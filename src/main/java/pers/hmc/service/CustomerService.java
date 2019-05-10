package pers.hmc.service;

import java.util.List;

import pers.hmc.bean.Customer;

public interface CustomerService {

	//查询所有客户
	List<Customer> selectAllCustomer();
	
	//添加客户
	void addCustomer(Customer customer);
	
	//根据客户id查询客户信息
	Customer selectById(Long id);
	
	//更新客户信息
	void update(Customer customer);
	
	//根据客户id删除客户信息
	void delete(Long id);
	
	//快速查询客户
	List<Customer> quickQuery(Customer customer);
	
}
