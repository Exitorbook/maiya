<%@page import="cn.edu.zhku.model.Order"%>
<%@ page language="java" import="java.util.*,cn.edu.zhku.service.CartService,cn.edu.zhku.model.Cart" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�����ҳ</title>
    
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
	<%
	}
	}
	 %>
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
	<!--top-header-->
     
     <table border="2">
    	<tr>
    		<td>����id</td>
    		<td>��Աid</td>
    		<td>��Ա��</td>
    		<td>��Ա�ջ���ַ</td>
    		<td>��Ա�ֻ�����</td>
    		<td>���ﳵid</td>
    		<td>����״̬</td>
    		<td>��ݷ�ʽ</td>
    		<td>��ݷ���</td>
    		<td>֧����ʽ</td>
    		<td>���Ա</td>
    		<td>���Ա��ϵ�绰</td>
    		<td>��Ʊ���ͼ���Ϣ</td>
    		<td>�ܼ�</td>
    		<td>����</td>
    		<td>����</td>
    		<td>����</td>
    	</tr>
    <%
    
    CartService cartService = new CartService();
    
    List<Order> orders = cartService.queryOrder((Integer)session.getAttribute("userId"), 0);
    
    if(orders == null){
    %>
    
    	�����տ���Ҳ��<a href="index.jsp">ȥ�����Ʒ</a>
    <%
    }
    else if(orders != null){
    
    
    	for(Order order:orders){
    
     %>
    	<tr>
    		<td><%=order.getId() %></td>
    		<td><%=order.getCustomerID() %></td>
    		<td><%=order.getCustomerName() %></td>
    		<td><%=order.getCustomerAddress() %></td>
    		<td><%=order.getCustomerPhone() %></td>
    		<td><%=order.getIdOfCart() %>&nbsp;&nbsp;&nbsp;<a href="customertBoughtGoodsInfo.jsp?cartId=<%=request.getParameter("cartId") %>">�鿴����</a></td>
    		<td><%=order.getStatus() %></td>
    		<td><%=order.getExpressMode() %></td>
    		<td><%=order.getExpressCharge() %></td>
    		<td><%=order.getPayMode() %></td>
    		<td><%=order.getExpressWorker() %></td>
    		<td><%=order.getExpressWorkerPhone() %></td>
    		<td><%=order.getInvoiceStypeAndInfo() %></td>
    		<td><%=order.getTotalMoney() %></td>
    		<% if(order.getStatus().equals(new String("���׳ɹ����رս���") )
    			|| order.getStatus().equals(new String("���������˻�Э���Ѵ��"))
    				|| order.getStatus().equals(new String("�������뻻��Э���Ѵ��"))){%>
    					<td><a href="DelOrderNew.jsp?orderId=<%=order.getId()%>">ɾ������</a></td>
    		
    		<%
    		}
    		if(order.getStatus().equals(new String("����Ѹ���ȴ�ƽ̨ȷ��") )
    			|| order.getStatus().equals(new String("�ȴ���Ҹ���") )){
    			%>
    					<td><a href="DelOrderNew.jsp?orderId=<%=order.getId()%>">ȡ������</a></td>
    		
    		<%
    		}
    		if(order.getStatus().equals(new String("�ȴ���Ҹ���"))){
    		 %>
    			<td><a href="EditTheOrderStatusByCustomer.jsp?orderId=<%=order.getId()%>&orderStatus=<%=order.getStatus()%>&totalMoney=<%=order.getTotalMoney() %>">����</a></td>
    		
    		<%
    		}
    		else if(order.getStatus().equals(new String("�����ѷ���"))){
    		 %>
    			<td><a href="EditTheOrderStatusByCustomer.jsp?orderId=<%=order.getId()%>&orderStatus=<%=order.getStatus()%>&totalMoney=<%=order.getTotalMoney() %>">ȷ���ջ�</a></td>
    		
    		<%
    		}
    		else if(order.getStatus().equals(new String("������ջ�"))){
    		 %>
    			<td><a>������ջ�</a></td>
    		
    		<%
    		}
    		else if(order.getStatus().equals(new String("���׳ɹ����رս���"))){
    		 %>
    			<td><a href="EditTheOrderStatusByCustomer.jsp?orderId=<%=order.getId()%>&orderStatus=<%=order.getStatus()%>&totalMoney=<%=order.getTotalMoney() %>">�����ˡ�����</a></td>
    		
    		<%
    		}
    		else if(order.getStatus().equals(new String("��������˻�"))){
     		%>
    			<td><a>���ύ�˻����룬�����ĵȴ���</a></td>
     		<% 
     		}
    		else if(order.getStatus().equals(new String("������뻻��"))){
     		%>
    			<td><a>���ύ�������룬�����ĵȴ���</a></td>
     		<% 
     		}
    		else if(order.getStatus().equals(new String("���������˻�Э���Ѵ��"))){
     		%>
    			<td><a >���������˻�Э���Ѵ�ɣ������ĵȴ���</a></td>
     		<% 
     		}
    		else if(order.getStatus().equals(new String("�������뻻��Э���Ѵ��"))){
     		%>
    			<td><a >�������뻻��Э���Ѵ�ɣ������ĵȴ���</a></td>
     		<% 
     		}
     		
     		%>
    	</tr>
    
    <%
    
    } 
    
   }
    %>
    </table>
     
  </body>
</html>
