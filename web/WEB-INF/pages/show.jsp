<%--
  Created by IntelliJ IDEA.
  User: stark
  Date: 2018.11.23
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <title>Boot客户管理系统 v2.0</title>
    <link href="//at.alicdn.com/t/font_713390_td2zdac6rwe.css" rel="stylesheet">
    <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet">
    <style type="text/css">
        .sidebar{
            position: fixed;
            top: 53px;
            left:0px;
            bottom:0px;
            margin:auto;
            width:250px;
            padding-top:20px;
        }
        #wrapper{
            position: absolute;
            top: 52px;
            left:250px;
            bottom:0px;
            right:0px;
            margin:auto;
            padding:0px 20px;
            box-sizing: border-box;
        }
        .page-message{
            line-height: 75px;
        }
        @media (max-width:991px) {
            #wrapper{
                left:0px;
            }
        }
    </style>
</head>

<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Boot客户管理系统 v2.0</a>
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#example-navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div>
            <div class="collapse navbar-collapse" id="example-navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <!-- 邮件信息 -->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="iconfont icon-youjian"></i>
                            <i class="iconfont icon-xiala"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li>
                                <a href="javascript:void(0)">
                                    <span>这里是邮件信息...</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a class="text-center" href="#">
                                    <strong>查看全部消息</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!--待办事件开始-->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)">
                            <i class="iconfont icon-job"></i>
                            <i class="iconfont icon-xiala"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li>
                                <a>这里是待办事件</a>
                            </li>
                        </ul>
                    </li>
                    <!--待办事件结束-->

                    <!--事件处理进度开始-->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="javscript:void(0)">
                            <i class="iconfont icon-xiaoxi"></i>
                            <i class="iconfont icon-xiala"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li>
                                <a href="">这里是事件处理进度</a>
                            </li>
                        </ul>
                    </li>
                    <!--事件处理进度结束-->

                    <!-- 用户信息 开始 -->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="iconfont icon-user"></i>
                            <i class="iconfont icon-xiala"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="javascript:void(0)"><i class="iconfont icon-user"></i>&emsp;管理员：${USER_SESSION.userName}</a>
                            </li>
                            <li>
                                <a href="javascript:void(0)"><i class="iconfont icon-linedesign-07"></i>&emsp;系统设置</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="${pageContext.request.contextPath }/loginout">
                                    <i class="iconfont icon-tuichu"></i>&emsp;退出登录
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!-- 用户信息结束 -->
                </ul>
            </div>
        </div>
    </div>
</nav>
<!-- 左侧搜索栏开始 -->
<div class="navbar-default sidebar col-lg-2 hidden-sm hidden-xs" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <div class="row">

            <ul class="nav" id="side-menu">
                <li class="sidebar-search">
                    <div class="input-group custom-search-form">
                        <input type="text" class="form-control" placeholder="查询内容...">
                        <span class="input-group-btn">
									<button class="btn btn-default" type="button" style="margin: -3px 0 -3px -1px;">
										<i class="iconfont icon-search" style="font-size:14px;"></i>
									</button>
								</span>
                    </div>
                </li>
                <li>
                    <a href="javascript:void(0)" class="active">
                        <i class="iconfont icon-icon-test"></i>  客户管理
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <i class="iconfont icon-yanse" ></i>  客户拜访
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- 左侧搜索栏结束 -->

