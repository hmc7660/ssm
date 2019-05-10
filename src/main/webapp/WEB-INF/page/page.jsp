<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客户列表</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- 引入jquery -->
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-3.3.1.js"></script>
<!-- 引入样式 -->
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

	<!-- ================添加客户模态框================ -->
	<div class="modal fade" id="custAddModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h2 class="modal-title" id="myModalLabel">添加客户</h2>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="name" class="form-control"
                                   id="name_add_input" placeholder="客户姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" name="telephone" class="form-control"
                                   id="telephone_add_input" placeholder="电话">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">地址</label>
                        <div class="col-sm-10">
                            <input type="text" name="address" class="form-control"
                                   id="address_add_input" placeholder="地址">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <input type="text" name="remark" class="form-control"
                                   id="remark_add_input" placeholder="备注">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="cust_save_btn">保存</button>
            </div>
        	</div>
    	</div>
	</div>

	
	<!-- ================更新客户信息模态框============ -->
	<div class="modal fade" id="custUpdateModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h2 class="modal-title" id="myModalLabel">更新客户信息</h2>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="name" class="form-control"
                                   id="name_update_input" placeholder="客户姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" name="telephone" class="form-control"
                                   id="telephone_update_input" placeholder="电话">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">地址</label>
                        <div class="col-sm-10">
                            <input type="text" name="address" class="form-control"
                                   id="address_update_input" placeholder="地址">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <input type="text" name="remark" class="form-control"
                                   id="remark_update_input" placeholder="备注">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="cust_update_btn">更新</button>
            </div>
        	</div>
    	</div>
	</div>
				
	
	<!-- =================确认删除模态框================= -->
	<div class="modal fade" id="custDeleteModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h2 class="modal-title">提示</h2>
            </div>
            <div class="modal-body">
                <p id="pid"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="confirm_btn">确定</button>
            </div>
        </div>
    </div>
	</div>

	
	<!-- ===================导航栏=================== -->	
	<nav class="navbar navbar-inverse">
	    <div class="container-fluid">
	        <div class="navbar-header">
	            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	                <span class="sr-only">Toggle navigation</span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	            </button>
	            <a class="navbar-brand" href="#"><b>SSM整合快速入门</b></a>
	        </div>
	        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	            <ul class="nav navbar-nav">
	                <li class="active"><a href="#" onclick="customerInfo()">客户信息<span class="sr-only">(current)</span></a></li>
	                <li><a href="#" onclick="add()">添加客户</a></li>
	            </ul>
	            <ul class="nav navbar-nav navbar-right">
	                <li><a href="${APP_PATH }/index">退出</a></li>
	            </ul>
	            <form class="navbar-form navbar-right">
	                <div class="form-group">
	                    <input type="text" name="name" id="quickQuery-input" class="form-control" placeholder="输入模糊客户名进行查询">
	                </div>
	                <button type="button" class="btn btn-default" id="quickQuery-btn"><span class="glyphicon glyphicon-search">快速查询</span></button>
	            </form>
	        </div>
	    </div>
	</nav>
	
	
	<!-- ================删除成功提示================ -->
	<div class="modal fade" id="DeleteSuccessModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-content">
                <h3 class="modal-title text-center">删除成功!</h3>
            </div>
        </div>
    </div>
	</div>
	
	
	<!-- ================添加成功提示================ -->
	<div class="modal fade" id="AddSuccessModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-content">
                <h3 class="modal-title text-center">添加成功!</h3>
            </div>
        </div>
    </div>
	</div>

	
	<!-- ================更新成功提示================ -->
	<div class="modal fade" id="UpdateSuccessModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-content">
                <h3 class="modal-title text-center">更新成功!</h3>
            </div>
        </div>
    </div>
	</div>
	
	
	<div class="container-fluid">
		
		<!-- 列表标题 -->
		<div class="row">
			<div class="col-md-12">
				<h2 class="text-left"><b>客户信息列表</b></h2>
			</div>
		</div>
		<br/>
				
		
		<!-- 显示客户列表数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="customer_table">
					<thead>
						<tr>
							<th>ID</th>
							<th>客户名</th>
							<th>电话</th>
							<th>地址</th>
							<th>备注</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
							
					</tbody>
				</table>
			</div>
		</div>
		
		<!-- 分页文字、分页条信息 -->
		<div class="row">
			<!-- 分页文字信息区域 -->
			<div class="col-md-6 text-left" id="page_info_area"><p><b></b></p></div>
			<!-- 分页条信息区域 -->
			<div class="col-md-6 text-center" id="page_nav_area"></div>
		</div>
		
		
		<!-- ==================界面中各按钮的功能实现================== -->		
		<div>
			<script type="text/javascript">
			
				var totalRecord,currentPage,flag,Quick_input;
								
		/********************加载客户列表信息********************/
				//入口函数
				$(function() {
					//加载客户列表信息并显示第一页
					to_page(1);
				});
				
				function to_page(pn){
					$.ajax({
						url : "${APP_PATH}/cust",
						data : "pn=" + pn,
						type : "GET",
						success : function(result) {
							//解析并显示客户数据
							cust_table(result);
							flag = true;
							//解析并显示分页信息
							build_page_info(result);
							//解析并显示分页条
							build_page_nav(result);
						}
					});
				}
								
				//解析并显示客户数据
				function cust_table(result){
					//
					$("#customer_table tbody").empty();
					var cust = result.extend.Info.list;
					$.each(cust,function(index, item){
						var custId = $("<td></td>").append(item.id);
						var custName = $("<td></td>").append(item.name);
						var custTelephone = $("<td></td>").append(item.telephone);
						var custAddress = $("<td></td>").append(item.address);
						var custRemark = $("<td></td>").append(item.remark);
						
						var editBtn = $("<button></button>").addClass(
								"btn btn-default btn-sm edit_btn").append(
								$("<span></span>").addClass(
										"glyphicon glyphicon-pencil")).attr("editBtn-id", item.id);
						
						var delBtn = $("<button></button>").addClass(
						"btn btn-default btn-sm delete_btn").append(
						$("<span></span>").addClass(
								"glyphicon glyphicon-trash")).attr("delBtn-id", item.id);
						
						var custBtn = $("<td></td>").append(editBtn)
						.append(" ").append(delBtn);
						
						//将所有数据添加到tbody中
						$("<tr></tr>").append(custId).append(custName).append(custTelephone)
						.append(custAddress).append(custRemark).append(
								custBtn).appendTo(
								"#customer_table tbody");
					});
				}
				
				//解析并显示分页信息
				function build_page_info(result) {
					$("#page_info_area p b").empty();
					$("#page_info_area p b").append(
							"当前" + result.extend.Info.pageNum + " 页,总"
									+ result.extend.Info.pages + "页,总"
									+ result.extend.Info.total + "条记录");
					totalRecord = result.extend.Info.total;
					currentPage = result.extend.Info.pageNum;
				}
				
				//解析并显示分页条
				function build_page_nav(result) {
					$("#page_nav_area").empty();
					var ul = $("<ul><ul>").addClass("pagination");
					var firstPage = $("<li></li>").append($("<a></a>")
							.append("首页").attr("href", "#"));
					var prePage = $("<li></li>").append($("<a></a>")
							.append("&laquo;"));
					if (result.extend.Info.hasPreviousPage == false) {
						firstPage.addClass("disabled");
						prePage.addClass("disabled");
					} else {
						
						firstPage.click(function() {
							to_page(1);
						});
						prePage.click(function() {
							to_page(result.extend.Info.pageNum - 1);
						});
					}
					ul.append(firstPage).append(prePage);
					
					$.each(result.extend.Info.navigatepageNums, function(
							index, item) {

						var num = $("<li></li>").append(
								$("<a></a>").append(item));
						if (result.extend.Info.pageNum == item) {
							num.addClass("active");
						}
						
						num.click(function() {
							to_page(item);
						});
						ul.append(num);
					});
					
					var nextPage = $("<li></li>").append(
							$("<a></a>").append("&raquo;"));
					var lastPage = $("<li></li>").append(
							$("<a></a>").append("末页").attr("href", "#"));
					if (result.extend.Info.hasNextPage == false) {
						nextPage.addClass("disabled");
						lastPage.addClass("disabled");
					} else {
						
						nextPage.click(function() {
							to_page(result.extend.Info.pageNum + 1);
						});
						lastPage.click(function() {
							to_page(result.extend.Info.pages);
						});
					}
					ul.append(nextPage).append(lastPage);
					var nav = $("<nav></nav>").append(ul);
					nav.appendTo("#page_nav_area");
				}
				
		
				
		/********************导航栏 客户信息 功能实现********************/
				function customerInfo() {
					$("#quickQuery-input").val("");
					to_page(1);
				}
				
		
		
		/********************导航栏 添加客户 功能实现********************/		
				function add() {
					//清空模态框中的表单数据
					$("#custAddModal form")[0].reset();
					$("#quickQuery-input").val("");
					to_page(1);
    				$("#custAddModal").modal({
       	 			backdrop : "static"
    			});
				}
				
				//添加客户信息模态框 保存 按钮功能实现
				$("#cust_save_btn").click(function(){
					$.ajax({
						url:"${APP_PATH}/add",
						type:"POST",
						data:$("#custAddModal form").serialize(),
						success:function(result){
							$("#custAddModal").modal('hide');							
							to_page(totalRecord);
							
							setTimeout(function(){ $("#AddSuccessModal").modal({
			       	 			backdrop : "static"
			    			}); }, 1000);
							setTimeout(function(){ $("#AddSuccessModal").modal(
								"hide"); }, 2500);
						}
					});
				});
				
				
				
		/********************列表中 编辑按钮 功能实现********************/		
				$(document).on("click",".edit_btn",function(){					
					//查询出客户信息并赋值到 更新客户信息模态框
					getCustomer($(this).attr("editBtn-id"));					
					//把客户的id传递给更新客户信息模态框的更新按钮，方便后面执行 更新 操作
					$("#cust_update_btn").attr("edit-id",$(this).attr("editBtn-id"));					
					$("#custUpdateModal").modal({
						backdrop : "static"
					});					
				});
				
				function getCustomer(id){
					$.ajax({
						url:"${APP_PATH}/customer/"+id,
						type:"GET",
						success:function(result){
							console.log(result);
							var customerDate = result.extend.custInfo;
							$("#name_update_input").val(customerDate.name);
							$("#telephone_update_input").val(customerDate.telephone);
							$("#address_update_input").val(customerDate.address);
							$("#remark_update_input").val(customerDate.remark);
						}
					});
				}
								
		/******更新客户信息模态框  更新  按钮功能实现,更新客户信息******/
				$("#cust_update_btn").click(function(){
					$.ajax({
						url:"${APP_PATH}/customer/"+$(this).attr("edit-id"),
						type:"POST",
						data:$("#custUpdateModal form").serialize()+"&_method=PUT",
						success:function(result){
							$("#custUpdateModal").modal("hide");
							
							if(Quick_input == null&&flag == true){
								to_page(currentPage);
							}else if(Quick_input !== null&&flag == true){
								$("#quickQuery-input").val("");
								to_page(currentPage);
							}else if(Quick_input !== null&&flag == false){
								$("#quickQuery-input").val(Quick_input);
								quickQuery(currentPage);
							}
							
							setTimeout(function(){ $("#UpdateSuccessModal").modal({
			       	 			backdrop : "static"
			    			}); }, 1000);
							setTimeout(function(){ $("#UpdateSuccessModal").modal(
								"hide"); }, 2500);
						}
					});												
				});
				
				
		/********************列表中 删除按钮 功能实现********************/
				$(document).on("click",".delete_btn",function(){
					
					var name = $(this).parents("tr").find("td:eq(1)").text();
					
					$("#pid").text("确定要删除客户    [  " + name + "  ]    吗？");
					
					//将要删除的客户id赋给删除模态框的确认按钮
					$("#confirm_btn").attr("delBtn-id",$(this).attr("delBtn-id"));
					
					$("#custDeleteModal").modal({
						backdrop : "static"
					});
					
				});
		
		
		
		/******************删除模态框 确认按钮 功能实现******************/
				$("#confirm_btn").click(function(){
					var id = $(this).attr("delBtn-id");
					$.ajax({
						url:"${APP_PATH}/customer/"+id,
						type:"DELETE",
						success:function(result){
							$("#custDeleteModal").modal("hide");							
							
							//回到更新了客户信息的页面							
							if(Quick_input == null&&flag == true){
								to_page(currentPage);
							}else if(Quick_input !== null&&flag == true){
								$("#quickQuery-input").val("");
								to_page(currentPage);
							}else if(Quick_input !== null&&flag == false){
								$("#quickQuery-input").val(Quick_input);
								quickQuery(currentPage);
							}
							
							setTimeout(function(){ $("#DeleteSuccessModal").modal({
			       	 			backdrop : "static"
			    			}); }, 1000);
							setTimeout(function(){ $("#DeleteSuccessModal").modal(
								"hide"); }, 2500);							
						}
					});
				});
				
				

		/********************导航栏 快速查询按钮 功能实现********************/
				$("#quickQuery-btn").click(function(){
					Quick_input = $("#quickQuery-input").val();
					quickQuery(1);
				});			
				//实现根据客户名的快速查询
				function quickQuery(pn){
					$.ajax({
						url:"${APP_PATH}/quickQuery",
						type:"GET",
						data:"pn="+pn+"&"+$("#bs-example-navbar-collapse-1 form").serialize(),
						dataType: 'json',
						success:function(result){
							//解析并显示快速查询客户数据
							cust_table(result);
							flag = false;
							//解析并显示快速查询分页信息
							build_page_info(result);
							//解析并显示快速查询分页条
							quickQuery_page_nav(result);	
						}
					});
				}
				
				//解析并显示快速查询分页条
				function quickQuery_page_nav(result){
					$("#page_nav_area").empty();
					var ul = $("<ul><ul>").addClass("pagination");
					var firstPage = $("<li></li>").append($("<a></a>")
							.append("首页").attr("href", "#"));
					var prePage = $("<li></li>").append($("<a></a>")
							.append("&laquo;"));
					if (result.extend.Info.hasPreviousPage == false) {
						firstPage.addClass("disabled");
						prePage.addClass("disabled");
					} else {
						
						firstPage.click(function() {
							quickQuery(1);
						});
						prePage.click(function() {
							quickQuery(result.extend.Info.pageNum - 1);
						});
					}
					ul.append(firstPage).append(prePage);
					
					$.each(result.extend.Info.navigatepageNums, function(
							index, item) {

						var num = $("<li></li>").append(
								$("<a></a>").append(item));
						if (result.extend.Info.pageNum == item) {
							num.addClass("active");
						}
						
						num.click(function() {
							quickQuery(item);
						});
						ul.append(num);
					});
					
					var nextPage = $("<li></li>").append(
							$("<a></a>").append("&raquo;"));
					var lastPage = $("<li></li>").append(
							$("<a></a>").append("末页").attr("href", "#"));
					if (result.extend.Info.hasNextPage == false) {
						nextPage.addClass("disabled");
						lastPage.addClass("disabled");
					} else {
						
						nextPage.click(function() {
							quickQuery(result.extend.Info.pageNum + 1);
						});
						lastPage.click(function() {
							quickQuery(result.extend.Info.pages);
						});
					}
					ul.append(nextPage).append(lastPage);
					var nav = $("<nav></nav>").append(ul);
					nav.appendTo("#page_nav_area");
				}
																			
			</script>
		</div>
		
	</div>
</body>
</html>