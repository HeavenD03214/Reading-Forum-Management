<template>
  <div>
    <el-container class="container">
      <el-aside class="guide_aside" v-show="isWide">
        <el-main class="guide_main">
          <el-row class="tac">
            <el-menu
                default-active="1"
                :default-openeds="openeds"
                class="el-menu-vertical-demo"
                @select="handleSelect">
              <el-menu-item index="1" class="guide_menu">
                <i class="el-icon-house"></i>
                <span slot="title">首页</span>
              </el-menu-item>
              <el-submenu index="2" class="guide_menu">
                <template slot="title">
                  <i class="el-icon-s-operation"></i>
                  <span>功能菜单</span>
                </template>
                <el-menu-item index="2-1">作者一览</el-menu-item>
                <el-menu-item index="2-2">书籍一览</el-menu-item>
              </el-submenu>
              <el-submenu index="3" class="guide_menu">
                <template slot="title">
                  <i class="el-icon-film"></i>
                  <span>活动菜单</span>
                </template>
                <el-menu-item index="3-1">每日签到</el-menu-item>
                <el-menu-item index="3-2">抽卡游戏</el-menu-item>
                <el-badge :value="this.chat_room_unRead" :max="999" :hidden="this.chat_room_unRead===0" class="guide_menu_badge">
                  <el-menu-item index="3-3">在线聊天室</el-menu-item>
                </el-badge>
              </el-submenu>
              <el-submenu index="4" class="guide_menu">
                <template slot="title">
                  <i class="el-icon-cpu"></i>
                  <span>权限相关</span>
                </template>
                <el-menu-item index="4-1">作者面板</el-menu-item>
                <el-menu-item index="4-2" v-if="this.$store.state.selfInfo.isAdmin">管理员面板</el-menu-item>
              </el-submenu>
              <el-submenu index="5" class="guide_menu">
                <template slot="title">
                  <i class="el-icon-shopping-bag-1"></i>
                  <span>主题切换</span>
                </template>
                <el-menu-item index="5-1">蓝色风格</el-menu-item>
                <el-menu-item index="5-2">黄色风格</el-menu-item>
              </el-submenu>
              <el-submenu index="6" class="guide_menu">
                <template slot="title">
                  <i class="el-icon-setting"></i>
                  <span>个人相关</span>
                </template>
                <el-badge :value="this.friends_list_unRead" :max="99" :hidden="this.friends_list_unRead===0" class="guide_menu_badge">
                  <el-menu-item index="6-1">好友列表</el-menu-item>
                </el-badge>
                <el-menu-item index="6-2">个人资料设置</el-menu-item>
              </el-submenu>
            </el-menu>
          </el-row>
        </el-main>
      </el-aside>

      <el-main class="main">
        <el-header class="main_header" style="height: 56px">
          <el-popover
              width="160"
              v-model="exit_visible">
            <p>确认要退出登录吗？</p>
            <div style="text-align: right; margin: 0">
              <el-button size="mini" type="text" @click="exit_visible = false">取消</el-button>
              <el-button type="primary" size="mini" @click="exit">确定</el-button>
            </div>
            <el-button type="text" slot="reference">
              <p style="position: relative;right: 5px;bottom: 10px;color: darkgrey;">退出登录 ∨</p>
            </el-button>
          </el-popover>
        </el-header>

        <el-main class="main_bk">
          <userPage v-if="index === '1'"/>
          <authors v-if="index === '2-1'"/>
          <books v-if="index === '2-2'"/>
          <sign-in v-if="index === '3-1'"/>
          <lottery v-if="index === '3-2'"/>
          <chat-room v-if="index === '3-3'"/>
          <writer-auth v-if="index === '4-1'"/>
          <admin-auth v-if="index === '4-2'"/>
          <friends v-if="index === '6-1'"/>
          <personal-setting v-if="index === '6-2'"/>
        </el-main>
      </el-main>

    </el-container>
  </div>
</template>

