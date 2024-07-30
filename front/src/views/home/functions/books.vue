<template>
  <div class="book_main">
    <div class="book_bk">
      <h1 class="book_title">书籍一览</h1>

      <el-row type="flex" justify="center">

        <el-col :span="5">
          <el-input v-model="search_bookName" size="medium" placeholder="请输入书名" clearable/>
        </el-col>
        <el-col :span="5">
          <el-select v-model="search_classification" placeholder="请选择分类名" clearable>
            <el-option
                v-for="item in classifications"
                :key="item.classification"
                :label="item.classification"
                :value="item.classification">
            </el-option>
          </el-select>
        </el-col>
        <el-col :span="5">
          <el-input v-model="search_author" size="medium" placeholder="请输入作者" clearable/>
        </el-col>
        <el-col :span="5">
          <el-select v-model="search_publisher" placeholder="请选择发行商" clearable style="width:200px;">
            <el-option
                v-for="item in publishers"
                :key="item.publisher"
                :label="item.publisher"
                :value="item.publisher">
            </el-option>
          </el-select>
        </el-col>

        <el-col :span="5">
          <el-button type="primary" icon="el-icon-search" @click="updateData" style="position: relative; bottom: 2px;">搜索</el-button>
        </el-col>

      </el-row>

      <el-scrollbar class="book_display" wrap-style="overflow-x:hidden;">
        <div v-for="n in Math.ceil(tableData.length / tableRowMax)" :key="n" class="book_display_main"> <el-row type="flex" justify="center">
          <el-col :span="4" v-for="(book,index) in tableData.slice((n-1) * tableRowMax, n * tableRowMax)" :key="index">
            <el-card :body-style="{padding: '0px'}" class="book_card" :style="book.style">
              <el-popover
                  placement="top-start"
                  width="400"
                  trigger="hover"
                  :open-delay="300">
                <el-descriptions class="margin-top" :column=1 border>
                  <el-descriptions-item>
                    <template slot="label">
                      <i class="el-icon-notebook-1"></i>
                      书名
                    </template>
                    {{ '《' + book.book_name + "》"}}
                  </el-descriptions-item>
                  <el-descriptions-item >
                    <template slot="label">
                      <i class="el-icon-folder-opened"></i>
                      分类
                    </template>
                    {{ book.classification }}
                  </el-descriptions-item>
                  <el-descriptions-item>
                    <template slot="label">
                      <i class="el-icon-user-solid"></i>
                      作者
                    </template>
                    {{ book.author }}
                  </el-descriptions-item>
                  <el-descriptions-item>
                    <template slot="label">
                      <i class="el-icon-more"></i>
                      介绍
                    </template>
                    {{ book.intro }}
                  </el-descriptions-item>
                  <el-descriptions-item >
                    <template slot="label">
                      <i class="el-icon-takeaway-box"></i>
                      发行商
                    </template>
                    {{ book.publisher }}
                  </el-descriptions-item>
                </el-descriptions>
                <el-image slot="reference" class="book_head" fit="cover" :src="book.image"
                          :style="book.style"
                          @mouseover="book_hover(book,1)"
                          @mouseleave="book_hover(book,0)">
                  <div slot="error"><img class="book_card" :src="default_book_url"
                                         @mouseover="book_hover(book,1)"
                                         @mouseleave="book_hover(book,0)"></div>
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
          :total="totalBooks">
      </el-pagination>
    </div>
  </div>
</template>

<script>
import bm from "@/api/home/FunctionMenu/book";
import options from "@/api/home/FunctionMenu/options";
import {default_book_url} from "@/utils/url";

export default {
  name: "booksDisplay",
  data() {
    return {
      default_book_url: default_book_url,

      tableData: [],
      tableRowMax: 5,
      totalBooks: 0,

      currentSize: 10,
      currentPage: 1,
      search_bookName: '',
      search_classification: '',
      search_author: '',
      search_publisher: '',
      classifications: [],
      publishers: []
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
        book_name: this.search_bookName,
        classification: this.search_classification,
        author: this.search_author,
        publisher: this.search_publisher
      }
      bm.getBooks(data).then(res => {
        this.totalBooks = res.data.data.total;
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
    getOptions(){
      options.getClassifications().then(res => {
        if(res.data.code === 1) this.classifications = res.data.data;
      }).catch(e => {console.log(e)})
      options.getPublishers().then(res => {
        if(res.data.code === 1) this.publishers = res.data.data;
      }).catch(e => {console.log(e)})
    },
    book_hover(book, state){
      if(state) {
        book.style.height = '225px';
        book.style.width = '225px';
        book.style.opacity = '65%';
      }
      else{
        book.style.height = '200px';
        book.style.width = '200px';
        book.style.opacity = '100%';
      }
      this.$forceUpdate();
    }
  },
  created() {
    this.updateData();
    this.getOptions();
  }
}
</script>

<style scoped>

.book_main {
  padding: 35px;
  height: 90%;
}

.book_bk {
  background-color: white;
  text-align: center;
  height: 700px;
  position: relative;
  padding: 50px;
}

.book_title {
  position: relative;
  bottom: 30px;
}

.book_display {
  height: 560px;
}

.book_display_main {
  margin: 40px 0 0 0;
}

.book_head {
  width: 200px;
  height: 200px;
}

.book_card {
  width: 200px;
  height: 200px;
}

</style>