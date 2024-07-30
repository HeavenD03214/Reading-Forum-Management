<template>
  <div>
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

    <el-table
        :data="tableData"
        stripe
        border
        height="660px"
        style="margin: 10px 0 10px 0;"
        @selection-change="handleSelectionChange">
      <el-table-column
          type="selection"
          width="40">
      </el-table-column>
      <el-table-column
          prop="authorname"
          label="笔名"
          width="130">
      </el-table-column>
      <el-table-column
          prop="name"
          label="姓名"
          width="120">
      </el-table-column>
      <el-table-column
          prop="username"
          label="用户名"
          width="100">
      </el-table-column>
      <el-table-column
          label="性别"
          width="60">
        <template slot-scope="scope">
          {{ scope.row.gender === null?'不明' : (scope.row.gender === 0?'男':'女') }}
          <i class="el-icon-male" v-if="scope.row.gender === 0"></i> <i class="el-icon-female" v-if="scope.row.gender === 1"></i>
        </template>
      </el-table-column>
      <el-table-column
          prop="email"
          label="邮箱"
          width="220">
      </el-table-column>
      <el-table-column
          label="生日"
          width="120">
        <template slot-scope="scope">
          <i class="el-icon-date"></i>
          {{ scope.row.birthday }}
        </template>
      </el-table-column>
      <el-table-column
          prop="province"
          label="省份"
          width="70">
      </el-table-column>
      <el-table-column
          prop="area"
          label="地区"
          width="200">
      </el-table-column>
      <el-table-column
          prop="emailcode"
          label="邮编"
          width="120">
      </el-table-column>
      <el-table-column
          prop="balance"
          label="积分"
          width="100">
      </el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button
              size="mini"
              type="success"
              @click="handleAuthEdit(scope.row)">撤职</el-button>
          <el-button
              size="mini"
              @click="handleInfoEdit(scope.row)">编辑</el-button>
          <el-button
              size="mini"
              type="danger"
              @click="handleDelete(scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-sizes="[10, 20, 50, 100]"
        :page-size="currentSize"
        layout="total, sizes, prev, pager, next"
        :total="total">
    </el-pagination>

    <el-dialog title="修改作者" :visible.sync="dialogModifyWriterVisible" :modal-append-to-body="false">
      <el-form :model="formModifyWriter" ref="formModifyWriter" :rules="rules" label-position="right">
        <el-form-item label="笔名" prop="authorname">
          <el-input v-model="formModifyWriter.authorname" placeholder="请输入笔名" style="width: 150px;"></el-input>
        </el-form-item>
        <el-form-item label="用户名" prop="username">
          <el-input v-model="formModifyWriter.username" placeholder="请输入用户名" style="width: 150px;"></el-input>
        </el-form-item>
        <el-form-item label="昵称" prop="name">
          <el-input v-model="formModifyWriter.name" placeholder="请输入昵称" style="width: 150px;"></el-input>
        </el-form-item>
        <el-form-item label="性别" prop="gender">
          <el-radio-group v-model="formModifyWriter.gender">
            <el-radio :label="null">不明</el-radio>
            <el-radio :label="0">男</el-radio>
            <el-radio :label="1">女</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="formModifyWriter.email" placeholder="请输入邮箱" style="width: 250px;"></el-input>
        </el-form-item>
        <el-form-item label="生日" prop="birthday">
          <el-date-picker v-model="formModifyWriter.birthday" type="date" placeholder="请选择日期"
                          value-format="yyyy-MM-dd" style="width: 150px;"></el-date-picker>
        </el-form-item>
        <el-form-item label="省份" prop="province">
          <el-input v-model="formModifyWriter.province" placeholder="请输入省份" style="width: 150px;"></el-input>
        </el-form-item>
        <el-form-item label="地区" prop="area">
          <el-input v-model="formModifyWriter.area" placeholder="请输入地区" style="width: 300px;"></el-input>
        </el-form-item>
        <el-form-item label="邮编" prop="emailcode">
          <el-input v-model="formModifyWriter.emailcode" placeholder="请输入邮编" style="width: 150px;"></el-input>
        </el-form-item>
        <el-form-item label="积分" prop="balance">
          <el-input v-model.number="formModifyWriter.balance" placeholder="请输入积分" style="width: 150px;"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer">
        <el-button @click="dialogModifyWriterVisible = false">取 消</el-button>
        <el-button type="primary" @click="modifyUserCommit">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import authors from "@/api/home/FunctionMenu/authors";
import adminAuth from "@/api/home/Authorities/adminAuth";
import personalSetting from "@/api/home/PersonalSettings/personalSetting";
import authorAuth from "@/api/home/Authorities/authorAuth";

