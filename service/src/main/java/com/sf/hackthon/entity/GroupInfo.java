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
 * @author WEIJINLIANG
 * @since 2017-12-15
 */
@TableName("group_info")
public class GroupInfo extends Model<GroupInfo> {

  private static final long serialVersionUID = 1L;

  /**
   * 主键
   */
  @TableId(value = "id", type = IdType.AUTO)
  private Integer id;
  /**
   * 参团类型 1/全国
   */
  @TableField("group_type")
  private Integer groupType;
  /**
   * 集件团名称
   */
  @TableField("group_name")
  private String groupName;
  /**
   * 图片地址
   */
  @TableField("adv_img")
  private String advImg;
  /**
   * 单客日均最小件量
   */
  @TableField("daily_min_package")
  private Integer dailyMinPackage;
  /**
   * 重量区间（最小）单位：克
   */
  @TableField("weight_min")
  private Integer weightMin;
  /**
   * 重量区间（最大）单位：克
   */
  @TableField("weight_max")
  private Integer weightMax;
  /**
   * 首重价格： 分
   */
  @TableField("base_price")
  private Integer basePrice;
  /**
   * 首重重量 克
   */
  @TableField("base_weight")
  private Integer baseWeight;
  /**
   * 成团人数
   */
  @TableField("group_limit")
  private Integer groupLimit;
  /**
   * 当前参团人数
   */
  @TableField("group_count")
  private Integer groupCount;
  /**
   * 成团周期
   */
  @TableField("group_duration")
  private Integer groupDuration;
  /**
   * 0/未成团  1/已成团
   */
  @TableField("group_state")
  private Integer groupState;
  /**
   * 参团结束时间
   */
  @TableField("group_end_time")
  private Date groupEndTime;
  /**
   * 实际结束时间
   */
  @TableField("group_finish_time")
  private Date groupFinishTime;
  /**
   * 集件团规则
   */
  @TableField("group_rule")
  private String groupRule;
  /**
   * 市场id
   */
  @TableField("pro_market_base_id")
  private Integer proMarketBaseId;


  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public Integer getGroupType() {
    return groupType;
  }

  public void setGroupType(Integer groupType) {
    this.groupType = groupType;
  }

  public String getGroupName() {
    return groupName;
  }

  public void setGroupName(String groupName) {
    this.groupName = groupName;
  }

  public String getAdvImg() {
    return advImg;
  }

  public void setAdvImg(String advImg) {
    this.advImg = advImg;
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

  public Integer getGroupCount() {
    return groupCount;
  }

  public void setGroupCount(Integer groupCount) {
    this.groupCount = groupCount;
  }

  public Integer getGroupDuration() {
    return groupDuration;
  }

  public void setGroupDuration(Integer groupDuration) {
    this.groupDuration = groupDuration;
  }

  public Integer getGroupState() {
    return groupState;
  }

  public void setGroupState(Integer groupState) {
    this.groupState = groupState;
  }

  public Date getGroupEndTime() {
    return groupEndTime;
  }

  public void setGroupEndTime(Date groupEndTime) {
    this.groupEndTime = groupEndTime;
  }

  public Date getGroupFinishTime() {
    return groupFinishTime;
  }

  public void setGroupFinishTime(Date groupFinishTime) {
    this.groupFinishTime = groupFinishTime;
  }

  public String getGroupRule() {
    return groupRule;
  }

  public void setGroupRule(String groupRule) {
    this.groupRule = groupRule;
  }

  public Integer getProMarketBaseId() {
    return proMarketBaseId;
  }

  public void setProMarketBaseId(Integer proMarketBaseId) {
    this.proMarketBaseId = proMarketBaseId;
  }

  @Override
  protected Serializable pkVal() {
    return this.id;
  }

  @Override
  public String toString() {
    return "GroupInfo{" +
        ", id=" + id +
        ", groupType=" + groupType +
        ", groupName=" + groupName +
        ", advImg=" + advImg +
        ", dailyMinPackage=" + dailyMinPackage +
        ", weightMin=" + weightMin +
        ", weightMax=" + weightMax +
        ", basePrice=" + basePrice +
        ", baseWeight=" + baseWeight +
        ", groupLimit=" + groupLimit +
        ", groupCount=" + groupCount +
        ", groupDuration=" + groupDuration +
        ", groupState=" + groupState +
        ", groupEndTime=" + groupEndTime +
        ", groupFinishTime=" + groupFinishTime +
        ", groupRule=" + groupRule +
        ", proMarketBaseId=" + proMarketBaseId +
        "}";
  }
}
