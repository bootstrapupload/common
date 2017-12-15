package com.sf.common.exception;

/**
 * 通知异常类
 *
 * @author weijinliang
 * @since 2017-12-14 22:33
 */
public class BusinessException extends RuntimeException {

  public BusinessException(String message) {
    super(message);
  }

}
