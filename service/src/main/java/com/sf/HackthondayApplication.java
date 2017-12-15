package com.sf;

import com.battcn.swagger.annotation.EnableSwagger2Doc;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;


/**
 * 应用启动类
 *
 * @author weijinliang
 * @since 2017-12-15 19:08
 */

@EnableScheduling
@EnableSwagger2Doc
@SpringBootApplication
public class HackthondayApplication {

  private HackthondayApplication() {

  }

  public static void main(String[] args) {
    SpringApplication.run(HackthondayApplication.class, args);
  }
}