<!-- 内容开始 -->
<div id="wrapper" class="col-lg-10">
    <div class="row">
        <div class="col-md-12">
            <h3>客户管理</h3>
        </div>
    </div>
    <!-- 条件搜索开始 -->
    <div class="panel panel-default">
        <div class="panel-body">
            <form action="findCustomer" class="form-inline" method="get">
                <div class="form-group">
                    <label for="customerName">客户名称</label>
                    <input type="text" class="form-control" id="customerName"
                           value="${custName }" name="custName" />
                </div>
                <div class="form-group">
                    <label for="customerFrom">客户来源</label>
                    <select	class="form-control" id="customerFrom" name="custSource">
                        <option value="">--请选择--</option>
                        <c:forEach items="${fromType}" var="item">
                            <option value="${item.dictId}" <c:if test="${item.dictId == custSource}">selected</c:if>>${item.dictItemName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="custIndustry">所属行业</label>
                    <select	class="form-control" id="custIndustry"  name="custIndustry">
                        <option value="">--请选择--</option>
                        <c:forEach items="${industryType}" var="item">
                            <option value="${item.dictId}"<c:if test="${item.dictId == custIndustry}"> selected</c:if>>${item.dictItemName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="custLevel">客户级别</label>
                    <select	class="form-control" id="custLevel" name="custLevel">
                        <option value="">--请选择--</option>
                        <c:forEach items="${levelType}" var="item">
                            <option value="${item.dictId}"<c:if test="${item.dictId == custLevel}"> selected</c:if>>${item.dictItemName}</option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit" class="btn btn-success">查询客户</button>
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#newCustomerDialog">新增客户</button>
            </form>
        </div>
    </div>
    <!-- 条件搜索结束 -->



    <!-- 内容主体部分开始 -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">客户信息列表</div>
                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th class="text-center">编号</th>
                        <th class="text-center">客户名称</th>
                        <th class="text-center">客户来源</th>
                        <th class="text-center">客户所属行业</th>
                        <th class="text-center">客户级别</th>
                        <th class="text-center">客户联系地址</th>
                        <th class="text-center">固定电话</th>
                        <th class="text-center">手机</th>
                        <th class="text-center">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${customerList }" var="item">
                        <tr>
                            <td class="text-center">${item.custId }</td>
                            <td class="text-center">${item.custName }</td>
                            <td class="text-center">${item.custSource }</td>
                            <td class="text-center">${item.custIndustry }</td>
                            <td class="text-center">${item.custLevel }</td>
                            <td class="text-center">${item.custAddress }</td>
                            <td class="text-center">${item.custPhone }</td>
                            <td class="text-center">${item.custMobile }</td>
                            <td class="text-center">
                                <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick="editCustomer(${item.custId})">修改</a>
                                <a href="#" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteCustomer" onclick="editCustomer(${item.custId})">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- 分页按钮 -->
    <div class="container-fuild">
        <div class="paging" style="height: 80px;width:520px;margin: 0px auto;">
            <nav aria-label="Page navigation" class="pull-left">
                <ul class="pagination">
                    <c:choose>
                        <c:when test="${empty custPageList }">
                            <li class="<c:if test="${custList.isFirstPage}">disabled</c:if>">
                                <a href=<c:choose><c:when test="${custList.isFirstPage}">"javascript:void(0)"</c:when><c:otherwise>"customer?pageNum=${custList.pageNum-1 }"</c:otherwise></c:choose>
                                aria-label="Previous">
                                <span aria-hidden="true">上一页</span>
                                </a>
                            </li>
                            <c:forEach items="${custList.navigatepageNums }" var="p">
                                <li<c:if test="${ p == custList.pageNum}"> class="active"</c:if>>
                                    <a href="customer?pageNum=${p }">${p }</a>
                                </li>
                            </c:forEach>
                            <li class="<c:if test="${custList.isLastPage}">disabled</c:if>">
                                <a href=<c:choose><c:when test="${custList.isLastPage}">"javascript:void(0)"</c:when><c:otherwise>"customer?pageNum=${custList.pageNum+1 }"</c:otherwise></c:choose>
                                aria-label="Next">
                                <span aria-hidden="true">下一页</span>
                                </a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="<c:if test="${custPageList.isFirstPage}">disabled</c:if>">
                                <a href=<c:choose><c:when test="${custPageList.isFirstPage}">"javascript:void(0)"</c:when><c:otherwise>"findCustomer?<c:if test="${not empty custName}">custName=${custName}&</c:if><c:if test="${not empty custSource}">custSource=${custSource}&</c:if><c:if test="${not empty custIndustry}">custIndustry=${custIndustry}&</c:if><c:if test="${not empty custLevel}">custLevel=${custLevel}&</c:if>pageNum=${custPageList.pageNum-1 }"</c:otherwise></c:choose>
                                aria-label="Previous">
                                <span aria-hidden="true">上一页</span>
                                </a>
                            </li>
                            <c:forEach items="${custPageList.navigatepageNums }" var="p">
                                <li<c:if test="${ p == custPageList.pageNum}"> class="active"</c:if>>
                                    <a href="findCustomer?pageNum=${p }&<c:if test="${not empty custName}">custName=${custName}&</c:if><c:if test="${not empty custSource}">custSource=${custSource}&</c:if><c:if test="${not empty custIndustry}">custIndustry=${custIndustry}&</c:if><c:if test="${not empty custLevel}">custLevel=${custLevel}&</c:if>">${p }</a>
                                </li>
                            </c:forEach>
                            <li class="<c:if test="${custPageList.isLastPage}">disabled</c:if>">
                                <a href=<c:choose><c:when test="${custPageList.isLastPage}">"javascript:void(0)"</c:when><c:otherwise>"findCustomer?<c:if test="${not empty custName}">custName=${custName}&</c:if><c:if test="${not empty custSource}">custSource=${custSource}&</c:if><c:if test="${not empty custIndustry}">custIndustry=${custIndustry}&</c:if><c:if test="${not empty custLevel}">custLevel=${custLevel}&</c:if>pageNum=${custPageList.pageNum+1 }"</c:otherwise></c:choose>
                                aria-label="Next">
                                <span aria-hidden="true">下一页</span>
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
                <div class="page-message pull-right" style="vertical-align: middle!important; margin-left: 10px">
                    <b>第${custList.pageNum }${custPageList.pageNum }页 / 共${custList.pages }${custPageList.pages }页&nbsp;</b>
                    <input type="text" class="page-num" style="line-height: 10px;width:30px;">
                    <span>
				   			<a href="" class="btn btn-primary btn-xs page-redirect-btn">跳转</a>
				   		</span>
                </div>
            </nav>
        </div>
    </div>
    <!-- 内容主体部分结束 -->
</div>
<!-- 内容结束 -->

<!-- 创建客户模态框 -->
<div class="modal fade" id="newCustomerDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新建客户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_customer_form" action="addCustomer">
                    <div class="form-group">
                        <label for="new_customerName" class="col-sm-2 control-label">
                            客户名称
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_customerName" placeholder="客户名称" name="custName" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_customerFrom" style="float:left;padding:7px 15px 0 27px;">客户来源</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="new_customerFrom" name="custSource">
                                <option value="">--请选择--</option>
                                <c:forEach items="${fromType}" var="item">
                                    <option value="${item.dictId}">${item.dictItemName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_custIndustry" style="float:left;padding:7px 15px 0 27px;">所属行业</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="new_custIndustry"  name="custIndustry">
                                <option value="">--请选择--</option>
                                <c:forEach items="${industryType}" var="item">
                                    <option value="${item.dictId}">${item.dictItemName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_custLevel" style="float:left;padding:7px 15px 0 27px;">客户级别</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="new_custLevel" name="custLevel">
                                <option value="">--请选择--</option>
                                <c:forEach items="${levelType}" var="item">
                                    <option value="${item.dictId}">${item.dictItemName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_linkMan" class="col-sm-2 control-label">联系人</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_linkMan" placeholder="联系人" name="custLinkman" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_phone" class="col-sm-2 control-label">固定电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_phone" placeholder="固定电话" name="custPhone" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_mobile" class="col-sm-2 control-label">移动电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_mobile" placeholder="移动电话" name="custMobile" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_zipcode" class="col-sm-2 control-label">邮政编码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_zipcode" placeholder="邮政编码" name="custZipcode" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_address" class="col-sm-2 control-label">联系地址</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_address" placeholder="联系地址" name="custAddress" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="createCustomer()">创建客户</button>
            </div>
        </div>
    </div>
</div>
<!-- 修改客户模态框 -->
<div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改客户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_customer_form">
                    <input type="hidden" id="edit_cust_id" name="custId"/>
                    <div class="form-group">
                        <label for="edit_customerName" class="col-sm-2 control-label">客户名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_customerName" placeholder="客户名称" name="custName" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_customerFrom" style="float:left;padding:7px 15px 0 27px;">客户来源</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="edit_customerFrom" name="custSource">
                                <option value="">--请选择--</option>
                                <c:forEach items="${fromType}" var="item">
                                    <option value="${item.dictId}"<c:if test="${item.dictId == custSource}"> selected</c:if>>${item.dictItemName }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_custIndustry" style="float:left;padding:7px 15px 0 27px;">所属行业</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="edit_custIndustry"  name="custIndustry">
                                <option value="">--请选择--</option>
                                <c:forEach items="${industryType}" var="item">
                                    <option value="${item.dictId}"<c:if test="${item.dictId == custIndustry}"> selected</c:if>>${item.dictItemName }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_custLevel" style="float:left;padding:7px 15px 0 27px;">客户级别</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="edit_custLevel" name="custLevel">
                                <option value="">--请选择--</option>
                                <c:forEach items="${levelType}" var="item">
                                    <option value="${item.dictId}"<c:if test="${item.dictId == custLevel}"> selected</c:if>>${item.dictItemName }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_linkMan" class="col-sm-2 control-label">联系人</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_linkMan" placeholder="联系人" name="custLinkman" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_phone" class="col-sm-2 control-label">固定电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_phone" placeholder="固定电话" name="custPhone" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_mobile" class="col-sm-2 control-label">移动电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_mobile" placeholder="移动电话" name="custMobile" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_zipcode" class="col-sm-2 control-label">邮政编码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_zipcode" placeholder="邮政编码" name="custZipcode" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_address" class="col-sm-2 control-label">联系地址</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_address" placeholder="联系地址" name="custAddress" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="updateCustomer()" >保存修改</button>
            </div>
        </div>
    </div>
</div>

<!-- 删除客户模态框 -->
<div class="modal fade bs-example-modal-sm" id="deleteCustomer" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title text-muted" id="myModalLabel">删除客户</h4>
            </div>
            <div class="modal-body">
                <form id="delete">
                    <input type="hidden" id="delete_id" name="custId">
                </form>
                <div><h5 class="del-msg text-primary"></h5></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default resetSelectByDate" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-success selectByDate" data-dismiss="modal" onclick="deleteCustomer()">确定</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $(".page-num").blur(function(){
            var page = $(".page-num").val();
            if(page==""||page==null){return;}
            var newurl="customer?pageNum="+page;
            if(${custPageList.pages}+1!=1){
                newurl = "findCustomer?custName=${custName}&custSource=${custSource}&custIndustry=${custIndustry}&custLevel=${custLevel}&pageNum="+page;
            }
            $(".page-redirect-btn").attr("href",newurl);
        });
    });
    function createCustomer() {
        $.post("addCustomer",
            $("#new_customer_form").serialize(),function(data){
                console.log(data)
                if(data =="OK"){
                    setTimeout(function(){
                        toastr.options.positionClass = "toast-top-right";
                        toastr.info('客户创建成功!');
                    },500);
                    setTimeout(function(){
                        window.location.href="customer?pageNum=${custList.pages}";
                    }, 2500);
                }else{
                    setTimeout(function(){
                        toastr.options.positionClass = "toast-top-right";
                        toastr.error('客户创建失败!');
                    },500);
                }
            });
    }
    function editCustomer(id) {
        $.ajax({
            type:"get",
            url:"getCustomerById",
            data:{"id":id},
            success:function(data) {
                console.log(data)
                $("#edit_cust_id").val(data.custId);
                $("#edit_customerName").val(data.custName);
                $("#edit_customerFrom").val(data.custSource)
                $("#edit_custIndustry").val(data.custIndustry)
                $("#edit_custLevel").val(data.custLevel)
                $("#edit_linkMan").val(data.custLinkman);
                $("#edit_phone").val(data.custPhone);
                $("#edit_mobile").val(data.custMobile);
                $("#edit_zipcode").val(data.custZipcode);
                $("#edit_address").val(data.custAddress);
                $("#delete_id").val(data.custId);
                $(".del-msg").html("是否删除当前客户：<b class='text-primary'>"+data.custName+"</b>");
            }

        })
    }
    function updateCustomer() {
        $.post("updateCustomer",$("#edit_customer_form").serialize(),function(data){
            if(data =="OK"){
                setTimeout(function() {
                    toastr.options.positionClass = "toast-top-right";
                    toastr.success('客户信息修改成功!');
                },500);;
                setTimeout(function(){
                    window.location.reload();
                }, 2500);
            }else{
                setTimeout(function(){
                    toastr.options.positionClass = "toast-top-right";
                    toastr.error('客户信息更新失败！');
                },500);
            }
        });
    }
    function deleteCustomer() {
        $.post("deleteCustomer",$("#delete").serialize(),function(data){
            if(data =="OK"){
                setTimeout(function() {
                    toastr.options.positionClass = "toast-top-right";
                    toastr.success('客户删除成功!');
                },500);;
                setTimeout(function(){
                    window.location.reload();
                }, 2500);
            }else{
                setTimeout(function(){
                    toastr.options.positionClass = "toast-top-right";
                    toastr.error('客户删除失败！');
                },500);
            }
        });
    }
</script>
</body>

</html>