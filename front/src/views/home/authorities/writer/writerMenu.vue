<template>
  <div class="writer_menu">
    <el-row class="writer_authorName">
      <el-col :span="3"><h1 class="writer_authorName_title">
        <i class="el-icon-s-order"></i>
        作者面板
      </h1></el-col>
      <el-col :span="6" style="margin-right: 10px">
        <el-input v-model="authorNameInput" placeholder="请输入待修改的笔名" clearable></el-input>
      </el-col>
      <el-col :span="2">
        <el-button type="primary" icon="el-icon-edit" @click="modifyAuthorName" >修改笔名</el-button>
      </el-col>
      <el-col :span="8">
        <el-button type="warning" icon="el-icon-upload2" @click="releaseBook" >发布书籍</el-button>
      </el-col>
    </el-row>

    <el-row class="writer_bookManager">
      <div class="book_bk">
        <h1 class="book_title">你的书籍</h1>

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
          <el-col :span="4">
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
                  <div slot="reference">
                    <el-popconfirm
                        cancel-button-text='修改'
                        cancel-button-type="warning"
                        @cancel="modifyBook(book)"
                        confirm-button-text='删除'
                        confirm-button-type="danger"
                        @confirm="deleteBook(book)"
                        icon="el-icon-info"
                        icon-color="orange"
                        :title="'你想对《'+book.book_name+'》做什么？'">
                      <el-image slot="reference" class="book_head" fit="cover" :src="book.image"
                                :style="book.style"
                                @mouseover="book_hover(book,1)"
                                @mouseleave="book_hover(book,0)">
                        <div slot="error"><img class="book_card" :src="default_book_url"
                                               @mouseover="book_hover(book,1)"
                                               @mouseleave="book_hover(book,0)"></div>
                      </el-image>
                    </el-popconfirm>
                  </div>
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
    </el-row>

    <el-dialog title="发布书籍" :visible.sync="dialogReleaseBookVisible" :modal-append-to-body="false">
      <el-form :model="releaseBookForm" ref="releaseBookForm" :rules="rules">
        <el-form-item label="书名" prop="name" :label-width="BookFormWidth">
          <el-input v-model="releaseBookForm.name" clearable placeholder="请输入书名" style="width:200px;"></el-input>
        </el-form-item>
        <el-form-item label="分类" prop="classification" :label-width="BookFormWidth">
          <el-select v-model="releaseBookForm.classification" placeholder="请选择分类名" clearable style="width:200px;">
            <el-option
                v-for="item in classifications"
                :key="item.classification"
                :label="item.classification"
                :value="item.classification">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label='介绍' :label-width="BookFormWidth">
          <el-input type="textarea" v-model="releaseBookForm.intro" clearable placeholder="请输入介绍" style="width:800px;"></el-input>
        </el-form-item>
        <el-form-item label="发行商" prop="publisher" :label-width="BookFormWidth">
          <el-select v-model="releaseBookForm.publisher" placeholder="请选择发行商" clearable style="width:200px;">
            <el-option
                v-for="item in publishers"
                :key="item.publisher"
                :label="item.publisher"
                :value="item.publisher">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer">
        <el-button @click="dialogReleaseBookVisible = false">取 消</el-button>
        <el-button type="primary" @click="commitReleaseBook">确 定</el-button>
      </div>
    </el-dialog>

    <el-dialog title="修改书籍" :visible.sync="dialogModifyBookVisible" :modal-append-to-body="false">
      <el-form :model="modifyBookForm" ref="modifyBookForm" :rules="rules">
        <el-form-item label="书名" prop="name" :label-width="BookFormWidth">
          <el-input v-model="modifyBookForm.name" clearable placeholder="请输入书名" style="width:200px;"></el-input>
        </el-form-item>
        <el-form-item label="分类" prop="classification" :label-width="BookFormWidth">
          <el-select v-model="modifyBookForm.classification" placeholder="请选择分类名" clearable style="width:200px;">
            <el-option
                v-for="item in classifications"
                :key="item.classification"
                :label="item.classification"
                :value="item.classification">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label='介绍' :label-width="BookFormWidth">
          <el-input type="textarea" v-model="modifyBookForm.intro" clearable placeholder="请输入介绍" style="width:800px;"></el-input>
        </el-form-item>
        <el-form-item label="发行商" prop="publisher" :label-width="BookFormWidth">
          <el-select v-model="modifyBookForm.publisher" placeholder="请选择发行商" clearable style="width:200px;">
            <el-option
                v-for="item in publishers"
                :key="item.publisher"
                :label="item.publisher"
                :value="item.publisher">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer">
        <el-button @click="dialogModifyBookVisible = false">取 消</el-button>
        <el-button type="primary" @click="commitModifyBook">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import authors from "@/api/home/FunctionMenu/authors";
import authorAuth from "@/api/home/Authorities/authorAuth";
import book from "@/api/home/FunctionMenu/book";
import options from "@/api/home/FunctionMenu/options";
import {default_book_url} from "@/utils/url";
import {mapState} from "vuex";

