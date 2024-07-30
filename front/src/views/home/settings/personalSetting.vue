<template>
  <div class="personal_main">
    <h1 class="personal_title">个人资料修改</h1>

    <div class="avatar_main">
      <el-upload
          class="avatar-uploader"
          :action="url"
          :headers="uploadHeaders"
          :show-file-list="false"
          :before-upload="beforeUpload"
          :on-success="handleAvatarSuccess"
          :on-error="handleAvatarError">
        <el-image class="avatar" fit="cover" :src="selfInfo.image">
          <div slot="error"><img class="avatar" :src="default_avatar_url"></div>
        </el-image>
      </el-upload>
    </div>

    <el-form :model="formModifyUserInfo" ref="formModifyUserInfo" :rules="rules">
      <el-form-item label="昵称" prop="nickName">
        <el-input v-model="formModifyUserInfo.nickName" placeholder="请输入昵称" style="width: 150px;"></el-input>
      </el-form-item>
      <el-form-item label="性别" prop="gender">
        <el-radio-group v-model="formModifyUserInfo.gender">
          <el-radio :label="null">不明</el-radio>
          <el-radio :label="0">男</el-radio>
          <el-radio :label="1">女</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="邮箱" prop="email">
        <el-input v-model="formModifyUserInfo.email" placeholder="请输入邮箱" style="width: 250px;"></el-input>
      </el-form-item>
      <el-form-item label="生日" prop="birthday">
        <el-date-picker v-model="formModifyUserInfo.birthday" type="date" placeholder="请选择日期"
                        value-format="yyyy-MM-dd" style="width: 150px;"></el-date-picker>
      </el-form-item>
      <el-form-item label="省份" prop="province">
        <el-input v-model="formModifyUserInfo.province" placeholder="请输入省份" style="width: 150px;"></el-input>
      </el-form-item>
      <el-form-item label="地区" prop="area">
        <el-input v-model="formModifyUserInfo.area" placeholder="请输入地区" style="width: 300px;"></el-input>
      </el-form-item>
      <el-form-item label="邮编" prop="emailCode">
        <el-input v-model="formModifyUserInfo.emailCode" placeholder="请输入邮编" style="width: 150px;"></el-input>
      </el-form-item>
    </el-form>

    <el-button type="primary" @click="commitModify">提交修改</el-button>

  </div>
</template>

<script>
import personalSetting from "@/api/home/PersonalSettings/personalSetting";
import {default_avatar_url} from '@/utils/url';
import {url} from '@/utils/url'
import {mapMutations, mapState} from "vuex";

export default {
  name: "personalSetting",
  computed: {
    ...mapState(['selfInfo'])
  },
  data() {
    return {
      default_avatar_url: default_avatar_url,
      url: '',
      uploadHeaders: {},
      formModifyUserInfo: {},
      rules:{
        nickName: [
          { required: true, message: '请输入昵称', trigger: 'blur' }
        ],
        email: [
          { required: true, message: '请输入邮箱', trigger: 'change' },
          { type: 'email', message: '请按格式输入邮箱'}
        ],
        birthday: [
          { required: true, message: '请选择日期', trigger: 'change' }
        ]
      }
    }
  },
  methods: {
    ...mapMutations(['infoUpdate']),
    commitModify(){
      this.$refs.formModifyUserInfo.validate((valid) => {
        if (valid) {
          let info = {
            id: this.formModifyUserInfo.id,
            name: this.formModifyUserInfo.nickName,
            gender: this.formModifyUserInfo.gender,
            email: this.formModifyUserInfo.email,
            province: this.formModifyUserInfo.province,
            area: this.formModifyUserInfo.area,
            birthday: this.formModifyUserInfo.birthday,
            emailcode: this.formModifyUserInfo.emailCode
          }
          personalSetting.updateSelfInfo(info).then(res => {
            if(res.data.code === 1){
              this.$message.success(res.data.msg);
              this.infoUpdate();
            }else{
              this.$message.error(res.data.msg);
            }
          }).catch(e => {
            console.log(e)
          });
        }
      })
    },
    beforeUpload(file){
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!');
      }
      return isLt2M;
    },
    handleAvatarSuccess(res, file) {
      console.log(file);
      if(res.code === 1){
        this.$message.success(res.msg);
        this.infoUpdate();
      }
      else this.$message.error(res.msg);
    },
    handleAvatarError(res) {
      this.$message.error(res);
    }
  },
  created() {
    this.formModifyUserInfo = this.selfInfo;
    if(this.selfInfo.nickName === null) this.formModifyUserInfo.nickName = this.selfInfo.userName;
    this.url = 'http://' + url + '/upload/' + this.selfInfo.id;
    this.uploadHeaders.token = localStorage.getItem('token');
  }
}
</script>

<style scoped>

.personal_main {
  margin-top: 50px;
  margin-left: 50px;
}

.personal_title {
  margin: 0 50px 30px 0;
}

.avatar_main {
  margin: 0 0 30px 0;
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

.avatar {
  width: 178px;
  height: 178px;
  display: block;
  border: 1px dashed #8c8c8c;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

</style>