<%@page import="java.util.jar.Attributes.Name"%>
<%@ page language="java" import="java.util.*,cn.edu.zhku.service.*,cn.edu.zhku.model.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<title>���ﳵ</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--jQuery(necessary for Bootstrap's JavaScript plugins)-->
<script src="js/jquery-1.11.0.min.js"></script>
<!--Custom-Theme-files-->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content=""> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
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
	
	<!-- ��־�Ƿ�����������ˢ�¹��ﳵ����������ɾ�����ﳵ��ˢ�²�������Ҫ�ط���ҳ�棩 -->
	
	
						
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
			 	 		<div class = ''>
			 	 			<div class = ''>
			 	 				��ӭ����<%=userIdentity%>&nbsp;&nbsp;<%=userName%>
			 	 			</div>
			 	 		<div class = ''>
			 	 			<a href='logout.jsp' target='_self'>
			 	 				�˳�
			 	 			</a>
			 	 		</div>
	<%
	}
	   
	  else if(userIdentity.equals(new String("operator"))){
	 %>
			 	 		<div class = 'welcome'>
			 	 			��ӭ����" + userIdentity + "&nbsp;&nbsp;&nbsp;" + userName + "&nbsp;&nbsp;&nbsp;
			 	 			ע�⣺�������ڴ�������<a href='PersonalHomePageOperator.jsp' target='_self'>
			 	 				ǧ��������ҳ
			 	 			</a>
			 	 			&nbsp;&nbsp;&nbsp;
			 	 			<a href='logout.jsp' target='_self'>
			 	 				�˳�
			 	 			</a>
			 	 		</div>
	  <% 
	  }
  	}
  	%>
  	</div>
  	
						
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="col-md-6 top-header-left">
					<div class="cart box_1">
						<a href="checkout.jsp">
							 <div class="total">
								<span>��0.00</span></div>
								<img src="images/cart-1.png" alt="" />
							
						</a>
						<p><a href="javascript:;" class="simpleCart_empty">���ﳵ</a></p>
						<div class="clearfix"> </div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--top-header-->
	<!--start-logo-->
	
	<!-- ��logo -->
	<div class="logo">
		<a href="index.jsp"><img alt="" src="images/logo.png" class="">
	</div>
	<!--start-logo-->
	<!--bottom-header-->
	<div class="header-bottom">
		<div class="container">
			<div class="header">
				<div class="col-md-9 header-left">
				<div class="top-nav">
					<ul class="memenu skyblue"><li class="active"><a href="index.jsp">��ҳ</a></li>
						<li class="grid"><a href="">���</a>
						</li>
						<li class="grid"><a href="">����</a>
						</li>
						<li class="grid"><a href="">��ʾ��</a>
						</li>
						<li class="grid"><a href="">��Ϸ�ֱ�</a>
						</li>
						<li class="grid"><a href="">�ڴ�</a>
						</li>
						<li class="grid"><a href="">����</a>
						</li>
						<li class="grid"><a href="">Ӳ��</a>
						</li>
						<li class="grid"><a href="">�Կ�</a>
						</li>
						<li class="grid"><a href="">����</a>
						</li>
						<li class="grid"><a href="">CPU</a>
						</li>
						<li class="grid"><a href="">����</a>
						</li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="col-md-3 header-right"> 
				<div class="search-bar">
				
				<!-- �����ӣ� -->
					<input type="text" value="����" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
					<input type="submit" value="">
				</div>
			</div>
			<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--bottom-header-->
	<!--start-breadcrumbs-->
	<div class="breadcrumbs">
		<div class="container">
			<div class="breadcrumbs-main">
				<ol class="breadcrumb">
					<li><a href="index.jsp">��ҳ</a></li>
					<li class="active">���ﳵ</li>
				</ol>
			</div>
		</div>
	</div>
	<!--end-breadcrumbs-->
	<!--start-ckeckout-->
	
	<%
		String productId = request.getParameter("productId");
		String productName = request.getParameter("productName");
		String productPrice = request.getParameter("productPrice");
		String productNum = request.getParameter("productNum");
		String productPicPath = request.getParameter("productPicPath");
						
	%>
	
	<% if(userIdentity == null && userName ==null){
		
	%>
	<div class="ckeckout container ckeck-top heading">
		<a href ="login.jsp?productId=<%=productId %>&ago=cart&identity=customer" >
			<h2>���ȵ�¼��</h2>
		</a>
	</div>
	
	
	
	
	<%
	}
	
	else if(userIdentity != null && userName !=null){
	 %>
	
	<%
			/*��singleҳ�棨��Ʒ����ҳ�棩��ӽ����ﳵ������������ҳ��  */
		if(request.getParameter("request") != null){
			
 				/* session.setAttribute("isBan", "true"); */
 				
				String Request = request.getParameter("request");
					
				if(Request.equals(new String("addToCart"))){
					CartService cartService = new CartService();
					
					Cart cart = new Cart();
					
					cart.setIdOfCustomer((Integer)session.getAttribute("userId"));
					cart.setIdOfGoods(Integer.parseInt(productId));
					cart.setNumOfGoods(1);
					cart.setTotalMoney(Double.parseDouble(productPrice));
					
					if(cartService.addToCart(cart)){
								
						/*Ϊ�˷�ֹˢ��ҳ������������ݽ���cart��  */
					%>
						<script>window.alert("�����Ʒ�ɹ���");</script>
					<%
							
					}
			}
		}
	%>
		
	<div class="ckeckout">
		<div class="container">
			<div class="ckeck-top heading">
				<h2>���ﳵ</h2>
			</div>
			<div class="ckeckout-top">
			<div class="cart-items">
				
			   
			   <div class="in-check" >
			   <table border="2">
					<tr>
						<td>������</td>
						<td>�˿�id</td>
						<td>��Ʒid</td>
						<td>����</td>
						<td>����</td>
						<td>�ܼ�</td>
						<td>��������</td>
						<td>ɾ������</td>
						<td>����</td>
					</tr>
				
				<!-- �����ݿ��Cart���й��ڵ�ǰ��Աid������ -->
				
					
				<%
				
				if((session.getAttribute("userIdentity") != null) 
					&& session.getAttribute("userIdentity").equals(new String("customer"))){
						CartService cartService = new CartService();
					/* ��Ա��¼��������ҳ�鿴���ﳵ���� */	
					if(session.getAttribute("userId") != null && session.getAttribute("userName") != null){
						
						List<Cart> carts = cartService.readCart((Integer)session.getAttribute("userId"));
							
							for(Cart cart:carts){
							
					%>
					
								<tr>
										<td><%=cart.getIdOfCart() %></td>
										<td><%=cart.getIdOfCustomer()%></td>
										<td><%=cart.getIdOfGoods() %></td>
										<td><%=(int)(cart.getTotalMoney()/cart.getNumOfGoods()) %></td>
										<td><%=cart.getNumOfGoods() %></td>
										<td><%=cart.getTotalMoney() %></td>
										<td>����&nbsp;&nbsp;4-5�����ʹ�</td>
										<td>
											<a href="./servlet/CustomerDelCart?customerIdentity=<%=userIdentity%>&
												customerId=<%=cart.getIdOfCustomer() %>&idOfCart=<%=cart.getIdOfCart()%>&userName=<%=userName%>">
												ɾ��
											</a>
										</td>
										<td>
										
											<a href="CustomerOrder.jsp?idOfCart=<%=cart.getIdOfCart() %>
												&idofgoods=<%=cart.getIdOfGoods() %>&numofgoods=<%=cart.getNumOfGoods() %>
												&totalmoney=<%=cart.getTotalMoney() %>
												&customerId=<%=cart.getIdOfCustomer() %>">
												�¶���
											</a>
										</td>
									</tr>
					
					<% 
						}
					}
						
				 %>
					<div class="clearfix"> </div>
				</ul>
				
				
			</div>
			</div>  
		 </div>
		</div>
	</div>
	
	
	
	
	<%} 
	
	}%>
  </body>
</html>
