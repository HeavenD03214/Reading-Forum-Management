<template>
  <div class="manager_main">
    <div class="manager_bk">
      <h1 class="manager_title">作者一览</h1>

      <el-row type="flex" justify="center">

        <el-col :span="4">
          <el-input v-model="search_authorName" size="medium" placeholder="请输入笔名" clearable/>
        </el-col>
        <el-col :span="4">
          <el-input v-model="search_name" size="medium" placeholder="请输入作者名" clearable/>
        </el-col>
        <el-col :span="4">
          <el-input v-model="search_userName" size="medium" placeholder="请输入用户名" clearable/>
        </el-col>
        <el-col :span="4">
          <el-select v-model="search_gender" placeholder="请选择性别" style="position: relative; bottom: 2px;">
            <el-option label="性别" value=""></el-option>
            <el-option label="男" value="0"></el-option>
            <el-option label="女" value="1"></el-option>
          </el-select>
        </el-col>
        <el-col :span="4">
          <el-input v-model="search_province" size="medium" placeholder="请输入省份" clearable/>
        </el-col>
        <el-col :span="4">
          <el-input v-model="search_area" size="medium" placeholder="请输入城市" clearable/>
        </el-col>

        <el-col :span="4">
          <el-button type="primary" icon="el-icon-search" @click="updateData" style="position: relative; bottom: 2px;">搜索</el-button>
        </el-col>

      </el-row>

      <el-scrollbar class="manager_display" wrap-style="overflow-x:hidden;">
        <div v-for="n in Math.ceil(tableData.length / tableRowMax)" :key="n" class="manager_display_main"> <el-row type="flex" justify="center">
          <el-col :span="4" v-for="(writer,index) in tableData.slice((n-1) * tableRowMax, n * tableRowMax)" :key="index">
            <el-card :body-style="{padding: '0px'}" class="manager_card" :style="writer.style">
              <el-popover
                  placement="top-start"
                  width="600"
                  trigger="hover"
                  :open-delay="300">
                <el-descriptions class="margin-top" :column=1 border>
                  <el-descriptions-item v-show="writer.name!=='null'">
                    <template slot="label">
                      <i class="el-icon-user-solid"></i>
                      笔名
                    </template>
                    {{ writer.authorname }}
                  </el-descriptions-item>
                  <el-descriptions-item >
                    <template slot="label">
                      <i class="el-icon-user"></i>
                      作者名
                    </template>
                    {{ writer.name }}
                  </el-descriptions-item>
                  <el-descriptions-item>
                    <template slot="label">
                      <i class="el-icon-warning-outline"></i>
                      用户名
                    </template>
                    {{ writer.username }}
                  </el-descriptions-item>
                  <el-descriptions-item >
                    <template slot="label">
                      <i class="el-icon-sunny"></i>
                      性别
                    </template>
                    {{ writer.gender==='null'?'不明' : (writer.gender===0?'男':'女') }}
                    <i class="el-icon-male" v-if="writer.gender===0"></i> <i class="el-icon-female" v-if="writer.gender===1"></i>
                  </el-descriptions-item>
                  <el-descriptions-item>
                    <template slot="label">
                      <i class="el-icon-message"></i>
                      邮箱
                    </template>
                    {{ writer.email }}
                  </el-descriptions-item>
                  <el-descriptions-item>
                    <template slot="label">
                      <i class="el-icon-location-outline"></i>
                      地址
                    </template>
                    {{ writer.province==='null'?'不明' : (writer.province+writer.area) }}
                  </el-descriptions-item>
                </el-descriptions>
                <el-image slot="reference" class="manager_head" fit="cover" :src="writer.image"
                          :style="writer.style"
                          @mouseover="writer_hover(writer,1)"
                          @mouseleave="writer_hover(writer,0)">
                  <div slot="error"><img class="manager_card" :src="default_avatar_url"
                                         @mouseover="writer_hover(writer,1)"
                                         @mouseleave="writer_hover(writer,0)"></div>
                </el-image>
              </el-popover>
            </el-card>
          </el-col>
        </el-row>
        </div>
      </el-scrollbar>

      <el-pagination
          @current-change="handleCurrentChange"
          @size-change="handleSizeChange"
          :current-page="currentPage"
          :page-sizes="[10, 20, 50, 100]"
          :page-size="currentSize"
          layout="total, sizes, prev, pager, next"
          :total="totalWriters">
      </el-pagination>
    </div>
  </div>
</template>

<script>
import um from "@/api/home/FunctionMenu/authors";
import {default_avatar_url} from '@/utils/url';

export default {
  name: "authorsDisplay",
  data() {
    return {
      default_avatar_url: default_avatar_url,

      tableData: [],
      tableRowMax: 5,
      totalWriters: 0,

      currentSize: 10,
      currentPage: 1,
      search_authorName: '',
      search_userName: '',
      search_name: '',
      search_gender: '',
      search_province: '',
      search_area: '',

      dialogAddUserManagerVisible: false,
      formAddUserManager: {
        date: '',
        name: '',
        country: '',
        city: '',
        address: '',
        postalCode: ''
      }
    }
  },
  methods: {
    handleCurrentChange(val){
      this.currentPage = val;
      this.updateData();
    },
    handleSizeChange(val){
      this.currentSize = val;
      this.currentPage = 1;
      this.updateData();
    },
    updateData(){
      let data = {
        page: this.currentPage,
        pageSize: this.currentSize,
        authorName: this.search_authorName,
        username: this.search_userName,
        name: this.search_name,
        gender: this.search_gender,
        province: this.search_province,
        area: this.search_area
      }
      um.getAuthors(data).then(res => {
        this.totalWriters = res.data.data.total;
        this.tableData = res.data.data.rows;
        for(let index = 0; index < this.tableData.length; index++){
          this.tableData[index].style = {
            height: '200px',
            width: '200px',
            opacity: '100%'
          }
        }
      }).catch(e => {
        console.log(e)
      });
    },
    writer_hover(writer, state){
      if(state) {
        writer.style.height = '225px';
        writer.style.width = '225px';
        writer.style.opacity = '65%';
      }
      else{
        writer.style.height = '200px';
        writer.style.width = '200px';
        writer.style.opacity = '100%';
      }
      this.$forceUpdate();
    }
  },
  created() {
    this.updateData();
  }
}
</script>

<style scoped>

.manager_main {
  padding: 35px;
  height: 90%;
}

.manager_bk {
  background-color: white;
  text-align: center;
  height: 700px;
  position: relative;
  padding: 50px;
}

.manager_title {
  position: relative;
  bottom: 30px;
}

.manager_display {
  height: 560px;
}

.manager_display_main {
  margin: 40px 0 0 0;
}

.manager_head {
  width: 200px;
  height: 200px;
}

.manager_card {
  width: 200px;
  height: 200px;
}

</style>