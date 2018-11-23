package com.riley.dao;

import java.util.List;

import com.riley.entity.Customer;

public interface CustomerMapper {
	/**
	 * 查询所有客户信息
	 * 
	 * @return
	 */
	public List<Customer> selectCustomerList();

	/**
	 * 条件查询
	 * 
	 * @return
	 */
	public List<Customer> selectCustomerListByCondition(Customer customer);

	/**
	 * 添加客户
	 * @param customer
	 * @return
	 */
	public int createCustomer(Customer customer);
	/**
	 * 通过id查询
	 * @param id
	 * @return
	 */
	public Customer getCustomerById(int id);
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