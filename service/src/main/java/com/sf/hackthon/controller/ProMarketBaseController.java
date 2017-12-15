package com.sf.hackthon.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.sf.common.dto.WsResult;
import com.sf.hackthon.entity.ProMarketBase;
import com.sf.hackthon.entity.enums.ProMarketBaseState;
import com.sf.hackthon.service.IProMarketBaseService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import javax.annotation.Resource;
import javax.validation.Valid;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p> 前端控制器 </p>
 *
 * @author arainLiu
 * @since 2017-12-15
 */

@Api
@RestController
@RequestMapping("/hackthonday/proMarketBase")
public class ProMarketBaseController {

  @Resource
  private IProMarketBaseService iProMarketBaseService;

  @GetMapping("/getMarketById/{id}")
  @ApiOperation("通过id获取一个地址详情")
  public WsResult getMarketById(@PathVariable int id) {
    WsResult rs = new WsResult();
    EntityWrapper<ProMarketBase> ew = new EntityWrapper<>();
    ew.eq("id", id);
    ProMarketBase data = iProMarketBaseService.selectOne(ew);
    rs.setData(data);
    rs.setSuccess();
    return rs;
  }

  @GetMapping("/page")
  @ApiOperation("分页查询列表")
  public WsResult page(
      @RequestParam(value = "page", required = false, defaultValue = "1") int pageNum,
      @RequestParam(value = "size", required = false, defaultValue = "20") int size) {

    WsResult rs = new WsResult();
    Page pages = new Page(pageNum, size);
    EntityWrapper<ProMarketBase> ew = new EntityWrapper<>();
    ew.where("id>1000");
    Page<ProMarketBase> data = iProMarketBaseService.selectPage(pages, ew);
    rs.setData(data);
    rs.setSuccess();
    return rs;
  }

  @PostMapping("/insert")
  @ApiOperation("新增市场")
  public WsResult insert(@RequestBody @Valid ProMarketBase marketBase) {

    WsResult rs = new WsResult();
    Boolean data = iProMarketBaseService.insert(marketBase);
    rs.setData(data);
    rs.setSuccess();
    return rs;
  }

  @PostMapping("/update")
  @ApiOperation("更新")
  public WsResult update(@RequestBody ProMarketBase marketBase) {

    WsResult rs = new WsResult();
    Boolean data = iProMarketBaseService.updateById(marketBase);
    rs.setData(data);
    rs.setSuccess();
    return rs;
  }

  @PostMapping("/delete")
  @ApiOperation("删除")
  public WsResult delete(@RequestBody ProMarketBase marketBase) {

    marketBase.setMktState(ProMarketBaseState.UNVALID.getValue());
    WsResult rs = new WsResult();
    Boolean data = iProMarketBaseService.updateById(marketBase);
    rs.setData(data);
    rs.setSuccess();
    return rs;
  }

}

