package com.sf.hackthon.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import java.io.Serializable;

/**
 * <p> 地址demo </p>
 *
 * @author YANGLiiN
 * @since 2017-12-15
 */
public class Area extends Model<Area> {

  private static final long serialVersionUID = 1L;

  @TableId(value = "id", type = IdType.AUTO)
  private Integer id;

  /**
   * 区域代码
   */
  private String code;

  /**
   * 区域名字
   */
  private String name;

  /**
   * 市区代码
   */
  @TableField("city_code")
  private String cityCode;


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

  public String getCityCode() {
    return cityCode;
  }

  public void setCityCode(String cityCode) {
    this.cityCode = cityCode;
  }

  @Override
  protected Serializable pkVal() {
    return this.id;
  }

  @Override
  public String toString() {
    return "Area{" +
        ", id=" + id +
        ", code=" + code +
        ", name=" + name +
        ", cityCode=" + cityCode +
        "}";
  }
}
