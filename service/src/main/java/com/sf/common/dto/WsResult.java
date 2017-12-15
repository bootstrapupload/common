package com.sf.common.dto;

import java.io.Serializable;

/**
 * 返回结果封装类
 *
 * @author weijinliang
 * @since 2017-12-15 19:34
 */
public class WsResult implements Serializable {

  /**
   * 系统错误
   */
  public static final Integer SYSTEM_ERROR = -1;
  public static final String SYSTEM_ERROR_MESSAGE = "系统异常";

  /**
   * 参数错误
   */
  public static final Integer PARAMETER_ERROR = -2;
  public static final String PARAMETER_ERROR_MESSAGE = "参数有误";

  /**
   * 操作结果码
   */
  private Integer result;

  /**
   * 操作错误详情
   */
  private String msg;

  /**
   * 返回结果对象
   */
  private Object data;

  /**
   * 创建结果.
   */
  public void setError(Integer errorCode, String errorMsg) {
    this.result = errorCode;
    this.msg = errorMsg;
  }

  /**
   * 成功.
   */
  public void setSuccess() {
    setError(1, null);
  }

  /**
   * 创建默认异常结果.
   */
  public void setSystemError() {
    setError(SYSTEM_ERROR, SYSTEM_ERROR_MESSAGE);
  }

  /**
   * 创建参数异常结果
   */
  public void setParameterError() {
    setError(PARAMETER_ERROR, PARAMETER_ERROR_MESSAGE);
  }

  public Integer getResult() {
    return result;
  }

  public void setResult(Integer result) {
    this.result = result;
  }

  public String getMsg() {
    return msg;
  }

  public void setMsg(String msg) {
    this.msg = msg;
  }

  public Object getData() {
    return data;
  }

  public void setData(Object data) {
    this.data = data;
  }
}
