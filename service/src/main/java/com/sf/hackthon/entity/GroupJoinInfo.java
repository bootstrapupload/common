package com.sf.hackthon.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import java.io.Serializable;
import java.util.Date;
import javax.validation.constraints.Pattern;
import org.hibernate.validator.constraints.NotBlank;

/**
 * <p> 地址demo </p>
 *
 * @author YUTAO
 * @since 2017-12-15
 */
@TableName("group_join_info")
public class GroupJoinInfo extends Model<GroupJoinInfo> {

  private static final long serialVersionUID = 1L;
  private static final String PATTERN_TELEPHONE = "^((17[0-9])|(14[0-9])|(13[0-9])|(15[^4,\\\\D])|(18[0,5-9]))\\\\d{8}$";
  /**
   * 主键
   */
  @TableId(value = "id", type = IdType.AUTO)
  private Integer id;
  /**
   * 省份编码
   */
  @TableField("province_code")
  @NotBlank
  private String provinceCode;
  /**
   * 城市编码
   */
  @TableField("city_code")
  @NotBlank
  private String cityCode;
  /**
   * 地区编码
   */
  @TableField("area_code")
  private String areaCode;
  /**
   * 详细地址
   */
  @NotBlank
  private String address;
  /**
   * 寄件人名称
   */
  @TableField("sender_name")
  @NotBlank
  private String senderName;
  /**
   * 寄件人电话
   */
  @TableField("sender_phone")
  @NotBlank
  @Pattern(regexp = PATTERN_TELEPHONE, message = "请输入正确的手机号码")
  private String senderPhone;

  /**
   * 单件平均重量，克
   */
  @TableField("avg_weight")
  @NotBlank
  private Integer avgWeight;

  /**
   * 寄件数量
   */
  @TableField("avg_count")
  @NotBlank
  private Integer avgCount;

  /**
   * 集团id
   */
  @TableField("group_id")
  @NotBlank
  private Integer groupId;

  @TableField("user_id")
  private String userId;

  /**
   * 用户头像地址
   */
  @TableField("user_pic")
  private String userPic;

  /**
   * 参团时间
   */
  @TableField("create_time")
  private Date createTime;


  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getProvinceCode() {
    return provinceCode;
  }

  public void setProvinceCode(String provinceCode) {
    this.provinceCode = provinceCode;
  }

  public String getCityCode() {
    return cityCode;
  }

  public void setCityCode(String cityCode) {
    this.cityCode = cityCode;
  }

  public String getAreaCode() {
    return areaCode;
  }

  public void setAreaCode(String areaCode) {
    this.areaCode = areaCode;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getSenderName() {
    return senderName;
  }

  public void setSenderName(String senderName) {
    this.senderName = senderName;
  }

  public String getSenderPhone() {
    return senderPhone;
  }

  public void setSenderPhone(String senderPhone) {
    this.senderPhone = senderPhone;
  }

  public Integer getAvgWeight() {
    return avgWeight;
  }

  public void setAvgWeight(Integer avgWeight) {
    this.avgWeight = avgWeight;
  }

  public Integer getAvgCount() {
    return avgCount;
  }

  public void setAvgCount(Integer avgCount) {
    this.avgCount = avgCount;
  }

  public Integer getGroupId() {
    return groupId;
  }

  public void setGroupId(Integer groupId) {
    this.groupId = groupId;
  }

  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

  public String getUserPic() {
    return userPic;
  }

  public void setUserPic(String userPic) {
    this.userPic = userPic;
  }

  public Date getCreateTime() {
    return createTime;
  }

  public void setCreateTime(Date createTime) {
    this.createTime = createTime;
  }

  @Override
  protected Serializable pkVal() {
    return this.id;
  }

  @Override
  public String toString() {
    return "GroupJoinInfo{" +
        ", id=" + id +
        ", provinceCode=" + provinceCode +
        ", cityCode=" + cityCode +
        ", areaCode=" + areaCode +
        ", address=" + address +
        ", senderName=" + senderName +
        ", senderPhone=" + senderPhone +
        ", avgWeight=" + avgWeight +
        ", avgCount=" + avgCount +
        ", groupId=" + groupId +
        ", userId=" + userId +
        ", userPic=" + userPic +
        ", createTime=" + createTime +
        "}";
  }
}
