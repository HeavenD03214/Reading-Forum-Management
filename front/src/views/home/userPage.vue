<template>
  <div>
    <el-col :span="8" class="per_info">
      <h1>欢迎 {{ selfInfo.nickName===null?selfInfo.userName:selfInfo.nickName }}</h1>
      <div class="avatar_border">
        <el-image class="avatar_content" fit="cover" :src="this.selfInfo.image">
          <div slot="error"><img class="avatar_content" :src="default_avatar_url"></div>
        </el-image>
      </div>
    </el-col>
    <el-col :span="12" class="user_show">
      <el-radio-group v-model="radio" size="medium">
        <el-radio-button label="信息" ></el-radio-button>
        <el-radio-button label="日历"></el-radio-button>
      </el-radio-group>
      <div v-show="radio === '信息'">
        <h1>用户基本信息</h1>
        <el-descriptions class="user_show_perInf" :column="1" border>
          <el-descriptions-item>
            <template slot="label">
              <i class="el-icon-user"></i>
              用户名
            </template>
            {{ selfInfo.userName }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template slot="label">
              <i class="el-icon-user-solid"></i>
              昵称
            </template>
            {{ selfInfo.nickName==='null'?selfInfo.userName:selfInfo.nickName }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template slot="label">
              <i class="el-icon-message"></i>
              邮箱
            </template>
            {{ selfInfo.email }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template slot="label">
              <i class="el-icon-cpu"></i>
              权限
            </template>
            <el-tag v-if="this.selfInfo.isAuth === false && this.selfInfo.isAdmin === false" type="info">读者</el-tag>
            <el-tag v-if="this.selfInfo.isAdmin === true">管理员</el-tag>
            <el-tag v-if="this.selfInfo.isAuth === true" type="success">作者</el-tag>
          </el-descriptions-item>
          <el-descriptions-item>
            <template slot="label">
              <i class="el-icon-money"></i>
              积分
            </template>
            {{ selfInfo.balance }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template slot="label">
              <i class="el-icon-sunny"></i>
              性别
            </template>
            {{ selfInfo.gender === null?'不明' : (selfInfo.gender === 0?'男':'女') }}
            <i class="el-icon-male" v-if="this.selfInfo.gender === 0"></i> <i class="el-icon-female" v-if="this.selfInfo.gender === 1"></i>
          </el-descriptions-item>
          <el-descriptions-item>
            <template slot="label">
              <i class="el-icon-tickets"></i>
              生日
            </template>
            <i class="el-icon-date"></i>
            {{ selfInfo.birthday }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template slot="label">
              <i class="el-icon-location-outline"></i>
              地址
            </template>
            {{ selfInfo.province === 'null'?'不明' : (selfInfo.province + selfInfo.area) }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template slot="label">
              <i class="el-icon-key"></i>
              邮编
            </template>
            {{ selfInfo.emailCode==='null'?'不明':selfInfo.emailCode }}
          </el-descriptions-item>
        </el-descriptions>
      </div>
      <div v-show="radio === '日历'">
        <el-calendar v-model="date"></el-calendar>
      </div>
    </el-col>
  </div>
</template>

<script>
import {default_avatar_url} from '@/utils/url';
import {mapState} from 'vuex'

export default {
  name: "userPage",
  data() {
    return {
      default_avatar_url: default_avatar_url,
      radio: '信息',
      date: new Date()
    }
  },
  computed: {
    ...mapState(['selfInfo'])
  }
}
</script>

<style scoped>

.per_info {
  height: 100%;
  position: relative;
  top: 60px;
  text-align: center;
}

.avatar_border {
  height: 300px;
  width: 300px;
  border-radius: 5px;
  text-align: center;
  background-color: white;
  position: absolute;
  left: 50%;
  transform: translate(-50%, 0%);
}

.avatar_content {
  width: 250px;
  height: 250px;
  top: 25px;
}

.user_show {
  background-color: white;
  height: 100%;
  position: relative;
  top: 60px;
  text-align: center;
  transform: translate(10%, 0%);
}

.user_show_perInf {
  padding: 0 50px 50px 50px;
}

</style>