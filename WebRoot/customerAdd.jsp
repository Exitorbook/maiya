<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ע��</title>
    
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--jQuery(necessary for Bootstrap's JavaScript plugins)-->
<script src="js/jquery-1.11.0.min.js"></script>
<!--Custom Theme files-->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Luxury Watches Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>	
<!--start-menu-->
<script src="js/simpleCart.min.js"> </script>
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>$(document).ready(function(){$(".memenu").memenu();});</script>	
<!--dropdown-->
<script src="js/jquery.easydropdown.js"></script>			
</head>
<body> 
<!--top-header-->
	<div class="top-header">
		<div class="container">
			<div class="top-header-main">
				<div class="col-md-6 top-header-left">
					<div class="drop">
						
						
						<div class="clearfix"></div>
					</div>
				</div>
				
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--top-header-->
	<!--start-logo-->
	<div class="logo">
		<a href="index.jsp"><img alt="" src="images/logo.png" class="" height="50px">
		</a>
	</div>
	<!--start-logo-->
	<!--bottom-header-->
	<div class="header-bottom">
		<div class="container">
			<div class="header">
				<div class="col-md-9 header-left">
				<div class="top-nav">
					
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="col-md-3 header-right"> 
				
			</div>
			<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--bottom-header-->
	<!--banner-starts-->
	<div class="breadcrumbs">
		<div class="container">
			<div class="breadcrumbs-main">
				<ol class="breadcrumb">
					<li><a href="index.jsp" target="_self">��ҳ</a></li>
					<li class="active">ע��</li>
				</ol>
			</div>
		</div>
	</div>
	<!--end-breadcrumbs-->
    <script type="text/javascript" src="check_Customers_Message.js"></script>
<form name="AddCustomers" method="post" action="servlet/addCustomer" onsubmit="return check(AddCustomers);">
<table border="0" align="center" width="60%">
<caption><p align="center"><font size="5" color="black" >��Աע��</font></p></caption>
<tr>
<td >������</td>
<td ><input type="text" name="customerName" size="19" ><label id="C1" ></label>
</td>
</tr>

<tr>
<td >���룺</td>
<td ><input type="password" name="customerPsw" size="19"><label id="C2" ></label>
</td>
</tr>

<tr>
<td >ȷ�����룺</td>
<td ><input type="password" name="checkPsw" size="19"><label id="C3" color="red"></label>
</td>
</tr>

<tr>
<td width="116" height="45">�绰��</td>
<td width="50" height="45"><input type="text" name="phone" size="19">
<label id="C4" color="red"></label>
</td>
</tr>

<tr height="40px">
					<td colspan="2" align="center">
						<input type="submit" name="submit" value="ȷ��" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" name="reset" value="����" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</table>
</form>
</div>
				
				<div class="clearfix"></div>
				<div class="tabBetweenDiv2"></div>
	<!--register-end-->
	<!--information-starts-->
	<div class="information">
		<div class="container">
			<div class="infor-top">
				<div class="col-md-3 infor-left">
					<h3>����</h3>
					<ul>
						<li><a href=""><span class=""></span><h6>email</h6></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>��Ϣ</h3>
					<ul>
						<li><a href=""><p>��������</p></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>��������</h3>
					<ul>
						<li><a href=""><p>����</p></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>��վ��Ϣ</h3>
					<h4>��˾,
						<span>��ѽ,</span>
						������.</h4>
					<h5>+86 12345678911</h5>	
					<p><a href="mailto:contactus@maiya.com">contactus@maiya.com</a></p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--information-end-->
	<!--footer-starts-->
	<div class="footer">
		<div class="container">
			<div class="footer-top">
				<div class="col-md-6 footer-left">
					<form>
						<input type="text" name="email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '������email';}">
						<input type="submit" value="����">
					</form>
				</div>
				<div class="col-md-6 footer-right">					
					<p>Copyright &copy; 2016.maiya All rights reserved.<a target="_blank" href=""></a></p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--footer-end-->	
  </body>
</html>
