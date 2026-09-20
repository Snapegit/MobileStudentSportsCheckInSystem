<template>
	<view class="content">
		<view class="box" :style='{"width":"100%","padding":"0px 40rpx 0","backgroundColor":"#edf2ff","backgroundSize":"100% 100%","backgroundImage":"url(http://codegen.caihongy.cn/20231206/330ac64c394b4b488d83e6264f2bd05b.gif)","height":"100%"}'>
			<view :style='{"padding":"30rpx","borderRadius":"40rpx 40rpx 0 0","background":"linear-gradient(180deg, rgba(213,224,255,0.5) 0%, rgba(255,255,255,0) 100%)","display":"block","width":"100%","position":"relative","height":"auto"}'>
				<image :style='{"margin":"0 0 0","borderRadius":"8rpx","top":"-180rpx","display":"none","width":"160rpx","position":"absolute","height":"160rpx"}' src="http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg" mode="aspectFill"></image>
				<view v-if="loginType==1" :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' class="uni-form-item uni-column">
					<view :style='{"width":"188rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#A1A1A1"}' class="label">账号：</view>
					<input v-model="username" :style='{"border":"0px solid rgb(255, 170, 51)","padding":"0px 24rpx","margin":"0px","color":"#1A1A1A","borderRadius":"40rpx","flex":"1","background":"#F8F8F8","fontSize":"28rpx","height":"88rpx"}' type="text" class="uni-input" name="" placeholder="请输入账号" />
				</view>
				<view v-if="loginType==1" :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' class="uni-form-item uni-column">
					<view :style='{"width":"188rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#A1A1A1"}' class="label">密码：</view>
					<input v-model="password" :style='{"border":"0px solid rgb(255, 170, 51)","padding":"0px 24rpx","margin":"0px","color":"#1A1A1A","borderRadius":"40rpx","flex":"1","background":"#F8F8F8","fontSize":"28rpx","height":"88rpx"}' type="password" class="uni-input" name="" placeholder="请输入密码" />
				</view>
				<view v-if="roleNum>1" :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}'>
					<view :style='{"width":"188rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#A1A1A1"}' class="label">用户类型：</view>
					<picker @change="optionsChange" :value="index" :range="options" :style='{"padding":"0 20rpx","color":"#1A1A1A","borderRadius":"40rpx","flex":"1","background":"#F8F8F8","display":"inline-block","lineHeight":"88rpx","fontSize":"28rpx","float":"right"}'>
						<view class="uni-picker-type">{{options[index]}}</view>
					</picker>
				</view>
				

				
				<button v-if="loginType==1" class="btn-submit" @tap="onLoginTap" type="primary" :style='{"border":"0","padding":"0px","margin":"0 0 24rpx 0","color":"rgb(255, 255, 255)","borderRadius":"40rpx","background":"#0060C8","width":"100%","lineHeight":"88rpx","fontSize":"40rpx","height":"88rpx"}'>登录</button>
				<button v-if="loginType==2" class="btn-submit" @tap="onFaceLoginTap" type="primary" :style='{"border":"0","padding":"0px","margin":"0 0 24rpx 0","color":"rgb(255, 255, 255)","borderRadius":"40rpx","background":"#0060C8","width":"100%","lineHeight":"88rpx","fontSize":"40rpx","height":"88rpx"}'>人脸识别登录</button>
				<view class="links" :style='{"width":"100%","margin":"0 0 24rpx 0","flexWrap":"wrap","display":"flex","height":"auto"}'>
					<view class="link-highlight" @tap="onRegisterTap('xuesheng')" :style='{"border":"2rpx solid #7C9EFF","padding":"10rpx 20rpx","margin":"16rpx 1%","color":"#999","borderRadius":"40rpx","textAlign":"center","background":"#fff","width":"30%","fontSize":"28rpx"}'>注册学生</view>
					<view class="link-highlight" @tap="onRegisterTap('jiaoshi')" :style='{"border":"2rpx solid #7C9EFF","padding":"10rpx 20rpx","margin":"16rpx 1%","color":"#999","borderRadius":"40rpx","textAlign":"center","background":"#fff","width":"30%","fontSize":"28rpx"}'>注册教师</view>
				</view>
				
				<view class="idea1" :style='{"width":"100%","background":"red","display":"none","height":"80rpx"}'>idea1</view>
				<view class="idea2" :style='{"width":"100%","background":"red","display":"none","height":"80rpx"}'>idea2</view>
				<view class="idea3" :style='{"width":"100%","background":"red","display":"none","height":"80rpx"}'>idea3</view>
			</view>
		</view>
	</view>
