<%@page import="cn.edu.zhku.model.Cart"%>
<%@page import="cn.edu.zhku.dao.UserDao"%>
<%@page import="cn.edu.zhku.model.Order"%>
<%@page import="cn.edu.zhku.service.CartService"%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'CustomerOrder.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<div>��������</div>
  	<table border="2">
<%--    <a href="CustomerOrder.jsp?customerId=<%=cart.getIdOfCustomer() %>&idOfCart=<%=cart.getIdOfCart()%>">
		�¶���
	</a>   --%>
	<%!CartService cartService = new CartService();
		UserDao userDao = new UserDao();
		int idofgoods = -1;
		Order currentOrder = null;
	 %>
  	<%
	if(request.getParameter("customerId") != null 
		&& request.getParameter("idOfCart") != null
		&& request.getParameter("idofgoods") != null
		&& request.getParameter("numofgoods") != null
		&& request.getParameter("totalmoney") != null){
		
			String customerId = request.getParameter("customerId");
			String idOfCart = request.getParameter("idOfCart");
			String idofgoods = request.getParameter("idofgoods");
			String numofgoods = request.getParameter("numofgoods");
			String totalmoney = request.getParameter("totalmoney");
			
			out.print(customerId + " " + idOfCart + " " + idofgoods + " " + numofgoods + " " + totalmoney);
			
			if(cartService.CustomerAddOrder(Integer.parseInt(customerId), Integer.parseInt(idOfCart))){
		
		
		
				if(cartService.CartAddToGoodsInTransit(Integer.parseInt(customerId) ,
					 Integer.parseInt(idOfCart), Integer.parseInt(idofgoods), 
						Integer.parseInt(numofgoods), Double.parseDouble(totalmoney))){
				
		  	
		  			if(cartService.CustomerDelCart(0, Integer.parseInt(idOfCart), 1)){ 
		  	 	%>
		  			<div>�ɹ��ύ������</div>
		  
		  		<%
		  			}
				}
	  		}
	  	}
  	 %>
	<%   	 
  	 
    if(request.getParameter("customerId") != null 
    	&& request.getParameter("idOfCart") != null){
    	
   		String customerId = request.getParameter("customerId");
		String idOfCart = request.getParameter("idOfCart");
		
   		List<Order> currentOrders = cartService.CustomerQueryOrder(Integer.parseInt(customerId),Integer.parseInt(idOfCart));
    	
    	
    	
     %>
   	
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
  		for(Order order:currentOrders){
    		currentOrder = order;
    		
  		 %>
  		<tr>
  			<td><%=currentOrder.getId() %></td>
  			<td><%=currentOrder.getCustomerID() %></td>
  			<td><%=currentOrder.getCustomerName() %></td>
  			<td><%=currentOrder.getCustomerAddress() %></td>
  			<td><%=currentOrder.getCustomerPhone() %></td>
  			<%
  				idofgoods = userDao.readGoodsInTransit(Integer.parseInt(customerId),Integer.parseInt(idOfCart)).get(0).getIdOfGoods();
  			 %>
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
  				<td><a href = "pay.jsp?idoforder=<%=currentOrder.getId()%>&requestCode=0">����</a></td>
  			<% 
  			}
  			else if(currentOrder.getStatus().equals(new String("����Ѹ���ȴ�ƽ̨ȷ��"))){
  			%>
  			
  				<td><a href = "pay.jsp?idoforder=<%=currentOrder.getId()%>&requestCode=1">����Ѹ���ȴ�ƽ̨ȷ��</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("�ȴ�����"))){
  			%>
  			
  				<td><a href = "pay.jsp?idoforder=<%=currentOrder.getId()%>&requestCode=2">�ȴ�����</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("ȷ���ջ�"))){
  			%>
  			
  				<td><a href = "pay.jsp?idoforder=<%=currentOrder.getId()%>&requestCode=3">�ȴ����ȷ���ջ�</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("��ȷ���ջ���ȥ����"))){
  			%>
  			
  				<td><a href = "pay.jsp?idoforder=<%=currentOrder.getId()%>&requestCode=4">��ȷ���ջ���ȥ����</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("���׳ɹ�"))){
  			%>
  			
  				<td><a href = "pay.jsp?idoforder=<%=currentOrder.getId()%>&requestCode=5">���׳ɹ�</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("�����ˡ�����"))){
  			%>
  			
  				<td><a href = "pay.jsp?idoforder=<%=currentOrder.getId()%>&requestCode=6">�����ˡ�����</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("ȡ������"))){
  			%>
  			
  				<td><a href = "pay.jsp?idoforder=<%=currentOrder.getId()%>&requestCode=7">ȡ������</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("�����ۺ�"))){
  			%>
  			
  				<td><a href = "pay.jsp?idoforder=<%=currentOrder.getId()%>&requestCode=8">�����ۺ�</a></td>
  			<%
  			}
  			%> 
  			
  		</tr>
  		
  		<%
  		}
  		%>
  		<tr>
  			<td colspan="2">��������������</td>
  			<td colspan="13"></td>
  		</tr>
  		<%
  		List<Order> currentOtherOrders = cartService.CustomerQueryOrder(Integer.parseInt(customerId),0);
    	
    	for(Order order:currentOtherOrders){
    		currentOrder = order;
    		if(currentOrder.getIdOfCart() == Integer.parseInt(idOfCart)){
    			continue;
    		}
    	
    	%>
    	<tr>
  			<td><%=currentOrder.getId() %></td>
  			<td><%=currentOrder.getCustomerID() %></td>
  			<td><%=currentOrder.getCustomerName() %></td>
  			<td><%=currentOrder.getCustomerAddress() %></td>
  			<td><%=currentOrder.getCustomerPhone() %></td>
  			<%
  				idofgoods = userDao.readGoodsInTransit(Integer.parseInt(customerId),Integer.parseInt(idOfCart)).get(0).getIdOfGoods();
  			 %>
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
  				if(currentOrder.getStatus().equals(new String("����Ѹ���"))){
  			%>
  				<td><a href = "fahuo.jsp">����</a></td>
  			<% 
  			}
  			else if(currentOrder.getStatus().equals(new String("����Ѹ���ȴ�ƽ̨ȷ��"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=1">����Ѹ���ȴ�ƽ̨ȷ��</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("�ȴ�����"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=2">�ȴ�����</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("ȷ���ջ�"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=3">�ȴ����ȷ���ջ�</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("��ȷ���ջ���ȥ����"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=4">��ȷ���ջ���ȥ����</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("���׳ɹ�"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=5">���׳ɹ�</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("�����ˡ�����"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=6">�����ˡ�����</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("ȡ������"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=7">ȡ������</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("�����ۺ�"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=8">�����ۺ�</a></td>
  			<%
  			}
  			%>
  			
		</tr>
    	
    	
    	<%
    		}
  		} 
  		else if(session.getAttribute("userIdentity")!=null&&
  			session.getAttribute("userName")!=null&&
  			session.getAttribute("userId")!=null){
  		
  			%>
  			
  			
  			
  			
  			<%
  		List<Order> currentOtherOrders = cartService.CustomerQueryOrder(0,0);
  		if(currentOtherOrders != null){
    		out.print("currentOtherOrders != null");
    	}
    	for(Order order:currentOtherOrders){
    		currentOrder = order;
    	%>
    	<tr>
  			<td><%=currentOrder.getId() %></td>
  			<td><%=currentOrder.getCustomerID() %></td>
  			<td><%=currentOrder.getCustomerName() %></td>
  			<td><%=currentOrder.getCustomerAddress() %></td>
  			<td><%=currentOrder.getCustomerPhone() %></td>
  			<%
  				idofgoods = userDao.readGoodsInTransit(currentOrder.getCustomerID(),currentOrder.getIdOfCart()).get(0).getIdOfGoods();
  			 %>
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
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&ididoforder=<%=currentOrder.getId()%>&requestCode=0">����</a></td>
  			<% 
  			}
  			else if(currentOrder.getStatus().equals(new String("����Ѹ���ȴ�ƽ̨ȷ��"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=1">����Ѹ���ȴ�ƽ̨ȷ��</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("�ȴ�����"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=2">�ȴ�����</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("ȷ���ջ�"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=3">�ȴ����ȷ���ջ�</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("��ȷ���ջ���ȥ����"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=4">��ȷ���ջ���ȥ����</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("���׳ɹ�"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=5">���׳ɹ�</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("�����ˡ�����"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=6">�����ˡ�����</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("ȡ������"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=7">ȡ������</a></td>
  			<%
  			}
  			else if(currentOrder.getStatus().equals(new String("�����ۺ�"))){
  			%>
  			
  				<td><a href = "pay.jsp?id=<%=session.getAttribute("userId") %>&identity=<%=session.getAttribute("userIdentity ")%>&idoforder=<%=currentOrder.getId()%>&requestCode=8">�����ۺ�</a></td>
  			<%
  			}
  			%>
  			
		</tr>
    	
    	
    	<%
    		}
  			
  			
  			%>
  			
  			
  			<% 
  		}
  		
  		%>
   
  	</table>
  </body>
</html>
