<template>
	<div class="addEdit-block" :style='{"padding":"30px"}'>
		<el-form
			:style='{"borderRadius":"6px","padding":"30px"}'
			class="add-update-preview"
			ref="ruleForm"
			:model="ruleForm"
			:rules="rules"
			label-width="100px"
		>
			<template >
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="select" v-if="type!='info'"  label="运动类型" prop="yundongleixing">
					<el-select :disabled="ro.yundongleixing" v-model="ruleForm.yundongleixing" placeholder="请选择运动类型" >
						<el-option
							v-for="(item,index) in yundongleixingOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="运动类型" prop="yundongleixing">
					<el-input v-model="ruleForm.yundongleixing"
						placeholder="运动类型" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="时长（分钟）" prop="shizhang">
					<el-input v-model.number="ruleForm.shizhang" placeholder="时长（分钟）" clearable  :readonly="ro.shizhang"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="时长（分钟）" prop="shizhang">
					<el-input v-model="ruleForm.shizhang" placeholder="时长（分钟）" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="备注" prop="beizhu">
					<el-input v-model="ruleForm.beizhu" placeholder="备注" clearable  :readonly="ro.beizhu"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="备注" prop="beizhu">
					<el-input v-model="ruleForm.beizhu" placeholder="备注" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="date" v-if="type!='info'" label="打卡时间" prop="dakashijian">
					<el-date-picker
						value-format="yyyy-MM-dd HH:mm:ss"
						v-model="ruleForm.dakashijian" 
						type="datetime"
						:readonly="ro.dakashijian"
						placeholder="打卡时间"
					></el-date-picker>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-else-if="ruleForm.dakashijian" label="打卡时间" prop="dakashijian">
					<el-input v-model="ruleForm.dakashijian" placeholder="打卡时间" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="upload" v-if="type!='info' && !ro.touxiang" label="头像" prop="touxiang">
                    <el-image v-if="ruleForm.touxiang" :src="ruleForm.touxiang?$base.url + ruleForm.touxiang:''" style="width:150px;height:150px;"></el-image>
                    <el-button @click="imgAddClick">人脸识别</el-button>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="upload" v-else-if="ruleForm.touxiang" label="头像" prop="touxiang">
					<img v-if="ruleForm.touxiang.substring(0,4)=='http'" class="upload-img" style="margin-right:20px;" v-bind:key="index" :src="ruleForm.touxiang.split(',')[0]" width="100" height="100">
					<img v-else class="upload-img" style="margin-right:20px;" v-bind:key="index" v-for="(item,index) in ruleForm.touxiang.split(',')" :src="$base.url+item" width="100" height="100">
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="学号" prop="xuehao">
					<el-input v-model="ruleForm.xuehao" placeholder="学号" clearable  :readonly="ro.xuehao"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="学号" prop="xuehao">
					<el-input v-model="ruleForm.xuehao" placeholder="学号" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="姓名" prop="xingming">
					<el-input v-model="ruleForm.xingming" placeholder="姓名" clearable  :readonly="ro.xingming"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="姓名" prop="xingming">
					<el-input v-model="ruleForm.xingming" placeholder="姓名" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="班级" prop="banji">
					<el-input v-model="ruleForm.banji" placeholder="班级" clearable  :readonly="ro.banji"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="班级" prop="banji">
					<el-input v-model="ruleForm.banji" placeholder="班级" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="运动次数" prop="yundongcishu">
					<el-input v-model.number="ruleForm.yundongcishu" placeholder="运动次数" clearable  :readonly="ro.yundongcishu"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="运动次数" prop="yundongcishu">
					<el-input v-model="ruleForm.yundongcishu" placeholder="运动次数" readonly></el-input>
				</el-form-item>
			</template>
			<el-form-item :style='{"padding":"0","margin":"0"}' class="btn">
				<el-button class="btn2" v-show="!faceMatchFlag" v-if="type!='info'" type="success" @click="faceMatchHandle">
					<span class="icon iconfont " :style='{"margin":"0 2px","fontSize":"14px","color":"#fff","height":"40px"}'></span>
					人脸校验
				</el-button>
				<el-button class="btn3" v-show="faceMatchFlag" v-if="type!='info'" type="success" @click="onSubmit">
					<span class="icon iconfont " :style='{"margin":"0 2px","fontSize":"14px","color":"#fff","height":"40px"}'></span>
					提交
				</el-button>
				<el-button class="btn4" v-if="type!='info'" type="success" @click="back()">
					<span class="icon iconfont " :style='{"margin":"0 2px","fontSize":"14px","color":"#fff","height":"40px"}'></span>
					取消
				</el-button>
				<el-button class="btn5" v-if="type=='info'" type="success" @click="back()">
					<span class="icon iconfont " :style='{"margin":"0 2px","fontSize":"14px","color":"#fff","height":"40px"}'></span>
					返回
				</el-button>
			</el-form-item>
		</el-form>
    

    <imgAdd ref="imgAdd" @imgChange="imgChange"></imgAdd>
  </div>
