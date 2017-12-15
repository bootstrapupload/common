package com.sf.hackthon.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.sf.common.dto.WsResult;
import com.sf.hackthon.entity.City;
import com.sf.hackthon.service.ICityService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p> 前端控制器  </p>
 *
 * @author YUTAO
 * @since 2017-12-15
 */
@Api
@RestController
@RequestMapping("/hackthonday/city")
public class CityController {

  @Autowired
  private ICityService iCityService;


  /**
   * 通过省级code获取所有城市
   */
  @GetMapping("/getCityList/{provinceCode}")
  @ApiOperation("通过省级code获取所有市区")
  public WsResult getCityList(@PathVariable Long provinceCode) {

    WsResult rs = new WsResult();
    EntityWrapper<City> ew = new EntityWrapper<>();
    ew.eq("province_code", provinceCode);
    List<City> cityList = iCityService.selectList(ew);
    rs.setData(cityList);
    rs.setSuccess();
    return rs;

  }

}

