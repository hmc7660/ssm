package pers.hmc.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import pers.hmc.bean.Customer;
import pers.hmc.bean.Message;
import pers.hmc.service.CustomerService;

import java.util.List;

@Controller
public class CustomerController {

	@Autowired
	private CustomerService customerservice;
	
	//查询所有客户并实现分页
	@RequestMapping("/cust")
	@ResponseBody
	public Message selectAllCustomerJson(@RequestParam(value = "pn", defaultValue = "1")Integer pn) {
		//startPage传入页码、每页的数据条数
		PageHelper.startPage(pn, 5);
		List<Customer> cust = customerservice.selectAllCustomer();
		//通过PageInfo包装查询结果，传入查询的结果、分页条连续显示的的页数
		PageInfo page = new PageInfo(cust,5);
		//JSON格式返回查询结果
		return Message.success().add("Info", page);
	}
	
	//快速查询客户并实现分页
	@RequestMapping("/quickQuery")
	@ResponseBody
	public Message quickQuery(@RequestParam(value = "pn", defaultValue = "1")Integer pn,Customer customer) {
		
		PageHelper.startPage(pn, 5);
		
		List<Customer> cust = customerservice.quickQuery(customer);
		
		PageInfo page = new PageInfo(cust, 5);		
		
		return Message.success().add("Info", page);
	}
			
	//添加客户
	@RequestMapping("/add")
	@ResponseBody
	public Message addCustomer(Customer customer) {
		customerservice.addCustomer(customer);
		return Message.success();
	}
	
	//根据客户id查询客户信息
	@RequestMapping(value = "/customer/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Message selectById(@PathVariable("id")Long id) {		
		Customer customer = customerservice.selectById(id);
		return Message.success().add("custInfo", customer);
	}
	
	//更新客户信息
	@RequestMapping(value= "/customer/{id}",method=RequestMethod.PUT)
	@ResponseBody
	public Message update(Customer customer) {
		customerservice.update(customer);
		return Message.success();
		
	}
	
	//根据客户id删除客户
	@RequestMapping(value="/customer/{id}",method=RequestMethod.DELETE)
	@ResponseBody
	public Message delete(@PathVariable("id")Long id) {
		customerservice.delete(id);
		return Message.success();
	}
		
}
