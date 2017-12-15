package com.sf.hackthon.job;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.toolkit.IdWorker;
import com.sf.common.Constants;
import com.sf.hackthon.dao.GroupInfoMapper;
import com.sf.hackthon.dao.ProMarketBaseMapper;
import com.sf.hackthon.entity.GroupInfo;
import com.sf.hackthon.entity.ProMarketBase;
import com.sf.hackthon.entity.enums.GroupInfoState;
import com.sf.hackthon.entity.enums.GroupType;
import com.sf.hackthon.entity.enums.ProMarketBaseState;
import java.util.List;
import javax.annotation.Resource;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

/**
 * @author YANGLiiN 2017-12-15 13:45
 */

@Service
public class GroupJob {

  private static final Logger logger = LoggerFactory.getLogger(GroupJob.class);

  @Resource
  private ProMarketBaseMapper proMarketBaseMapper;

  @Resource
  private GroupInfoMapper groupInfoMapper;


  /**
   * 根据市场信息创建集团任务
   */
  @Scheduled(fixedDelay = 10000)
  public void newGroupInfoWhenCreateTaskInfo() {

    logger.info("根据市场创建集团信息-->开始");

    DateTime now = DateTime.now();
    DateTime start = now.minusMinutes(3);
    DateTime end = now.plusMinutes(3);

    EntityWrapper<ProMarketBase> mew = new EntityWrapper<>();
    mew.eq("mkt_state", ProMarketBaseState.VALID.getValue())
        .between("create_time", start.toString(Constants.DATE_TIME_FORMAT),
            end.toString(Constants.DATE_TIME_FORMAT));
    List<ProMarketBase> markets = proMarketBaseMapper.selectList(mew);

    for (ProMarketBase m : markets) {
      EntityWrapper<GroupInfo> gew = new EntityWrapper<>();
      gew.eq("pro_market_base_id", m.getId());
      Integer count = groupInfoMapper.selectCount(gew);
      if (count == null || count < 1) {
        GroupInfo g = new GroupInfo();
        BeanUtils.copyProperties(m, g);
        g.setProMarketBaseId(m.getId());
        g.setGroupType(GroupType.CONUTRY.getValue());
        g.setGroupName(m.getMktName() + String.valueOf(IdWorker.getId()).substring(13) + "期");
        g.setAdvImg(m.getMktImg());
        g.setGroupState(GroupInfoState.UNFINISH.getValue());
        g.setGroupCount(0);
        g.setGroupRule(m.getMktRule());
        g.setGroupEndTime(now.plusMinutes(m.getGroupDuration()).toDate());
        groupInfoMapper.insert(g);
      }
    }

    logger.info("根据市场创建集团信息<--结束");


  }


  /**
   * 人员够了更新集团状态
   */
  @Scheduled(fixedRate = 10000)
  public void endGroup() {

    logger.info("集团人数够了更新集团状态任务-->开始");

    groupInfoMapper.endGroup(GroupInfoState.UNFINISH.getValue(), GroupInfoState.FINISH.getValue());

    logger.info("集团人数够了更新集团状态任务<--结束");


  }


}
