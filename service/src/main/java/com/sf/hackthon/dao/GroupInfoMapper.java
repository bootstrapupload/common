package com.sf.hackthon.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.sf.hackthon.entity.GroupInfo;
import org.apache.ibatis.annotations.Param;

/**
 * <p> Mapper 接口 </p>
 *
 * @author WEIJINLIANG
 * @since 2017-12-15
 */
public interface GroupInfoMapper extends BaseMapper<GroupInfo> {

  /**
   * 添加组信息
   *
   * @param groupId 组id
   * @param state 状态
   */
  boolean incrGroupCount(@Param(value = "groupId") Integer groupId,
      @Param(value = "state") Integer state);


  /**
   * 更新未完成的组状态
   */
  void endGroup(@Param(value = "unFinishState") Integer unFinishState,
      @Param(value = "finishState") Integer finishState);

}
