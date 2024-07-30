<template>
  <div class="lottery_main">
    <el-row class="lottery_screen">
      <div class="lottery_cards">
        <el-row class="lottery_row">
          <div class="lottery_col" v-show="lottery_one_start">
            <el-image :style="lottery_one_card_style" :src="lottery_one_card_image" fit="fit"
                      @mouseover="handleCardHover(1,lottery_one_card_style)"
                      @mouseleave="handleCardHover(0,lottery_one_card_style)"
                      @click="handleCardClick(lottery_one_card_style)">
            </el-image>
            <div v-show="lottery_one_open" class="lottery_card_level" :style="lottery_one_card_level_style">
              {{ this.lottery_one_card_item.level }}
            </div>
            <div v-show="lottery_one_open" class="lottery_card_name">
              {{ this.lottery_one_card_item.name }}
            </div>
          </div>
        </el-row>
        <el-row v-show="!lottery_one_start" v-for="row in Math.ceil(10.0 / card_row_max)" :key="row">
          <el-row class="lottery_row">
            <div class="lottery_seat" :style="card_seat_style" v-for="index in card_row_max" :key="index">
              <el-col class="lottery_col" v-show="lottery_ten_starts[(row-1)*card_row_max + (index-1)]">
                <el-image :style="lottery_ten_cards_style[(row-1)*card_row_max + (index-1)]" :src="lottery_ten_cards_images[(row-1)*card_row_max + (index-1)]" fit="fit"
                          @mouseover="handleCardHover(1,lottery_ten_cards_style[(row-1)*card_row_max + (index-1)],true)"
                          @mouseleave="handleCardHover(0,lottery_ten_cards_style[(row-1)*card_row_max + (index-1)],true)"
                          @click="handleCardClick(lottery_ten_cards_style[(row-1)*card_row_max + (index-1)],true)">
                </el-image>
                <div v-show="lottery_ten_opens[(row-1)*card_row_max + (index-1)]" class="lottery_card_level" :style="lottery_ten_cards_level_style[(row-1)*card_row_max + (index-1)]">
                  {{ lottery_ten_card_items.length>0 ? lottery_ten_card_items[(row-1)*card_row_max + (index-1)].level : '' }}
                </div>
                <div v-show="lottery_ten_opens[(row-1)*card_row_max + (index-1)]" class="lottery_card_name">
                  {{ lottery_ten_card_items.length>0 ? lottery_ten_card_items[(row-1)*card_row_max + (index-1)].name : '' }}
                </div>
              </el-col>
            </div>
          </el-row>
        </el-row>
      </div>
    </el-row>
    <el-row class="lottery_buttons" type="flex" justify="end">
      <el-col :span="6">
        <el-button v-show="this.lottery_ten_start" class="lottery_button" type="success" round @click="handleLotteryAllClick">全部翻开</el-button>
      </el-col>
      <el-col :span="6">
        <el-button class="lottery_button" type="info" round :disabled="this.selfInfo.balance < 50.0" @click="handleLotteryOne">单抽(￥50)</el-button>
      </el-col>
      <el-col :span="6">
        <el-button class="lottery_button" type="warning" round :disabled="this.selfInfo.balance < 500.0" @click="handleLotteryTen">十连(￥500)</el-button>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import lottery from "@/api/home/Activities/lottery";
import {default_lottery_card_url} from "@/utils/url";
import {mapMutations, mapState} from "vuex"

