package com.sf.hackthon.service;

import com.baomidou.mybatisplus.service.IService;
import com.sf.hackthon.entity.GroupJoinInfo;

/**
 * <p> 服务类 </p>
 *
 * @author YUTAO
 * @since 2017-12-15
 */
public interface IGroupJoinInfoService extends IService<GroupJoinInfo> {


  /**
   * 创建信息
   */
  boolean newGroupJoinInfo(GroupJoinInfo groupJoinInfo);

}
