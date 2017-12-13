package com.sf.hackthon.pre.hackthonday.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 *
 * </p>
 *
 * @author YANGLiiN
 * @since 2017-12-05
 */
public class Address extends Model<Address> {

  private static final long serialVersionUID = 1L;

  @TableId(value = "id", type = IdType.AUTO)
  private Long id;
  /**
   * 地址编码
   */
  private String code;
  /**
   * 地址名称
   */
  private String name;
  /**
   * 父编码
   */
  @TableField("parentCode")
  private String parentCode;
  /**
   * 地址层级
   */
  private String level;
  @TableField("createAt")
  private Date createAt;
  @TableField("updateAt")
  private Date updateAt;


  public Long getId() {
    return id;
  }

  public void setId(Long id) {
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

  public String getParentCode() {
    return parentCode;
  }

  public void setParentCode(String parentCode) {
    this.parentCode = parentCode;
  }

  public String getLevel() {
    return level;
  }

  public void setLevel(String level) {
    this.level = level;
  }

  public Date getCreateAt() {
    return createAt;
  }

  public void setCreateAt(Date createAt) {
    this.createAt = createAt;
  }

  public Date getUpdateAt() {
    return updateAt;
  }

  public void setUpdateAt(Date updateAt) {
    this.updateAt = updateAt;
  }

  @Override
  protected Serializable pkVal() {
    return this.id;
  }

  @Override
  public String toString() {
    return "Address{" +
        ", id=" + id +
        ", code=" + code +
        ", name=" + name +
        ", parentCode=" + parentCode +
        ", level=" + level +
        ", createAt=" + createAt +
        ", updateAt=" + updateAt +
        "}";
  }
}
