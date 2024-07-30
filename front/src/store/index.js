import Vue from 'vue'
import Vuex from 'vuex'
import personalSetting from "@/api/home/PersonalSettings/personalSetting";
import chatRoom from "@/api/home/Activities/chatRoom";
import friend from "@/api/home/Activities/friend";
import {EventBus} from '@/utils/eventBus'

Vue.use(Vuex);

function sortFriendsList(){
	store.state.friends_list.sort(function(a, b){
		if(!('unRead' in a)) return -1;
		else if(!('unRead' in b)) return 1;
		else if(a.unRead !== 0 || b.unRead !==0) return b.unRead - a.unRead;
		else return new Date(b.time).getTime() - new Date(a.time).getTime();
	})
}

const store = new Vuex.Store({
	state:{
		selfInfo:{
			id: 0,
			userName: '',
			nickName: '',
			image: '',
			isAuth: false,
			isAdmin: false,
			gender: null,
			email: '',
			balance: 0.0,
			birthday: '',
			province: '',
			area: '',
			emailCode: ''
		},
		chat_messages: [],
		chat_room_unRead : 0,
		chat_room_enter: false,

		friends_list_unRead: 0,
		friends_list: [],
		friendChatId: 0,
		friends_chat_messages: [],
		friend_chat_enter: false
	},
	mutations:{
		infoUpdate(state,vue = null){
			state.selfInfo.id = parseInt(localStorage.getItem('id'));
			personalSetting.getSelfInfo(state.selfInfo.id).then(res => {
				if(res.data.code === 1){
					if(res.data.data === null){
						setTimeout(()=>{
							vue.$router.replace('/login');
						},1000)
						localStorage.removeItem('token');
						localStorage.setItem('colorStyle', '0');
						alert('你的账号被吃了！')
					}
					state.selfInfo.userName = res.data.data.username;
					state.selfInfo.nickName = res.data.data.name;
					state.selfInfo.image = res.data.data.image;
					state.selfInfo.isAuth = res.data.data.author !== null;
					state.selfInfo.isAdmin = res.data.data.admin !== null;
					state.selfInfo.gender = res.data.data.gender===null?null:parseInt(res.data.data.gender);
					state.selfInfo.email = res.data.data.email;
					state.selfInfo.balance = parseFloat(res.data.data.balance);
					state.selfInfo.birthday = res.data.data.birthday;
					state.selfInfo.province = res.data.data.province;
					state.selfInfo.area = res.data.data.area;
					state.selfInfo.emailCode = res.data.data.emailcode;
				}else{
					console.log('logging error:' + res.data.msg)
				}
			}).catch(e => {
				console.log(e)
			});
		},
		chatMessagesUpdate(state){
			chatRoom.getChatMes(state.selfInfo.id).then(res => {
				state.chat_messages = res.data.data;
			}).catch(e => {
				console.log(e)
			})
		},
		friendChatMessagesUpdate(state,id){
			chatRoom.getChatMes(state.selfInfo.id,id).then(res => {
				state.friends_chat_messages = res.data.data;
				for(let item of state.friends_list){
					if(item.id === id){
						state.friends_list_unRead -= item.unRead;
						item.unRead = 0;
						break;
					}
				}
				EventBus.$emit('friendChatScrollRefresh',true);
			}).catch(e => {
				console.log(e)
			})
		},
		chatMesPush(state,msg,self = true){
			state.chat_messages.push(msg);
			if(state.chat_room_enter) EventBus.$emit('chatRoomScrollRefresh', self);
		},
		friendMesPush(state,msg,self=true){
			state.friends_chat_messages.push(msg);
			EventBus.$emit('friendChatScrollRefresh', self);
		},
		setChatRoomEnter(state,b){
			state.chat_room_enter = b;
			if(b===true) state.chat_room_unRead = 0;
		},
		addChatRoomUnread(state){
			state.chat_room_unRead++;
		},
		addFriendChatUnread(state){
			state.friends_list_unRead++;
		},
		friendsListUpdate(state){
			friend.getFriendList(state.selfInfo.id).then(res => {
				state.friends_list_unRead = 0;
				if(res.data.code === 1){
					state.friends_list = res.data.data;
					for(let item of res.data.data) state.friends_list_unRead += item.unRead;
					friend.getFriendRequestList(state.selfInfo.id).then(res => {
						if(res.data.code === 1 && res.data.data.length > 0) for(let item of res.data.data){
							state.friends_list_unRead++;
							state.friends_list.push(item);
						}
						sortFriendsList();
					}).catch(e => {
						console.log(e)
					})}
				}
			).catch(e => {
				console.log(e)
			})

		},
		friendsListUpdateSelf(state,data){
			let target = ('username' in data)?data.send:data.id
			if(target === state.selfInfo.id) target = state.friendChatId
			for(let item of state.friends_list){
				if(item.id === target){
					item.send = ('username' in data)?data.send:data.id;
					item.msg = data.msg;
					item.time = data.time;
					break;
				}
			}
			sortFriendsList();
		},
		friendsListUpdateSingle(state,id){
			let data = {
				'send': state.selfInfo.id,
				'receive': id
			}
			friend.getFriendListSingle(data).then(res => {
				if(res.data.code === 1){
					for(let item of state.friends_list){
						if(item.id === res.data.data.id){
							item.send = res.data.data.id
							item.msg = res.data.data.msg
							item.time = res.data.data.time
							item.unRead = res.data.data.unRead
							state.friends_list_unRead++;
							break;
						}
					}
					sortFriendsList()
				}
			}).catch(e => {
				console.log(e)
			})
		},
		setFriendChatId(state,id){state.friendChatId = id}
	},
	actions:{

	},
	getters:{

	}

})
export default store