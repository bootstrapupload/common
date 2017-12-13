package com.sf.hackthon.pre.hackthonday.config;


import com.baomidou.mybatisplus.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.plugins.PerformanceInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

/**
 * @author YANGLiiN 2017-12-05 13:55
 */
@Configuration
@MapperScan("com.sf.hackthon.pre.hackthonday.dao*")
public class MybatisPlusConfig {

  /**
   * mybatis-plus SQL执行效率插件【生产环境可以关闭】
   */
  @Bean
  @Profile({"dev", "test"})
  public PerformanceInterceptor performanceInterceptor() {
    return new PerformanceInterceptor();
  }

  /**
   * mybatis-plus分页插件<br> 文档：http://mp.baomidou.com<br>
   */
  @Bean
  public PaginationInterceptor paginationInterceptor() {
    PaginationInterceptor paginationInterceptor = new PaginationInterceptor();
    // 开启 PageHelper 的支持
    paginationInterceptor.setLocalPage(true);
    return paginationInterceptor;
  }

}
