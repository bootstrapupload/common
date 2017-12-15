package com.sf.hackthon.service;

import com.baomidou.mybatisplus.service.IService;
import com.sf.hackthon.entity.GroupInfo;
import java.util.List;

/**
 * <p> 服务类 </p>
 *
 * @author WEIJINLIANG
 * @since 2017-12-15
 */
public interface IGroupInfoService extends IService<GroupInfo> {

  /**
   * 返回未成团、未过期可用的团列表
   *
   * @return 返回可用信息集件信息，如果没有，返回空list
   */
  List<GroupInfo> getAvaliableGroupInfs();

  /**
   * 根据groupId, 判断有效性，无效则抛出异常
   */
  void validateAvaliable(Integer groupId);

  /**
   * 增加参团人数
   *
   * @param groupId 组信息
   */
  boolean incrGroupCount(Integer groupId);
}