export default {
  name: "writerMenu",
  computed: {
    ...mapState(['selfInfo'])
  },
  data() {
    return {
      default_book_url: default_book_url,
      BookFormWidth: '100px',

      authorNameInput: '',
      authorName: '',

      tableData: [],
      tableRowMax: 5,
      totalBooks: 0,
      classifications: [],
      publishers: [],

      currentSize: 10,
      currentPage: 1,
      search_bookName: '',
      search_classification: '',
      search_publisher: '',

      dialogReleaseBookVisible: false,
      releaseBookForm: {
        name: '',
        author: '',
        classification: '',
        intro: '',
        publisher: '',
      },

      dialogModifyBookVisible: false,
      modifyBookForm: {
        id: 0,
        name: '',
        author: '',
        classification: '',
        intro: '',
        publisher: '',
      },

      rules:{
        name: [
          { required: true, message: '请输入书名', trigger: 'change' }
        ],
        classification: [
          { required: true, message: '请选择分类', trigger: 'change' }
        ],
        publisher: [
          { required: true, message: '请输入发行商', trigger: 'change' }
        ]
      },
    }
  },
  methods: {
    getOptions(){
      options.getClassifications().then(res => {
        if(res.data.code === 1) this.classifications = res.data.data;
      }).catch(e => {console.log(e)})
      options.getPublishers().then(res => {
        if(res.data.code === 1) this.publishers = res.data.data;
      }).catch(e => {console.log(e)})
    },
    modifyAuthorName(){
      if(this.authorNameInput.length === 0) this.$message.error('笔名不能为空！')
      if(this.authorNameInput === this.authorName) this.$message.error('你改了？')
      else{
        let data = {
          'id': this.selfInfo.id,
          'name': this.authorNameInput
        }
        authorAuth.modifyAuthorName(data).then(res => {
          if(res.data.code === 1){
            this.$message.success(res.data.data)
            this.authorName = this.authorNameInput
            this.updateData();
          }else this.$message.error(res.data.data)
        }).catch(e => {
          console.log(e)
        })
      }
    },
    releaseBook(){
      this.releaseBookForm.name = ''
      this.releaseBookForm.classification = ''
      this.releaseBookForm.intro = ''
      this.releaseBookForm.publisher = ''
      this.dialogReleaseBookVisible = true
    },
    commitReleaseBook(){
      this.$refs.releaseBookForm.validate((valid) => {
        if(valid){
          let data = {
            'id': this.selfInfo.id,
            'book_name': this.releaseBookForm.name,
            'author': this.authorName,
            'classification': this.releaseBookForm.classification,
            'intro': this.releaseBookForm.intro,
            'publisher': this.releaseBookForm.publisher
          }
          book.releaseBook(data).then(res => {
            if(res.data.code === 1){
              this.$message.success(res.data.data)
              this.dialogReleaseBookVisible = false;
              this.updateData();
            }else this.$message.error(res.data.data)
          }).catch(e => {
            console.log(e)
          })
        }
      });
    },
    modifyBook(data){
      this.modifyBookForm.id = data.id
      this.modifyBookForm.name = data.book_name
      this.modifyBookForm.classification = data.classification
      this.modifyBookForm.intro = data.intro
      this.modifyBookForm.publisher = data.publisher
      this.dialogModifyBookVisible = true
    },
    commitModifyBook(){
      this.$refs.modifyBookForm.validate((valid) => {
        if(valid){
          let data = {
            'id': this.modifyBookForm.id,
            'book_name': this.modifyBookForm.name,
            'author': this.authorName,
            'classification': this.modifyBookForm.classification,
            'intro': this.modifyBookForm.intro,
            'publisher': this.modifyBookForm.publisher
          }
          book.modifyBook(data).then(res => {
            if(res.data.code === 1){
              this.$message.success(res.data.data)
              this.dialogModifyBookVisible = false;
              this.updateData();
            }else this.$message.error(res.data.data)
          }).catch(e => {
            console.log(e)
          })
        }
      });
    },
    deleteBook(data){
      book.deleteBook(data.id).then(res => {
        if(res.data.code === 1){
          this.$message.success(res.data.data)
          this.updateData();
        }else this.$message.error(res.data.data)
      }).catch(e => {
        console.log(e)
      })
    },
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
        author: this.authorName,
        publisher: this.search_publisher
      }
      book.getBooks(data).then(res => {
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
    let data = {
      'username': this.selfInfo.userName
    }
    authors.getAuthors(data).then(res => {
      if(res.data.code === 1){
        this.authorNameInput = this.authorName = res.data.data.rows[0].authorname;
        this.updateData();
      }else this.$message.error(res.data.msg)
    }).catch(e => {
      console.log(e)
    })
    this.getOptions();
  }
}
</script>

<style scoped>

.writer_menu {
  height: 85%;
  margin: 10px 50px 30px 50px;
}

.writer_authorName {
  height: 10%;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
}

.writer_authorName_title {
  border-style: solid;
  border-width: 1px;
  border-radius: 5px;
  border-color: #000000;
  background-color: #fcd6ff;
  margin-right: 10px;
}

.writer_bookManager {
  height: 90%;
}

.book_bk {
  background-color: rgba(124, 56, 0, 0.13);
  text-align: center;
  height: 600px;
  position: relative;
  padding: 50px;
  border-style: groove;
  border-width: 15px;
  border-radius: 20px;
  border-color: rgba(124, 56, 0, 0.31);
}

.book_title {
  position: relative;
  bottom: 40px;
}

.book_display {
  height: 500px;
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