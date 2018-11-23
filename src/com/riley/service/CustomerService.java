package com.riley.service;

import java.util.List;

import com.riley.entity.BaseDict;
import com.riley.entity.Customer;

public interface CustomerService {

	/**
	 * 查询数据字典，根据类别id查询
	 * 
	 * @param typecode
	 * @return
	 */
	public List<BaseDict> findBaseDictTypeByTypeCode(String typecode);

	/**
	 * 查询所有客户信息
	 * 
	 * @return
	 */
	public List<Customer> findCustomerList();

	/**
	 * 条件查询客户
	 * 
	 * @return
	 */
	public List<Customer> findCustomerListByCondition(Customer customer);

	/**
	 * 创建客户
	 * 
	 * @param c
	 */
	public int addCustomer(Customer c);

	/**
	 * 通过id查询
	 * 
	 * @param id
	 * @return
	 */
	public Customer findCustomerById(int id);
	/**
	 * 更新客户
	 * @param customer
	 * @return
	 */
	public int updateCustomer(Customer customer);
	/**
	 * 删除客户
	 * @param id
	 * @return
	 */
	public int deleteCustomer(Integer id);
	
}
