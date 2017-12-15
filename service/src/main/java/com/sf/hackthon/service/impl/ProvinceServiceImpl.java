package com.sf.hackthon.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.sf.hackthon.dao.ProvinceMapper;
import com.sf.hackthon.entity.Province;
import com.sf.hackthon.service.IProvinceService;
import org.springframework.stereotype.Service;

/**
 * <p> 服务实现类  </p>
 *
 * @author YANGLiiN
 * @since 2017-12-15
 */
@Service
public class ProvinceServiceImpl extends ServiceImpl<ProvinceMapper, Province> implements
    IProvinceService {

}
