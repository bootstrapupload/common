package com.sf.hackthon.pre.hackthonday.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.sf.hackthon.pre.hackthonday.dao.AddressMapper;
import com.sf.hackthon.pre.hackthonday.entity.Address;
import com.sf.hackthon.pre.hackthonday.service.IAddressService;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

/**
 * <p> 服务实现类 </p>
 *
 * @author YANGLiiN
 * @since 2017-12-05
 */
@Service
public class AddressServiceImpl extends ServiceImpl<AddressMapper, Address> implements
    IAddressService {

  @Resource
  private AddressMapper addressMapper;

}
