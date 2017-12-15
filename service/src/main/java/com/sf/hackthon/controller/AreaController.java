package com.sf.hackthon.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.sf.common.dto.WsResult;
import com.sf.hackthon.entity.Area;
import com.sf.hackthon.service.IAreaService;
import io.swagger.annotations.Api;
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
@RequestMapping("/hackthonday/area")
public class AreaController {

  @Autowired
  private IAreaService iAreaService;


  /**
   * 通过城市code获取所有区域
   */
  @GetMapping("/getAreaList/{cityCode}")
  public WsResult<List<Area>> getAreaList(@PathVariable Long cityCode) {

    WsResult<List<Area>> rs = new WsResult<>();
    EntityWrapper<Area> ew = new EntityWrapper<>();
    ew.eq("city_code", cityCode);
    List<Area> cityList = iAreaService.selectList(ew);
    rs.setData(cityList);
    rs.setSuccess();
    return rs;

  }

}

