package pers.hmc.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.hmc.bean.Customer;
import pers.hmc.dao.CustomerMapper;
import pers.hmc.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private CustomerMapper customermapper;
	
	@Override
	public List<Customer> selectAllCustomer() {		
		return customermapper.selectAllCustomer();
	}

	@Override
	public void addCustomer(Customer customer) {		
		customermapper.addCustomer(customer);
	}

	@Override
	public Customer selectById(Long id) {		
		return customermapper.selectById(id);
	}

	@Override
	public void update(Customer customer) {		
		customermapper.update(customer);		
	}

	@Override
	public void delete(Long id) {
		customermapper.delete(id);		
	}

	@Override
	public List<Customer> quickQuery(Customer customer) {
		return customermapper.quickQuery(customer);
	}
	
}
