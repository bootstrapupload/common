package com.sf.hackthon.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 *
 * </p>
 *
 * @author YANGLiiN
 * @since 2017-12-15
 */
@TableName("pro_market_base")
public class ProMarketBase extends Model<ProMarketBase> {


  /**
   * 主键
   */
  @TableId(value = "id", type = IdType.AUTO)
  private Integer id;
  /**
   * 市场外部名称
   */
  @TableField("mkt_name")
  private String mktName;
  /**
   * 市场图片
   */
  @TableField("mkt_img")
  private String mktImg;
  /**
   * 单客日均最小件量
   */
  @TableField("daily_min_package")
  private Integer dailyMinPackage;
  /**
   * 重量区间（最小）
   */
  @TableField("weight_min")
  private Integer weightMin;
  /**
   * 重量区间（最大）
   */
  @TableField("weight_max")
  private Integer weightMax;
  /**
   * 首重价格
   */
  @TableField("base_price")
  private Integer basePrice;
  /**
   * 首重重量
   */
  @TableField("base_weight")
  private Integer baseWeight;
  /**
   * 成团人数
   */
  @TableField("group_limit")
  private Integer groupLimit;
  /**
   * 拼团周期(为了方便测试运行，以分钟为单位)
   */
  @TableField("group_duration")
  private Integer groupDuration;
  /**
   * 使用要求
   */
  @TableField("mkt_rule")
  private String mktRule;
  /**
   * 创建人
   */
  @TableField("create_name")
  private String createName;
  /**
   * 创建时间
   */
  @TableField("create_time")
  private Date createTime;
  /**
   * 修改人
   */
  @TableField("mdify_name")
  private String mdifyName;
  /**
   * 修改时间
   */
  @TableField("modify_time")
  private Date modifyTime;
  /**
   * 是否删除 0 否 1 是
   */
  @TableField("mkt_state")
  private Integer mktState;


  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getMktName() {
    return mktName;
  }

  public void setMktName(String mktName) {
    this.mktName = mktName;
  }

  public String getMktImg() {
    return mktImg;
  }

  public void setMktImg(String mktImg) {
    this.mktImg = mktImg;
  }

  public Integer getDailyMinPackage() {
    return dailyMinPackage;
  }

  public void setDailyMinPackage(Integer dailyMinPackage) {
    this.dailyMinPackage = dailyMinPackage;
  }

  public Integer getWeightMin() {
    return weightMin;
  }

  public void setWeightMin(Integer weightMin) {
    this.weightMin = weightMin;
  }

  public Integer getWeightMax() {
    return weightMax;
  }

  public void setWeightMax(Integer weightMax) {
    this.weightMax = weightMax;
  }

  public Integer getBasePrice() {
    return basePrice;
  }

  public void setBasePrice(Integer basePrice) {
    this.basePrice = basePrice;
  }

  public Integer getBaseWeight() {
    return baseWeight;
  }

  public void setBaseWeight(Integer baseWeight) {
    this.baseWeight = baseWeight;
  }

  public Integer getGroupLimit() {
    return groupLimit;
  }

  public void setGroupLimit(Integer groupLimit) {
    this.groupLimit = groupLimit;
  }

  public Integer getGroupDuration() {
    return groupDuration;
  }

  public void setGroupDuration(Integer groupDuration) {
    this.groupDuration = groupDuration;
  }

  public String getMktRule() {
    return mktRule;
  }

  public void setMktRule(String mktRule) {
    this.mktRule = mktRule;
  }

  public String getCreateName() {
    return createName;
  }

  public void setCreateName(String createName) {
    this.createName = createName;
  }

  public Date getCreateTime() {
    return createTime;
  }

  public void setCreateTime(Date createTime) {
    this.createTime = createTime;
  }

  public String getMdifyName() {
    return mdifyName;
  }

  public void setMdifyName(String mdifyName) {
    this.mdifyName = mdifyName;
  }

  public Date getModifyTime() {
    return modifyTime;
  }

  public void setModifyTime(Date modifyTime) {
    this.modifyTime = modifyTime;
  }

  public Integer getMktState() {
    return mktState;
  }

  public void setMktState(Integer mktState) {
    this.mktState = mktState;
  }

  @Override
  protected Serializable pkVal() {
    return this.id;
  }

  @Override
  public String toString() {
    return "ProMarketBase{" +
        ", id=" + id +
        ", mktName=" + mktName +
        ", mktImg=" + mktImg +
        ", dailyMinPackage=" + dailyMinPackage +
        ", weightMin=" + weightMin +
        ", weightMax=" + weightMax +
        ", basePrice=" + basePrice +
        ", baseWeight=" + baseWeight +
        ", groupLimit=" + groupLimit +
        ", groupDuration=" + groupDuration +
        ", mktRule=" + mktRule +
        ", createName=" + createName +
        ", createTime=" + createTime +
        ", mdifyName=" + mdifyName +
        ", modifyTime=" + modifyTime +
        ", mktState=" + mktState +
        "}";
  }
}
