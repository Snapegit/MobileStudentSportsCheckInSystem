<template>
	<view class="content">
		<view :style='{"width":"100%","padding":"24rpx 24rpx 0px","background":"#F4F8FB","height":"100vh"}'>
			<view v-if="user&&user.id" :style='{"padding":"24rpx","margin":"0 0 20rpx 0","borderRadius":"20rpx","background":"#fff","display":"flex","width":"100%","position":"relative","height":"280rpx"}' @tap="onPageTap('../user-info/user-info')" class="header" v-bind:class="{'status':isH5Plus}">
				<view :style='{"width":"100%","flexWrap":"wrap","display":"flex","height":"100%"}' v-if="tableName=='xuesheng'" class="userinfo">
					<image :style='{"width":"88rpx","padding":"0","margin":"0 20rpx 0 0","borderRadius":"100%","height":"88rpx"}' :src="user.touxiang?baseUrl+user.touxiang:'/static/gen/upload.png'"></image>
					<view :style='{"flex":"1","flexDirection":"column","justifyContent":"center","display":"flex"}' class="info">
						<view :style='{"width":"100%","lineHeight":"36rpx","fontSize":"24rpx","color":"#000000"}'>{{user.xuehao}}<text v-if="user.vip&& user.vip=='是'">(VIP)</text></view>
					</view>
					
					<view :style='{"width":"100%","margin":"16rpx 0","flexWrap":"wrap","justifyContent":"space-around","display":"flex"}' class="info">
						<view :style='{"color":"#0060C8","lineHeight":"36rpx","fontSize":"24rpx"}'>手机：{{user.shouji}}</view>
					</view>
				</view>
				<view :style='{"width":"100%","flexWrap":"wrap","display":"flex","height":"100%"}' v-if="tableName=='jiaoshi'" class="userinfo">
					<view :style='{"flex":"1","flexDirection":"column","justifyContent":"center","display":"flex"}' class="info">
						<view :style='{"width":"100%","lineHeight":"36rpx","fontSize":"24rpx","color":"#000000"}'>{{user.jiaoshigonghao}}<text v-if="user.vip&& user.vip=='是'">(VIP)</text></view>
					</view>
					
					<view :style='{"width":"100%","margin":"16rpx 0","flexWrap":"wrap","justifyContent":"space-around","display":"flex"}' class="info">
						<view :style='{"color":"#0060C8","lineHeight":"36rpx","fontSize":"24rpx"}'>电话：{{user.dianhua}}</view>
					</view>
				</view>
				<view :style='{"padding":"0","alignItems":"center","top":"0","display":"flex","width":"160rpx","position":"absolute","right":"0","justifyContent":"center","height":"80rpx"}' class="setting">
					<text class="icon iconfont icon-qita6" :style='{"border":"0","width":"40rpx","lineHeight":"40rpx","fontSize":"40rpx","color":"#0060C8","borderRadius":"0"}'></text>
					<text :style='{"color":"#0060C8","lineHeight":"2","fontSize":"24rpx"}'>设置</text>
				</view>
			</view>
			
			<view v-else :style='{"padding":"24rpx","margin":"0 0 20rpx 0","borderRadius":"20rpx","background":"#fff","display":"flex","width":"100%","position":"relative","height":"280rpx"}' @tap="loginClick" class="header" v-bind:class="{'status':isH5Plus}">
				<view :style='{"alignItems":"center","color":"#666","display":"flex","width":"100%","fontSize":"36rpx","justifyContent":"center","height":"100%"}'>登录/注册</view>
			</view>
			
			<view :style='{"width":"100%","height":"auto"}' class="list">
				
				<view :style='{"width":"100%","overflow":"hidden","borderRadius":"20rpx","background":"#fff","height":"auto"}'>
					<view :style='{"width":"100%","padding":"0 20rpx","justifyContent":"space-between","display":"flex","height":"auto"}'>
						<view :style='{"fontSize":"32rpx","lineHeight":"72rpx","color":"#0060C8","fontWeight":"700"}'>我的服务</view>
					</view>
					<view :style='{"width":"100%","padding":"0 24rpx","flexWrap":"wrap","display":"flex","height":"auto"}'>
					
						<block v-for="item in menuList" v-bind:key="item.roleName">
							<block v-if="role==item.roleName" v-bind:key="menu.menu" v-for="(menu,index) in item.backMenu">
								<block v-bind:key="child.tableName" v-for=" (child,sort) in menu.child">
									<view :style='{"borderColor":"#ccc","alignItems":"center","borderWidth":"0","display":"flex","width":"100%","borderStyle":"solid","height":"auto"}' v-if="child.tableName!='orders/已发货' && child.tableName!='orders/已退款' &&child.tableName!='orders/已取消' && child.tableName!='orders/未支付' && child.tableName!='orders/已支付' && child.tableName!='orders/已完成' && child.tableName!='exampaper' && child.tableName!='examquestion' " @tap="onPageTap('../'+child.tableName+'/list?userid='+user.id+'&menuJump='+child.menuJump)" class="li" hover-class="hover">
										<view :style='{"color":"#000000","lineHeight":"1","fontSize":"40rpx"}' :class="child.appFrontIcon"></view>
										<view :style='{"width":"100%","padding":"0 20rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#000000","flex":"1"}' class="text">{{child.menu}}</view>
										<view :style='{"width":"28rpx","lineHeight":"28rpx","fontSize":"28rpx","color":"#999"}' class="icon iconfont icon-jinru"></view>
									</view>
								</block>
							</block>
						</block>
						
						
						<view @tap="onPageTap('../forum-my/forum-my')" :style='{"borderColor":"#ccc","alignItems":"center","borderWidth":"0","display":"flex","width":"100%","borderStyle":"solid","height":"auto"}' class="li"
						 hover-class="hover">
							<view :style='{"color":"#000000","lineHeight":"1","fontSize":"40rpx"}' class="cuIcon-scan"></view>
							<view class="text" :style='{"width":"100%","padding":"0 20rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#000000","flex":"1"}'>我的发贴</view>
							<view :style='{"width":"28rpx","lineHeight":"28rpx","fontSize":"28rpx","color":"#999"}' class="icon iconfont icon-jinru"></view>
						</view>
						<view v-if="user&&user.id" @tap="passwordShow()" :style='{"borderColor":"#ccc","alignItems":"center","borderWidth":"0","display":"flex","width":"100%","borderStyle":"solid","height":"auto"}' class="li" hover-class="hover">
							<view :style='{"color":"#000000","lineHeight":"1","fontSize":"40rpx"}' class="cuIcon-lock"></view>
							<view class="text" :style='{"width":"100%","padding":"0 20rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#000000","flex":"1"}'>修改密码</view>
							<view :style='{"width":"28rpx","lineHeight":"28rpx","fontSize":"28rpx","color":"#999"}' class="icon iconfont icon-jinru"></view>
						</view>
					</view>
				</view>
			</view>
			
			<!-- 推荐 -->
			<view style="width: 100%;height: 80px"></view>
		</view>
		<uni-popup class="popup-content" ref="passwordPopup" type="bottom">
			<view class="passwordForm">
				<view class="passwordInput">
					<input type="password" v-model="passwordForm.mima" placeholder="原密码" />
				</view>
				<view class="passwordInput">
					<input type="password" v-model="passwordForm.newmima" placeholder="新密码" />
				</view>
				<view class="passwordInput">
					<input type="password" v-model="passwordForm.newmima1" placeholder="确认密码" />
				</view>
				<view class="passwordBtnView">
					<button class="passwordBtn" @click="updatePassword">更新</button>
				</view>
			</view>
		</uni-popup>
	</view>
