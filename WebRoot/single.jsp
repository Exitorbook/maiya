<%@page import="cn.edu.zhku.model.Goods,cn.edu.zhku.service.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��Ʒ����</title>
	

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
if(request.getAttribute("userIdentity") != null 
	&& request.getAttribute("userName") != null
 	&& request.getAttribute("id") != null){
		session.setAttribute("userIdentity",request.getAttribute("userIdentity"));
		session.setAttribute("userId",request.getAttribute("id"));
		session.setAttribute("userName",request.getAttribute("userName"));

}
  String userIdentity = (String)session.getAttribute("userIdentity");
  String userName = (String)session.getAttribute("userName");
  if(userIdentity != null && userName != null){
	  if(userIdentity.equals(new String("customer"))){
	  %>
	 	 		<div class = ''>
	 	 			<div class = 'whi'>��ӭ����<%=userIdentity %>&nbsp;&nbsp;<%=userName %>&nbsp;&nbsp;<a href='PersonalHomePageCustomer.jsp' target='_self'>��������</a>&nbsp;&nbsp;
	 	 			</div>
	 	 		<div class = ''>
	 	 			<a href='logout.jsp' target='_self'>
	 	 				�˳�
	 	 			</a>
	 	 		</div>
	 	 	
	 <% 	
	  }
  }
  else if(userIdentity == null && userName == null){
  
  %> 	
  		<div class = 'box1'>
  			<a href='login.jsp?identity=customer' target='_self'>
  				��¼
  			</a>
  		</div>
  		<div class = 'box1'>
  			<a href='register.jsp?identity=customer' target='_self'>
  				ע��
  			</a>
  		</div>
  		<div class = 'box1'>
  			<a href='login.jsp?identity=operator' target='_self'>
  				��Ӫ�̵�¼
  			</a>
  		</div>
  <% 
  }
  
  %>
  </div>
  
						
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="col-md-6 top-header-left">
					<div class="cart box_1">
					
					<!-- Ҫ������? -->
					
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
						<li class="grid"><a href="#">���</a>
						</li>
						<li class="grid"><a href="#">����</a>
						</li>
						<li class="grid"><a href="#">��ʾ��</a>
						</li>
						<li class="grid"><a href="typo.html">��Ϸ�ֱ�</a>
						</li>
						<li class="grid"><a href="typo.html">�ڴ�</a>
						</li>
						<li class="grid"><a href="typo.html">����</a>
						</li>
						<li class="grid"><a href="typo.html">Ӳ��</a>
						</li>
						<li class="grid"><a href="typo.html">�Կ�</a>
						</li>
						<li class="grid"><a href="typo.html">����</a>
						</li>
						<li class="grid"><a href="typo.html">����</a>
						</li>
						<li class="grid"><a href="contact.html">CPU</a>
						</li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="col-md-3 header-right"> 
				<div class="search-bar">
					<input type="text" value="����" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
					<input type="submit" value="">
				</div>
			</div>
			<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--bottom-header-->
	
	<!--start-single-->
	<div class="single contact">
		<div class="container">
			<div class="single-main">
				<div class="col-md-9 single-main-left">
				<div class="sngl-top">
					<div class="col-md-5 single-top-left">	
						<div class="flexslider">
							  <ul class="slides">
							  <%
							  	int productId = -1;
							  	if(request.getParameter("productId") != null){
							  	
							  		productId = Integer.parseInt(request.getParameter("productId"));
							  	}
							  
							  	
								VisitHomeService visitHomeService = new VisitHomeService();
									
								Goods good = visitHomeService.visitGoods(productId);
								
								
								
						 		%>
						 		
						 		
								<li data-thumb="<%=good.getPicturepath() %>">
									<div class="thumb-image"> <img src="<%=good.getPicturepath() %>" data-imagezoom="true" class="img-responsive" alt=""/> </div>
								</li>
								
							  </ul>
						</div>	  
						<!-- FlexSlider -->
						<script src="js/imagezoom.js"></script>
						<script defer src="js/jquery.flexslider.js"></script>
						<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />

						<script>
						// Can also be used with $(document).ready()
						$(window).load(function() {
						  $('.flexslider').flexslider({
							animation: "slide",
							controlNav: "thumbnails"
						  });
						});
						</script>
					</div>	
					<div class="col-md-7 single-top-right">
						<div class="single-para simpleCart_shelfItem">
						<h2><%=good.getName() %></h2>
							
							
							<h5 class="price">��<%=good.getPrice() %></h5>
							<p class = "title"><%=good.getIntroduce() %></p>
							<div class="available">
								<ul>
								<% String colors = good.getColor();
								%>
								<li>��ɫ
										<select name="color">
										<option><%=colors %></option></select></li>
										
									
									<% String styles = good.getStyle();
								%>
								<li>��ʽ
								<select name="style">
									<option><%=styles %></option>
								</select>
								</li>
								<li>����
								<select name="style">
									<option>1</option>
								</select>
								</li>
								
									
								<div class="clearfix"> </div>
							</ul>
						</div>
						<!-- �����Ա��¼�ˣ���ֱ�Ӱ���Ʒ���ӵ����ﳵ������ת����¼ҳ�棬�ɹ���¼����װ�ش�ҳ�� -->
						<%
						if(session.getAttribute("userIdentity") != null){
						
							if(session.getAttribute("userIdentity").equals(new String("customer"))){
							
								
						 %>
								<a href="CartNew.jsp?productId=<%=good.getId() %>&productName=<%=good.getName() %>&productNum=1&productPrice=<%=good.getPrice() %>&productPicPath=<%=good.getPicturepath() %>&request=addToCart" class="add-cart item_add">���빺�ﳵ</a>
							<%
								}
							}
							else{
							 %>	
								<a href="CartNew.jsp?productId=<%=good.getId() %>&productName=<%=good.getName() %>&productNum=1&productPrice=<%=good.getPrice() %>&productPicPath=<%=good.getPicturepath() %>" class="add-cart item_add">���빺�ﳵ</a>
								
								<%
								}
								 %>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="tabs">
					<ul class="menu_drop">
				<li class="item1"><a href="#"><img src="images/arrow.png" alt="">����</a>
					<ul>
						<li class="subitem1"><a href="#"><%=good.getIntroduce() %></a></li>
					</ul>
				</li>
				<li class="item2"><a href="#"><img src="images/arrow.png" alt="">������</a>
					<ul>
					    <li class="subitem2"><a href="#"><%=good.getSpecification() %></a></li>
					</ul>
				</li>
				<li class="item3"><a href="#"><img src="images/arrow.png" alt="">����</a>
					<ul>
						<li class="subitem1"><a href="#"><%=good.getEvaluation() %></a></li>
					</ul>
				</li>
	 		</ul>
				</div>
				
				<!-- ��ʵ���û�ѡ����Щ��ʽ����ɫ������ -->
				
				
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--end-single-->
	<!--information-starts-->
	<div class="tabBetweenDiv"> </div>
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
						<li><a href="contact.html"><p>��������</p></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>�ҵ��˻�</h3>
					<ul>
						<li><a href="account.html"><p>�ҵ��˻�</p></a></li>
						<li><a href=""><p>��/����</p></a></li>
						<li><a href=""><p>������Ϣ</p></a></li>
						<li><a href=""><p>�ջ���ַ</p></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>��վ��Ϣ</h3>
					<h4>��˾,
						<span>��ѽ,</span>
						������.</h4>
					<h5>+86 12345678911</h5>	
					<p><a href="mailto:example@email.com">contactus@maiya.com</a></p>
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
						<input type="submit" value="�ύ">
					</form>
				</div>
				<div class="col-md-6 footer-right">					
					<p>Copyright &copy; 2016.maiya All rights reserved.<a target="_blank" href=""></a></p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	
  </body>
</html>
