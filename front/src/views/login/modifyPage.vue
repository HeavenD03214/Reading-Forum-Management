<template>
  <div>
    <!--横屏模式-->
    <el-container v-if="isWide" class="login_main">

      <el-header class="modify_header">
        <h1>修改密码</h1>
      </el-header>

      <el-main class="main_3">
        <el-row>
          <el-col :span="12">
            <div class="border">
              <el-row :span="12"><el-input placeholder="用户名" class="main_content"
                                           v-model="userName" @input="handleUpdate()" ></el-input></el-row>
              <el-row :span="12"><el-input placeholder="旧密码" show-password class="main_content"
                                           v-model="oldPassWord" @input="handleUpdate()" ></el-input></el-row>
            </div>
          </el-col>

          <el-col :span="12">
            <el-row :span="12"><el-input placeholder="新密码" show-password class="main_content"
                                         v-model="newPassWord" @input="handleUpdate()" ></el-input></el-row>
            <el-row :span="12"><el-input placeholder="确认新密码" show-password class="main_content"
                                         v-model="confirmNewPassWord" @input="handleUpdate()" ></el-input></el-row>
          </el-col>
        </el-row>
      </el-main>

      <el-footer class="footer">
        <el-col :span="12"><el-button type="text" @click="confirmModify">
          <p style="color:white">确认修改</p>
        </el-button></el-col>
        <el-col :span="12"><el-button type="text" @click="changeState(0)">
          <p style="color:white">登录用户</p>
        </el-button></el-col>
      </el-footer>
    </el-container>

    <!--竖屏模式-->
    <el-container v-if="!isWide" class="login_main">

      <el-header class="modify_header">
        <h1>修改密码</h1>
      </el-header>

      <el-main class="main_3" style="height: 250px">
        <el-row :span="12"><el-input placeholder="用户名" class="main_content"
                                     v-model="userName" @input="handleUpdate()" ></el-input></el-row>
        <el-row :span="12"><el-input placeholder="旧密码" show-password class="main_content"
                                     v-model="oldPassWord" @input="handleUpdate()" ></el-input></el-row>
        <el-row :span="12"><el-input placeholder="新密码" show-password class="main_content"
                                     v-model="newPassWord" @input="handleUpdate()" ></el-input></el-row>
        <el-row :span="12"><el-input placeholder="确认新密码" show-password class="main_content"
                                     v-model="confirmNewPassWord" @input="handleUpdate()" ></el-input></el-row>
      </el-main>

      <el-footer class="footer" style="height: 150px">
        <el-row :span="12"><el-button type="text" @click="confirmModify">
          <p style="color:white">确认修改</p>
        </el-button></el-row>
        <el-row :span="12"><el-button type="text" @click="changeState(0)">
          <p style="color:white">登录用户</p>
        </el-button></el-row>
      </el-footer>
    </el-container>

  </div>
</template>

<script>
import user from "@/api/user/user";

export default {
  name: "modifyPage",
  data() {
    return {
      userName: '',
      oldPassWord: '',
      newPassWord: '',
      confirmNewPassWord: '',
      isWide: true,
    }
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
    confirmModify() {
      if(this.userName === ''){
        this.$message.error('用户名不能为空');
      }else if(this.oldPassWord === ''){
        this.$message.error('旧密码不能为空');
      }else if(this.newPassWord === ''){
        this.$message.error('新密码不能为空');
      }else if(this.confirmNewPassWord === ''){
        this.$message.error('确认新密码不能为空');
      }else if(this.newPassWord !== this.confirmNewPassWord){
        this.$message.error('两次新密码输入不一致');
      }else if(this.oldPassWord === this.newPassWord){
        this.$message.error('旧密码不能与新密码相同');
      }else{
        let userInfo = {
          username: this.userName,
          oldPassWord: this.oldPassWord,
          newPassWord: this.newPassWord
        }
        user.modifyPassWord(userInfo).then(res => {
          if(res.data.code === 1){
            this.$message.success(res.data.msg);
            this.$emit('changeState', 0);
          }else{
            this.$message.error(res.data.msg);
          }
        }).catch(e => {
          console.log(e)
        });
      }
    },
    changeState(state) {
      this.$emit('changeState', state)
    },
    handleAvatarSuccess(res, file) {
      this.imageUrl = URL.createObjectURL(file.raw);
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === 'image/jpeg';
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG) {
        this.$message.error('上传头像图片只能是 JPG 格式!');
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!');
      }
      return isJPG && isLt2M;
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

.modify_header {
  background-color: #F2F2F2;
  color: #333;
  width: 40%;
  align-self: center;
  text-align: center;
  line-height: 20px;
}

.main_3 {
  background-color: #F2F2F2;
  color: #333;
  width: 40%;
  height: 150px;
  align-self: center;
  text-align: center;
  line-height: 50px;
}

.main_content {
  width: 75%;
  text-align: left;
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

.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}

.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}

.avatar {
  width: 178px;
  height: 178px;
  display: block;
}

</style>