<template>
  <div>
    <!--横屏模式-->
    <el-container v-if="isWide" class="login_main">

      <el-header class="regis_header">
        <h1>注册新用户</h1>
      </el-header>

      <el-main class="main_2">
        <el-row>
          <el-col>
            <el-row :span="12"><el-input placeholder="用户名" class="main_content"
                                         v-model="userName" @input="handleUpdate()" ></el-input></el-row>
            <el-row :span="12"><el-input placeholder="密码" show-password class="main_content"
                                         v-model="passWord" @input="handleUpdate()" ></el-input></el-row>
            <el-row :span="12"><el-input placeholder="邮箱" class="main_content"
                                         v-model="email" @input="handleUpdate()" ></el-input>
            </el-row>
            <el-row :span="12" class="main_content_emailCode">
              <el-col><el-input
                  size="large"
                  v-model="code"
                  placeholder="输入验证码"
                  autocomplete="off"
                  style="width:200px;">
              </el-input></el-col>
              <el-col>
                <el-button size="large" :disabled="countTimer" @click="handleSms" style="position: relative;right: 180px;">
                  {{ label }}
                </el-button>
              </el-col>
            </el-row>
            <el-row :span="12"><el-date-picker type="date" placeholder="选择出生年月" style="width:75%"
                                               v-model="date" value-format="yyyy-MM-dd"></el-date-picker></el-row>
          </el-col>
        </el-row>
      </el-main>

      <el-footer class="footer">
        <el-col :span="12"><el-button type="text" @click="confirmRegister">
          <p style="color:white">确认注册</p>
        </el-button></el-col>
        <el-col :span="12"><el-button type="text" @click="changeState(0)">
          <p style="color:white">登录用户</p>
        </el-button></el-col>
      </el-footer>
    </el-container>

    <!--竖屏模式-->
    <el-container v-if="!isWide" class="login_main">

      <el-header class="regis_header">
        <h1>注册新用户</h1>
      </el-header>

      <el-main class="main_2" style="height: 300px;">
        <el-row :span="12"><el-input placeholder="用户名" class="main_content"
                                     v-model="userName" @input="handleUpdate()" ></el-input></el-row>
        <el-row :span="12"><el-input placeholder="密码" show-password class="main_content"
                                     v-model="passWord" @input="handleUpdate()" ></el-input></el-row>
        <el-row :span="12"><el-input placeholder="邮箱" class="main_content"
                                     v-model="email" @input="handleUpdate()" ></el-input></el-row>
        <el-row :span="12" class="main_content_emailCode">
          <el-col><el-input
              size="large"
              v-model="code"
              placeholder="输入验证码"
              autocomplete="off"
              style="width:200px;">
          </el-input></el-col>
          <el-col>
            <el-button size="large" :disabled="countTimer" @click="handleSms" style="position: relative;right: 180px;">
              {{ label }}
            </el-button>
          </el-col>
        </el-row>
        <el-row :span="12"><el-date-picker type="date" placeholder="选择出生年月" style="width:75%"
                                           v-model="date" value-format="yyyy-MM-dd"></el-date-picker></el-row>
      </el-main>

      <el-footer class="footer" style="height: 150px">
        <el-row :span="12"><el-button type="text" @click="confirmRegister()">
          <p style="color:white">确认注册</p>
        </el-button></el-row>
        <el-row :span="12"><el-button type="text" @click="changeState(0)">
          <p style="color:white">登录用户</p>
        </el-button></el-row>
      </el-footer>
    </el-container>
  </div>
</template>

<script>
import user from '@/api/user/user';
export default {
  name: "loginPage",
  data() {
    return {
      userName: '',
      passWord: '',
      email: '',
      date: '',
      isWide: true,
      imageUrl: '',
      imgID: '',

      code: null,
      countdown: 60, // 初始化倒计时时间为60秒
      countTimer: null
    }
  },
  computed: {
    label() {return this.countTimer ? `${this.countdown}秒后重试` : '发送验证码';}
  },
  methods: {
    handleUpdate() {
      this.$forceUpdate()
    },
    handleResize() {
      this.fullWidth = document.documentElement.clientWidth;
      // 页面宽度小于800px时，切换竖屏显示
      this.isWide = this.fullWidth >= 800;
    },
    confirmRegister() {
      const reg = /^([a-zA-Z]|[0-9])(\w|-|\.)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/
      if(this.userName === ''){
        this.$message.error('用户名不能为空');
      }else if(this.passWord === ''){
        this.$message.error('用户密码不能为空');
      }else if(!reg.test(this.email)){
        this.$message.error('邮箱格式错误');
      }else if(this.code === ''){
        this.$message.error('验证码不能为空');
      }else if(this.date === '' || this.date === null){
        this.$message.error('出生年月不能为空');
      }else{
        let data = {
          'email': this.email,
          'code': this.code
        }
        user.checkEmail(data).then(res => {
          if(res.data.code === 1){
            let userInfo = {
              username: this.userName,
              password: this.passWord,
              email: this.email,
              birthday: this.date,
              imgUrl: this.imgID
            }
            user.register(userInfo).then(res => {
              if(res.data.code === 1){
                this.$message.success(res.data.data);
                this.$emit('changeState', 0);
              }else{
                this.$message.error(res.data.data);
              }
            }).catch(e => {
              console.log(e)
            });
          }else this.$message.error(res.data.data)
        }).catch(e => {
          console.log(e)
        })
      }
    },
    changeState(state) {
      this.$emit('changeState', state)
    },
    handleSms(){
      const reg = /^([a-zA-Z]|[0-9])(\w|-|\.)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
      if(!reg.test(this.email)){
        this.$message.error('邮箱格式错误');
        return;
      }
      user.sendEmail(this.email).then(res => {
        if(res.data.code === 1){
          this.$message.success(res.data.data);
          this.startCountdown(); // 开始倒计时
        }else this.$message.error(res.data.msg);
      }).catch(e => {
        console.log(e)
      })
    },
    startCountdown() {
      this.countdown = 60; // 重置倒计时时间
      this.countTimer = setInterval(() => {
        if (this.countdown > 0) {
          this.countdown -= 1; // 每秒减1
        } else {
          clearInterval(this.countTimer); // 停止倒计时
          this.countTimer = null;
        }
      }, 1000);
    }
  },
  created(){
    window.addEventListener('resize', this.handleResize)
    this.handleResize()
  },
  beforeDestroy: function () {
    window.removeEventListener('resize', this.handleResize)
    if(this.countTimer) clearInterval(this.countTimer)
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

.regis_header {
  background-color: #F2F2F2;
  color: #333;
  width: 40%;
  align-self: center;
  text-align: center;
  line-height: 20px;
}

.main_2 {
  background-color: #F2F2F2;
  color: #333;
  width: 40%;
  height: 300px;
  align-self: center;
  text-align: center;
  line-height: 50px;
}

.main_content {
  width: 75%;
  text-align: left;
}

.main_content_emailCode {
  display: flex;
  align-items: center;
  justify-content: left;
  flex-direction: row;
  left: 14px;
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