export default {
  name: "writerTable",
  data() {
    return {
      search_authorName: '',
      search_userName: '',
      search_name: '',
      search_gender: '',
      search_province: '',
      search_area: '',

      tableData: [],

      currentPage: 1,
      currentSize: 10,
      total: 0,

      dialogModifyWriterVisible: false,
      formModifyWriter: {
        id : '',
        authorname: '',
        name : '',
        username : '',
        gender : 'null',
        email : '',
        birthday : '',
        province : '',
        area : '',
        emailcode : '',
        balance : 0.0
      },
      rules:{
        authorname: [
          { required: true, message: '请输入笔名', trigger: 'blur' }
        ],
        username: [
          { required: true, message: '请输入用户名', trigger: 'blur' }
        ],
        name: [
          { required: true, message: '请输入昵称', trigger: 'blur' }
        ],
        email: [
          { required: true, message: '请输入邮箱', trigger: 'change' },
          { type: 'email', message: '请按格式输入邮箱'}
        ],
        birthday: [
          { required: true, message: '请选择日期', trigger: 'change' }
        ],
        province: [
          { required: true, message: '请输入省份', trigger: 'change' }
        ],
        area: [
          { required: true, message: '请输入地区', trigger: 'change' }
        ],
        emailcode: [
          { required: true, message: '请输入邮编', trigger: 'change' },
        ],
        balance: [
          { required: true, message: '请输入积分', trigger: 'change' },
          { type: 'number', message: '积分必须为数值'}
        ]
      },

      multipleSelection: []
    }
  },
  methods: {
    handleSizeChange(val) {
      this.currentSize = val;
      this.currentPage = 1;
      this.updateData();
    },
    handleCurrentChange(val) {
      this.currentPage = val;
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
      authors.getAuthors(data).then(res => {
        this.total = res.data.data.total;
        this.tableData = res.data.data.rows;
      }).catch(e => {
        console.log(e)
      });
    },
    handleAuthEdit(content){
      this.$confirm('此操作将撤销作者权限, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let ids = [];
        if(this.multipleSelection.length === 0) ids.push(content.userId)
        else for(let i of this.multipleSelection) ids.push(i.userId)
        let data = '';
        for(let i of ids) data += (i+',')
        data = data.substr(0,data.length - 1)
        adminAuth.deleteAuthor(data).then(res => {
          if(res.data.code === 1){
            this.$message.success(res.data.data);
            this.updateData();
          }else{
            this.$message.error(res.data.data);
          }
        }).catch(e => {
          console.log(e)
        });
      }).catch(() => {

      });
    },
    handleInfoEdit(content){
      this.formModifyWriter.id = content.userId;
      this.formModifyWriter.authorname = content.authorname;
      this.formModifyWriter.name = content.name;
      this.formModifyWriter.username = content.username;
      this.formModifyWriter.gender = content.gender;
      this.formModifyWriter.email = content.email;
      this.formModifyWriter.birthday = content.birthday;
      this.formModifyWriter.province = content.province;
      this.formModifyWriter.area = content.area;
      this.formModifyWriter.emailcode = content.emailcode;
      this.formModifyWriter.balance = parseFloat(content.balance);

      this.dialogModifyWriterVisible = true;
    },
    modifyUserCommit(){
      this.$refs.formModifyWriter.validate((valid) => {
        if(valid){
          personalSetting.updateSelfInfo(this.formModifyWriter).then(res => {
            if(res.data.code === 1){
              let data = new FormData();
              data.append('id',this.formModifyWriter.id);
              data.append('balance',this.formModifyWriter.balance);
              adminAuth.modifyBalance(data).then(res => {
                if(res.data.code === 1){
                  let data2 = {
                    'id': this.formModifyWriter.id,
                    'name': this.formModifyWriter.authorname
                  }
                  authorAuth.modifyAuthorName(data2).then(res => {
                    if(res.data.code === 1){
                      this.$message.success(res.data.data);
                      this.dialogModifyWriterVisible = false;
                      this.updateData();
                    }
                  }).catch(e => {
                    console.log(e)
                  })
                }else{
                  this.$message.error(res.data.data);
                }
              }).catch(e => {
                console.log(e)
              });
            }else{
              this.$message.error(res.data.data);
            }
          }).catch(e => {
            console.log(e)
          });
        }
      });
    },
    handleSelectionChange(val) {
      this.multipleSelection = val;
    },
    handleDelete(content){
      this.$confirm('此操作将永久删除用户, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let ids = [];
        if(this.multipleSelection.length === 0) ids.push(content.userId)
        else for(let i of this.multipleSelection) ids.push(i.userId)
        let data = '';
        for(let i of ids) data += (i+',')
        data = data.substr(0,data.length - 1)
        adminAuth.deleteUsers(data).then(res => {
          if(res.data.code === 1){
            this.$message.success(res.data.data);
            this.updateData();
          }else{
            this.$message.error(res.data.data);
          }
        }).catch(e => {
          console.log(e)
        });
      }).catch(() => {

      });
    }
  },
  created() {
    this.updateData();
  }
}
</script>

<style scoped>

.authModifySelect {
  margin: 0 10px 0 10px;
}

</style>