<template>
<view class="content">
	<view class="box" :style='{"width":"100%","padding":"0px 40rpx 0","backgroundSize":"100% 100%","backgroundImage":"url(http://codegen.caihongy.cn/20231206/3555f706e28d4757bbe87fa5f3a2b267.gif)","height":"100%"}'>
		<view :style='{"padding":"30rpx","borderRadius":"40rpx 40rpx 0 0 ","background":"linear-gradient(180deg, rgba(213,224,255,0.5) 0%, rgba(255,255,255,0) 100%)","display":"block","width":"100%","position":"relative","height":"auto"}'>
			<image :style='{"margin":"0 auto 24rpx auto","borderRadius":"8rpx","top":"-180rpx","display":"none","width":"160rpx","position":"absolute","height":"160rpx"}' src="http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg" mode="aspectFill"></image>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' v-if="tableName=='xuesheng'" class="uni-form-item uni-column">
				<view :style='{"width":"188rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#A1A1A1"}' class="label">学号：</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"0px 24rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"40rpx","flex":"1","background":"#F8F8F8","fontSize":"28rpx","height":"88rpx"}'  v-model="ruleForm.xuehao"  type="text"  class="uni-input" name="" placeholder="学号" />
			</view>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' v-if="tableName=='xuesheng'" class="uni-form-item uni-column">
				<view :style='{"width":"188rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#A1A1A1"}' class="label">姓名：</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"0px 24rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"40rpx","flex":"1","background":"#F8F8F8","fontSize":"28rpx","height":"88rpx"}'  v-model="ruleForm.xingming"  type="text"  class="uni-input" name="" placeholder="姓名" />
			</view>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' v-if="tableName=='xuesheng'" class="uni-form-item uni-column">
				<view :style='{"width":"188rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#A1A1A1"}' class="label">密码：</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"0px 24rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"40rpx","flex":"1","background":"#F8F8F8","fontSize":"28rpx","height":"88rpx"}'  v-model="ruleForm.mima" type="password"  class="uni-input" name="" placeholder="密码" />
			</view>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' v-if="tableName=='xuesheng'" class="uni-form-item uni-column">
				<view :style='{"width":"188rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#A1A1A1"}' class="label">确认密码：</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"0px 24rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"40rpx","flex":"1","background":"#F8F8F8","fontSize":"28rpx","height":"88rpx"}' v-model="ruleForm.mima2" type="password" class="uni-input" name="" placeholder="确认密码" />
			</view>
            <view :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' v-if="tableName=='xuesheng'" class="">
				<view :style='{"width":"188rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#A1A1A1"}' class="label">性别：</view>
				<picker :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' v-if="tableName=='xuesheng'"  @change="xueshengxingbieChange" :value="xueshengxingbieIndex" :range="xueshengxingbieOptions">
					<view>
						<view :style='{"padding":"0 30rpx","color":"#1A1A1A","borderRadius":"40rpx","background":"#F8F8F8","flex":"1","display":"inline-block","lineHeight":"88rpx","fontSize":"28rpx","float":"right"}' class="uni-input">{{ruleForm.xingbie?ruleForm.xingbie:"请选择性别"}}</view>
					</view>
				</picker>
			</view>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' v-if="tableName=='xuesheng'" class="uni-form-item uni-column">
				<view :style='{"width":"188rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#A1A1A1"}' class="label">手机：</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"0px 24rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"40rpx","flex":"1","background":"#F8F8F8","fontSize":"28rpx","height":"88rpx"}'  v-model="ruleForm.shouji"  type="text"  class="uni-input" name="" placeholder="手机" />
			</view>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' v-if="tableName=='xuesheng'" class="uni-form-item uni-column">
				<view :style='{"width":"188rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#A1A1A1"}' class="label">班级：</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"0px 24rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"40rpx","flex":"1","background":"#F8F8F8","fontSize":"28rpx","height":"88rpx"}'  v-model="ruleForm.banji"  type="text"  class="uni-input" name="" placeholder="班级" />
			</view>
            <view :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' v-if="tableName=='xuesheng'" @tap="xueshengtouxiangTap" class="">
				<view :style='{"width":"188rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#A1A1A1"}' class="label">头像：</view>
				<image :style='{"width":"80rpx","borderRadius":"40rpx","background":"#0060C8","display":"block","height":"80rpx"}' v-if="ruleForm.touxiang" class="avator" :src="baseUrl+ruleForm.touxiang" mode=""></image>
                <image :style='{"width":"80rpx","borderRadius":"40rpx","background":"#0060C8","display":"block","height":"80rpx"}' v-else class="avator" src="../../static/gen/upload.png" mode=""></image>
            </view>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' v-if="tableName=='jiaoshi'" class="uni-form-item uni-column">
				<view :style='{"width":"188rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#A1A1A1"}' class="label">教师工号：</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"0px 24rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"40rpx","flex":"1","background":"#F8F8F8","fontSize":"28rpx","height":"88rpx"}'  v-model="ruleForm.jiaoshigonghao"  type="text"  class="uni-input" name="" placeholder="教师工号" />
			</view>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' v-if="tableName=='jiaoshi'" class="uni-form-item uni-column">
				<view :style='{"width":"188rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#A1A1A1"}' class="label">密码：</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"0px 24rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"40rpx","flex":"1","background":"#F8F8F8","fontSize":"28rpx","height":"88rpx"}'  v-model="ruleForm.mima" type="password"  class="uni-input" name="" placeholder="密码" />
			</view>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' v-if="tableName=='jiaoshi'" class="uni-form-item uni-column">
				<view :style='{"width":"188rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#A1A1A1"}' class="label">确认密码：</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"0px 24rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"40rpx","flex":"1","background":"#F8F8F8","fontSize":"28rpx","height":"88rpx"}' v-model="ruleForm.mima2" type="password" class="uni-input" name="" placeholder="确认密码" />
			</view>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' v-if="tableName=='jiaoshi'" class="uni-form-item uni-column">
				<view :style='{"width":"188rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#A1A1A1"}' class="label">教师姓名：</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"0px 24rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"40rpx","flex":"1","background":"#F8F8F8","fontSize":"28rpx","height":"88rpx"}'  v-model="ruleForm.jiaoshixingming"  type="text"  class="uni-input" name="" placeholder="教师姓名" />
			</view>
            <view :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' v-if="tableName=='jiaoshi'" class="">
				<view :style='{"width":"188rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#A1A1A1"}' class="label">性别：</view>
				<picker :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' v-if="tableName=='jiaoshi'"  @change="jiaoshixingbieChange" :value="jiaoshixingbieIndex" :range="jiaoshixingbieOptions">
					<view>
						<view :style='{"padding":"0 30rpx","color":"#1A1A1A","borderRadius":"40rpx","background":"#F8F8F8","flex":"1","display":"inline-block","lineHeight":"88rpx","fontSize":"28rpx","float":"right"}' class="uni-input">{{ruleForm.xingbie?ruleForm.xingbie:"请选择性别"}}</view>
					</view>
				</picker>
			</view>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' v-if="tableName=='jiaoshi'" class="uni-form-item uni-column">
				<view :style='{"width":"188rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#A1A1A1"}' class="label">职称：</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"0px 24rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"40rpx","flex":"1","background":"#F8F8F8","fontSize":"28rpx","height":"88rpx"}'  v-model="ruleForm.zhicheng"  type="text"  class="uni-input" name="" placeholder="职称" />
			</view>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' v-if="tableName=='jiaoshi'" class="uni-form-item uni-column">
				<view :style='{"width":"188rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#A1A1A1"}' class="label">电话：</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"0px 24rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"40rpx","flex":"1","background":"#F8F8F8","fontSize":"28rpx","height":"88rpx"}'  v-model="ruleForm.dianhua"  type="text"  class="uni-input" name="" placeholder="电话" />
			</view>
            <view :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' v-if="tableName=='jiaoshi'" @tap="jiaoshitouxiangTap" class="">
				<view :style='{"width":"188rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#A1A1A1"}' class="label">头像：</view>
				<image :style='{"width":"80rpx","borderRadius":"40rpx","background":"#0060C8","display":"block","height":"80rpx"}' v-if="ruleForm.touxiang" class="avator" :src="baseUrl+ruleForm.touxiang" mode=""></image>
                <image :style='{"width":"80rpx","borderRadius":"40rpx","background":"#0060C8","display":"block","height":"80rpx"}' v-else class="avator" src="../../static/gen/upload.png" mode=""></image>
            </view>
			<view :style='{"width":"100%","margin":"0 0 24rpx 0","display":"flex","height":"auto"}' v-if="tableName=='jiaoshi'" class="uni-form-item uni-column">
				<view :style='{"width":"188rpx","lineHeight":"88rpx","fontSize":"28rpx","color":"#A1A1A1"}' class="label">班级：</view>
				<input :style='{"border":"0px solid rgb(255, 170, 51)","padding":"0px 24rpx","margin":"0px","color":"rgb(0, 0, 0)","borderRadius":"40rpx","flex":"1","background":"#F8F8F8","fontSize":"28rpx","height":"88rpx"}'  v-model="ruleForm.banji"  type="text"  class="uni-input" name="" placeholder="班级" />
			</view>
			<button :style='{"border":"0","padding":"0px","margin":"0 0 24rpx 0","color":"rgb(255, 255, 255)","borderRadius":"40rpx","background":"#0060c8","width":"100%","lineHeight":"88rpx","fontSize":"32rpx","height":"88rpx"}' class="btn-submit" @tap="register" type="primary">注册</button>
			
			<view class="idea1" :style='{"width":"100%","background":"red","display":"none","height":"80rpx"}'>idea1</view>
			<view class="idea2" :style='{"width":"100%","background":"red","display":"none","height":"80rpx"}'>idea2</view>
			<view class="idea3" :style='{"width":"100%","background":"red","display":"none","height":"80rpx"}'>idea3</view>
		</view>
	</view>
