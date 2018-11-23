package com.riley.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.riley.entity.BaseDict;
import com.riley.entity.Customer;
import com.riley.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * @author YJ
 * @Title CustomerController.java
 * @data 2018年6月20日 下午4:44:30
 * @Description 客户信息展示列表
 */
@Controller
public class CustomerController {

    @Autowired
    private CustomerService customerService;
    /**
     * 客户来源
     */
    private String FROM_TYPE = "002";
    /**
     * 客户所属行业
     */
    private String INDUSTRY_TYPE = "001";
    /**
     * 客户级别
     */
    private String LEVEL_TYPE = "003";
    /**
     * 当前页码
     */
    public String thisPage = null;

    /**
     * 查询客户信息展示
     *
     * @param model
     * @return
     */

    @RequestMapping("/customer")
    public String findBaseDict(HttpSession session, Model model,
                               @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
        List<BaseDict> fromType = customerService.findBaseDictTypeByTypeCode(FROM_TYPE);
        List<BaseDict> industryType = customerService.findBaseDictTypeByTypeCode(INDUSTRY_TYPE);
        List<BaseDict> levelType = customerService.findBaseDictTypeByTypeCode(LEVEL_TYPE);
        session.setAttribute("fromType", fromType);
        session.setAttribute("industryType", industryType);
        session.setAttribute("levelType", levelType);
        PageHelper.startPage(pageNum, 10, "cust_id asc");
        List<Customer> customerList = customerService.findCustomerList();
        PageInfo<Customer> custList = new PageInfo<Customer>(customerList, 5);
        thisPage = custList.getPages() + "";
        model.addAttribute("custList", custList);
        session.setAttribute("customerList", customerList);
        return "show.jsp";
    }

    /**
     * 条件查询
     *
     * @param custSource   客户来源
     * @param custName     客户姓名
     * @param custIndustry 客户行业
     * @param custLevel    客户级别
     * @param pageNum      分页页码
     * @param model
     * @return
     */
    @RequestMapping("/findCustomer")
    public String findCustomer(String custSource, String custName, String custIndustry, String custLevel,
                               HttpSession session, Model model, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
        Customer customer = new Customer();

        if (custName != "" && custName != null) {
            customer.setCustName(custName);
        }
        if (custSource != "" && custSource != null){
            customer.setCustSource(custSource);
        }
        if (custIndustry != "" && custIndustry != null){
            customer.setCustIndustry(custIndustry);
        }
        if (custLevel != "" && custLevel != null){
            customer.setCustLevel(custLevel);
        }
        if (custName == "" && custSource == "" && custIndustry == "" && custLevel == ""){
            return "redirect:customer";
        }

        PageHelper.startPage(pageNum, 10, "cust_id asc");
        List<Customer> customerList = customerService.findCustomerListByCondition(customer);
        PageInfo<Customer> custList = new PageInfo<Customer>(customerList);
        session.removeAttribute("customerList");
        model.addAttribute("custPageList", custList);

        session.setAttribute("customerList", customerList);
        model.addAttribute("custName", custName);
        model.addAttribute("custSource", custSource);
        model.addAttribute("custIndustry", custIndustry);
        model.addAttribute("custLevel", custLevel);
        return "show.jsp";
    }

    /**
     * 创建新用户
     *
     * @param customer
     * @param model
     * @return
     * @throws IOException
     */
    @RequestMapping("/addCustomer")
    @ResponseBody
    public String addCustomer(Customer customer, Model model) {
        int row = customerService.addCustomer(customer);
        if (row > 0) {
            return "OK";
        } else {
            return "FAIL";
        }
    }

    /**
     * 通过id查询客户
     *
     * @param id
     * @return
     */
    @RequestMapping("/getCustomerById")
    @ResponseBody
    public Customer getCustomerById(int id) {
        Customer customer = customerService.findCustomerById(id);
        return customer;
    }

    /**
     * 更新客户
     *
     * @param customer
     * @return
     */
    @RequestMapping("/updateCustomer")
    @ResponseBody
    public String updateCustomer(Customer customer) {
        int row = customerService.updateCustomer(customer);
        if (row > 0) {
            return "OK";
        } else {
            return "FAIL";
        }
    }

    /**
     * 删除客户
     *
     * @param custId
     * @return
     */
    @RequestMapping("/deleteCustomer")
    @ResponseBody
    public String deleteCustomer(String custId) {
        int row = customerService.deleteCustomer(Integer.parseInt(custId));
        if (row > 0) {
            return "OK";
        } else {
            return "FAIL";
        }
    }

}
