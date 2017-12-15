package com.sf.hackthon.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.sf.hackthon.dao.CityMapper;
import com.sf.hackthon.entity.City;
import com.sf.hackthon.service.ICityService;

/**
 * <p> 服务实现类  </p>
 *
 * @author YANGLiiN
 * @since 2017-12-15
 */
@Service
public class CityServiceImpl extends ServiceImpl<CityMapper, City> implements ICityService {

}
