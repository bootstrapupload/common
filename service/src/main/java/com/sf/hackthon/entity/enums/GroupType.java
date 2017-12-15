package com.sf.hackthon.entity.enums;

import com.baomidou.mybatisplus.enums.IEnum;

/**
 * @author weijinliang
 * @since 2017-12-15 13:56
 */
public enum GroupType implements IEnum {

  /**
   * 全国团
   */
  CONUTRY(1);

  /**
   * 状态值
   */
  private Integer value;

  GroupType(Integer value) {
    this.value = value;
  }


  @Override
  public Integer getValue() {
    return this.value;
  }
}
