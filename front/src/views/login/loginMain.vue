<template>
  <div>
    <loginPage v-show="loginState === 0" @changeState="changeState"/>
    <regisPage v-show="loginState === 1" @changeState="changeState"/>
  </div>
</template>

<script>
import loginPage from '@/views/login/loginPage';
import regisPage from "@/views/login/regisPage";
export default {
  name: "loginMain",
  components: {
    loginPage, regisPage
  },
  data() {
    return {
      loginState: 0
    }
  },
  methods: {
    changeState(state){
      this.loginState = state
    }
  }
}
</script>

<style>

body {
  background-image: url("../../resource/background/login_background.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: top center;
}

</style>