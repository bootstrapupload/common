package com.sf.hackthon.pre.hackthonday.dto;

import java.io.Serializable;

public class WSResult<T> implements Serializable {

  // -- 返回代码定义 --//
  public static final Integer SYSTEM_ERROR = -10;
  public static final String SYSTEM_ERROR_MESSAGE = "Runtime unknown internal error.";

  public static final Integer PARAMETER_ERROR = -1;
  public static final String PARAMETER_ERROR_MESSAGE = "Parameter error.";

  // 操作结果码
  private Integer result;

  // 操作错误详情
  private String msg;

  // 返回结果对象
  private T data;

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

  public T getData() {
    return data;
  }

  public void setData(T data) {
    this.data = data;
  }
}
