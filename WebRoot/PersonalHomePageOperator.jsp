<%@page import="cn.edu.zhku.service.CartService"%>
<%@page import="cn.edu.zhku.model.Order"%>
<%@page import="cn.edu.zhku.service.OperatorManagementService"%>
<%@page import="cn.edu.zhku.model.Customer"%>
<%@page import="cn.edu.zhku.dao.UserDao"%>
<%@ page language="java" import="java.util.*,cn.edu.zhku.model.Operator,cn.edu.zhku.model.ShopInfo" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��Ӫ����ҳ</title>
    
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

<!-- <form action="" name="f1">
<input type="text" value="" name = "ctrl" id="ctrl"/>
</form -->


	<!--top-header-->
	<div class="top-header">
		<div class="container">
			<div class="top-header-main">
				<div class="col-md-6 top-header-left">
					<div class="drop">
					
		<%!UserDao userDao = new UserDao(); %>
		<%
  String userIdentity = null;
  /* ����String userId = (String)request.getAttribute("userId"); */
  String userId = null;
  /*���ǵ���Ӫ�̵�һ�ε�½ʱ����Ҫ request.getAttribute("userId")���ٴ�������ҳ���ǣ�userId��Ϊnull�� */
  if(request.getAttribute("userId") != null ){
  		userId = String.valueOf((Integer)request.getAttribute("userId"));
  }
  /* ������Ҫ��session�����ȡ */
  else if(request.getAttribute("userId") == null){
  		userId = String.valueOf((Integer)request.getAttribute("userId"));
  
  }
  
  /*���ǵ���Ӫ�̵�һ�ε�½ʱ����Ҫ request.getAttribute("identity")���ٴ�������ҳ���ǣ�identity��Ϊnull�� */
  if( request.getAttribute("identity") != null){
  		userIdentity = (String)request.getAttribute("identity");
  }
  /* ������Ҫ��session�����ȡ */
  else if(request.getAttribute("identity") == null){
  		userIdentity = (String)session.getAttribute("userIdentity");
  
  }
  
  String userName = (String)request.getAttribute("userName");
  
  if(userIdentity != null && userId!= null && userName!= null){
  
	  session.setAttribute("userIdentity",request.getAttribute("identity"));
	  session.setAttribute("userId",request.getAttribute("userId"));
	  session.setAttribute("userName",request.getAttribute("userName"));
  } 
  
  
  userIdentity = (String)session.getAttribute("userIdentity");
  userName = (String)session.getAttribute("userName");
  if(userIdentity != null && userName != null){
	  if(userIdentity.equals(new String("customer"))){
	 	 		out.print("<div class = ''><div class = ''>��ӭ����" + userIdentity + "&nbsp;&nbsp;" + userName + "</div><div class = ''><a href='logout.jsp' target='_self'>�˳�</a></div></div>");
	  }
	  else if(userIdentity.equals(new String("seller"))){
	 	 		out.print("<div class = ''><div class = ''>��ӭ����" + userIdentity + "&nbsp;&nbsp;" + userName + "</div><div class = ''><a href='logout.jsp' target='_self'>�˳�</a></div></div>");
	  }
	  else if(userIdentity.equals(new String("operator"))){
	 	 		out.print("<div class = 'welcome'>��ӭ����" + userIdentity + "&nbsp;&nbsp;" + userName + "&nbsp;&nbsp;&nbsp;<a href='logout.jsp' target='_self'>�˳�</a></div>");
	  
	  }
  }
  else if(userIdentity == null && userName ==null){
  		out.print("<div class = 'box1'><a href='login.jsp?identity=customer' target='_self'>��¼</a></div><div class = 'box1'><a href='register.jsp?identity=customer' target='_self'>ע��</a></div><div class = 'box1'><a href='login.jsp?identity=seller' target='_self'>�̼�����</a></div><div class = 'box1'><a href='register.jsp?identity=seller' target='_self'>�̼���פ</a></div><div class = 'box1'><a href='login.jsp?identity=operator' target='_self'>��Ӫ�̵�¼</a></div>");
  }
   
  
  %>
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
  
    <!--start-logo-->
	<div class="logo">
		<a href="index.jsp"><h1>��ѽ</h1></a>
	</div>
	<!--start-logo-->
	
    
  	<div class="header-bottom">
		<div class="container">
			<div class="header">
				<div class="col-md-9 header-left">
				<div class="top-nav">
					<ul class="memenu skyblue"><li class="active"><a href="index.jsp">��ҳ</a></li>
						<li class="grid"><a>������Ʒ</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<a href="StockInformation.jsp"><h4>�����Ϣ</h4></a>
									
									</div>
									<div class="col1 me-one">
										<h4>
										<a href="AddGoods.jsp">��Ʒ�ϼ�</a>
										</h4>
											
									</div>
									<div class="col1 me-one">
										<h4>
										<A href="AlterGoods.jsp">�޸���Ʒ��Ϣ</A>
										</h4>
											
									</div>
									<div class="col1 me-one">
										<h4>
										<A href="DeleteGoods.jsp">ɾ����Ʒ</A>
										</h4>
											
									</div>
									
								</div>
							</div>
						</li>
						
						<li class="grid"><a>���񱨱�</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>
										<a href="salesInformation.jsp">
										��������
										</a>
										</h4>
										
									</div>
									
									
								</div>
							</div>
						</li>
						
						<li class="grid"><a>�����Ա</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>
										<a href="./servlet/OperatorQueryCustomerInfo?requestCode=displayCustomers">��ѯ��Ա</a>
										</h4>
										
									</div>
										
									<div class="col1 me-one">
										<h4>
									<a href="./servlet/Synchronize?requestCode=operatorAndCustomer">ͬ����Ա��Ϣ</a>
										</h4>
											
									</div>
									<div class="col1 me-one">
										<h4>
										<a href="./servlet/OperatorDeleteCustomer?requestCode=byId">ɾ����Ա</a>
										</h4>
											
									</div>
									
								</div>
							</div>
						</li>
						<li class="grid"><a>������</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>
										<a href="./servlet/OperatorManOrders?requestCode=121">��ѯ����</a>
										</h4>
										
									</div>
										
									<div class="col1 me-one">
										<h4>
									<a href="./servlet/OperatorManOrders?requestCode=121">�޸Ķ���״̬</a>
										</h4>
											
									</div>
									
								</div>
							</div>
						</li>
						
						<li class="grid"><a>������Ϣ</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4><a href="./servlet/OperatorManSelf?requestCode=qs">��ѯ������Ϣ</a></h4>
										
									</div>
									<div class="col1 me-one">
										<h4><a href="./servlet/OperatorManSelf?requestCode=es">�޸ĸ�����Ϣ</a></h4>
											
									</div>
									
								</div>
							</div>
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
	
    <%
    String requsetCode = (String)request.getAttribute("reqCode");
    
    String identity = (String)session.getAttribute("userIdentity");
    /*��Ӫ��id  */
    String id = String.valueOf((Integer)request.getAttribute("userId"));
    
    int genealViewOrSpecificView = -2;
    if(request.getAttribute("GenealViewOrSpecificView") != null){
    	/* if(request.getAttribute("GenealViewOrSpecificView") instanceof String){
    		genealViewOrSpecificView = Integer.parseInt((String)(request.getAttribute("GenealViewOrSpecificView")));
    	}else{ */
     		genealViewOrSpecificView= (Integer)request.getAttribute("GenealViewOrSpecificView");
     	/* } */
    }
    
    if(genealViewOrSpecificView != -1){
    
	/* ��ʾ������,������Ӫ�̵������ѯ���̡�,����OperatorQueryShopsInfo.java(Servlet)���ݲ�����requestCode<������>=displayShops<ֵ>��,Servlet request��getParameter(name)���ڴ��ݸ���jspҳ��*/
    	if(genealViewOrSpecificView == 0){ 
    
    
	    if(requsetCode == null){
	    	out.print("��ӭ��");
	    }
	    else if(requsetCode != null){
	    	if(requsetCode.equals(new String("displayShops"))){
	    	
	    		/*id:��Ӫ��id  */
	    		List<?> userlist = userDao.query(identity,Integer.parseInt(id),0);
	    		if(userlist == null){
	    			out.print("Ϊ��");
	    		}
	    		else if(userlist != null){
			    	String shops = null;
			    	for (Object object : userlist) {
			    		
			    		shops = ((Operator)object).getShops();
			    	}
			    	//��ȡÿ������id
			    	String [] shopsArr = shops.split(";");
			    	
			    	int [] shopsIdArr = new int[3];
			    	
			    	List<ShopInfo> shopInfos = new ArrayList<ShopInfo>();
			    	
			    	for(int i = 0;i < 3;i++){
			    		shopsIdArr[i] = Integer.parseInt(shopsArr[i]);
			    		shopInfos.add(userDao.QueryShopInfo(shopsIdArr[i]));
			    	}
			    	
			    	
			    	out.print("<div class = ''>�������</div>");
			    	out.print("<div class = ''>��ѯ����</div>");
			    	
			    	session.setAttribute("shopsInfo",shopInfos);
			    	out.print("<table border = '1' class = 'displayShops'><tr>");
			    	String idsInshopInfos = "";
			    	for(int i = 0;i < shopsIdArr.length;i++){
			    	
			    		idsInshopInfos += shopsIdArr[i] + ";";
			    	}
			    	System.out.print("ids = "+ idsInshopInfos);
			    	for(int i = 0;i < 3;i++){    		
			    		out.print("<td class ='shop'><form action='./servlet/OperatorQueryShopsInfoDetails' method='post'><table><tr height='150px'><td colspan='2'>��ƷͼƬ</td></tr><tr><td>"+ shopInfos.get(i).getShopId() + "</td><td>" +shopInfos.get(i).getShopName()+"</td></tr><tr><td colspan='2'><input name = 'shopId' type='text' value="+ shopInfos.get(i).getShopId()+" class = 'hideShopIdInInput'/></td></tr><tr><td colspan='2'><input type='submit' value='��ѯ'/></td></tr></table></form></td>");
			    	}
			    	/* userId:��Ӫ��id ; idsInshopInfos:�Ѿ���ʾ����Ӫ����ҳ�ĵ���id*/
			    	out.print("<td width = '135px'><form action='./servlet/OperatorQueryShopsInfoDetails' method='post'><table><tr><td><input name = 'operatorId_queryTheLeft' type='text' value="+ userId+" class = ''/></td></tr><tr><td><input type = 'submit' value = '���������Ϣ'/></td></tr><tr><td><input name = 'idsInshopInfos_queryTheLeft' type='text' value="+ idsInshopInfos+" class = ''/></td></tr></table></form></td></tr></table>");
			    	out.print("<div class = ''>ɾ������</div>");
	    		}
	    	}
	    }	
    }
    
    /* �û�������������"��ѯ"��ť����ʾ�������� */
    else if(genealViewOrSpecificView == 1){
    	 out.print("�û������������� ��ѯ ��ť����ʾ��������");
	     out.print("<div><a href = 'PersonalHomePageOperator.jsp' target = '_self'><</a></div>");
    	
    	/*id:��Ӫ��id,���ڴ��뵽Servlet->OperatorDeleteShop���棬����ɾ��Operator���е�����Ϣ�Ĳ�����ɾ����ǰ����id��  */
    	 id = (String)session.getAttribute("userId");
    	 
    	 
    	 int operatorId = Integer.parseInt((String)session.getAttribute("userId"));
    	 /*shopInfo�������ڲ�ѯ��һ������һ������  */
	     ShopInfo shopInfo = (ShopInfo)request.getAttribute("shopInfoDetails");
	     if(shopInfo != null){
	       out.print("<table><tr><td colspan='2'>����ͼƬ:</td><td>�����ƹ���</td></tr><tr><td colspan='2'>����Id:</td><td>"+shopInfo.getShopId()+"</td></tr><tr><td colspan='2'>������:</td><td>"+shopInfo.getShopName()+"</td></tr><tr><td colspan='2'>����id:</td><td>"+shopInfo.getSellerId()+"</td></tr><tr><td colspan='2'>�Ƿ���Ч��֤����(1:��Ч��0����Ч):</td><td>"+shopInfo.getIsValidShop()+"</td></tr><tr><td colspan='2'>Ӫҵ��:</td><td>"+shopInfo.getShopTurnOver()+"</td></tr><tr><td colspan='2'>�̼�ӵ�е���Ʒid����Ӫ�̲����޸ģ�:<td>"+shopInfo.getShopGoodsId() + "</td></tr><td colspan='2'>��������Ӫ�̲����޸ģ�:</td><td>"+shopInfo.getShopOrdersId()+"<td></tr></table>");
	       /*���ݵ��̵�ǰid ����Ӫ��id(���Եó�ȫ������id)���Ӷ���λ��һ������һ������*/
	       out.print("<table border='1'><tr><td width = '100px'><form action='./servlet/OperatorDeleteShop' method='post'><table><tr><td><input name = 'operatorid' type='text' value="+ id+" class = '' size = '5'/></td></tr><tr><td><input type='submit' value='ɾ��' class = 'btn'/></td></tr><tr><td><input name = 'userIdentity' type='text' value="+ userIdentity+" class = '' size = '5'/></td></tr><tr><td><input name = 'shopCurrentId_deleteShop' type='text' value="+ shopInfo.getShopId()+" class = '' size = '5'/></td></tr></table></form></td><td width = '100px'><form action='./servlet/OperatorQueryShopsInfoDetails' method='post'><table><tr><td><input name = 'operatorid' type='text' value="+ id+" class = '' size = '5'/></td></tr><tr><td><input type='submit' value='��һ��' class = 'btn'/></td></tr><tr><td><input name = 'operatorId_forlast' type='text' value="+ operatorId+" class = '' size = '5'/></td></tr><tr><td><input name = 'shopCurrentId_forlast' type='text' value="+ shopInfo.getShopId()+" class = '' size = '5'/></td></tr></table></form></td><td width = '100px'><form action='./servlet/OperatorQueryShopsInfoDetails' method='post'><table><tr><td><input name = 'operatorid' type='text' value="+ id+" class = '' size = '5'/></td></tr><tr><td><input type='submit' value='��һ��' class = 'btn'/></td></tr><tr><td><input name = 'operatorId' type='text' value="+ operatorId+" class = '' size = '5'/></td></tr><tr><td><input name = 'shopCurrentId' type='text' value="+ shopInfo.getShopId()+" class = '' size = '5'/></td></tr></table></form></td></tr></table>");
	     }
	   	 else if(shopInfo == null){
	    	out.print("�޸��������Ϣ��");
	     }
	   /*  
	    <tr><td><input name = 'operatorid' type='text' value="+ id+" class = '' size = '5'/></td></tr>
     */
    
    }
    /* �û��������"�ϡ���һ��/���������Ϣ"��ť��Ҳ����ɾ�����ڵ��̣���ʾ�ϡ���һ��/���������Ϣ�������� */
    else if(genealViewOrSpecificView == 2){
    	out.print("�û�������� �ϡ���һ��/���������Ϣ ��ť����ʾ�ϡ���һ��/���������Ϣ�������� ");
    	
    	/*id:��Ӫ��id,���ڴ��뵽Servlet->OperatorDeleteShop���棬����ɾ��Operator���е�����Ϣ�Ĳ�����ɾ����ǰ����id��  */
    	 id = (String)session.getAttribute("userId");
    	
	     out.print("<div><a href = 'PersonalHomePageOperator.jsp' target = '_self'><</a></div>");
    	if(request.getAttribute("theRemainingshopIds") != null){
	    	List<ShopInfo> shopsInfo_theLeft = new ArrayList<ShopInfo>();
	    	
	     shopsInfo_theLeft = (List<ShopInfo>)request.getAttribute("theRemainingshopIds");
	     for(ShopInfo shopsInfo : shopsInfo_theLeft){
	    		out.print("<td class ='shop'><form action='./servlet/OperatorQueryShopsInfoDetails' method='post'><table border = '1'><tr height='150px'><td colspan='2'>��ƷͼƬ</td></tr><tr><td>"+ shopsInfo.getShopId() + "</td><td>" +shopsInfo.getShopName()+"</td></tr><tr><td colspan='2'><input name = 'shopId' type='text' value="+ shopsInfo.getShopId()+" class = 'hideShopIdInInput'/></td></tr><tr><td colspan='2'><input type='submit' value='��ѯ'/></td></tr></table></form></td>");
    		}
    	}
    	
    	 int operatorId = Integer.parseInt((String)session.getAttribute("userId"));
    	 /*shopInfo�������ڲ�ѯ��һ������һ������  */
	     ShopInfo shopInfo = (ShopInfo)request.getAttribute("shopInfoDetails");
	      if(shopInfo != null){
	       out.print("<table><tr><td colspan='2'>����ͼƬ:</td><td>�����ƹ���</td></tr><tr><td colspan='2'>����Id:</td><td>"+shopInfo.getShopId()+"</td></tr><tr><td colspan='2'>������:</td><td>"+shopInfo.getShopName()+"</td></tr><tr><td colspan='2'>����id:</td><td>"+shopInfo.getSellerId()+"</td></tr><tr><td colspan='2'>�Ƿ���Ч��֤����(1:��Ч��0����Ч):</td><td>"+shopInfo.getIsValidShop()+"</td></tr><tr><td colspan='2'>Ӫҵ��:</td><td>"+shopInfo.getShopTurnOver()+"</td></tr><tr><td colspan='2'>�̼�ӵ�е���Ʒid����Ӫ�̲����޸ģ�:<td>"+shopInfo.getShopGoodsId() + "</td></tr><td colspan='2'>��������Ӫ�̲����޸ģ�:</td><td>"+shopInfo.getShopOrdersId()+"<td></tr></table>");
	       /*���ݵ��̵�ǰid ����Ӫ��id(���Եó�ȫ������id)���Ӷ���λ��һ������һ������*/
	       out.print("<table border='1'><tr><td width = '100px'><form action='./servlet/OperatorDeleteShop' method='post'><table><tr><td><input name = 'operatorid' type='text' value="+ id+" class = '' size = '5'/></td></tr><tr><td><input type='submit' value='ɾ��' class = 'btn'/></td></tr><tr><td><input name = 'userIdentity' type='text' value="+ userIdentity+" class = '' size = '5'/></td></tr><tr><td><input name = 'shopCurrentId_deleteShop' type='text' value="+ shopInfo.getShopId()+" class = '' size = '5'/></td></tr></table></form></td><td width = '100px'><form action='./servlet/OperatorQueryShopsInfoDetails' method='post'><table><tr><td><input name = 'operatorid' type='text' value="+ id+" class = '' size = '5'/></td></tr><tr><td><input type='submit' value='��һ��' class = 'btn'/></td></tr><tr><td><input name = 'operatorId_forlast' type='text' value="+ operatorId+" class = '' size = '5'/></td></tr><tr><td><input name = 'shopCurrentId_forlast' type='text' value="+ shopInfo.getShopId()+" class = '' size = '5'/></td></tr></table></form></td><td width = '100px'><form action='./servlet/OperatorQueryShopsInfoDetails' method='post'><table><tr><td><input name = 'operatorid' type='text' value="+ id+" class = '' size = '5'/></td></tr><tr><td><input type='submit' value='��һ��' class = 'btn'/></td></tr><tr><td><input name = 'operatorId' type='text' value="+ operatorId+" class = '' size = '5'/></td></tr><tr><td><input name = 'shopCurrentId' type='text' value="+ shopInfo.getShopId()+" class = '' size = '5'/></td></tr></table></form></td></tr></table>");
	     }
	   	 else if(shopInfo == null){
	    	out.print("�޸��������Ϣ��");
	     }
	    
	     
    }
   /*  ɾ��������Ϣ����Ҫ������Ӫ��Ȩ�������ҳ��  */
    else if(genealViewOrSpecificView == 3){
    	out.print("ɾ��������Ϣ����Ҫ������Ӫ��Ȩ������ҳ��");
    	/* request.setAttribute("userIdentity", userIdentity);
			request.setAttribute("GenealViewOrSpecificView", new Integer(3));
			request.setAttribute("shopCurrentId_deleteShop", shopCurrentId_deleteShop); */
    	String userIdentityFromOperatorDeleteShopServlet = (String)request.getAttribute("userIdentity");
    	int GenealViewOrSpecificView = (Integer)request.getAttribute("GenealViewOrSpecificView");
    	String shopCurrentId_deleteShop = (String)request.getAttribute("shopCurrentId_deleteShop");
    	
    	/* �������ݵ�OperatorDeleteShop���Servlet������д��� */
    	out.print("userIdentityFromOperatorDeleteShopServlet GenealViewOrSpecificView shopCurrentId_deleteShop=" + userIdentityFromOperatorDeleteShopServlet +GenealViewOrSpecificView +shopCurrentId_deleteShop);
    	
    	out.print("<form action='./servlet/OperatorDeleteShop' method='post'><table><tr><td><input name = 'operatorIdForDeleteShops' type='text' value='"+session.getAttribute("userId")+"' class = '' size = '5'/></td></tr><tr><td><input name = 'userIdentity' type='text' value='"+userIdentityFromOperatorDeleteShopServlet+"' class = '' size = '5'/></td></tr><tr><td><input name = 'GenealViewOrSpecificView' type='text' value='"+GenealViewOrSpecificView+"' class = '' size = '5'/></td></tr><tr><td><input name = 'shopCurrentId_deleteShop' type='text' value='"+shopCurrentId_deleteShop+"' class = '' size = '5'/></td></tr><tr><td>Ȩ�����룺</td><td><input name = 'operatingAuthorityPsw' type='text' class = '' size = '5'/></td></tr><tr><td><input type='submit' value='ɾ��' class = 'btn'/></td><td><input type= 'button' value = '����' onclick='window.history.go(-1)' class = 'btn'></td></tr></table></form>");
    }
    /* <tr><td><input name = 'operatorIdForDeleteShops' type='text' value='"+sess+"' class = '' size = '5'/></td></tr> */
    
         /* �û����"���������Ϣ"��ť����ʾ�����������  */
    else if(genealViewOrSpecificView == 31){
    	out.print("ɾ��ȫ�������ɹ���");
    }
    /* ��Ӫ���������idɾ������ */
    else if(genealViewOrSpecificView == 4){
    	out.print("ɾ��byid��");
    	/* String userIdentityFromOperatorDeleteShopServlet = (String)request.getAttribute("userIdentity");
    	int GenealViewOrSpecificView = (Integer)request.getAttribute("GenealViewOrSpecificView");
    	String shopCurrentId_deleteShop = (String)request.getAttribute("shopCurrentId_deleteShop");
    	 */
    	/* �������ݵ�OperatorDeleteShop���Servlet������д��� */
    	/* out.print("userIdentityFromOperatorDeleteShopServlet GenealViewOrSpecificView shopCurrentId_deleteShop=" + userIdentityFromOperatorDeleteShopServlet +GenealViewOrSpecificView +shopCurrentId_deleteShop);
    	 */out.print("identity = " + identity);
    	
    	out.print("<form action='./servlet/OperatorDeleteShop' method='post'><table><tr><td><input name = 'operatorIdToDelShop' type='text' value='"+session.getAttribute("userId")+"' class = '' size = '5'/></td><td><input name = 'operatorIdtenToDelShop' type='text' value='"+session.getAttribute("userIdentity")+"' class = '' size = '5'/></td><td><input name = 'GenealViewOrSpecificView' type='text' value='41' class = '' size = '5'/></td></tr><tr><td>����id:</td><td colspan='2'><input name = 'shopid' type='text' class = '' size = '40'/></td></tr><tr><td><input type='submit' value='ɾ��' class = 'btn'/></td><td><input type= 'button' value = '����' onclick='window.history.go(-1)' class = 'btn'></td></tr></table></form>");
   
      }
    
    
     /* ��Ӫ��ͬ�����ݿ���Ϣ */
    else if(genealViewOrSpecificView == 5){
    
    	 out.print("<form action='./servlet/Synchronize' method='post'><table><tr><td><input name = 'operatorIdToSynShop' type='text' value='"+session.getAttribute("userId")+"' class = '' size = '5'/></td><td><input name = 'operatorIdtenToSynShop' type='text' value='"+session.getAttribute("userIdentity")+"' class = '' size = '5'/></td><td><input name = 'GenealViewOrSpecificView' type='text' value='51' class = '' size = '5'/></td></tr><tr><tr><td><input type='submit' value='ͬ��' class = 'btn'/></td><td><input type= 'button' value = '����' onclick='window.history.go(-1)' class = 'btn'></td></tr></table></form>");
     } 
    else if(genealViewOrSpecificView == 52){
    	 out.print("ͬ���ɹ���"); 
    
    } 
    /* ��ʾ��ѯδ��֤�����е��� */
    else if(genealViewOrSpecificView == 6){
    	List<ShopInfo> allInvalidshops = (List<ShopInfo>)request.getAttribute("invalidshops");
    	/* if(allInvalidshops != null){
    		for(ShopInfo shopInfo:allInvalidshops){
    			if(Integer.parseInt(shopInfo.getIsValidShop()) == 1){
    				allInvalidshops.remove(shopInfo);
    			}
    		}
    	} */
    	
    	out.print("<table>");
    	for(ShopInfo shopInfo : allInvalidshops){
    		 out.print("<tr><td>����id:</td><td>" + shopInfo.getShopId()+ "</td></tr><tr><td>isValidShop:</td><td>"+shopInfo.getIsValidShop()+"</td></tr><tr><td>��֤״̬��</td><td>δ��֤</td><tr><tr><td>----</td><td>----</td><tr>");
    	}
    	out.print("</table>");
    	 out.print("<form action='./servlet/AuthenticateShopCtrl' method='post'><table><tr><td><input name = 'operatorIdToAuthShop' type='text' value='"+session.getAttribute("userId")+"' class = '' size = '5'/></td><td><input name = 'operatorIdtenToAuthShop' type='text' value='"+session.getAttribute("userIdentity")+"' class = '' size = '5'/></td><td><input name = 'requestCode' type='text' value='61' class = '' size = '5'/></td></tr><tr><tr><td><input type='submit' value='һ��ȫ����֤����' class = 'btn'/></td><td><input type= 'button' value = '����' onclick='window.history.go(-1)' class = 'btn'></td></tr></table></form>");
    
    } 
   /*  //��ʾ��֤�ɹ���� */
    else if(genealViewOrSpecificView == 62){
    	out.print("��֤�ɹ���");
    } 
    /* ����ȫ���Ѿ���֤ */
    else if(genealViewOrSpecificView == 63){
    	out.print("����ȫ���Ѿ���֤��");
    } 
    
    
    /* ��Ӫ�̲鿴��Ա��Ϣ����¼���롢֧�����롢�����⣩ */
    else if(genealViewOrSpecificView == 7){
    	/* out.print("����ȫ���Ѿ���֤��"); */
    	 out.print("<div class='tab1'><form action='./servlet/OperatorQueryCustomerInfo' method='post'><table><tr><td><input name = 'operatorIdToQureryCustomer' type='text' value='"+session.getAttribute("userId")+"' class = 'hide' size = '5'/></td><td><input name = 'operatorIdenToQureryCustomer' type='text' value='"+session.getAttribute("userIdentity")+"' class = 'hide' size = '5'/></td><td><input name = 'GenealViewOrSpecificView' type='text' value='71' class = 'hide' size = '5'/></td></tr><tr><tr><td><input type='submit' value='�鿴��Ա��Ϣ' class = 'btn'/></td><td><input type= 'button' value = '����' onclick='window.history.go(-1)' class = 'btn'></td></tr></table></form><div>");
    } 
    else if(genealViewOrSpecificView == 72){
    	/* out.print("����ȫ���Ѿ���֤��"); */
    	List<Customer> customersInfolList = (List<Customer>)request.getAttribute("customersInfolList");
    	if(customersInfolList != null){
    	%>
    	<div class='tab1'>
    	 <form action='' method='post'>
    		<table border="1">
    		<tr>
    			<td>��Աid</td>
    			<td>��Ա��</td>
    			<td>��ϵ�绰</td>
    			<td>�ջ���ַ</td>
    			<td>�Ƿ�ͨ����֤��0����;1���ǣ�</td>
    		</tr>
    		<%
    		for(Customer customers:customersInfolList){
    		 %>
    	 		
    	 		<tr>
    	 			<td ><%=customers.getId()%></td>
    	 			<td ><%=customers.getName()%></td>
    	 			<td ><%=customers.getPhone()%></td>
    	 			<td><%=customers.getDeliveryAddress()%></td>
    	 			<td ><%=customers.getIsValidCustomer()%></td>
    	 			
    	 		</tr>
    	 	<%
    	 	} %>	
    	 	</table>
    	 </form>
    	</div>
    	 		
    	 	<%	
    		}
    	
    } 
    else if(genealViewOrSpecificView == 8){
    	out.print("<form action='./servlet/OperatorDeleteCustomer' method='post'><table><tr><td><input name = 'operatorIdToDelCus' type='text' value='"+session.getAttribute("userId")+"' class = 'hide' size = '5'/></td><td><input name = 'operatorIdtenToDelCus' type='text' value='"+session.getAttribute("userIdentity")+"' class = 'hide' size = '5'/></td><td><input name = 'GenealViewOrSpecificView' type='text' value='81' class = 'hide' size = '5'/></td></tr><tr><td>��Աid:</td><td colspan='2'><input name = 'cusid' type='text' class = '' size = '30'/></td></tr><tr><td>Ȩ������:</td><td colspan='2'><input name = 'authpsw' type='password' class = '' size = '30'/></td></tr><tr><td><input type='submit' value='ɾ��' class = 'btn'/></td><td><input type= 'button' value = '����' onclick='window.history.go(-1)' class = 'btn'></td></tr></table></form>");
   
    }
    else if(genealViewOrSpecificView == 82){
    	out.print("<div class='tab1'>ɾ����Ա��Ϣ�ɹ���</div>");
   
    }
     
       /* ��Ӫ��ͬ�����ݿ���Ϣ-��Ա */
    else if(genealViewOrSpecificView == 9){
    
    	 out.print("<div class='tab1'><form action='./servlet/Synchronize' method='post'><table><tr><td><input name = 'operatorIdToSynCus' type='text' value='"+session.getAttribute("userId")+"' class = 'hide' size = '5'/></td><td><input name = 'operatorIdtenToSynCus' type='text' value='"+session.getAttribute("userIdentity")+"' class = 'hide' size = '5'/></td><td><input name = 'GenealViewOrSpecificView' type='text' value='91' class = 'hide' size = '5'/></td></tr><tr><tr><td><input type='submit' value='ͬ��' class = 'btn'/></td><td><input type= 'button' value = '����' onclick='window.history.go(-1)' class = 'btn'></td></tr></table></form></div>");
     } 
     /*��Ӫ��ͬ����Ա��Ϣ����Ӫ�̱�-���  */
    else if(genealViewOrSpecificView == 92){
    	 out.print("<div class='tab1'>ͬ���ɹ���</div>"); 
    
    } 
    /* ��Ӫ�̲�ѯ������Ϣ */
    else if(genealViewOrSpecificView == 10){
    	out.print("<div class='tab1'><form action='./servlet/OperatorManSelf' method='post'><table><tr><td><input name = 'id' type='text' value='"+session.getAttribute("userId")+"' class = 'hide' size = '5'/></td><td><input name = 'iden' type='text' value='"+session.getAttribute("userIdentity")+"' class = 'hide' size = '5'/></td><td><input name = 'reqcode' type='text' value='101' class = 'hide' size = '5'/></td></tr><tr><tr><td><input type='submit' value='��ѯ' class = 'btn'/></td><td><input type= 'button' value = '����' onclick='window.history.go(-1)' class = 'btn'></td></tr></table></form>");
   
    }
    /*��Ӫ�̲�ѯ������Ϣ-���  */
    else if(genealViewOrSpecificView == 102){
    	
    	List<Operator> info = (List<Operator>)request.getAttribute("info");
    	Operator operator = null;
    	for(Operator op:info){
    		operator = op;
    	}
    	%>
    	<div class='tab1'>
    	<table border="1">
			<tr>
				<td>id��</td>
				<td><%=operator.getOperatorId()%></td>
			</tr>
			<tr>
				<td>������</td>
				<td><%=operator.getOperatorName()%></td>
			</tr>
			<tr>
				<td>���룺</td>
				<td><%=operator.getOperatorPsw()%></td>
			</tr>
			<tr>
				<td>Ȩ�����룺</td>
				<td><%=operator.getOperatingAuthorityPsw()%></td>
			</tr>
			<tr>
				<td>ӵ�еĹ˿�id��</td>
				<td><%=operator.getCustomers()%></td>
			</tr>
			<tr>
				<td>Ӫҵ�</td>
				<td><%=operator.getTurnover()%></td>
			</tr>
		</table>
		</div>
    	<%
    }
    /* ��Ӫ���޸ĸ�����Ϣ */
    else if(genealViewOrSpecificView == 11){
    	out.print("<div class='tab1'><form action='./servlet/OperatorManSelf' method='post'><table><tr><td><input name = 'id' type='text' value='"+session.getAttribute("userId")+"' class = 'hide' size = '40'/></td><td><input name = 'iden' type='text' value='"+session.getAttribute("userIdentity")+"' class = 'hide' size = '40'/></td><td><input name = 'reqcode' type='text' value='111' class = 'hide' size = '30'/></td></tr><tr><td>������</td><td colspan='2'><input name = 'name' type='text' class = '' size = '30'/></td></tr><tr><td>���룺</td><td colspan='2'><input name = 'psw' type='password' class = '' size = '30'/></td></tr><tr><td>ȷ�����룺</td><td colspan='2'><input name = 'confpsw' type='password' class = '' size = '30'/></td></tr><tr><td>Ȩ�����룺</td><td colspan='2'><input name = 'authpsw' type='password' class = '' size = '30'/></td></tr><tr><td>ȷ��Ȩ�����룺</td><td colspan='2'><input name = 'confauthpsw' type='password' class = '' size = '30'/></td></tr><tr><td>��Աid��</td><td colspan='2'><input name = 'cus' type='text' class = '' size = '30'/></td></tr><tr><td><input type='SUBMIT' value='ȷ��' class = 'btn'/></td><td><input type= 'button' value = 'ȡ��' onclick='PersonalHomePageOperator.jsp' class = 'btn'></td></tr></table></form></div>");
    	
    }
    /*��Ӫ���޸ĸ�����Ϣ-���  */
    else if(genealViewOrSpecificView == 112){
    	out.print("<div class='tab1'>�ɹ���</div>");
   
    }
    /*��ѯ�������޸Ķ���״̬  */
    else if(genealViewOrSpecificView == 121){
    	
    	OperatorManagementService operatorManagementService = new OperatorManagementService();
    	
    	List<Order> ordersList =  operatorManagementService.queryOrders();
    	%>
    	<table border="2">
	  		<tr>
	  			<td>������</td>
	  			<td>�˿�id</td>
	  			<td>�˿�����</td>
	  			<td>�˿��ջ���ַ</td>
	  			<td>�˿��ֻ�����</td>
	  			<td>��Ʒ���飨���ﳵid��</td>
	  			<td>����״̬</td>
	  			<td>��ݷ�ʽ</td>
	  			<td>��ݷ���</td>
	  			<td>֧����ʽ</td>
	  			<td>���Ա</td>
	  			<td>���Ա��ϵ�绰</td>
	  			<td>��Ʊ���ͺ���Ϣ</td>
	  			<td>�ϼ�</td>
	  			<td></td>
	  		</tr>
  			
  		
  		<%
  		Order currentOrder = null;
  		List<Order> currentOrders = null;
  		CartService cartService = new CartService();
  		
  		int idofgoods = -1;
  		for(Order order:ordersList){
    		currentOrder = order;
    		
  		 %>
  		<tr>
  			<td><%=currentOrder.getId() %></td>
  			<td><%=currentOrder.getCustomerID() %></td>
  			<td><%=currentOrder.getCustomerName() %></td>
  			<td><%=currentOrder.getCustomerAddress() %></td>
  			<td><%=currentOrder.getCustomerPhone() %></td>
  			<td><a href = "customertBoughtGoodsInfo.jsp?idOfgoods=<%=idofgoods %>&idofcart=<%=currentOrder.getIdOfCart()%>"><%=currentOrder.getIdOfCart() %></a></td>
  			<td><%=currentOrder.getStatus() %></td>
  			<td><%=currentOrder.getExpressMode() %></td>
  			<td><%=currentOrder.getExpressCharge() %></td>
  			<td><%=currentOrder.getPayMode() %></td>
  			<td><%=currentOrder.getExpressWorker() %></td>
  			<td><%=currentOrder.getExpressWorkerPhone() %></td>
  			<td><%=currentOrder.getInvoiceStypeAndInfo() %></td>
  			<td><%=currentOrder.getTotalMoney() %></td>
  			<% 
  			if(currentOrder.getStatus().equals(new String("�ȴ���Ҹ���"))){
  			%>
  				<td><a>�ȴ���Ҹ���</a></td>
  			<% 
  			}
  			else if(currentOrder.getStatus().equals(new String("����Ѹ���ȴ�ƽ̨ȷ��"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=2">����</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("�����ѷ���"))){
  			%>
  			
  				<td><a>�ȴ�����ջ�</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("������ջ�"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=4">���׳ɹ����رս���</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("���׳ɹ����رս���"))){
  			%>
  			
  				<td><a>���׳ɹ����رս���</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("��������˻�"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=5&caozuo=tuihuo">��������ˡ���������</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("������뻻��"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=5&caozuo=huanhuo">��������ˡ���������</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("���ȡ������"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=">����ȡ����������</a></td>
  			<%
  			}
			%>  			
  		</tr>
  		<%
  		}
  		%>
  		</table>
    	<%
   }
   }
     %>
     <!-- <table><tr><td colspan='2'></td></tr></table> -->
  </body>
</html>
