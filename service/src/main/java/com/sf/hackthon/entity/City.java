package com.sf.hackthon.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;

/**
 * <p> 地址demo </p>
 *
 * @author YANGLiiN
 * @since 2017-12-15
 */
public class City extends Model<City> {

    private static final long serialVersionUID = 1L;

	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
	
	/**
	 * 市区代码
	 */
	private String code;
	
	/**
	 * 市区名字
	 */
	private String name;
	
	/**
	 * 省代码
	 */
	@TableField("province_code")
	private String provinceCode;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProvinceCode() {
		return provinceCode;
	}

	public void setProvinceCode(String provinceCode) {
		this.provinceCode = provinceCode;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "City{" +
			", id=" + id +
			", code=" + code +
			", name=" + name +
			", provinceCode=" + provinceCode +
			"}";
	}
}
