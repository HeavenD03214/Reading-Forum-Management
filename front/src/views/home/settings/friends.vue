<template>
  <div class="friends">
    <el-row class="friends_search">
      <el-col :span="3"><h1 class="friends_search_title">
        <i class="el-icon-search"></i>
        好友搜索
      </h1></el-col>
      <el-col :span="6" style="margin-right: 10px">
        <el-input v-model="friends_search_userName" placeholder="请输入待添加好友的用户名" clearable></el-input>
      </el-col>
      <el-col :span="2">
        <el-button type="primary" icon="el-icon-plus" @click="addFriend" >添加好友</el-button>
      </el-col>
    </el-row>

    <el-row class="friends_main">
      <el-col :span="5" class="friends_list">
        <el-row class="friends_list_title">
          <h1><i class="el-icon-mobile-phone"></i>好友列表</h1>
        </el-row>
        <el-row class="friends_list_content">
          <el-scrollbar ref="friends_list_scroll" wrap-style="overflow-x:hidden;height:100%">
            <div v-for="(item, index) in this.friends_list" :key="index">
              <el-card class="friends_list_item"  shadow="hover" :body-style="{padding:'0px'}">
                <div @click="handlerFriendListItemClick(item,index)">
                  <el-row>
                    <el-col :span="4" class="friends_list_avatar">
                      <el-avatar size="large" :src="item.image" @error="avatarErrorHandler">
                        <img src="@/resource/icons/QQ.png"/>
                      </el-avatar>
                    </el-col>
                    <el-col :span="13" class="friends_list_text">
                      <el-row>{{ item.name!==null?item.name:item.username }}</el-row>
                      <el-row class="friends_list_text_content" v-if="item.time === null">快跟新朋友打声招呼吧！</el-row>
                      <el-row class="friends_list_text_content" v-if="'unRead' in item && item.msg !== null">
                        {{ (item.send!==selfInfo.id?('['+ (item.name!==null?item.name:item.username) +'] '):'') + item.msg }}
                      </el-row>
                      <el-row class="friends_list_text_request" v-if="!('unRead' in item)">申请添加你为好友！</el-row>
                    </el-col>
                    <el-col :span="6" class="friends_list_state">
                      <el-row class="friends_list_state_date" v-if="item.time === null">{{ formatDate(new Date()) }}</el-row>
                      <el-row class="friends_list_state_date" v-if="'unRead' in item && item.time !== null">{{ item.time.slice(0,10) }}</el-row>
                      <el-row class="friends_list_state_time" v-if="'unRead' in item && item.time !== null">{{ item.time.slice(11,16) }}</el-row>
                      <el-row class="friends_list_state_unread" v-if="!('unRead' in item)"><el-badge value="new"></el-badge></el-row>
                      <el-row class="friends_list_state_unread" v-if="'unRead' in item && item.unRead > 0"><el-badge :value="item.unRead"></el-badge></el-row>
                    </el-col>
                  </el-row>
                </div>
              </el-card>
            </div>
          </el-scrollbar>
        </el-row>
      </el-col>

      <el-col :span="19" class="friends_chat">
        <div v-show="this.friendChatId > 0" style="height: 100%;">
          <el-scrollbar class="chat_main" ref="chat_scroll" wrap-style="overflow-x:hidden;">
            <div class="chat_container">
              <div v-for="(chat, index) in this.friends_chat_messages" :key="index">
                <p class="chat_text">
                  {{ '[' + chat.time.slice(0,10) + ' ' + chat.time.slice(11,19) + '] ' }}
                  {{ (!chat.name?chat.username:chat.name) + '：' + chat.msg }}
                </p>
              </div>
            </div>
          </el-scrollbar>
          <el-button class="friends_chat_delete" type="danger" icon="el-icon-delete-solid" @click="handleFriendDelete">删除好友</el-button>
          <div class="chat_input">
            <el-input ref="chat_input" v-model="chat_mes" clearable @keydown.native="handleChatButtonKey"></el-input>
          </div>
        </div>
      </el-col>
    </el-row>

    <el-dialog
        title="☑好友申请处理☑"
        :visible.sync="dialogFriendRequestVisible"
        :modal-append-to-body="false"
        width="30%">
      <h1 style="text-align: center;">是否同意该好友申请？</h1>
      <span slot="footer">
    <el-button type="success" @click="friendRequestAgree">同 意</el-button>
    <el-button type="danger" @click="friendRequestDisagree">拒 绝</el-button>
  </span>
    </el-dialog>
  </div>
</template>

<script>

import {mapMutations, mapState} from "vuex";
import friend from "@/api/home/Activities/friend";
import chatRoom from "@/api/home/Activities/chatRoom";
import {EventBus} from "@/utils/eventBus";

