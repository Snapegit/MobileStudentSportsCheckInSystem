<template>
<view class="content">
	<view :style='{"padding":"40rpx 40rpx 100rpx","alignItems":"flex-start","flexWrap":"wrap","background":"#F4F8FB","display":"flex","width":"100%","height":"100%"}'>
		<view class="list-swiper-4" :style='{"width":"100%","overflow":"hidden","position":"relative","borderRadius":"40rpx","height":"360rpx"}' @touchstart="touchStart" @touchmove="touchMove" @touchend="touchEnd">
			<view :style='{"width":"100%","position":"absolute","top":"0%","left":"0%","background":"#fff","height":"360rpx"}' class="item animate__animated" :class="prevNumList4 == index  ? 'animate__fadeOut' : (numList4 == index  ? 'animate__fadeIn' : '')" v-for="(swiper,index) in swiperList" :key="index" v-if="numList4 == index || prevNumList4 == index">
				<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"360rpx"}' mode="aspectFill" :src="baseUrl+swiper.img" @tap="onSwiperTap(swiper)"></image>
				<view :style='{"padding":"8rpx 20rpx","margin":"0","color":"#fff","left":"0","textAlign":"center","background":"rgba(0, 0, 0, 0.2)","bottom":"0","display":"block","width":"100%","lineHeight":"1.5","fontSize":"28rpx","position":"absolute"}'>{{ swiper.title }}</view>
			</view>
			<view class="animate__navigation" :style='{"alignItems":"center","left":"0%","bottom":"0%","background":"rgba(0,0,0,0)","display":"none","width":"100%","position":"absolute","justifyContent":"center","height":"40rpx"}'>
				<block v-for="(swiper,index) in swiperList" :key="index">
					<text class="navigation-item" v-if="numList4 == index" :style='{"width":"16rpx","margin":"0 4rpx","borderRadius":"100%","background":"#b7dcfe","height":"16rpx"}'></text>
					<text class="navigation-item" v-if="numList4 != index" :style='{"width":"16rpx","margin":"0 4rpx","borderRadius":"100%","background":"#fff","height":"16rpx"}'></text>
				</block>
			</view>
		</view>
		<!-- menu -->
		<view v-if="true" class="menu" :style='{"width":"100%","padding":"0","margin":"0","flexWrap":"wrap","display":"flex","height":"auto"}'>
            <block v-for="(item,index1) in menuList" v-bind:key="item.roleName">
                <block v-if="index1==0" v-bind:key="index" v-for=" (menu,index) in item.frontMenu">
                    <block v-bind:key="sort" v-for=" (child,sort) in menu.child">
                        <block v-bind:key="sort2" v-for=" (button,sort2) in child.buttons">
                            <view :style='{"width":"23%","padding":"12rpx 0","margin":"10rpx 1% 0 ","height":"auto"}' class="menu-list" v-if="button=='查看' && child.tableName!='yifahuodingdan' && child.tableName!='yituikuandingdan' &&child.tableName!='yiquxiaodingdan' && child.tableName!='weizhifudingdan' && child.tableName!='yizhifudingdan' && child.tableName!='yiwanchengdingdan' " @tap="onPageTap2(child.tableName)">
                                <view class="iconarr" :class="child.appFrontIcon" :style='{"margin":"0px auto","color":"#333","borderRadius":"100%","display":"block","width":"80rpx","lineHeight":"80rpx","fontSize":"80rpx","height":"80rpx"}'></view>
                                <view :style='{"padding":"0","margin":"12rpx auto 0","color":"#333","textAlign":"center","width":"100%","lineHeight":"28rpx","fontSize":"28rpx"}'>{{child.menu.split("列表")[0]}}</view>
                            </view>
                        </block>
                    </block>
                </block>
            </block>
		</view>
		<!-- menu -->
		<!-- 商品推荐 -->
		<!-- 商品推荐 -->
		
		<!-- 商品列表 -->
		<view class="listBox list" :style='{"width":"100%","margin":"40rpx 0 20rpx","background":"#fff","order":"5"}'>
			<view class="title" :style='{"width":"100%","padding":"0 24rpx","margin":"0","background":"linear-gradient(270deg, rgba(162,207,255,1) 0%, rgba(0,96,200,1) 100%)","justifyContent":"space-between","display":"flex"}'>
				<view :style='{"color":"#fff","fontSize":"40rpx","lineHeight":"80rpx"}'>公告信息</view>
				<view :style='{"alignItems":"center","justifyContent":"center","display":"flex"}' @tap="onPageTap('gonggaoxinxi')">
				  <text :style='{"color":"#fff","fontSize":"28rpx"}'>更多</text>
				  <text class="icon iconfont icon-gengduo1" :style='{"color":"#fff","fontSize":"28rpx"}'></text>
				</view>
			</view>
			<view id="list-list-10" class="list-box10 waterfall-body" :style='{"width":"100%","padding":"40rpx 0px 0","alignItems":"flex-start","display":"flex","height":"auto"}'>
				<view id="waterfall-left-column-list-10gonggaoxinxi" class="waterfall-column-list-10" :style='{"margin":"0 12rpx 0 0","flex":"1","flexDirection":"column","display":"flex"}'>
					<view @tap="onDetailTap('gonggaoxinxi',product.id)" :style='{"boxShadow":"0 2rpx 4rpx rgba(0,0,0,.3)","margin":"0 0 20rpx 0","overflow":"hidden","position":"relative","borderRadius":"0px"}' v-for="product in leftListList10gonggaoxinxi" :key="product.id" class="left-content">
						<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"auto"}' mode="widthFix" v-if="product.tupian.substring(0,4)=='http'" :src="product.tupian"></image>
						<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"auto"}' mode="widthFix" v-else :src="product.tupian?baseUrl+product.tupian.split(',')[0]:''"></image>
						<view :style='{"width":"100%","background":"rgba(0,0,0,.8)"}'>
							<view :style='{"padding":"0 20rpx","overflow":"hidden","whiteSpace":"nowrap","color":"#fff","width":"100%","lineHeight":"60rpx","fontSize":"28rpx","textOverflow":"ellipsis"}' class="list-item-title">{{product.gonggaobiaoti}}</view>
							<view :style='{"padding":"0 20rpx","display":"none"}'>
								<text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#fff"}'></text>
								<text :style='{"color":"#fff","lineHeight":"1.5","fontSize":"24rpx"}'>{{product.addtime}}</text>
							</view>
							<view :style='{"padding":"0 20rpx","display":"none"}'>
								<text class="icon iconfont icon-shoucang10" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#fff"}'></text>
								<text :style='{"color":"#fff","lineHeight":"1.5","fontSize":"24rpx"}'>{{product.storeupnum}}</text>
							</view>
						</view>
					</view>
				</view>
				
				<view id="waterfall-right-column-list-10gonggaoxinxi" class="waterfall-column-list-10" :style='{"margin":"0 0 0 12rpx","flex":"1","flexDirection":"column","display":"flex"}'>
					<view @tap="onDetailTap('gonggaoxinxi',product.id)" :style='{"boxShadow":"0 2rpx 4rpx rgba(0,0,0,.3)","margin":"0 0 20rpx 0","overflow":"hidden","position":"relative","borderRadius":"0px"}' v-for="product in rightListList10gonggaoxinxi" :key="product.id" class="right-content">
						<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"auto"}' mode="widthFix" v-if="product.tupian.substring(0,4)=='http'" :src="product.tupian"></image>
						<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"auto"}' mode="widthFix" v-else :src="product.tupian?baseUrl+product.tupian.split(',')[0]:''"></image>
						<view :style='{"width":"100%","background":"rgba(0,0,0,.8)"}'>
							<view :style='{"padding":"0 20rpx","overflow":"hidden","whiteSpace":"nowrap","color":"#fff","width":"100%","lineHeight":"60rpx","fontSize":"28rpx","textOverflow":"ellipsis"}' class="list-item-title">{{product.gonggaobiaoti}}</view>
							<view :style='{"padding":"0 20rpx","display":"none"}'>
								<text class="icon iconfont icon-shijian21" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#fff"}'></text>
								<text :style='{"color":"#fff","lineHeight":"1.5","fontSize":"24rpx"}'>{{product.addtime}}</text>
							</view>
							<view :style='{"padding":"0 20rpx","display":"none"}'>
								<text class="icon iconfont icon-shoucang10" :style='{"margin":"0 4rpx 0 0","lineHeight":"1.5","fontSize":"24rpx","color":"#fff"}'></text>
								<text :style='{"color":"#fff","lineHeight":"1.5","fontSize":"24rpx"}'>{{product.storeupnum}}</text>
							</view>
						</view>
					</view>
				</view>
			</view>
		</view>
		<!-- 商品列表 -->
		<!-- 新闻资讯 -->
		<!-- 新闻资讯 -->
	</view>