</view>
</template>

<script>
    import multipleSelect from "@/components/momo-multipleSelect/momo-multipleSelect";
	export default {
		data() {
			return {
                xueshengxingbieOptions: [],
                xueshengxingbieIndex: 0,
                jiaoshixingbieOptions: [],
                jiaoshixingbieIndex: 0,
				ruleForm: {
                xuehao: '',
                xingming: '',
                mima: '',
                xingbie: '',
                shouji: '',
                banji: '',
                touxiang: '',
                yundongcishu: '0',
                jiaoshigonghao: '',
                mima: '',
                jiaoshixingming: '',
                xingbie: '',
                zhicheng: '',
                dianhua: '',
                touxiang: '',
                banji: '',
				},
				tableName:""
			}
		},
        components: {
            multipleSelect
        },
        computed: {
            baseUrl() {
                return this.$base.url;
            },
        },
		async onLoad() {
			let res = [];
			let table = uni.getStorageSync("loginTable");
            this.tableName = table;

                        // 自定义下拉框值
			if(this.tableName=='xuesheng'){
                this.xueshengxingbieOptions = "男,女".split(',');
				this.ruleForm.xingbie=this.xueshengxingbieOptions[0]
			}
            if(`xuesheng` == this.tableName){
                this.ruleForm.yundongcishu='0'
            }
                        // 自定义下拉框值
			if(this.tableName=='jiaoshi'){
                this.jiaoshixingbieOptions = "男,女".split(',');
				this.ruleForm.xingbie=this.jiaoshixingbieOptions[0]
			}
			
			this.styleChange()
		},
		methods: {

            // 下拉变化
            xueshengxingbieChange(e) {
                    this.xueshengxingbieIndex = e.target.value
                    this.ruleForm.xingbie = this.xueshengxingbieOptions[this.xueshengxingbieIndex]
            },
            xueshengtouxiangTap() {
                let _this = this;
                this.$api.upload(function(res) {
                    _this.ruleForm.touxiang = 'upload/' + res.file;
					_this.$forceUpdate();
                });
            },
            // 下拉变化
            jiaoshixingbieChange(e) {
                    this.jiaoshixingbieIndex = e.target.value
                    this.ruleForm.xingbie = this.jiaoshixingbieOptions[this.jiaoshixingbieIndex]
            },
            jiaoshitouxiangTap() {
                let _this = this;
                this.$api.upload(function(res) {
                    _this.ruleForm.touxiang = 'upload/' + res.file;
					_this.$forceUpdate();
                });
            },

            toggleTab(str) {
                this.$refs[str].show();
            },

			styleChange() {
				this.$nextTick(()=>{
					// document.querySelectorAll('.uni-input .uni-input-input').forEach(el=>{
					//   el.style.backgroundColor = this.registerFrom.content.input.backgroundColor
					// })
				})
			},
			// 获取uuid
			getUUID () {
				return new Date().getTime();
			},
			// 注册
			async register() {
				
				if((!this.ruleForm.xuehao) && `xuesheng` == this.tableName){
					this.$utils.msg(`学号不能为空`);
					return
				}
				if((!this.ruleForm.xingming) && `xuesheng` == this.tableName){
					this.$utils.msg(`姓名不能为空`);
					return
				}
				if((!this.ruleForm.mima) && `xuesheng` == this.tableName){
					this.$utils.msg(`密码不能为空`);
					return
				}
                if(`xuesheng` == this.tableName && (this.ruleForm.mima!=this.ruleForm.mima2)){
                    this.$utils.msg(`两次密码输入不一致`);
                    return
                }
				if(`xuesheng` == this.tableName && this.ruleForm.shouji&&(!this.$validate.isMobile(this.ruleForm.shouji))){
					this.$utils.msg(`手机应输入手机格式`);
					return
				}
				if(`xuesheng` == this.tableName && this.ruleForm.yundongcishu&&(!this.$validate.isIntNumer(this.ruleForm.yundongcishu))){
					this.$utils.msg(`运动次数应输入整数`);
					return
				}
				if((!this.ruleForm.jiaoshigonghao) && `jiaoshi` == this.tableName){
					this.$utils.msg(`教师工号不能为空`);
					return
				}
				if((!this.ruleForm.mima) && `jiaoshi` == this.tableName){
					this.$utils.msg(`密码不能为空`);
					return
				}
                if(`jiaoshi` == this.tableName && (this.ruleForm.mima!=this.ruleForm.mima2)){
                    this.$utils.msg(`两次密码输入不一致`);
                    return
                }
				if((!this.ruleForm.jiaoshixingming) && `jiaoshi` == this.tableName){
					this.$utils.msg(`教师姓名不能为空`);
					return
				}
				if(`jiaoshi` == this.tableName && this.ruleForm.dianhua&&(!this.$validate.isMobile(this.ruleForm.dianhua))){
					this.$utils.msg(`电话应输入手机格式`);
					return
				}
				await this.$api.register(`${this.tableName}`, this.ruleForm);
				this.$utils.msgBack('注册成功');;
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