export default {
  name: "friendsView",
  data() {
    return {
      friends_search_userName: '',
      dialogFriendRequestVisible: false,
      friendRequestId: 0,
      friendChatName: '',
      friendChatUserName: '',
      friendChatImage: '',
      chat_mes: ''
    }
  },
  computed: {
    ...mapState(['selfInfo','friends_list','friendChatId','friends_chat_messages'])
  },
  methods: {
    ...mapMutations(['friendsListUpdate','friendChatMessagesUpdate','friendMesPush','setFriendChatId','friendsListUpdateSelf']),
    addFriend(){
      if(this.friends_search_userName === '') return;
      let data = new FormData();
      data.append('send', this.selfInfo.id);
      data.append('username', this.friends_search_userName);
      friend.addFriend(data).then(res => {
        if(res.data.code === 1){
          this.friends_search_userName = '';
          this.$message.success(res.data.data)
        }else this.$message.error(res.data.data)
      }).catch(e => {
        console.log(e)
      })
    },
    avatarErrorHandler(){return true;},
    handlerFriendListItemHover(index,state){
      if(state){
        this.friends_list[index].style['background-color'] = '#F0F0F0'
      }else{
        this.friends_list[index].style['background-color'] = ''
      }
    },
    handlerFriendListItemClick(item,index){
      if('unRead' in this.friends_list[index]){
        this.setFriendChatId(item.id);
        this.friendChatUserName = item.username;
        this.friendChatName = item.name?item.name:item.username;
        this.friendChatImage = item.image;
        this.friendChatMessagesUpdate(this.friendChatId);
      }else{
        this.dialogFriendRequestVisible = true;
        this.friendRequestId = item.id;
      }
    },
    friendRequestAgree(){
      let data = new FormData();
      data.append('send',this.selfInfo.id);
      data.append('receive',this.friendRequestId);
      friend.friendRequestAgree(data).then(res => {
        if(res.data.code === 1){
          this.friendsListUpdate();
          this.$message.success(res.data.data);
          this.dialogFriendRequestVisible = false;
        }else this.$message.error(res.data.data)
      }).catch(e => {
        console.log(e)
      })
    },
    friendRequestDisagree(){
      let data = {
        'send': this.selfInfo.id,
        'receive': this.friendRequestId
      }
      friend.friendRequestDisagree(data).then(res => {
        if(res.data.code === 1){
          this.friendsListUpdate();
          this.$message.success(res.data.data);
          this.dialogFriendRequestVisible = false;
        }else this.$message.error(res.data.data)
      }).catch(e => {
        console.log(e)
      })
    },
    handleChatButtonKey(event){
      if (event.keyCode !== 13) return;
      let data = {
        'send': this.selfInfo.id,
        'receive': this.friendChatId,
        'msg': this.chat_mes
      }
      chatRoom.sendMes(data).then(res => {
        if(res.data.code === 1){
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
        }else this.$message.error(res.data.msg)
      }).catch(e => {
        console.log(e)
      })
    },
    handleFriendDelete(){
      this.$confirm('是否删除好友：'+ this.friendChatName +'?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let data = {
          'send': this.selfInfo.id,
          'receive': this.friendChatId
        }
        friend.deleteFriend(data).then(res => {
          if(res.data.code === 1){
            this.$message.success(res.data.data);
            this.setFriendChatId(0);
            this.friendsListUpdate();
          }else this.$message.error(res.data.data);
        }).catch(e => {
          console.log(e)
        })
      }).catch(() => {});
    },
    formatDate(date) {
      const year = date.getFullYear();
      const month = (date.getMonth() + 1).toString().padStart(2, '0');
      const day = date.getDate().toString().padStart(2, '0');
      return `${year}-${month}-${day}`;
    }
  },
  mounted() {
    EventBus.$on('friendChatScrollRefresh',(self)=>{
      this.$nextTick(()=>{
        if(!self && this.$refs.chat_scroll.wrap.scrollTop !== this.$refs.chat_scroll.wrap.scrollHeight) return;
        this.$refs.chat_scroll.wrap.scrollTop = this.$refs.chat_scroll.wrap.scrollHeight;
      });
    });
    this.$forceUpdate()
  },
  beforeDestroy() {
    this.setFriendChatId(0);
  }
}
</script>

<style scoped>

.friends {
  height: 85%;
  margin: 50px 50px 30px 50px;
}

.friends_search {
  height: 10%;
  display: flex;
  align-items: center;
  text-align: center;
  justify-content: center;
}

.friends_search_title {
  border-style: solid;
  border-width: 1px;
  border-radius: 5px;
  border-color: #000000;
  background-color: #d8ffd6;
  margin-right: 10px;
}

.friends_main {
  height: 90%;
  border-style: groove;
}

.friends_list {
  height: 100%;
}

.friends_list_title {
  height: 10%;
  background-color: #EAEAEAC3;
  border-bottom-style: groove;
  display: flex;
  align-items: center;
  justify-content: center;
}

.friends_list_item {
  height: 80px;
}

.friends_list_avatar {
  height: 100%;
  display: flex;
  justify-content: end;
  align-items: center;
  position: relative;
  top: 20px;
}

.friends_list_text {
  height: 100%;
  margin: 10px 0 10px 10px;
}

.friends_list_text_content {
  font-size: 12px;
  margin-top: 10px;
  color: #999999;
  overflow: hidden;
  text-overflow:ellipsis;
  white-space: nowrap;
  width: 90%;
}

.friends_list_text_request {
  font-size: 15px;
  color: #ff3030;
  margin-top: 6px;
  overflow: hidden;
  text-overflow:ellipsis;
  white-space: nowrap;
  width: 90%;
}

.friends_list_state {
  display: flex;
  height: 100%;
  margin-right: 2px;
  flex-direction: column;
  justify-content: end;
}

.friends_list_state_date {
  font-size: 11px;
  color: #999999;
  margin-top: 10px;
}

.friends_list_state_time {
  font-size: 11px;
  color: #999999;
}

.friends_list_state_unread {

}

.friends_list_content {
  background-color: #FFFFFF;
  height: 90%;
}

.friends_chat {
  background-color: #F2F2F2;
  border-left-style: groove;
  height: 100%;
}

.friends_chat_delete {
  position: absolute;
  right: 0;
  top: 0;
  margin: 10px 10px 0 0;
}

.chat_main {
  height: 93%;
}

.chat_container {
  line-height: 20px;
}

.chat_input {
  position: relative;
  right: 3px;
  height: 5%;
  width: 100%;
  border-style: groove;
  border-width: 3px;
  border-color: white;
}

.chat_text {
  color: #000000;
  font-size: 20px;
  width: 99%;
  margin-left: 10px;
  white-space: pre-wrap;
}

</style>