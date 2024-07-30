<template>
  <div class="writerApply_main">
    <h1>{{ default_title }}</h1>
    <el-input class="writerApply_input" v-model="apply_author_name" placeholder="请输入你待申请的笔名" clearable></el-input>
    <el-image :style="writerApply_button_style"
              :src="default_src"
              fit="fit"
              @mouseover="handleHover(1)"
              @mouseleave="handleHover(0)"
              @click="handleClick">
    </el-image>
  </div>
</template>

<script>

import authorAuth from "@/api/home/Authorities/authorAuth";
import {mapMutations, mapState} from "vuex";

export default {
  name: "writerApply",
  data() {
    return {
      apply_author_name: '',

      default_title: '点击申请作者（积分费用：1145.14）',
      default_src: require('@/resource/icons/writerApply.jpg'),
      default_size: '400px',
      click_size: '450px',
      click_opacity: '60%',
      writerApply_button_style: {
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
        this.writerApply_button_style.height = this.writerApply_button_style.width = this.click_size;
        this.writerApply_button_style.opacity = this.click_opacity;
      }else{
        this.writerApply_button_style.height = this.writerApply_button_style.width = this.default_size;
        this.writerApply_button_style.opacity = '100%';
      }
      this.$forceUpdate();
    },
    handleClick(){
      if(this.apply_author_name.length === 0) this.$message.error('笔名不能为空！');
      else {
        let data = new FormData();
        data.append('id',this.selfInfo.id);
        data.append('name',this.apply_author_name);
        authorAuth.authorApply(data).then(res => {
          if(res.data.code === 1){
            this.$message.success(res.data.data);
            this.infoUpdate();
          }else{
            this.$message.error(res.data.data);
            this.default_title = res.data.data;
            this.writerApply_button_style["box-shadow"] = '40px 40px 80px rgba(250, 30, 30, 0.5), -40px -40px 160px rgba(250, 30, 30, 0.5)';
          }
        }).catch(e => {
          console.log(e)
        })
      }
    }
  },
  created() {this.writerApply_button_style.height = this.writerApply_button_style.width = this.default_size;}
}
</script>

<style scoped>

.writerApply_main {
  position: relative;
  top: 120px;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

.writerApply_input {
  margin-bottom: 20px;
  width: 30%;
}

</style>