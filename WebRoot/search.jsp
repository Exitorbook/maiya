<%@ page language="java" import="java.util.*,cn.edu.zhku.model.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��ҳ</title>
	

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

function loginFuncton(){
		alert("value");
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
  if(userIdentity != null && userName != null){
	  if(userIdentity.equals(new String("customer"))){
	 	 		out.print("<div class = 'whi'><div class = ''>��ӭ����" + userIdentity + "&nbsp;&nbsp;" + userName + "&nbsp;&nbsp;<a href='PersonalHomePageCustomer.jsp' target='_self'>��������</a>&nbsp;&nbsp;<a href='logout.jsp' target='_self'>�˳�</a></div></div>");
	  }
	  else if(userIdentity.equals(new String("operator"))){
	 	 		out.print("<div class = 'welcome whi'>��ӭ����" + userIdentity + "&nbsp;&nbsp;" + userName + "&nbsp;&nbsp;<a href='PersonalHomePageOperator.jsp' target='_self'>��������</a>&nbsp;&nbsp;<a href='logout.jsp' target='_self'>�˳�</a></div>");
	  
	  }
  }
  else if(userIdentity == null && userName ==null){
  		out.print("<div class = 'box1 whi'><a href='login.jsp?identity=customer' target='_self'>��¼</a></div><div class = 'box1'><a href='customerAdd.jsp?identity=customer' target='_self'>ע��</a></div><div class = 'box1'><a href='login.jsp?identity=operator' target='_self'>��Ӫ�̵�¼</a></div>");
  }
  
   %>
   <div class="clearfix"></div>
					</div>
				</div>
				<div class="col-md-6 top-header-left">
					<div class="cart box_1">
						<a href="PersonalHomePageCustomer.jsp">
							 <div class="total">
								<span></span></div>
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
	<!--start-logo-->
	<div class="logo">
		<a href="index.jsp"><img alt="" src="images/logo.png" class="" height="60px">
	</div>
	<!--top-header-->
	<div class="header-bottom">
		<div class="container">
			<div class="header">
				<div class="col-md-9 header-left">
				<div class="top-nav">
					<ul class="memenu skyblue"><li class="active"><a href="index.jsp">��ҳ</a></li>
						<li class="grid"><a href="./servlet/SearchGoods?sort=sb">���</a>
						</li>
						<li class="grid"><a href="./servlet/SearchGoods?sort=jp">����</a>
						</li>
						<li class="grid"><a href="./servlet/SearchGoods?sort=xsq">��ʾ��</a>
						</li>
						<li class="grid"><a href="./servlet/SearchGoods?sort=yxsb">��Ϸ�ֱ�</a>
						</li>
						<li class="grid"><a href="./servlet/SearchGoods?sort=nc">�ڴ�</a>
						</li>
						<li class="grid"><a href="./servlet/SearchGoods?sort=zb">����</a>
						</li>
						<li class="grid"><a href="./servlet/SearchGoods?sort=yp">Ӳ��</a>
						</li>
						<li class="grid"><a href="./servlet/SearchGoods?sort=xk">�Կ�</a>
						</li>
						<li class="grid"><a href="./servlet/SearchGoods?sort=jx">����</a>
						</li>
						<li class="grid"><a href="./servlet/SearchGoods?sort=cpu">CPU</a>
						</li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="col-md-3 header-right"> 
				<div class="search-bar">
				<form action="./servlet/SearchGoods" method="post">
					<input type="text" value="����" onfocus="this.value = '';"name ="search"  onblur="if (this.value == '') {this.value = '����';} ">
					<input type="submit" value="">
				</form>
				</div>
			</div>
			<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--bottom-header-->
	
   
   <table border="1">
	   <tr>
		  	<td>��Ʒ���</td>
		   	<td>����</td>
		   	<td>���</td>
		   	<td>����</td>
		   	<td>���</td>
		   	<td>�۸�</td>
		   	<td>����</td>
		   	<td>��ɫ</td>
		   	<td>��ʽ</td>
		   	<td>���˵��</td>
	   	</tr>
   <%
   if(session.getAttribute("goodsList") != null){
   		List<Goods> goodsList = (List<Goods>)session.getAttribute("goodsList");
   		for(Goods goods:goodsList){
   		%>
   		<tr>
   			<td><a href ="single.jsp?productId=<%=goods.getId() %>"><%=goods.getId() %></a></td>
   			<td><a href ="single.jsp?productId=<%=goods.getId() %>"><%=goods.getName() %></a></td>
   			<td><%=goods.getSort() %></td>
   			<td><%=goods.getSalesvolume() %></td>
   			<td><%=goods.getKucun() %></td>
   			<td><%=goods.getPrice() %></td>
   			<td><%=goods.getIntroduce() %></td>
   			<td><%=goods.getColor() %></td>
   			<td><%=goods.getStyle() %></td>
   			<td><%=goods.getSpecification() %></td>
   		
   		</tr>
   		
   		
   		
    
   	<%
   }
   }
   	 %>
   </table>
  </body>
</html>
