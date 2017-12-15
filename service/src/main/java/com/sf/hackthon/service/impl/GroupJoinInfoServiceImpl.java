package com.sf.hackthon.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.sf.common.exception.BusinessException;
import com.sf.hackthon.dao.GroupJoinInfoMapper;
import com.sf.hackthon.entity.GroupJoinInfo;
import com.sf.hackthon.service.IGroupInfoService;
import com.sf.hackthon.service.IGroupJoinInfoService;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p> 服务实现类 </p>
 *
 * @author YUTAO
 * @since 2017-12-15
 */
@Service
public class GroupJoinInfoServiceImpl extends ServiceImpl<GroupJoinInfoMapper, GroupJoinInfo>
    implements IGroupJoinInfoService {


  @Autowired
  private IGroupInfoService groupInfoService;

  @Override
  @Transactional(rollbackFor = Exception.class)
  public boolean newGroupJoinInfo(GroupJoinInfo groupJoinInfo) {

    groupInfoService.validateAvaliable(groupJoinInfo.getGroupId());
    groupJoinInfo.setCreateTime(new Date());
    this.insert(groupJoinInfo);
    boolean incr = groupInfoService.incrGroupCount(groupJoinInfo.getGroupId());
    if (!incr) {
      throw new BusinessException("此集货团已经结束");
    }
    return true;
  }
}
