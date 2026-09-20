package com.entity.view;

import com.entity.YundongdakaEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;

import java.io.Serializable;
import com.utils.EncryptUtil;
 

/**
 * 运动打卡
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2024-04-22 21:50:06
 */
@TableName("yundongdaka")
public class YundongdakaView  extends YundongdakaEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public YundongdakaView(){
	}
 
 	public YundongdakaView(YundongdakaEntity yundongdakaEntity){
 	try {
			BeanUtils.copyProperties(this, yundongdakaEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}