</template>
<script>
	import menu from '@/utils/menu'
	export default {
		data() {
			return {
				isH5Plus: true,
				user: {},
				tableName:'',
				role: '',
				menuList: [],
				iconArr: [
				  'cuIcon-same',
				  'cuIcon-deliver',
				  'cuIcon-evaluate',
				  'cuIcon-shop',
				  'cuIcon-ticket',
				  'cuIcon-cascades',
				  'cuIcon-discover',
				  'cuIcon-question',
				  'cuIcon-pic',
				  'cuIcon-filter',
				  'cuIcon-footprint',
				  'cuIcon-pulldown',
				  'cuIcon-pullup',
				  'cuIcon-moreandroid',
				  'cuIcon-refund',
				  'cuIcon-qrcode',
				  'cuIcon-remind',
				  'cuIcon-profile',
				  'cuIcon-home',
				  'cuIcon-message',
				  'cuIcon-link',
				  'cuIcon-lock',
				  'cuIcon-unlock',
				  'cuIcon-vip',
				  'cuIcon-weibo',
				  'cuIcon-activity',
				  'cuIcon-friendadd',
				  'cuIcon-friendfamous',
				  'cuIcon-friend',
				  'cuIcon-goods',
				  'cuIcon-selection'
				],
				passwordForm: {
					mima: '',
					newmima: '',
					newmima1: '',
				},
			};
		},
		computed: {
			baseUrl() {
				return this.$base.url;
			},
		},
		async onLoad(){
			let menus = menu.list();
			this.menuList = menus;
		},
		async onShow(){
            uni.removeStorageSync("useridTag");
			this.role = uni.getStorageSync("appRole");
			await this.getSession()
			this.getStoreup()
			this.tableName = uni.getStorageSync("nowTable");
			let menus = menu.list();
			this.menuList = menus;
			this.mypic = uni.getStorageSync('headportrait')
			this.$forceUpdate()
		},
		methods: {
			async getSession(){
				let table = uni.getStorageSync("nowTable");
				let res = await this.$api.session(table);
				this.user = res.data;
				this.$forceUpdate()
			},
			async getStoreup(){
				if(!this.user||!this.user.id){
					return false
				}
				let res = await this.$api.page('storeup',{userid: this.user.id,type: 1})
				this.user.storenum = Number(res.data.total)
				this.$forceUpdate()
			},
			loginClick(){
				uni.navigateTo({
					url: '../login/login'
				});
			},
			onPageTap(url) {
                uni.setStorageSync("useridTag",1);
				uni.navigateTo({
					url: url,
					fail: function() {
						uni.switchTab({
							url: url
						});
					}
				});
			},
			recommendDetail(id) {
				uni.navigateTo({
					url: `../${this.recommendTable}/detail?id=${id}`,
					fail: function() {
						uni.switchTab({
							url: `../${this.recommendTable}/detail?id=${id}`
						});
					}
				});
			},
			passwordShow() {
				this.passwordForm = {
					mima: '',
					newmima: '',
					newmima1: '',
				}
				this.$forceUpdate()
				this.$refs.passwordPopup.open()
			},
			async updatePassword() {
				if (this.passwordForm.mima == ''){
					this.$utils.msg('原密码不能为空')
					return false
				}
				if (this.passwordForm.newmima == ''){
					this.$utils.msg('新密码不能为空')
					return false
				}
				if (this.passwordForm.newmima1 == ''){
					this.$utils.msg('确认密码不能为空')
					return false
				}
				let password = ''
				if (this.user.mima) {
					password = this.user.mima;
				} else if (this.user.password) {
					password = this.user.password;
				}
				let newpassword = this.passwordForm.mima
				if(password != newpassword){
					this.$utils.msg('原密码不正确')
					return false
				}
				if (this.passwordForm.newmima != this.passwordForm.newmima1){
					this.$utils.msg('两次密码不一致')
					return false
				}
				if (this.passwordForm.mima == this.passwordForm.newmima){
					this.$utils.msg('新密码与原密码相同！')
					return false
				}
				if (this.tableName == 'xuesheng') {
				}
				if (this.tableName == 'jiaoshi') {
				}
				this.user.password = this.passwordForm.newmima
				this.user.mima = this.passwordForm.newmima
				await this.$api.update(this.tableName,this.user)
				this.$utils.msg('修改密码成功,下次登录系统生效')
				this.$refs.passwordPopup.close()
				this.getSession()
			},
		}
	}
</script>

<style lang="scss" scoped>
	.content {
		height: calc(100vh - 94px);
		box-sizing: border-box;
	}
	.passwordForm {
		width: 100%;
		padding: 10px 20px 60px;
		background: #fff;
	
		.passwordInput {
			background: #eee;
			margin: 0 0 10px;
			padding: 0 10px;
	
			input {
				height: 36px;
				line-height: 36px;
				font-size: 14px;
			}
		}
	
		.passwordBtnView {
			width: 100%;
			display: flex;
			align-items: center;
			justify-content: center;
			padding: 10px 0;
	
			.passwordBtn {
				padding: 0 20px;
				width: auto;
				height: 20px;
				line-height: 20px;
				font-size: 14px;
				color: #fff;
				background: #007aff;
				border: none;
				border-radius: 5px;
	
			}
		}
	}
</style>