</template>
<script>
import imgAdd from "@/components/common/img";
import { 
	isIntNumer,
} from "@/utils/validate";
export default {
	data() {
		var validateIntNumber = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isIntNumer(value)) {
				callback(new Error("请输入整数"));
			} else {
				callback();
			}
		};
		return {
			id: '',
            uObject: null,
			type: '',
			
			userface : '',
			faceMatchFlag: false,
			
			ro:{
				yundongleixing : false,
				shizhang : false,
				beizhu : false,
				dakashijian : false,
				touxiang : false,
				xuehao : false,
				xingming : false,
				banji : false,
				yundongcishu : false,
				userid : false,
			},
			
			
			ruleForm: {
				yundongleixing: '',
				shizhang: '',
				beizhu: '',
				dakashijian: '',
				touxiang: '',
				xuehao: '',
				xingming: '',
				banji: '',
				yundongcishu: '1',
				userid: '',
			},
		
			yundongleixingOptions: [],

			
			rules: {
				yundongleixing: [
					{ required: true, message: '运动类型不能为空', trigger: 'blur' },
				],
				shizhang: [
					{ required: true, message: '时长（分钟）不能为空', trigger: 'blur' },
					{ validator: validateIntNumber, trigger: 'blur' },
				],
				beizhu: [
				],
				dakashijian: [
				],
				touxiang: [
					{ required: true, message: '头像不能为空', trigger: 'blur' },
				],
				xuehao: [
				],
				xingming: [
				],
				banji: [
				],
				yundongcishu: [
					{ validator: validateIntNumber, trigger: 'blur' },
				],
				userid: [
				],
			}
		};
	},
	props: ["parent"],
	computed: {



	},
    components: {
        imgAdd
    },
	created() {
		this.ruleForm.dakashijian = this.getCurDateTime()
	},
	methods: {
        imgAddClick(){
            this.$refs.imgAdd.onTake()
        },
        imgChange(e){
            this.ruleForm.touxiang = 'upload/' + e
        },
		
		// 下载
		download(file){
			window.open(`${file}`)
		},
		// 初始化
		init(id,type) {
			if (id) {
				this.id = id;
				this.type = type;
			}
			if(this.type=='info'||this.type=='else'){
				this.info(id);
			}else if(this.type=='logistics'){
				this.logistics=false;
				this.info(id);
			}else if(this.type=='cross'){
				var obj = this.$storage.getObj('crossObj');
				for (var o in obj){
						if(o=='yundongleixing'){
							this.ruleForm.yundongleixing = obj[o];
							this.ro.yundongleixing = true;
							continue;
						}
						if(o=='shizhang'){
							this.ruleForm.shizhang = obj[o];
							this.ro.shizhang = true;
							continue;
						}
						if(o=='beizhu'){
							this.ruleForm.beizhu = obj[o];
							this.ro.beizhu = true;
							continue;
						}
						if(o=='dakashijian'){
							this.ruleForm.dakashijian = obj[o];
							this.ro.dakashijian = true;
							continue;
						}
						if(o=='touxiang'){
							this.ruleForm.touxiang = obj[o];
							this.ro.touxiang = true;
							continue;
						}
						if(o=='xuehao'){
							this.ruleForm.xuehao = obj[o];
							this.ro.xuehao = true;
							continue;
						}
						if(o=='xingming'){
							this.ruleForm.xingming = obj[o];
							this.ro.xingming = true;
							continue;
						}
						if(o=='banji'){
							this.ruleForm.banji = obj[o];
							this.ro.banji = true;
							continue;
						}
						if(o=='yundongcishu'){
							this.ruleForm.yundongcishu = obj[o];
							this.ro.yundongcishu = true;
							continue;
						}
						if(o=='userid'){
							this.ruleForm.userid = obj[o];
							this.ro.userid = true;
							continue;
						}
				}
				this.ruleForm.yundongcishu = Number('1'); 			}
			// 获取用户信息
			this.$http({
				url: `${this.$storage.get('sessionTable')}/session`,
				method: "get"
			}).then(({ data }) => {
				if (data && data.code === 0) {
                    if(this.$storage.get("role")=="管理员") {
                        this.faceMatchFlag= true;
                    }
                    this.userface = data.data.touxiang;
					var json = data.data;
                    this.uObject = data.data;
					if(((json.xuehao!=''&&json.xuehao) || json.xuehao==0) && this.$storage.get("role")!="管理员"){
						this.ruleForm.xuehao = json.xuehao
						this.ro.xuehao = true;
					}
					if(((json.xingming!=''&&json.xingming) || json.xingming==0) && this.$storage.get("role")!="管理员"){
						this.ruleForm.xingming = json.xingming
						this.ro.xingming = true;
					}
					if(((json.banji!=''&&json.banji) || json.banji==0) && this.$storage.get("role")!="管理员"){
						this.ruleForm.banji = json.banji
						this.ro.banji = true;
					}
					if(this.$storage.get("role")!="管理员") {
						this.ro.yundongcishu = true;
					}
				} else {
					this.$message.error(data.msg);
				}
			});
            this.$http({
				url: `option/yundongleixing/yundongleixing`,
				method: "get"
            }).then(({ data }) => {
				if (data && data.code === 0) {
					this.yundongleixingOptions = data.data;
				} else {
					this.$message.error(data.msg);
				}
            });
			
		},
    // 多级联动参数

    info(id) {
      this.$http({
        url: `yundongdaka/info/${id}`,
        method: "get"
      }).then(({ data }) => {
        if (data && data.code === 0) {
        this.ruleForm = data.data;
        //解决前台上传图片后台不显示的问题
        let reg=new RegExp('../../../upload','g')//g代表全部
        } else {
          this.$message.error(data.msg);
        }
      });
    },

    faceMatchHandle() {
        if(this.ruleForm.touxiang!=null) {
            this.ruleForm.touxiang = this.ruleForm.touxiang.replace(new RegExp(this.$base.url,"g"),"");
        }
            let params = {
                face1:this.userface.replace("upload/",""),
                face2:this.ruleForm.touxiang.replace("upload/",""),
            } 
          this.$http({
            url: `matchFace`,
            method: "get",
            params: params
          }).then(({ data }) => {
            if (data && data.code === 0) {
                if(data.score>60) {
                    this.faceMatchFlag = true;
                    this.$message({
                      message: "匹配成功",
                      type: "success",
                      duration: 1500,
                    });
                } else {
                    this.faceMatchFlag = false;
                    this.$message.error("匹配失败");
                }
            } else {
              this.faceMatchFlag = false;
              this.$message.error("匹配失败");
            }
          });
    },

    // 提交
    onSubmit() {
	if(this.ruleForm.touxiang!=null) {
		this.ruleForm.touxiang = this.ruleForm.touxiang.replace(new RegExp(this.$base.url,"g"),"");
	}
var objcross = this.$storage.getObj('crossObj');
      //更新跨表属性
       var crossuserid;
       var crossrefid;
       var crossoptnum;
       if(this.type=='cross'){
                var statusColumnName = this.$storage.get('statusColumnName');
                var statusColumnValue = this.$storage.get('statusColumnValue');
                if(statusColumnName!='') {
                        var obj = this.$storage.getObj('crossObj');
                       if(statusColumnName && !statusColumnName.startsWith("[")) {
                               for (var o in obj){
                                 if(o==statusColumnName){
                                   obj[o] = statusColumnValue;
                                 }
                               }
                               var table = this.$storage.get('crossTable');
                             this.$http({
                                 url: `${table}/update`,
                                 method: "post",
                                 data: obj
                               }).then(({ data }) => {});
                       } else {
                               crossuserid=this.$storage.get('userid');
                               crossrefid=obj['id'];
                               crossoptnum=this.$storage.get('statusColumnName');
                               crossoptnum=crossoptnum.replace(/\[/,"").replace(/\]/,"");
                        }
                }
        }
		this.$refs["ruleForm"].validate(valid => {
			if (valid) {
				if(crossrefid && crossuserid) {
					this.ruleForm.crossuserid = crossuserid;
					this.ruleForm.crossrefid = crossrefid;
					let params = { 
						page: 1, 
						limit: 10, 
						crossuserid:this.ruleForm.crossuserid,
						crossrefid:this.ruleForm.crossrefid,
					} 
				this.$http({ 
					url: "yundongdaka/page", 
					method: "get", 
					params: params 
				}).then(({ 
					data 
				}) => { 
					if (data && data.code === 0) { 
						if(data.data.total>=crossoptnum) {
							this.$message.error(this.$storage.get('tips'));
							return false;
						} else {
							this.$http({
								url: `yundongdaka/${!this.ruleForm.id ? "save" : "update"}`,
								method: "post",
								data: this.ruleForm
							}).then(({ data }) => {
								if (data && data.code === 0) {
									if(this.uObject.yundongcishu>=0){
										this.uObject.yundongcishu = parseFloat(this.uObject.yundongcishu) + parseFloat(this.ruleForm.yundongcishu)
										this.$http({url: `${this.$storage.get('sessionTable')}/update`,method: "post",data: this.uObject}).then(res => {});
									}
									this.$message({
										message: "操作成功",
										type: "success",
										duration: 1500,
										onClose: () => {
											this.parent.showFlag = true;
											this.parent.addOrUpdateFlag = false;
											this.parent.yundongdakaCrossAddOrUpdateFlag = false;
											this.parent.search();
											this.parent.contentStyleChange();
										}
									});
								} else {
									this.$message.error(data.msg);
								}
							});

						}
					} else { 
				} 
			});
		} else {
			this.$http({
				url: `yundongdaka/${!this.ruleForm.id ? "save" : "update"}`,
				method: "post",
			   data: this.ruleForm
			}).then(({ data }) => {
				if (data && data.code === 0) {
					if(this.uObject.yundongcishu>=0){
						this.uObject.yundongcishu = parseFloat(this.uObject.yundongcishu) + parseFloat(this.ruleForm.yundongcishu)
						this.$http({url: `${this.$storage.get('sessionTable')}/update`,method: "post",data: this.uObject}).then(res => {});
					}
					this.$message({
						message: "操作成功",
						type: "success",
						duration: 1500,
						onClose: () => {
							this.parent.showFlag = true;
							this.parent.addOrUpdateFlag = false;
							this.parent.yundongdakaCrossAddOrUpdateFlag = false;
							this.parent.search();
							this.parent.contentStyleChange();
						}
					});
				} else {
					this.$message.error(data.msg);
			   }
			});
		 }
         }
       });
    },
    // 获取uuid
    getUUID () {
      return new Date().getTime();
    },
    // 返回
    back() {
      this.parent.showFlag = true;
      this.parent.addOrUpdateFlag = false;
      this.parent.yundongdakaCrossAddOrUpdateFlag = false;
      this.parent.contentStyleChange();
    },
    touxiangUploadChange(fileUrls) {
	    this.ruleForm.touxiang = fileUrls;
    },
  }
};
</script>
<style lang="scss" scoped>
	.amap-wrapper {
		width: 100%;
		height: 500px;
	}
	
	.search-box {
		position: absolute;
	}
	
	.el-date-editor.el-input {
		width: auto;
	}
	
	.add-update-preview .el-form-item ::v-deep .el-form-item__label {
	  	  padding: 0 10px 0 0;
	  	  color: #666;
	  	  font-weight: 500;
	  	  width: 100px;
	  	  font-size: 14px;
	  	  line-height: 40px;
	  	  text-align: right;
	  	}
	
	.add-update-preview .el-form-item ::v-deep .el-form-item__content {
	  margin-left: 100px;
	}
	
	.add-update-preview .el-input ::v-deep .el-input__inner {
	  	  border: 1;
	  	  border-radius: 4px;
	  	  padding: 0 12px;
	  	  outline: none;
	  	  color: #333;
	  	  width: 400px;
	  	  font-size: 14px;
	  	  height: 40px;
	  	}
	.add-update-preview .el-input-number ::v-deep .el-input__inner {
		text-align: left;
	  	  border: 1;
	  	  border-radius: 4px;
	  	  padding: 0 12px;
	  	  outline: none;
	  	  color: #333;
	  	  width: 400px;
	  	  font-size: 14px;
	  	  height: 40px;
	  	}
	.add-update-preview .el-input-number ::v-deep .el-input-number__decrease {
		display: none;
	}
	.add-update-preview .el-input-number ::v-deep .el-input-number__increase {
		display: none;
	}
	
	.add-update-preview .el-select ::v-deep .el-input__inner {
	  	  border: 1;
	  	  border-radius: 4px;
	  	  padding: 0 10px;
	  	  outline: none;
	  	  color: #333;
	  	  width: 200px;
	  	  font-size: 14px;
	  	  height: 40px;
	  	}
	
	.add-update-preview .el-date-editor ::v-deep .el-input__inner {
	  	  border: 1;
	  	  border-radius: 4px;
	  	  padding: 0 10px 0 30px;
	  	  outline: none;
	  	  color: #333;
	  	  width: 200px;
	  	  font-size: 14px;
	  	  height: 40px;
	  	}
	
	.add-update-preview ::v-deep .el-upload--picture-card {
		background: transparent;
		border: 0;
		border-radius: 0;
		width: auto;
		height: auto;
		line-height: initial;
		vertical-align: middle;
	}
	
	.add-update-preview ::v-deep .upload .upload-img {
	  	  border: 1px dashed #385d86;
	  	  cursor: pointer;
	  	  border-radius: 6px;
	  	  color: #385d86;
	  	  width: 200px;
	  	  font-size: 32px;
	  	  line-height: 200px;
	  	  text-align: center;
	  	  height: 200px;
	  	}
	
	.add-update-preview ::v-deep .el-upload-list .el-upload-list__item {
	  	  border: 1px dashed #385d86;
	  	  cursor: pointer;
	  	  border-radius: 6px;
	  	  color: #385d86;
	  	  width: 200px;
	  	  font-size: 32px;
	  	  line-height: 200px;
	  	  text-align: center;
	  	  height: 200px;
	  	}
	
	.add-update-preview ::v-deep .el-upload .el-icon-plus {
	  	  border: 1px dashed #385d86;
	  	  cursor: pointer;
	  	  border-radius: 6px;
	  	  color: #385d86;
	  	  width: 200px;
	  	  font-size: 32px;
	  	  line-height: 200px;
	  	  text-align: center;
	  	  height: 200px;
	  	}
	
	.add-update-preview .el-textarea ::v-deep .el-textarea__inner {
	  	  border: 1;
	  	  border-radius: 4px;
	  	  padding: 12px;
	  	  outline: none;
	  	  color: #333;
	  	  width: 400px;
	  	  font-size: 14px;
	  	  height: 120px;
	  	}
	
	.add-update-preview .btn .btn1 {
				border: 0;
				cursor: pointer;
				border-radius: 4px;
				padding: 0 24px;
				margin: 4px;
				outline: none;
				color: #fff;
				background: #385d86;
				width: auto;
				font-size: 14px;
				height: 40px;
			}
	
	.add-update-preview .btn .btn1:hover {
				opacity: 0.8;
			}
	
	.add-update-preview .btn .btn2 {
				border: 0;
				cursor: pointer;
				border-radius: 4px;
				padding: 0 24px;
				margin: 4px;
				outline: none;
				color: #fff;
				background: #385d86;
				width: auto;
				font-size: 14px;
				height: 40px;
			}
	
	.add-update-preview .btn .btn2:hover {
				opacity: 0.8;
			}
	
	.add-update-preview .btn .btn3 {
				border: 0;
				cursor: pointer;
				border-radius: 4px;
				padding: 0 24px;
				margin: 4px;
				outline: none;
				color: #fff;
				background: #385d86;
				width: auto;
				font-size: 14px;
				height: 40px;
			}
	
	.add-update-preview .btn .btn3:hover {
				opacity: 0.8;
			}
	
	.add-update-preview .btn .btn4 {
				border: 0;
				cursor: pointer;
				border-radius: 4px;
				padding: 0 24px;
				margin: 4px;
				outline: none;
				color: #fff;
				background: #385d86;
				width: auto;
				font-size: 14px;
				height: 40px;
			}
	
	.add-update-preview .btn .btn4:hover {
				opacity: 0.8;
			}
	
	.add-update-preview .btn .btn5 {
				border: 0;
				cursor: pointer;
				border-radius: 4px;
				padding: 0 24px;
				margin: 4px;
				outline: none;
				color: #fff;
				background: #385d86;
				width: auto;
				font-size: 14px;
				height: 40px;
			}
	
	.add-update-preview .btn .btn5:hover {
				opacity: 0.8;
			}
</style>
