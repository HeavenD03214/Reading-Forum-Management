package com.nt.nothing.interceptor;

import com.alibaba.fastjson.JSONObject;
import com.nt.nothing.pojo.Result;
import com.nt.nothing.service.UserService;
import com.nt.nothing.utils.JwtUtils;
import io.jsonwebtoken.Claims;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Component
public class CheckInterceptor implements HandlerInterceptor {

    @Autowired
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //获取请求url
        String url = request.getRequestURI().toString();
        log.info("请求的url:{}",url);
        //获取请求头中的令牌
        String jwt = request.getHeader("token");
        //判断令牌是否存在
        if(!StringUtils.hasLength(jwt)){
            log.info("请求头token为空，返回未登陆信息");
            Result error = new Result<String>().error("NOT_LOGIN");
            String notLogin = JSONObject.toJSONString(error);
            response.getWriter().write(notLogin);
            return false;
        }
        //解析token
        try {
            Claims claims =  JwtUtils.parseJWT(jwt);
            Integer id  = claims.get("id", Integer.class);
            String username = claims.get("username",String.class);
            if(!userService.isAdmin(id)){
                if(url.contains("admin")) {
                    log.info("权限不足，无法操作");
                    Result error = new Result<String>().error("PowerNotEnough");
                    String notLogin = JSONObject.toJSONString(error);
                    response.getWriter().write(notLogin);
                    return false;
                }
                if(!userService.isAuthor(id)){
                    if(url.contains("author") && (!url.contains("beAuthor")) && (!url.contains("search"))) {
                        log.info("权限不足，无法操作");
                        Result error = new Result<String>().error("PowerNotEnough");
                        String notLogin = JSONObject.toJSONString(error);
                        response.getWriter().write(notLogin);
                        return false;
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            log.info("解析令牌失败,返回未登陆错误信息");
            Result error = new Result<String>().error("NOT_LOGIN");
            String notLogin = JSONObject.toJSONString(error);
            response.getWriter().write(notLogin);
            return false;
        }
        //放行
        log.info("令牌合法，放行");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("22222222222");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("333333333333");
    }
}
