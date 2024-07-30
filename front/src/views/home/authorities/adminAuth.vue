<template>
  <div class="adminAuthMain">
    <el-radio-group v-model="tableDisplay" class="adminAuthSelect">
      <el-radio-button label="总表"></el-radio-button>
      <el-radio-button label="作者表"></el-radio-button>
      <el-radio-button label="管理员表"></el-radio-button>
    </el-radio-group>
    <user-table v-if="tableDisplay === '总表'"/>
    <writer-table v-if="tableDisplay === '作者表'"/>
    <admin-table v-if="tableDisplay === '管理员表'"/>
  </div>
</template>

<script>
import userTable from "@/views/home/authorities/admin/userTable";
import writerTable from "@/views/home/authorities/admin/writerTable";
import adminTable from "@/views/home/authorities/admin/adminTable";

export default {
  name: "adminAuth",
  components: {
    userTable, writerTable, adminTable
  },
  data() {
    return {
      tableDisplay : '总表'
    }
  },
  methods: {

  }
}
</script>

<style scoped>

.adminAuthMain {
  margin: 20px 20px 20px 20px;
}

.adminAuthSelect {
  margin-bottom: 20px;
}

</style>