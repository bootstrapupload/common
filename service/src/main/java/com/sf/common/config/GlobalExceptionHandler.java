package com.sf.common.config;

import com.google.common.base.Strings;
import com.sf.common.dto.WsResult;
import com.sf.common.exception.BusinessException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 服务异常统一返回
 *
 * @author YANGLIN
 * @since 2017-12-15 13:55
 */

@RestControllerAdvice
public class GlobalExceptionHandler {

  private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);


  @ExceptionHandler(Throwable.class)
  @ResponseStatus(HttpStatus.OK)
  public WsResult sysException(Exception e) {

    WsResult rs = new WsResult();
    rs.setSystemError();

    String message = null;
    if (e instanceof MethodArgumentNotValidException) {
      MethodArgumentNotValidException argException = (MethodArgumentNotValidException) e;
      rs.setParameterError();
      BindingResult bindingResult = argException.getBindingResult();
      message = bindingResult.hasErrors() ? bindingResult.getAllErrors().get(0).getDefaultMessage()
          : null;
    } else if (e instanceof BusinessException) {
      message = e.getMessage();
    }

    if (!Strings.isNullOrEmpty(message)) {
      rs.setMsg(message);
    }

    logger.error("服务系统异常", e);
    return rs;

  }


}
