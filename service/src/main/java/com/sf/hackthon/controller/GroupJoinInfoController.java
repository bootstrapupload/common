package com.sf.hackthon.controller;


import com.sf.common.dto.WsResult;
import com.sf.hackthon.entity.GroupJoinInfo;
import com.sf.hackthon.service.IGroupInfoService;
import com.sf.hackthon.service.IGroupJoinInfoService;
import io.swagger.annotations.Api;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
@RequestMapping("/hackthonday/groupJoinInfo")
public class GroupJoinInfoController {

  @Autowired
  private IGroupInfoService groupInfoService;

  @Autowired
  private IGroupJoinInfoService groupJoinInfoService;


  /**
   * 判断是否该集货团是否已结束
   */
  @GetMapping("/estimateIsEnd")
  public WsResult<GroupJoinInfo> estimateIsEnd(Integer groupId) {

    groupInfoService.validateAvaliable(groupId);
    WsResult<GroupJoinInfo> ws = new WsResult<>();
    ws.setSuccess();
    return ws;
  }

  @PostMapping("/new")
  public WsResult<GroupJoinInfo> newGroupJoinInfo(@Valid GroupJoinInfo groupJoinInfo) {

    groupJoinInfoService.newGroupJoinInfo(groupJoinInfo);
    WsResult<GroupJoinInfo> ws = new WsResult<>();
    ws.setSuccess();
    return ws;

  }

}

