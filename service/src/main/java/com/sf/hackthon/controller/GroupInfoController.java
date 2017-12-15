package com.sf.hackthon.controller;


import com.sf.common.dto.WsResult;
import com.sf.hackthon.entity.GroupInfo;
import com.sf.hackthon.service.IGroupInfoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p> 集团寄件信息列表 </p>
 *
 * @author WEIJINLIANG
 * @since 2017-12-15
 */
@Api
@RestController
@RequestMapping("/hackthonday/groupInf")
public class GroupInfoController {

  @Autowired
  private IGroupInfoService groupInfoService;


  /**
   * 获取集件信息团列表
   */
  @GetMapping("/list")
  @ApiOperation("获取集件信息团列表")
  public WsResult<List<GroupInfo>> list() {

    WsResult<List<GroupInfo>> rs = new WsResult();
    rs.setSuccess();
    rs.setData(groupInfoService.getAvaliableGroupInfs());
    return rs;

  }

}

