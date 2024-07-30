<template>
  <div class="signIn_main">
    <h1>{{ default_title }}</h1>
    <el-image :style="signIn_button_style"
              :src="default_src"
              fit="fit"
    @mouseover="handleHover(1)"
    @mouseleave="handleHover(0)"
    @click="handleClick">
    </el-image>
  </div>
</template>

<script>

import signIn from "@/api/home/Activities/signIn";
import {mapMutations, mapState} from "vuex";

export default {
  name: "signIn",
  data() {
    return {
      default_title: '点击签到',
      default_src: require('@/resource/icons/Signin_up.jpg'),
      default_size: '400px',
      click_size: '450px',
      click_opacity: '60%',
      signIn_button_style: {
        'height': '',
        'width': '',
        'opacity': '100%',
        'border-radius': '120px',
        'box-shadow': '2px 2px 4px rgba(0, 0, 0, 0.5), -2px -2px 8px rgba(0, 0, 0, 0.3)'
      }
    }
  },
  computed: {
    ...mapState(['selfInfo'])
  },
  methods: {
    ...mapMutations(['infoUpdate']),
    handleHover(state){
      if(state){
        this.signIn_button_style.height = this.signIn_button_style.width = this.click_size;
        this.signIn_button_style.opacity = this.click_opacity;
      }else{
        this.signIn_button_style.height = this.signIn_button_style.width = this.default_size;
        this.signIn_button_style.opacity = '100%';
      }
      this.$forceUpdate();
    },
    handleClick(){
      signIn.signIn(this.selfInfo.id).then(res => {
        this.default_title = res.data.data;
        if(res.data.code === 1){
          this.$message.success(res.data.data);
          this.signIn_button_style["box-shadow"] = '40px 40px 80px rgba(244, 255, 133, 0.5), -40px -40px 160px rgba(244, 255, 133, 0.3)';
          this.infoUpdate();
        }else{
          this.$message.error(res.data.data);
          this.default_src = require('@/resource/icons/Signin_down.jpg');
          this.signIn_button_style["box-shadow"] = '40px 40px 80px rgba(250, 30, 30, 0.5), -40px -40px 160px rgba(250, 30, 30, 0.5)';
        }
      }).catch(e => {
        console.log(e)
      })
    }
  },
  created() {this.signIn_button_style.height = this.signIn_button_style.width = this.default_size;}
}
</script>

<style scoped>

.signIn_main {
  position: relative;
  bottom: 100px;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

</style>