</view>
</template>

<script>
    import menu from '@/utils/menu'
	import '@/assets/css/global-restaurant.css'
	import uniIcons from "@/components/uni-ui/lib/uni-icons/uni-icons.vue"
	export default {
		components: {
			uniIcons
		},
		data() {
			return {
				startX: 0,
				prevNumList4: '',
				numList4: 0,
				timerList4: null,
				flagList4: false,
				navigationActive: {"width":"16rpx","margin":"0 4rpx","borderRadius":"100%","background":"#b7dcfe","height":"16rpx"},
				navigationDefault: {"width":"16rpx","margin":"0 4rpx","borderRadius":"100%","background":"#fff","height":"16rpx"},
				options2: {
					effect: 'flip',
					loop : true
				},
				options3: {
					effect: 'cube',
					loop : true,
					cubeEffect: {
						shadow: true,
						slideShadows: true,
						shadowOffset: 20,
						shadowScale: 0.94,
					}
				},
				rows: 2,
				column: 4,
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
                role : '',
                menuList: [],
                swiperMenuList:[],
                user: {},
                tableName:'',

				//轮播
				swiperList: [],
				homegonggaoxinxilist: [],
				news: [],
				leftListList10gonggaoxinxi: [],
				rightListList10gonggaoxinxi: [],
				tempListList10gonggaoxinxi: [],
			}
		},
		watch: {
			copyFlowListList10gonggaoxinxi(nVal, oVal) {
				this.tempListList10gonggaoxinxi = this.cloneData(this.copyFlowListList10gonggaoxinxi);
				this.splitDataList10gonggaoxinxi();
			},
		},
		mounted() {
			this.tempListList10gonggaoxinxi = this.cloneData(this.copyFlowListList10gonggaoxinxi);
			this.splitDataList10gonggaoxinxi();
		},
		computed: {
			baseUrl() {
				return this.$base.url;
			},
			copyFlowListList10gonggaoxinxi() {
				return this.cloneData(this.homegonggaoxinxilist);
			},
		},
        async onLoad(){
            
        },
		async onShow() {
			this.swiperMenuList = []
			this.role = uni.getStorageSync("appRole");
			let table = uni.getStorageSync("nowTable");
			let res = await this.$api.session(table);
			this.user = res.data;
			this.tableName = table;
			let menus = menu.list();
			this.menuList = menus;
			this.menuList.forEach((item,key) => {
			    if(key==0) {
			        item.frontMenu.forEach((item2,key2) => {
			            if(item2.child[0].buttons.indexOf("查看")>-1) {
			                this.swiperMenuList.push(item2);
			            }
			        })
			    }
			})
            // let res;
			// 轮播图
			let swiperList = []
			res = await this.$api.list('config', {
				page: 1,
				limit: 5
			});
			for (let item of res.data.list) {
				if (item.name.indexOf('picture') >= 0 && item.value && item.value!="" && item.value!=null ) {
					swiperList.push({
						img: item.value,
                        title: item.name,
						url: item.url
					});
				}
			}
			if (swiperList) {
				this.swiperList = swiperList;
			}
			
			this.prevNumList4 = this.swiperList.length - 1
			this.timerList4 = setInterval(this.autoPlayList4, 12000)

			this.leftListList10gonggaoxinxi = []
			this.rightListList10gonggaoxinxi = []
			this.tempListList10gonggaoxinxi = []
			this.getRecommendList()
			this.getHomeList()
			this.getNewsList()
		},
		methods: {
			async splitDataList10gonggaoxinxi() {
				if (!this.tempListList10gonggaoxinxi.length) return;
				let leftRect = await this.uGetRect('#waterfall-left-column-list-10gonggaoxinxi');
				let rightRect = await this.uGetRect('#waterfall-right-column-list-10gonggaoxinxi');
				// 如果左边小于或等于右边，就添加到左边，否则添加到右边
				let item = this.tempListList10gonggaoxinxi[0];
				// 解决多次快速上拉后，可能数据会乱的问题，因为经过上面的两个await节点查询阻塞一定时间，加上后面的定时器干扰
				// 数组可能变成[]，导致此item值可能为undefined
				if (!item) return;
				
				if (leftRect.height < rightRect.height) {
					this.leftListList10gonggaoxinxi.push(item);
				} else if (leftRect.height > rightRect.height) {
					this.rightListList10gonggaoxinxi.push(item);
				} else {
					// 这里是为了保证第一和第二张添加时，左右都能有内容
					// 因为添加第一张，实际队列的高度可能还是0，这时需要根据队列元素长度判断下一个该放哪边
					if (this.leftListList10gonggaoxinxi.length <= this.rightListList10gonggaoxinxi.length) {
						this.leftListList10gonggaoxinxi.push(item);
					} else {
						this.rightListList10gonggaoxinxi.push(item);
					}
				}
				// 移除临时列表的第一项
				this.tempListList10gonggaoxinxi.splice(0, 1);
				// 如果临时数组还有数据，继续循环
				if (this.tempListList10gonggaoxinxi.length) {
					setTimeout(()=>{
						this.splitDataList10gonggaoxinxi();
					}, 150)
					return
				}
			},
			uGetRect(selector, all) {
				return new Promise(resolve => {
					uni.createSelectorQuery()
					.in(this)
					[all ? 'selectAll' : 'select'](selector)
					.boundingClientRect(rect => {
						if (all && Array.isArray(rect) && rect.length) {
							resolve(rect);
						}
						if (!all && rect) {
							resolve(rect);
						}
					})
					.exec();
				});
			},
			cloneData(data) {
				return JSON.parse(JSON.stringify(data));
			},
			newsTabClick2(index){
				this.newsIndex2 = index
				this.getNewsList()
			},
			async getNewsList(){
				let res;
				let params = {
					page: 1,
					limit: 6,
					sort: 'id',
					order: 'desc',
				}
			},
			homeTabClick2(index,name){
				this['home' + name + 'Index2'] = index
				this.getHomeList()
			},
			async getHomeList(){
				let res;
				let params;
				params = {
					page:1,
					limit: 10,
				}
				res = await this.$api.list('gonggaoxinxi', params);
				this.homegonggaoxinxilist = res.data.list
				this.tempListList10gonggaoxinxi = this.copyFlowListList10gonggaoxinxi;
				this.splitDataList10gonggaoxinxi();
			},
			recommendTabClick2(index,name){
				this[name + 'Index2'] = index
				this.getRecommendList()
			},
			async getRecommendList(){
				let res;
				let params;
			},
			autoPlayList4() {
				this.prevNumList4 = this.numList4
			
				this.numList4++
				if (this.numList4 == this.swiperList.length) this.numList4 = 0
			},
			touchStart(event) {
				this.startX = event.touches[0].clientX
				
				clearInterval(this.timerList4)
				this.flagList4 = true
			},
			touchMove(event) {
				const currentX = event.touches[0].clientX;
				const deltaX = currentX - this.startX;
				
				if (deltaX > 50) {
					// 向右滑动逻辑
					if (this.flagList4) {
						this.flagList4 = false
						
						this.prevNumList4 = this.numList4
						this.numList4++
						if (this.numList4 == this.swiperList.length) this.numList4 = 0
					}
					
				} else if (deltaX < -50) {
					// 向左滑动逻辑
					if (this.flagList4) {
						this.flagList4 = false
						
						this.prevNumList4 = this.numList4
						this.numList4--
						if (this.numList4 < 0) this.numList4 = this.swiperList.length - 1
					}
				}
			},
			touchEnd() {
				this.startX = 0
				this.timerList4 = setInterval(this.autoPlayList4, 12000)
				this.flagList4 = false
			},
			//轮播图跳转
			onSwiperTap(e) {
				if(e.url) {
					if (e.url.indexOf('https') != -1) {
						// #ifdef MP-WEIXIN
						uni.navigateTo({
						    url: '../../common/linkOthers/linkOthers?url=' + encodeURIComponent(e.url),
						});
						return false
						// #endif
						window.open(e.url)
					} else {
						this.$utils.jump(e.url)
					}
				}
			},
			// 新闻详情
			onNewsDetailTap(id) {
				this.$utils.jump(`../news-detail/news-detail?id=${id}`)
			},
			// 推荐列表点击详情
			onDetailTap(tableName, id) {
				this.$utils.jump(`../${tableName}/detail?id=${id}`)
			},
			onPageTap(tableName){

				uni.navigateTo({
					url: `../${tableName}/list`,
					fail: function(){
						uni.switchTab({
							url: `../${tableName}/list`
						});
					}
				});
				// this.$utils.jump(`../${tableName}/list`)
			},
            onPageTap2(index) {
				let url = '../' + index + '/list'
				if(index=='forum'){
					url = '../forum-index/forum-index'
				}
                uni.setStorageSync("useridTag",0);
                uni.navigateTo({
                    url: url,
                    fail: function() {
                        uni.switchTab({
                            url: url
                        });
                    }
                });
            }
		}
	}
</script>

<style lang="scss" scoped>
	.content {
		min-height: calc(100vh - 44px);
		box-sizing: border-box;
	}
	.list-swiper-4 .animate__animated {
		--animate-delay: 600ms;
	}
	.recommend {
		.style2 {
			.tabView {
				.tab {
					border: 0px solid rgb(64, 158, 255);
					border-radius: 40rpx;
					padding: 0 10rpx;
					margin: 0 10rpx;
					color: #AAAAAA;
				}
				.tabActive {
					border: 0px solid rgb(64, 158, 255);
					border-radius: 40rpx;
					padding: 0 10rpx;
					margin: 0 10rpx;
					color: #000000;
				}
			}
		}
	}

</style>