</template>

<script>
	import menu from '@/utils/menu'
	export default {
		data() {
			return {
				username: '',
				password: '',
                loginType:1,
				codes: [{
				  num: 1,
				  color: '#000',
				  rotate: '10deg',
				  size: '16px'
				}, {
				  num: 2,
				  color: '#000',
				  rotate: '10deg',
				  size: '16px'
				}, {
				  num: 3,
				  color: '#000',
				  rotate: '10deg',
				  size: '16px'
				}, {
				  num: 4,
				  color: '#000',
				  rotate: '10deg',
				  size: '16px'
				}],
				options: [
					'请选择登录用户类型',
				],
                optionsValues: [
					'',
                    'xuesheng',
                    'jiaoshi',
				],
				index: 0,
				roleNum:0,

			}
		},
		onLoad() {
			let options = ['请选择登录用户类型'];
			let menus = menu.list();
			this.menuList = menus;
			for(let i=0;i<this.menuList.length;i++){
				if(this.menuList[i].hasFrontLogin=='是'){
					options.push(this.menuList[i].roleName);
					this.roleNum++;
				}
			}
			if(this.roleNum==1) {
				this.index = 1;
			}	
			this.options = options;
			this.styleChange()
		},
		onShow() {
		},
		mounted() {
		},
		methods: {
			styleChange() {
				this.$nextTick(()=>{
					// document.querySelectorAll('.uni-input .uni-input-input').forEach(el=>{
					//   el.style.backgroundColor = this.loginFrom.content.input.backgroundColor
					// })
				})
			},
			onRegisterTap(tableName) {
                uni.setStorageSync("loginTable", tableName);
				this.$utils.jump('../register/register')
			},
			async onLoginTap() {
                if (!this.username) {
					this.$utils.msg('请输入用户名')
					return
				}
                if (!this.password) {
					this.$utils.msg('请输入用户密码')
					return
				}
                if (!this.optionsValues[this.index]) {
					this.$utils.msg('请选择登录用户类型')
					return
				}

				this.loginPost()

			},
			async loginPost() {
				
				let res = await this.$api.login(`${this.optionsValues[this.index]}`, {
					username: this.username,
					password: this.password
				});
				uni.removeStorageSync("useridTag");
				uni.setStorageSync("appToken", res.token);
				uni.setStorageSync("nickname",this.username);
				uni.setStorageSync("nowTable", `${this.optionsValues[this.index]}`);
				res = await this.$api.session(`${this.optionsValues[this.index]}`);
				if(res.data.touxiang) {
				    uni.setStorageSync('headportrait', res.data.touxiang);
				} else if(res.data.headportrait) {
				    uni.setStorageSync('headportrait', res.data.headportrait);
				}
				uni.setStorageSync('userSession',JSON.stringify(res.data))
				// 保存用户id
				uni.setStorageSync("appUserid", res.data.id);
				if(res.data.vip) {
					uni.setStorageSync("vip", res.data.vip);
				}
				uni.setStorageSync("appRole", `${this.options[this.index]}`);
				this.$utils.tab('../index/index');
			},
			optionsChange(e) {
				this.index = e.target.value
			}
		}
	}
</script>

<style lang="scss" scoped>
	page {
		height: 100%;
	}
	
	.content {
		height: 100%;
		box-sizing: border-box;
	}
	
</style>
