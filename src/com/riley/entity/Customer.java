package com.riley.entity;

import java.util.Date;

public class Customer{
	private Integer custId;// 客户编号

	private String custName;// 客户名称

	private Integer custUserId;// 负责人id

	private Integer custCreateId;// 创建人id

	private String custSource;// 客户信息来源

	private String custIndustry;// 客户所属行业

	private String custLevel;// 客户级别

	private String custLinkman;// 联系人

	private String custPhone;// 固定电话

	private String custMobile;// 移动

	private String custZipcode;// 邮政编码

	private String custAddress;// 联系地址

	private Date custCreatetime;// 创建时间

	public Customer(Integer custId, String custName, Integer custUserId, Integer custCreateId, String custSource,
			String custIndustry, String custLevel, String custLinkman, String custPhone, String custMobile,
			String custZipcode, String custAddress, Date custCreatetime) {
		super();
		this.custId = custId;
		this.custName = custName;
		this.custUserId = custUserId;
		this.custCreateId = custCreateId;
		this.custSource = custSource;
		this.custIndustry = custIndustry;
		this.custLevel = custLevel;
		this.custLinkman = custLinkman;
		this.custPhone = custPhone;
		this.custMobile = custMobile;
		this.custZipcode = custZipcode;
		this.custAddress = custAddress;
		this.custCreatetime = custCreatetime;
	}

	public Customer() {
		super();
	}

	public Integer getCustId() {
		return custId;
	}

	public void setCustId(Integer custId) {
		this.custId = custId;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public Integer getCustUserId() {
		return custUserId;
	}

	public void setCustUserId(Integer custUserId) {
		this.custUserId = custUserId;
	}

	public Integer getCustCreateId() {
		return custCreateId;
	}

	public void setCustCreateId(Integer custCreateId) {
		this.custCreateId = custCreateId;
	}

	public String getCustSource() {
		return custSource;
	}

	public void setCustSource(String custSource) {
		this.custSource = custSource;
	}

	public String getCustIndustry() {
		return custIndustry;
	}

	public void setCustIndustry(String custIndustry) {
		this.custIndustry = custIndustry;
	}

	public String getCustLevel() {
		return custLevel;
	}

	public void setCustLevel(String custLevel) {
		this.custLevel = custLevel;
	}

	public String getCustLinkman() {
		return custLinkman;
	}

	public void setCustLinkman(String custLinkman) {
		this.custLinkman = custLinkman;
	}

	public String getCustPhone() {
		return custPhone;
	}

	public void setCustPhone(String custPhone) {
		this.custPhone = custPhone;
	}

	public String getCustMobile() {
		return custMobile;
	}

	public void setCustMobile(String custMobile) {
		this.custMobile = custMobile;
	}

	public String getCustZipcode() {
		return custZipcode;
	}

	public void setCustZipcode(String custZipcode) {
		this.custZipcode = custZipcode;
	}

	public String getCustAddress() {
		return custAddress;
	}

	public void setCustAddress(String custAddress) {
		this.custAddress = custAddress;
	}

	public Date getCustCreatetime() {
		return custCreatetime;
	}

	public void setCustCreatetime(Date custCreatetime) {
		this.custCreatetime = custCreatetime;
	}
}