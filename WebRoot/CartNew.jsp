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
  	 	userIdentity = (String)session.getAttribute("userIdentity");
  	 	userName = (String)session.getAttribute("userName");
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
  	
  	<%
		String productId = request.getParameter("productId");
		String productName = request.getParameter("productName");
		String productPrice = request.getParameter("productPrice");
		String productNum = request.getParameter("productNum");
		String productPicPath = request.getParameter("productPicPath");
						
	%>
	
	<% if(userIdentity == null && userName ==null){
		
	%>
	<div class="whi">
		<a href ="login.jsp?productId=<%=productId %>&ago=cart&identity=customer" >
			<h2>���ȵ�¼��</h2>
		</a>
	</div>
	
	
	
	
	<%
	} else if(userIdentity != null && userName !=null){
	 %>
	
	<%
			/*��singleҳ�棨��Ʒ���棩��ӽ����ﳵ������������ҳ��  */
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
								
						/*Ϊ�˷�ֹˢ��ҳ������������ݽ���cart��  ��������*/
					%>
						<script>window.alert("�����Ʒ�ɹ���");</script>
					<%
							
					}
					else if(!cartService.addToCart(cart)){
					
					%>
						<script>
							window.alert("��Ʒ�Ѵ��ڹ��ﳵ����Ʒ��");
							window.location="PersonalHomePageCustomer.jsp";
						</script>
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
			<div class="ckeckout-top tab2">
			<div class="cart-items">
				
			   
			   <div class="in-check" >
			   <table border="2">
					<tr>
					<td>���ﳵid:</td>
		    		<td>��Աid:</td>
		    		<td>��Ʒid:</td>
		    		<td>��Ʒ����:</td>
		    		<td>����</td>
		    		<td>�ܼ�:</td>
		    		<td>ɾ��</td>
		    		<td>�µ�</td>
						
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
										<td><%=cart.getNumOfGoods() %></td>
										<td><%=(int)(cart.getTotalMoney()/cart.getNumOfGoods()) %></td>
										<td><%=cart.getTotalMoney() %></td>
										<td><a href="DelCartNew.jsp?customerId=<%=session.getAttribute("userId")%>&cartId=<%=cart.getIdOfCart()%>&requestCode=0">ɾ��</a></td>
    									<td><a href="PlaceTheOrderNew.jsp?customerId=<%=session.getAttribute("userId")%>&cartId=<%=cart.getIdOfCart()%>">�µ�</a></td>
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
	
	
	
	
	<%}else if(request.getParameter("customerId")!=null){
 	%>
 	�û��Ӹ�����ҳ�鿴���ﳵ���飡<br>
    customerId��<%=request.getParameter("customerId") %>
    
    <table border="2">
    	<tr>
    		<td>xia���ﳵid:</td>
    		<td>��Աid:</td>
    		<td>��Ʒid:</td>
    		<td>��Ʒ����:</td>
    		<td>����:</td>
    		<td>�ܼ�:</td>
    		<td>ɾ��</td>
    		<td>�µ�</td>
    	</tr>
    <%
    
    CartService cartService = new CartService();
    
    List<Cart> carts = cartService.readCart(Integer.parseInt(request.getParameter("customerId")));
    
    if(carts == null){
    %>
    
    	���ﳵ�տ���Ҳ��<a href="index.jsp">ȥ�����Ʒ</a>
    <%
    }
    else if(carts != null){
    
    
    	for(Cart cart:carts){
    
     %>
    	<tr>
    		<td><%=cart.getIdOfCart() %></td>
    		<td><%=cart.getIdOfCustomer() %></td>
    		<td><%=cart.getIdOfGoods() %></td>
    		<td><%=cart.getNumOfGoods() %></td>
    		<td><%=(int)(cart.getTotalMoney()/cart.getNumOfGoods()) %></td>
    		<td><%=cart.getTotalMoney() %></td>
    		<td><a href="DelCartNew.jsp?customerId=<%=request.getParameter("customerId")%>&cartId=<%=cart.getIdOfCart()%>&requestCode=0">ɾ��</a></td>
    		<td><a href="PlaceTheOrderNew.jsp?customerId=<%=request.getParameter("customerId")%>&cartId=<%=cart.getIdOfCart()%>">�µ�</a></td>
    	
    	</tr>
    
    <%
   		}
   }
 }
}
    %>
    </table>
  </body>
</html>
