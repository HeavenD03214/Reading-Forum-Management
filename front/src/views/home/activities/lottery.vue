<template>
  <div class="lottery">
    <el-row style="height: 100%;">
      <el-col :span="4" class="lottery_balance">
        <el-row class="lottery_balance_title">
          积分面板
        </el-row>
        <el-row class="lottery_balance_value">
          {{ lottery_balance_hide?'？':selfInfo.balance }}
        </el-row>
        <el-row class="lottery_balance_recharge">
          <el-image :style="recharge_button_style"
                    :src="default_recharge_src"
                    fit="fit"
                    @mouseover="handleRechargeHover(1)"
                    @mouseleave="handleRechargeHover(0)"
                    @click="handleRechargeClick">
          </el-image>
        </el-row>
      </el-col>
      <el-col :span="20" style="height: 100%;">
        <lottery_main @update-message="handleBalanceHide"/>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import alipay from "@/api/home/Activities/alipay";
import lottery_main from "@/views/home/activities/lottery_main";
import {EventBus} from '@/utils/eventBus'
import {mapMutations, mapState} from "vuex";

export default {
  name: "lotteryView",
  components: {lottery_main},
  data() {
    return {
      default_recharge_src: require('@/resource/icons/recharge.jpg'),
      default_recharge_size: '175px',
      recharge_click_size: '200px',
      recharge_click_opacity: '75%',
      recharge_button_style: {
        'height': '',
        'width': '',
        'opacity': '100%',
        'border-radius': '80px',
        'box-shadow': '4px 4px 8px rgba(244, 255, 133, 0.5), -4px -4px 8px rgba(244, 255, 133, 0.3)'
      },
      recharge_money: 0.0,
      recharge_success: false,
      recharge_timer: null,
      lottery_balance_hide: false,
    }
  },
  computed: {
    ...mapState(['selfInfo'])
  },
  methods: {
    ...mapMutations(['infoUpdate']),
    handleRechargeHover(state){
      if(state){
        this.recharge_button_style.height = this.recharge_button_style.width = this.recharge_click_size;
        this.recharge_button_style.opacity = this.recharge_click_opacity;
      }else{
        this.recharge_button_style.height = this.recharge_button_style.width = this.default_recharge_size;
        this.recharge_button_style.opacity = '100%';
      }
      this.$forceUpdate();
    },
    handleRechargeClick(){
      this.$prompt('请输入充值金额(1元：10积分)', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        inputPattern: /^\d+(\.\d{1,2})?$/,
        inputErrorMessage: '充值金额格式不正确'
      }).then(({ value }) => {
        let data = {
          'userId': this.selfInfo.id,
          'totalAmount': value,
          'subject': '抽卡界面充值订单'
        }
        alipay.pay(data).then(res => {
          this.recharge_success = false;
          this.recharge_money = value;
          let recharge_window = window.open('', '_blank');
          if (recharge_window) {
            // 在新窗口中写入HTML字符串
            recharge_window.document.write(res.data);
            this.recharge_timer = setInterval(()=>{
              if(this.recharge_success === true){
                recharge_window.close();
                clearInterval(this.recharge_timer);
                this.recharge_timer = null;
              }
            },100);
          } else {alert('窗口打开失败，请允许弹出窗口。')}
        }).catch(e => {console.log(e)})
      }).catch(()=>{})
    },
    handleBalanceHide(state){this.lottery_balance_hide = state}
  },
  created() {this.recharge_button_style.height = this.recharge_button_style.width = this.default_recharge_size;},
  mounted() {
    EventBus.$on('rechargeSuccess',(data)=>{
      this.recharge_success = true;
      this.$message({
        message: '恭喜你' + data.msg + '！充值金额：' + this.recharge_money,
        type: 'success',
        duration: 10000,
        showClose: true
      });
      this.infoUpdate();
    });
  },
  beforeDestroy() {if(this.recharge_timer !== null) clearInterval(this.recharge_timer)}
}
</script>

<style scoped>

.lottery {
  margin: 40px 40px 40px 40px;
  height: 88%;
  border-style: solid;
  border-radius: 80px;
  border-width: 10px;
  border-color: rgba(162, 173, 15, 0.71);
  background-image: url('@/resource/background/lottery.png');
  background-size: cover;
  background-position: right;
  background-repeat: no-repeat;
}

.lottery_balance {
  height: 100%;
  background-color: rgba(187, 196, 57, 0.31);
  border-radius: 70px;
  border-style: none solid solid none;
  border-width: 5px;
  border-color: rgba(162, 173, 15, 0.71);
  display: flex;
  align-items: center;
  flex-direction: column;
  box-shadow: 40px 40px 80px rgba(244, 255, 133, 0.5), -40px -40px 160px rgba(244, 255, 133, 0.3);
  background-image: url('@/resource/background/recharge.jpg');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}

.lottery_balance_title {
  font-size: 50px;
  font-style: inherit;
  height: 11.5%;
  top: 20px;
  color: #2d6c3c;
  border-style: solid;
  border-width: 5px;
  border-radius: 20px;
  background-color: rgba(233, 241, 124, 0.71);
}

.lottery_balance_value {
  text-align: center;
  font-size: 26px;
  font-style: inherit;
  height: 5%;
  width: 90%;
  top: 35px;
  color: #4800fa;
  background-color: rgba(242, 242, 242, 0.62);
  border-radius: 40px;
}

.lottery_balance_recharge {
  top: 400px;
}

</style>