package com.sf.hackthon.entity.enums;

import com.baomidou.mybatisplus.enums.IEnum;

/**
 * @author weijinliang
 * @since 2017-12-15 13:56
 */
public enum ProMarketBaseState implements IEnum {

  /**
   * 删除
   */
  VALID(0),

  /**
   * 未删除
   */
  UNVALID(1);

  /**
   * 状态值
   */
  private Integer value;

  ProMarketBaseState(Integer value) {
    this.value = value;
  }


  @Override
  public Integer getValue() {
    return this.value;
  }
}