export default {
  name: "lotteryMain",
  data() {
    return {
      card_rarity_shadows: {
        'S': '20px 20px 40px rgba(255, 255, 0, 0.75), -20px -20px 40px rgba(255, 255, 0, 0.75)',
        'A': '10px 10px 20px rgba(204, 0, 203, 0.75), -10px -10px 20px rgba(204, 0, 203, 0.75)',
        'B': '10px 10px 20px rgba(77, 121, 255, 0.75), -10px -10px 20px rgba(77, 121, 255, 0.75)'
      },
      card_rarityS_size_prop: 1.2,
      card_rarityS_click_speed_prop: 3.5,
      lottery_card_level_colors: {
        'S': 'rgba(255, 255, 0)',
        'A': 'rgba(204, 0, 203)',
        'B': 'rgba(77, 121, 255)'
      },

      lottery_one_start: false,
      lottery_one_appear: false,
      lottery_one_click: false,
      lottery_one_open: false,
      lottery_one_card_image: default_lottery_card_url,
      lottery_one_card_style: {
        width: '',
        height: '',
        opacity: '0%',
        'box-shadow': ''
      },
      lottery_one_card_level_style: {'color': '', 'text-shadow': ''},
      lottery_one_card_interval: null,
      lottery_one_card_item: {},

      lottery_ten_start: false,
      lottery_ten_starts: [false,false,false,false,false,false,false,false,false,false],
      lottery_ten_appears: [false,false,false,false,false,false,false,false,false,false],
      lottery_ten_click_count: 0,
      lottery_ten_clicks: [false,false,false,false,false,false,false,false,false,false],
      lottery_ten_opens: [false,false,false,false,false,false,false,false,false,false],
      lottery_ten_cards_images: [],
      lottery_ten_cards_style: [],
      lottery_ten_cards_level_style: [],
      lottery_ten_card_interval: null,
      lottery_ten_card_intervals: [null,null,null,null,null,null,null,null,null,null],
      lottery_ten_card_items: [],

      card_row_max: 5,
      card_hover_point: 1.12,
      card_default_size: 160,
      card_default_prop: 1.486,
      card_default_width: '',
      card_default_height: '',
      card_hover_width: '',
      card_hover_height: '',
      card_hover_opacity: '60%',
      card_seat_style: {'width' : '','height': ''},
      card_appear_speed: 8.5,
      card_appears_split_speed: 100,
      card_click_speed: 5
    }
  },
  computed: {
    ...mapState(['selfInfo'])
  },
  methods: {
    ...mapMutations(['infoUpdate']),
    handleLotteryOne(){
      let data = {
        'id': this.selfInfo.id,
        'num': 1
      }
      lottery.lottery(data).then(res => {
        if(res.data.code === 1){
          this.lottery_one_open = false;
          this.lottery_one_card_style["box-shadow"] = ''
          this.lottery_one_card_item = res.data.data[0];
          this.lottery_ten_start = false;
          this.lottery_one_start = true;
          this.$emit('update-message', true);
          this.infoUpdate();
          for(let i = 0; i < 10; i++) this.lottery_ten_starts[i] = false;
          this.clearAllIntervals();
          this.handleCardAppear(this.lottery_one_card_style)
        }else this.$message.error(res.data.msg)
      }).catch(e => {
        console.log(e)
      })
    },
    handleLotteryTen(){
      let data = {
        'id': this.selfInfo.id,
        'num': 10
      }
      lottery.lottery(data).then(res => {
        if(res.data.code === 1){
          for(let i = 0; i < 10; i++){
            this.lottery_ten_cards_style[i]["box-shadow"] = ''
            this.lottery_ten_starts[i] = false;
            this.lottery_ten_opens[i] = false;
          }
          this.lottery_ten_card_items = res.data.data;
          this.$emit('update-message', true);
          this.lottery_ten_click_count= 0;
          this.infoUpdate();
          this.lottery_ten_start = false;
          this.lottery_one_start = false;
          this.clearAllIntervals();
          let index = 0;
          this.lottery_ten_card_interval = setInterval(()=>{
            this.lottery_ten_starts[index] = true;
            this.handleCardAppear(this.lottery_ten_cards_style[index],true);
            index++;
            if(index >= 10) clearInterval(this.lottery_ten_card_interval)
          },this.card_appears_split_speed)
        }else this.$message.error(res.data.msg)
      }).catch(e => {
        console.log(e)
      })
    },
    handleCardAppear(card,multi = false){
      let opacity = 0;
      card.width = this.card_default_size + 'px'
      card.height = this.card_default_size * this.card_default_prop + 'px'
      if(!multi){
        this.lottery_one_appear = false;
        this.lottery_one_card_image = default_lottery_card_url;
        clearInterval(this.lottery_one_card_interval);
        this.lottery_one_card_interval = setInterval(()=>{
          opacity += 0.01;
          if(opacity > 1.0){
            clearInterval(this.lottery_one_card_interval);
            this.lottery_one_appear = true;
            this.lottery_one_click = false;
            this.lottery_one_open = false;
            return;
          }
          card.opacity = opacity;
        },this.card_appear_speed);
      }
      else{
        this.lottery_ten_appears[card.index] = false;
        this.lottery_ten_cards_images[card.index] = default_lottery_card_url;
        clearInterval(this.lottery_ten_card_intervals[card.index]);
        this.lottery_ten_card_intervals[card.index] = setInterval(()=>{
          opacity += 0.01;
          if(opacity > 1.0){
            clearInterval(this.lottery_ten_card_intervals[card.index]);
            this.lottery_ten_appears[card.index] = true;
            this.lottery_ten_clicks[card.index] = false;
            this.lottery_ten_opens[card.index] = false;
            if(card.index === 9) this.lottery_ten_start = true;
            return;
          }
          card.opacity = opacity;
        },this.card_appear_speed);
      }
    },
    handleCardHover(state,card,multi = false){
      if(!multi && !this.lottery_one_appear) return;
      if(multi && !this.lottery_ten_appears[card.index]) return;
      let click_state;
      if(!multi) click_state = !this.lottery_one_click
      else click_state = !this.lottery_ten_clicks[card.index]
      if(state){
        if(!multi){if(!this.lottery_one_open) this.lottery_one_card_style["box-shadow"] = this.card_rarity_shadows[this.lottery_one_card_item.level]}
        else{if(!this.lottery_ten_opens[card.index]) this.lottery_ten_cards_style[card.index]["box-shadow"] = this.card_rarity_shadows[this.lottery_ten_card_items[card.index].level]}
        if(click_state) card.width = this.card_hover_width;
        if(click_state) card.height = this.card_hover_height;
        card.opacity = this.card_hover_opacity;
      }else{
        if(click_state){
          if(!multi){if(!this.lottery_one_open) this.lottery_one_card_style["box-shadow"] = ''}
          else{if(!this.lottery_ten_opens[card.index]) this.lottery_ten_cards_style[card.index]["box-shadow"] = ''}
        }
        if(click_state) card.width = this.card_default_width;
        if(click_state) card.height = this.card_default_height;
        card.opacity = '100%';
      }
    },
    handleCardClick(card,multi = false){
      if(!multi && (!this.lottery_one_appear || this.lottery_one_click || this.lottery_one_open)) return;
      if(multi && (!this.lottery_ten_appears[card.index] || this.lottery_ten_clicks[card.index] || this.lottery_ten_opens[card.index])) return;
      let width_point = 1;
      if(!multi){
        this.lottery_one_click = true;
        this.lottery_one_card_style["box-shadow"] = this.card_rarity_shadows[this.lottery_one_card_item.level]
        let card_click_speed = this.card_click_speed;
        if(this.lottery_one_card_item.level === 'S'){
          card_click_speed *= this.card_rarityS_click_speed_prop;
          this.lottery_one_card_style.width = this.card_default_size * this.card_rarityS_size_prop + 'px';
          this.lottery_one_card_style.height = this.card_default_size * this.card_default_prop * this.card_rarityS_size_prop + 'px';
        }
        this.lottery_one_card_interval = setInterval(()=>{
          width_point -= 0.02;
          if(width_point < 0.0){
            clearInterval(this.lottery_one_card_interval);
            this.lottery_one_card_image = this.lottery_one_card_item.image;
            this.lottery_one_card_interval = setInterval(()=>{
              width_point += 0.02;
              if(width_point > 1.0){
                clearInterval(this.lottery_one_card_interval);
                this.lottery_one_click = false;
                this.lottery_one_open = true;
                this.$emit('update-message', false);
                this.lottery_one_card_style.width = this.card_default_size + 'px';
                this.lottery_one_card_style.height = this.card_default_size * this.card_default_prop + 'px';
                this.lottery_one_card_level_style.color = this.lottery_card_level_colors[this.lottery_one_card_item.level];
                this.lottery_one_card_level_style["text-shadow"] = this.card_rarity_shadows[this.lottery_one_card_item.level];
                return;
              }
              card.width = this.card_default_size * width_point + 'px'
            },card_click_speed)
            return;
          }
          card.width = this.card_default_size * width_point + 'px'
        },card_click_speed)
      }else{
        this.lottery_ten_clicks[card.index] = true;
        let card_click_speed = this.card_click_speed;
        if(this.lottery_ten_card_items[card.index].level === 'S'){
          card_click_speed *= this.card_rarityS_click_speed_prop;
          this.lottery_ten_cards_style[card.index].width = this.card_default_size * this.card_rarityS_size_prop + 'px';
          this.lottery_ten_cards_style[card.index].height = this.card_default_size * this.card_default_prop * this.card_rarityS_size_prop + 'px';
        }
        this.lottery_ten_card_intervals[card.index] = setInterval(()=>{
          width_point -= 0.02;
          if(width_point < 0.0){
            clearInterval(this.lottery_ten_card_intervals[card.index]);
            this.lottery_ten_cards_images[card.index] = this.lottery_ten_card_items[card.index].image;
            this.lottery_ten_cards_style[card.index]["box-shadow"] = this.card_rarity_shadows[this.lottery_ten_card_items[card.index].level]
            this.lottery_ten_cards_level_style[card.index]["text-shadow"] = this.card_rarity_shadows[this.lottery_ten_card_items[card.index].level];
            this.lottery_ten_card_intervals[card.index] = setInterval(()=>{
              width_point += 0.02;
              if(width_point > 1.0){
                clearInterval(this.lottery_ten_card_intervals[card.index]);
                this.lottery_ten_clicks[card.index] = false;
                this.lottery_ten_opens[card.index] = true;
                this.lottery_ten_click_count++;
                if(this.lottery_ten_click_count === 10){
                  this.$emit('update-message', false);
                  this.$forceUpdate();
                }
                this.lottery_ten_cards_style[card.index].width = this.card_default_size + 'px';
                this.lottery_ten_cards_style[card.index].height = this.card_default_size * this.card_default_prop + 'px';
                this.lottery_ten_cards_level_style[card.index].color = this.lottery_card_level_colors[this.lottery_ten_card_items[card.index].level];
                return;
              }
              card.width = this.card_default_size * width_point + 'px'
            },card_click_speed)
            return;
          }
          card.width = this.card_default_size * width_point + 'px'
        },card_click_speed)
      }
    },
    handleLotteryAllClick(){
      let index = 0;
      this.lottery_ten_card_interval = setInterval(()=>{
        if(!this.lottery_ten_opens[index]) this.handleCardClick(this.lottery_ten_cards_style[index],true)
        index++;
        if(index >= 10) clearInterval(this.lottery_ten_card_interval)
      },this.card_appears_split_speed)
    },
    clearAllIntervals(){
      if(this.lottery_one_card_interval) clearInterval(this.lottery_one_card_interval)
      if(this.lottery_ten_card_interval) clearInterval(this.lottery_ten_card_interval)
      for(let i = 0; i < 10; i++) if(this.lottery_ten_card_intervals[i]) clearInterval(this.lottery_ten_card_intervals[i])
    }
  },
  created() {
    this.card_default_width = this.card_default_size + 'px';
    this.card_default_height = this.card_default_size * this.card_default_prop + 'px';
    this.card_hover_width = this.card_default_size * this.card_hover_point + 'px';
    this.card_hover_height = this.card_default_size * this.card_default_prop * this.card_hover_point + 'px';
    this.lottery_one_card_style.height = this.card_default_height;
    this.lottery_one_card_style.width = this.card_default_width;
    this.card_seat_style.width = this.card_default_size * this.card_hover_point+ 'px';
    this.card_seat_style.height = this.card_default_size * this.card_hover_point * this.card_default_prop + 'px';
    for(let i = 0; i < 10; i++){
      this.$set(this.lottery_ten_cards_style,i,JSON.parse(JSON.stringify(this.lottery_one_card_style)));
      this.$set(this.lottery_ten_cards_level_style,i,JSON.parse(JSON.stringify(this.lottery_one_card_level_style)));
      this.lottery_ten_cards_style[i].index = i;
      this.lottery_ten_cards_images[i] = default_lottery_card_url;
    }
  },
  beforeDestroy() {this.clearAllIntervals()}
}
</script>

