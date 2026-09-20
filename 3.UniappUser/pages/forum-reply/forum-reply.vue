<template>
<view class="content">
	<view :style='{"minHeight":"100vh","width":"100%","padding":"20rpx 40rpx","position":"relative","background":"#edeff3","height":"auto"}'>
		<form :style='{"width":"100%","padding":"24rpx","background":"#edeff3","display":"block","height":"auto"}'>
			<view :style='{"padding":"10rpx 44rpx","margin":"0 0 24rpx 0","borderColor":"#ccc","alignItems":"center","borderRadius":"20rpx","borderWidth":"0 0 2rpx 0","background":"#fff","display":"flex","width":"100%","borderStyle":"solid","height":"auto"}'>
				<xia-editor :style='{"minHeight":"300rpx","padding":"0","margin":"0px","flex":"1","background":"rgba(255, 255, 255, 0)","height":"auto"}' v-model="content" @editorChange="contentChange" placeholder="回复"></xia-editor>
			</view>
			<view :style='{"width":"100%","justifyContent":"center","display":"flex","height":"auto"}'>
				<button :style='{"border":"0","padding":"0px","margin":"0","color":"rgb(255, 255, 255)","borderRadius":"80rpx","background":"#0060c8","width":"100%","lineHeight":"80rpx","fontSize":"28rpx","height":"80rpx"}' @tap="onReplyTap" class="bg-red margin-tb-sm">提交回复</button>
			</view>
		</form>
	</view>
</view>
</template>

<script>
    import xiaEditor from '@/components/xia-editor/xia-editor'
	export default {
		data() {
			return {
				pid: '',
				content: '',
				username: '',
                avatarurl: '',
				user: {},
			}
		},
        components: {
            xiaEditor
        },
		async onLoad(options) {
			this.pid = options.pid;
			let table = uni.getStorageSync("nowTable");
			// 获取用户信息
			let res = await this.$api.session(table);
			this.user = res.data;
            if(table == `xuesheng`){
                this.username = this.user.xuehao
            }
            if(table == `jiaoshi`){
                this.username = this.user.jiaoshigonghao
            }
		},
		methods: {
            contentChange(e) {
                this.content = e
            },
			async onReplyTap() {
                this.avatarurl = uni.getStorageSync('headportrait')?uni.getStorageSync('headportrait'):'';
				
				await this.$api.save('forum',{
					parentid: this.pid,
					content: this.content,
                    avatarurl: this.avatarurl,
					username: this.username,
					toptime: this.$utils.getCurDateTime()
				});
				this.$utils.msgBack('回复成功');
			}
		}
	}
</script>

<style lang="scss" scoped>
	.content {
		min-height: calc(100vh - 44px);
		box-sizing: border-box;
	}
</style>
