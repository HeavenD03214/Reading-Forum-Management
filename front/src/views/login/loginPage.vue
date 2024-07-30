<template>
  <div>
    <!--横屏模式-->
    <el-container v-if="isWide" class="login_main">

      <el-header class="login_header">
        <h1>登录</h1>
      </el-header>

      <el-main class="main_1">
        <el-row>
          <el-col :span="12">
            <div class="border">
              <el-row :span="12"><el-button type="primary" class="main_content">
                <img src="../../resource/icons/QQ.png" class="main_icon"/>  QQ登录
              </el-button></el-row>
              <el-row :span="12"><el-button type="success" class="main_content">
                <img src="../../resource/icons/微信.png" class="main_icon"/>  微信登录</el-button></el-row>
              <el-row :span="12"><el-button class="main_content" style="background-color:#EBEBEB;">
                <img src="../../resource/icons/支付宝.png" class="main_icon"/>  支付宝登录</el-button></el-row>
            </div>
          </el-col>

          <el-col :span="12">
            <div>
              <el-row :span="12"><el-input placeholder="用户名" class="main_content"
                                           v-model="userName" @input="handleUpdate()" ></el-input></el-row>
              <el-row :span="12"><el-input placeholder="密码" show-password class="main_content"
                                           v-model="passWord" @input="handleUpdate()" ></el-input></el-row>
              <el-row :span="12"><el-button type="success" class="main_content" @click="confirmLogin">登录</el-button></el-row>
            </div>
          </el-col>
        </el-row>
      </el-main>

      <el-footer class="footer">
        <el-col><el-button type="text" @click="changeState(1)">
          <p style="color:white">注册用户</p>
        </el-button></el-col>
      </el-footer>
    </el-container>

    <!--竖屏模式-->
    <el-container v-if="!isWide" class="login_main">

      <el-header class="login_header">
        <h1>登录</h1>
      </el-header>

      <el-main class="main_1" style="height: 350px">
        <div>
          <el-row :span="12"><el-button type="primary" class="main_content">
            <img src="../../resource/icons/QQ.png" class="main_icon"/>  QQ登录
          </el-button></el-row>
          <el-row :span="12"><el-button type="success" class="main_content">
            <img src="../../resource/icons/微信.png" class="main_icon"/>  微信登录</el-button></el-row>
          <el-row :span="12"><el-button class="main_content" style="background-color:#EBEBEB;">
            <img src="../../resource/icons/支付宝.png" class="main_icon"/>  支付宝登录</el-button></el-row>
          <el-row :span="12"><el-input placeholder="用户名" class="main_content"
                                       v-model="userName" @input="handleUpdate()" ></el-input></el-row>
          <el-row :span="12"><el-input placeholder="密码" show-password class="main_content"
                                       v-model="passWord" @input="handleUpdate()" ></el-input></el-row>
          <el-row :span="12"><el-button type="success" class="main_content" @click="confirmLogin">登录</el-button></el-row>
        </div>
      </el-main>

      <el-footer class="footer" style="height: 150px">
        <el-row><el-button type="text" @click="changeState(1)">
          <p style="color:white">注册用户</p>
        </el-button></el-row>
      </el-footer>
    </el-container>
  </div>
</template>

<script>
import user from '@/api/user/user'
export default {
  name: "loginPage",
  data() {
    return {
      userName: '',
      passWord: '',
      isWide: true
    }
  },
  methods: {
    handleResize() {
      this.fullWidth = document.documentElement.clientWidth;
      // 页面宽度小于800px时，切换竖屏显示
      this.isWide = this.fullWidth >= 800;
    },
    changeState(state) {
      this.$emit('changeState', state)
    },
    confirmLogin() {
      if(this.userName === ''){
        this.$message.error('用户名不能为空');
      }else if(this.passWord === ''){
        this.$message.error('用户密码不能为空');
      }else{
        let userInfo = {
          username: this.userName,
          password: this.passWord
        }
        user.login(userInfo).then(res => {
          if(res.data.code === 1){
            this.$message.success(res.data.msg);

            localStorage.setItem('token',res.data.data.token)
            localStorage.setItem('id',res.data.data.user.id)

            setTimeout(() => {
              this.$router.replace('/home');
            },1000);
          }else{
            this.$message.error(res.data.msg);
          }
        }).catch(e => {
          console.log(e)
        });
      }
    }
  },
  created(){
    window.addEventListener('resize', this.handleResize)
    this.handleResize()
  },
  beforeDestroy: function () {
    window.removeEventListener('resize', this.handleResize)
  },
}
</script>

<style>

.login_main {
  color: #333;
  opacity: 95%;
  position: relative;
  top: 50px;
}

.login_header {
  background-color: #F2F2F2;
  color: #333;
  width: 40%;
  align-self: center;
  text-align: center;
  line-height: 20px;
}

.main_1 {
  background-color: #F2F2F2;
  color: #333;
  width: 40%;
  height: 200px;
  align-self: center;
  text-align: center;
  line-height: 50px;
}

.main_content {
  width: 75%;
  text-align: left;
}

.main_icon {
  width: 6%;
}

.border {
  border-right: #C4C4C4 solid 2px;
}

.footer {
  background-color: #505050;
  color: #333;
  width: 40%;
  align-self: center;
  text-align: center;
  line-height: 60px;
}

body > .el-container {
  margin-bottom: 40px;
}

</style>