<script>
import userPage from "@/views/home/userPage";
import authors from "@/views/home/functions/authors";
import books from "@/views/home/functions/books";
import signIn from "@/views/home/activities/signIn";
import lottery from "@/views/home/activities/lottery";
import chatRoom from "@/views/home/activities/chatRoom";
import writerAuth from "@/views/home/authorities/writerAuth";
import adminAuth from "@/views/home/authorities/adminAuth";
import friends from "@/views/home/settings/friends";
import personalSetting from "@/views/home/settings/personalSetting";
import SocketService from "@/utils/websocket";
import {EventBus} from '@/utils/eventBus'
import {mapMutations, mapState} from 'vuex'
import friend from "@/api/home/Activities/friend";
export default {
  name: "homePage",
  components: {
    userPage,
    authors, books,
    signIn, lottery, chatRoom,
    writerAuth, adminAuth,
    friends, personalSetting
  },
  data() {
    return {
      isWide: true,
      openeds: ['2','3','4','5','6'],
      exit_visible: false,
      index: '1'
    }
  },
  computed: {
    ...mapState(['selfInfo','chat_room_enter','chat_room_unRead','friends_list_unRead','friendChatId'])
  },
  methods: {
    ...mapMutations(['infoUpdate','chatMessagesUpdate','chatMesPush','addChatRoomUnread','addFriendChatUnread',
      'friendsListUpdate','friendMesPush','friendsListUpdateSingle','friendsListUpdateSelf']),
    handleResize() {
      this.fullWidth = document.documentElement.clientWidth;
      // 页面宽度小于1000px时，切换竖屏显示
      this.isWide = this.fullWidth >= 1000;
    },
    handleSelect(index) {
      if(index[0]==='5'){
        this.handleColorChange(index[2]-1);
      }else {
        this.index = index;
      }
    },
    handleColorChange(index) {
      var colorStyles = [
          ['#95BCED', '#4288DE', '#D9E7F8'],
          ['#E2BA81', '#CE8B31', '#F2E3CC']
      ];
      document.documentElement.style.setProperty('--primary-color-guide-menu', colorStyles[index][0]);
      document.documentElement.style.setProperty('--primary-color-main-header', colorStyles[index][1]);
      document.documentElement.style.setProperty('--primary-color-main-bk', colorStyles[index][2]);
      localStorage.setItem('colorStyle', index);
    },
    exit() {
      this.exit_visible = false;
      localStorage.removeItem('token');
      localStorage.setItem('colorStyle', '0');
      this.$router.replace('/login');
    }
  },
  beforeCreate() {
    // eslint-disable-next-line no-unreachable
    if(!localStorage.getItem('token')){
      window.alert('请先登录！');
      this.$router.replace('/login');
    }
  },
  created() {
    window.addEventListener('resize', this.handleResize);
    this.handleResize();
    if(localStorage.getItem('colorStyle')){
      this.handleColorChange(localStorage.getItem('colorStyle'))
    }
    SocketService.Instance.connect(this);

    this.infoUpdate(this);
    this.chatMessagesUpdate();
    this.friendsListUpdate();
  },
  mounted() {
    EventBus.$on('chatMesReceive',(data)=>{
      if(this.chat_room_enter === false) this.addChatRoomUnread();
      if(this.selfInfo.userName !== data.username) this.chatMesPush(data,false);
    });
    EventBus.$on('friendChatReceive',(data)=>{
      if(data.id === this.friendChatId){
        let data = {
          'send': this.selfInfo.id,
          'receive': this.friendChatId
        }
        friend.getChatMesLast(data).then(res => {
          if(res.data.code === 1){
            this.friendMesPush(res.data.data)
            this.friendsListUpdateSelf(res.data.data)
            this.chat_mes = ''
          }
        }).catch(e => {
          console.log(e)
        })
        return;
      }
      this.friendsListUpdateSingle(data.id);
    });
    EventBus.$on('updateFriendList',()=>{this.friendsListUpdate();});
  }
}
</script>

<style>

:root {
  --primary-color-guide-home: #ECF5FF;
  --primary-color-guide-menu: #95BCED;
  --primary-color-main-header: #4288DE;
  --primary-color-main-bk: #D9E7F8;
}

body {
  background-image: url("../../resource/background/login_background.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: top center;
}

.container {
  height: 900px;
  opacity: 95%;
}

.main {
  padding: 0;
  height: 102.5%;
}

.main_header {
  background-color: var(--primary-color-main-header);
  width: 100%;
  text-align: right;
  padding: 0;
}

.main_bk {
  background-color: var(--primary-color-main-bk);
  height: 93%;
  padding: 0;
}

.guide_aside {
  background-color: white;
  height: 101.5%;
  padding: 0;
}

.guide_main {
  padding: 0 0 5px 0;
  text-align: center;
}

.guide_menu {
  background-color: var(--primary-color-guide-menu);
}

.guide_menu_badge {
  width: 85%;
}

</style>