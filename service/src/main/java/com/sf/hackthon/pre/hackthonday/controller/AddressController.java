package com.sf.hackthon.pre.hackthonday.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.sf.hackthon.pre.hackthonday.entity.Address;
import com.sf.hackthon.pre.hackthonday.service.IAddressService;
import java.util.List;
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
  public Address id(@PathVariable int id) {
    EntityWrapper<Address> ew = new EntityWrapper<>();
    ew.eq("id", id);
    return iAddressService.selectOne(ew);
  }


  // http://127.0.0.1:18080/hackthonday/address/page?page=20&size=1
  @ResponseBody
  @GetMapping("/page")
  public List<Address> page(
      @RequestParam(value = "page", required = false, defaultValue = "1") int page,
      @RequestParam(value = "size", required = false, defaultValue = "20") int size) {
    Page p = new Page(page, size);

    EntityWrapper<Address> ew = new EntityWrapper<>();
    ew.where("id>1000");

    return iAddressService.selectPage(p, ew).getRecords();
  }


  // http://127.0.0.1:18080/hackthonday/address/insert
  // {"code":"450","name":"广西2","parentCode":"CHINA","level":"1","createAt":1398419599000,"updateAt":1398419599000}
  @ResponseBody
  @PostMapping("/insert")
  public boolean insert(@RequestBody Address address) {

    return iAddressService.insert(address);
  }

  // http://127.0.0.1:18080/hackthonday/address/update
  // {"id":"2966","name":"广西23"}
  @ResponseBody
  @PostMapping("/update")
  public boolean update(@RequestBody Address address) {

    return iAddressService.updateById(address);
  }
}

