package com.sf.hackthon.entity.enums;

import com.baomidou.mybatisplus.enums.IEnum;

/**
 * @author weijinliang
 * @since 2017-12-15 13:56
 */
public enum GroupInfoState implements IEnum {

  /**
   * 未成团
   */
  UNFINISH(0),

  /**
   * 已成团
   */
  FINISH(1);

  /**
   * 状态值
   */
  private Integer value;

  GroupInfoState(Integer value) {
    this.value = value;
  }


  @Override
  public Integer getValue() {
    return this.value;
  }
}
