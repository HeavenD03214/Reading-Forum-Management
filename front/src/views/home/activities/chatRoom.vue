<template>
  <div>
    <el-row class="chat">
      <el-col :span="3" class="chat_user_list">

      </el-col>

      <el-col :span="21" class="chat_screen">
        <el-scrollbar class="chat_main" ref="chat_scroll" wrap-style="overflow-x:hidden;">
          <div class="chat_container">
            <div v-for="(chat, index) in this.chat_messages" :key="index">
              <p class="chat_text">
                {{ '[' + chat.time.slice(0,10) + ' ' + chat.time.slice(11,19) + '] ' }}
                {{ (!chat.name?chat.username:chat.name) + '：' + chat.msg }}
              </p>
            </div>
          </div>
        </el-scrollbar>
        <div class="chat_input">
          <el-input ref="chat_input" v-model="chat_mes" clearable @keydown.native="handleChatButtonKey"></el-input>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import chatRoom from "@/api/home/Activities/chatRoom";
import {EventBus} from '@/utils/eventBus'
import {mapMutations, mapState} from "vuex";
export default {
  name: "chatRoom",
  data() {
    return {
      showEmojiDialog: false,
      chat_mes: ''
    }
  },
  computed: {
    ...mapState(['selfInfo','chat_messages'])
  },
  methods: {
    ...mapMutations(['chatMesPush','setChatRoomEnter']),
    handleChatButtonKey(event){
      if (event.keyCode !== 13) return;
      let data = {
        'send': this.selfInfo.id,
        'receive': 0,
        'msg': this.chat_mes
      }
      chatRoom.sendMes(data).then(res => {
        if(res.data.code === 1){
          chatRoom.getChatRoomMesLast(this.selfInfo.id).then(res => {
            if(res.data.code === 1){
              this.chatMesPush(res.data.data)
              this.chat_mes = ''
            }
          }).catch(e => {
            console.log(e)
          })
        }else this.$message.error(res.data.msg)
      }).catch(e => {
        console.log(e)
      })
    }
  },
  created() {
    this.$nextTick(()=>{
      this.$refs.chat_scroll.wrap.scrollTop = this.$refs.chat_scroll.wrap.scrollHeight;
      this.setChatRoomEnter(true);
    })
  },
  destroyed() {
    this.setChatRoomEnter(false);
  },
  mounted() {
    EventBus.$on('chatRoomScrollRefresh',(self)=>{
      this.$nextTick(()=>{
        if(!self && this.$refs.chat_scroll.wrap.scrollTop !== this.$refs.chat_scroll.wrap.scrollHeight) return;
        this.$refs.chat_scroll.wrap.scrollTop = this.$refs.chat_scroll.wrap.scrollHeight;
      });
    });
  }
}
</script>

<style scoped>

.chat {
  margin: 50px 50px 50px 50px;
}

.chat_screen {
  background-color: #ffffff;
  height: 700px;
  border-style: groove;
}

.chat_user_list {
  background-color: #ffffff;
  height: 743px;
  border-style: groove;
}

.chat_main {
  height: 100%;
}

.chat_container {
  line-height: 20px;
}

.chat_input {
  position: relative;
  right: 3px;
  height: 40px;
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