<style scoped>

.lottery_main {
  height: 100%;
  background-color: rgba(255, 255, 255, 0.09);
  border-radius: 60px;
  margin: 0 20px 0 20px;
}

.lottery_screen {
  height: 90%;
}

.lottery_cards {
  height: 95%;
  margin: 20px 20px 20px 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  line-height: 75px;
}

.lottery_card_level {
  position: absolute;
  bottom: 165px;
  font-size: 50px;
  font-weight: bold;
  background-color: rgba(255, 255, 255, 0.1);
  width: 80px;
  text-align: center;
  border-radius: 50px;
  border-width: 50px;
}

.lottery_card_name {
  position: absolute;
  top: 165px;
  font-size: 35px;
  font-weight: bold;
  color: rgba(255, 255, 255);
  width: 160px;
  text-align: center;
}

.lottery_row {
  display: flex;
  flex-direction: row;
}

.lottery_seat {
  display: flex;
  align-items: center;
  margin-right: 10px;
  margin-bottom: 10px;
}

.lottery_col {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
}

.lottery_buttons {
  height: 10%;
}

.lottery_button {
  height: 50px;
  width: 200px;
  font-size: 20px;
  color: #daf5ff;
  box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5), -2px -2px 8px rgba(0, 0, 0, 0.3);
}

</style>