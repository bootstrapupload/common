package com.sf.hackthon.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.sf.common.dto.WsResult;
import com.sf.hackthon.entity.Province;
import com.sf.hackthon.service.IProvinceService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
@RequestMapping("/hackthonday/province")
public class ProvinceController {

  @Autowired
  private IProvinceService iProvinceService;


  /**
   * 获取所有省份
   */
  @GetMapping("/getProviceList")
  @ApiOperation("获取所有省份信息")
  public WsResult<List<Province>> getProviceList() {

    WsResult<List<Province>> rs = new WsResult();
    EntityWrapper<Province> ew = new EntityWrapper<>();
    List<Province> provinceList = iProvinceService.selectList(ew);
    rs.setData(provinceList);
    rs.setSuccess();
    return rs;
  }

}

