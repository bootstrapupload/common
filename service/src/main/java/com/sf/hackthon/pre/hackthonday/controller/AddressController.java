package com.sf.hackthon.pre.hackthonday.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.sf.hackthon.pre.hackthonday.dto.WSResult;
import com.sf.hackthon.pre.hackthonday.entity.Address;
import com.sf.hackthon.pre.hackthonday.service.IAddressService;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p> 前端控制器 </p>
 *
 * @author YANGLiiN
 * @since 2017-12-13
 */
@Controller
@RequestMapping("/hackthonday/address")
public class AddressController {

  @Resource
  private IAddressService iAddressService;


  // http://127.0.0.1:18080/hackthonday/address/2966
  @ResponseBody
  @GetMapping("/{id}")
  public WSResult<Address> id(@PathVariable int id) {
    WSResult<Address> rs = new WSResult<>();

    EntityWrapper<Address> ew = new EntityWrapper<>();
    ew.eq("id", id);
    Address data = iAddressService.selectOne(ew);
    rs.setData(data);
    rs.setSuccess();

    return rs;
  }


  // http://127.0.0.1:18080/hackthonday/address/page?page=20&size=1
  @ResponseBody
  @GetMapping("/page")
  public WSResult<Page<Address>> page(
      @RequestParam(value = "page", required = false, defaultValue = "1") int page,
      @RequestParam(value = "size", required = false, defaultValue = "20") int size) {

    WSResult<Page<Address>> rs = new WSResult<>();

    Page p = new Page(page, size);

    EntityWrapper<Address> ew = new EntityWrapper<>();
    ew.where("id>1000");

    Page<Address> data = iAddressService.selectPage(p, ew);

    rs.setData(data);
    rs.setSuccess();

    return rs;
  }


  // http://127.0.0.1:18080/hackthonday/address/insert
  // {"code":"450","name":"广西2","parentCode":"CHINA","level":"1","createAt":1398419599000,"updateAt":1398419599000}
  @ResponseBody
  @PostMapping("/insert")
  public WSResult<Boolean> insert(@RequestBody Address address) {
    WSResult<Boolean> rs = new WSResult<>();

    Boolean data = iAddressService.insert(address);
    rs.setData(data);
    rs.setSuccess();

    return rs;
  }

  // http://127.0.0.1:18080/hackthonday/address/update
  // {"id":"2966","name":"广西23"}
  @ResponseBody
  @PostMapping("/update")
  public WSResult<Boolean> update(@RequestBody Address address) {
    WSResult<Boolean> rs = new WSResult<>();

    Boolean data = iAddressService.updateById(address);
    rs.setData(data);
    rs.setSuccess();

    return rs;
  }
}

