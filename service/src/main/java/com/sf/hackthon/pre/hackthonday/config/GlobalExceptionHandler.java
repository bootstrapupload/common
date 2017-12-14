package com.sf.hackthon.pre.hackthonday.config;

import com.sf.hackthon.pre.hackthonday.dto.WSResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 服务异常统一返回
 *
 * @author YANGLiiN 2017-12-14 10:03
 */

@RestControllerAdvice
public class GlobalExceptionHandler {

  private static final Logger LOG = LoggerFactory.getLogger(GlobalExceptionHandler.class);


  @ExceptionHandler(Throwable.class)
  @ResponseStatus(HttpStatus.OK)
  public WSResult sysException(Exception e) {
    WSResult rs = new WSResult();
    rs.setSystemError();

    LOG.error("服务系统异常", e);

    return rs;
  }


}
