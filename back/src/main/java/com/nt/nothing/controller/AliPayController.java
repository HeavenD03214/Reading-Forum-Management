package com.nt.nothing.controller;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.easysdk.factory.Factory;
import com.alipay.easysdk.payment.page.models.AlipayTradePagePayResponse;
import com.nt.nothing.AliPay.AliPay;
import com.nt.nothing.AliPay.AliPayConfig;
import com.nt.nothing.AliPay.Order;
import com.nt.nothing.AliPay.PayUtil;
import com.nt.nothing.WebSocket.WebSocketUtil;
import com.nt.nothing.anno.Log;
import com.nt.nothing.service.MoneyService;
import com.nt.nothing.service.OrderService;
import com.nt.nothing.service.UserService;
import com.nt.nothing.service.impl.UserServiceImpl;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/10 20:03
 */
@Slf4j
@RestController
@Tag(name = "支付管理")
@CrossOrigin(origins = "*")
@RequestMapping("/alipay")
public class AliPayController {

    @Autowired
    OrderService orderService;

    @Autowired
    MoneyService moneyService;

    @Autowired
    UserService userService;

    @Resource
    PayUtil payUtil;


    @Operation(summary = "积分充值接口")
    @GetMapping("/pay") // http://localhost:4090/alipay/pay?subject=xxx&totalAmount=xxx
    public void pay(AliPay aliPay, HttpServletResponse httpResponse) throws Exception {
        aliPay.setTraceNo(UUID.randomUUID().toString());
        Order order = new Order(aliPay.getTraceNo(),aliPay.getUserId(),aliPay.getTotalAmount(), LocalDateTime.now(),0);
        orderService.addOrder(order);
        payUtil.pay(aliPay,httpResponse);
    }



    @Operation(summary = "支付宝回调接口")
    @PostMapping("/notify")  // 注意这里必须是POST接口
    public String payNotify(HttpServletRequest request) throws Exception {
        if (request.getParameter("trade_status").equals("TRADE_SUCCESS")) {
            System.out.println("=========支付宝异步回调========");

            Map<String, String> params = new HashMap<>();
            Map<String, String[]> requestParams = request.getParameterMap();
            for (String name : requestParams.keySet()) {
                params.put(name, request.getParameter(name));
                System.out.println(name + " = " + request.getParameter(name));
            }
            String tradeNo = params.get("out_trade_no");
            // 支付宝验签
            if (Factory.Payment.Common().verifyNotify(params)) {
                // 验签通过
                System.out.println("交易名称: " + params.get("subject"));
                System.out.println("交易状态: " + params.get("trade_status"));
                System.out.println("支付宝交易凭证号: " + params.get("trade_no"));
                    System.out.println("商户订单号: " + params.get("out_trade_no"));
                System.out.println("交易金额: " + params.get("total_amount"));
                System.out.println("买家在支付宝唯一id: " + params.get("buyer_id"));
                System.out.println("买家付款时间: " + params.get("gmt_payment"));
                System.out.println("买家付款金额: " + params.get("buyer_pay_amount"));
                // 更新订单未已支付
                Integer user_id =  orderService.getUserIdByUid(tradeNo);
                orderService.updateOrderState(tradeNo);
                Double amount = Double.parseDouble(params.get("total_amount"));
                moneyService.update(user_id, userService.getBalance(user_id) +  (amount * 10));

                Map msgMap = new HashMap();
                msgMap.put("type", "orderResult");
                msgMap.put("msg", "支付成功");
                WebSocketUtil.sendInfo(JSONObject.toJSONString(msgMap),user_id);
            }
            else {
                Integer user_id =  orderService.getUserIdByUid(tradeNo);
                Map msgMap = new HashMap();
                msgMap.put("type", "orderResult");
                msgMap.put("msg", "支付失败");
                WebSocketUtil.sendInfo(JSONObject.toJSONString(msgMap),user_id);
            }
        }
        return "success";
    }
}
