<%@page import="cn.edu.zhku.service.CartService"%>
<%@page import="cn.edu.zhku.model.Cart"%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��ֵҳ��</title>
    
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<!--jQuery(necessary for Bootstrap's JavaScript plugins)-->
	<script src="js/jquery-1.11.0.min.js"></script>
	<!--Custom-Theme-files-->
	<!--theme-style-->
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--start-menu-->
<script src="js/simpleCart.min.js"> </script>
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>$(document).ready(function(){$(".memenu").memenu();});</script>	
<!--dropdown-->
<script src="js/jquery.easydropdown.js"></script>
<script type="text/javascript">

function handle(){
		document.f1.ctrl.value = "dianwo";
}
</script>			
</head>
<body> 
<!--top-header-->
	<div class="top-header">
		<div class="container">
			<div class="top-header-main">
				<div class="col-md-6 top-header-left">
					<div class="drop">
					 
  <%
  	 String userIdentity = (String)session.getAttribute("userIdentity");
  	 String userName = (String)session.getAttribute("userName");
  	 String userId = "" +session.getAttribute("userId");
  	 if(userIdentity == null && userName == null){
  	 	userIdentity = (String) request.getAttribute("userIdentity");
  	 	userName = (String)request.getAttribute("userName");
  	 }
  	 
 	 if(userIdentity != null && userName != null){
	   if(userIdentity.equals(new String("customer"))){
	   %>
			 	 		<div class = 'whi'>
			 	 			<div class = ''>
			 	 				��ӭ����<%=userIdentity%>&nbsp;&nbsp;<%=userName%>
			 	 			</div>
			 	 		<div class = 'whi'>
			 	 			<a href='logout.jsp' target='_self'>
			 	 				�˳�
			 	 			</a>
			 	 		</div>
			 	 		</div>
			 	 		<div class="clearfix"></div>
					</div>
				</div>
				<div class="col-md-6 top-header-left">
					<div class="cart box_1">
						 <img alt="" src="./images/logo.png" height="50px">
						
						<div class="clearfix"> </div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--top-header-->
		<div class="header-bottom">
		<div class="container">
			<div class="header">
				<div class="col-md-9 header-left">
				<div class="top-nav">
					<ul class="memenu skyblue"><li class="active"><a href="PersonalHomePageCustomer.jsp">������ҳ</a></li>
					</ul>
					</div>
					</div>
					</div>
					</div>
					</div>
  <%
  }
  }
  %>
	<%--     ����id:<%=request.getParameter("orderId") %>
	    ����״̬:<%=request.getParameter("orderStatus") %>
	    �ܼ�:<%=request.getParameter("totalMoney") %> --%>
    <%
    CartService cartService = new CartService();
    String status = cartService.readOrderStatus(Integer.parseInt(request.getParameter("orderId")));
    if(status != null){
    	
    	if(status.equals(new String("�ȴ���Ҹ���"))){
     %>
     <form action="./servlet/PayCtrl" method="post">
     <table>
     
     	<tr class="hide"><td>�û�id</td><td><input type="text" name="userId" value="<%=session.getAttribute("userId")%>"/></td></tr>
     	<tr class="hide"><td>���</td><td><input type="text" name="userIdentity" value="<%=session.getAttribute("userIdentity")%>"/></td></tr>
     	<tr class="hide"><td>����id</td><td><input type="text" name="orderId" value="<%=request.getParameter("orderId")%>"/></td></tr>
     	<tr class="hide"><td>�ܼ�</td><td><input type="text" name="totalMoney" value="<%=request.getParameter("totalMoney")%>"/></td></tr>
     	<%
     	if(request.getParameter("delCart") != null){
	      %>
	     	
	     	<tr class="hide"><td>��ֵ�ɹ����ȡ�Ĳ���(�Ƿ�ɾ����ǰ���ﳵ�ļ�¼)</td><td><input type="text" name="delCart" value="<%=request.getParameter("delCart")%>"/></td></tr>
     	<%
     	}
     	else{
     	%>
     	<tr class="hide"><td>�Ƿ�ɾ����ǰ���ﳵ�ļ�¼</td><td><input type="text" name="delCart" value="true"/></td></tr>
     	
     	<%}
     	 %>
     	<tr><td>֧������:</td><td><input type="password" name="payPsw" value="" size="40"/></td></tr>
     	<tr><td><input type="submit" name="" value="ȷ��"/></td><td><input type="button" name="" value="����" onclick=""/></td></tr>
     	<tr></tr>
     </table>
     </form>
     
     <%
     }
     	else if(status.equals(new String("�����ѷ���"))){
     		%>
     	<form action="./servlet/CustomerHandleOrderCtrl" method="post">
     		<table>
		  			
		  			<tr>
		  				<td colspan="2" align="center">ȷ���ջ���</td>
		  			</tr>
		  			<tr class="hide">
		  				<td>����-������</td>
		  				<td><input type="text" value="1" name="requestCode"/></td>
		  			</tr>
		  			<tr class="hide">
		  				<td>������</td>
		  				<td><input type="text" value=<%=request.getParameter("orderId") %> name="orderId"/></td>
		  			</tr>
		  			<tr>
		  				<td><input type="submit" value="ȷ��"/></td><td><input type="button" value="ȡ��" onclick="javascript:history.back(-1);"/></td>
		  			</tr>
		  	</table>
     	</form>
     		<%
     	}
     	else if(status.equals(new String("���׳ɹ����رս���"))){
     		%>
     	<form action="./servlet/CustomerHandleOrderCtrl" method="post">
     		<table>
		  			
		  			<tr>
		  				<td colspan="2" align="center">�����˻���</td>
		  			</tr>
		  			<tr class="hide">
		  				<td>����-������</td>
		  				<td><input type="text" value="2" name="requestCode"/></td>
		  			</tr>
		  			<tr class="hide">
		  				<td>������</td>
		  				<td><input type="text" value=<%=request.getParameter("orderId") %> name="orderId"/></td>
		  			</tr>
		  			<tr>
		  				<td>��ѡ��</td>
		  				<td>
		  					<select name="caozuo" class="">
								<option value="tuihuo">�˻�</option>
								<option value="huanhuo">����</option>
							</select>
		  				</td>
		  			</tr>
		  			<tr>
		  				<td><input type="submit" value="ȷ��"/></td><td><input type="button" value="ȡ��" onclick="javascript:history.back(-1);"/></td>
		  			</tr>
		  		</table>
    	 </form>
     		<%
     	}
     	
     }
      %>
      
      
      <% 
  	 /* ��CustomerHandleOrder���յ��Ĳ��� */
  	 	if(request.getAttribute("requestCode") != null){
	  		int reqcode = (Integer)request.getAttribute("requestCode");
  	 		if(reqcode == 11){
	  		%>
	  			<div class="tab1">��ӭ�´λݹˣ�</div>
	  	
  	 		<% 
  	 		}
  	 		else if(reqcode == 21){
	  		%>
	  			<div class="tab1">�����˻��ɹ�����ȴ����һظ���</div>
  	 		<%
  	 		
  	 		}
  	 		else if(reqcode == 22){
	  		%>
	  			<div class="tab1">���뻻���ɹ�����ȴ����һظ���</div>
  	 		<%
  	 		
  	 		}
  	    }
	  	%>
  </body>
</html>
