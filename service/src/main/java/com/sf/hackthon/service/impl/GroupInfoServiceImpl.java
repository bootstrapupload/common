package com.sf.hackthon.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.sf.common.exception.BusinessException;
import com.sf.hackthon.dao.GroupInfoMapper;
import com.sf.hackthon.entity.GroupInfo;
import com.sf.hackthon.entity.enums.GroupInfoState;
import com.sf.hackthon.service.IGroupInfoService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p> 服务实现类 </p>
 *
 * @author WEIJINLIANG
 * @since 2017-12-15
 */
@Service
public class GroupInfoServiceImpl extends ServiceImpl<GroupInfoMapper, GroupInfo> implements
    IGroupInfoService {

  @Autowired
  private GroupInfoMapper groupInfoMapper;

  @Override
  public List<GroupInfo> getAvaliableGroupInfs() {

    EntityWrapper<GroupInfo> groupInfEntityWrapper = new EntityWrapper<>();
    groupInfEntityWrapper.eq("group_state", GroupInfoState.UNFINISH.getValue())
        .andNew("group_end_time > {0}", new Date())
        .and("group_count < group_limit");
    return this.selectList(groupInfEntityWrapper);

  }

  @Override
  public void validateAvaliable(Integer groupId) {

    GroupInfo groupInfo = this.selectById(groupId);
    if (null == groupInfo) {
      throw new BusinessException("无此集货信息");
    }

    boolean finish = groupInfo.getGroupLimit() <= groupInfo.getGroupCount();
    if (finish || groupInfo.getGroupState().intValue() != GroupInfoState.UNFINISH.getValue()
        .intValue()) {
      throw new BusinessException("此团已结束");
    }

    if (groupInfo.getGroupEndTime().before(new Date())) {
      throw new BusinessException("此团已过期");
    }

  }

  @Override
  public boolean incrGroupCount(Integer groupId) {
    return groupInfoMapper.incrGroupCount(groupId, GroupInfoState.UNFINISH.getValue());
  }

}
