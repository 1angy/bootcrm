package com.riley.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.riley.dao.BaseDictMapper;
import com.riley.dao.CustomerMapper;
import com.riley.entity.BaseDict;
import com.riley.entity.Customer;
import com.riley.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private BaseDictMapper basedict;
	@Autowired
	private CustomerMapper customer;
	
	@Override
	public List<BaseDict> findBaseDictTypeByTypeCode(String typecode) {
		return basedict.findBaseDictTypeByTypeCode(typecode);
	}

	@Override
	public List<Customer> findCustomerList() {
		return customer.selectCustomerList();
	}

	@Override
	public List<Customer> findCustomerListByCondition(Customer c) {
		return customer.selectCustomerListByCondition(c);
	}
	
	@Override
	public int addCustomer(Customer c) {
		return customer.createCustomer(c);
	}
	
	@Override
	public Customer findCustomerById(int id) {
		return customer.getCustomerById(id);
	}
	
	@Override
	public int updateCustomer(Customer c) {
		return customer.updateCustomer(c);
	}
	
	@Override
	public int deleteCustomer(Integer id) {
		return customer.deleteCustomer(id);
	}
}
