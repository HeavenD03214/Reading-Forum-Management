<template>
  <div>
    <writer-apply v-if="!selfInfo.isAuth"/>
    <writer-menu v-if="selfInfo.isAuth"/>
  </div>
</template>

<script>
import writerApply from "@/views/home/authorities/writer/writerApply";
import writerMenu from "@/views/home/authorities/writer/writerMenu";
import {mapState} from "vuex";

export default {
  name: "writerAuth",
  components: {
    writerApply, writerMenu
  },
  computed: {
    ...mapState(['selfInfo'])
  },
  data() {
    return {

    }
  },
  methods: {}
}
</script>

<style scoped>

</style>