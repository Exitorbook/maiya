<%@ page language="java" import="java.util.*,cn.edu.zhku.control.goodsControl,java.sql.ResultSet" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goodsConcern.jsp' starting page</title>
    
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
   <table border="1" width="800" align="center">
   	<tr align="center">
   	<td>��Ʒ���</td>
   	<td>����</td>
   	<td>���</td>
   	<td>������</td>
   	<td>����</td>
   	<td>���</td>
   	<td>�۸�</td>
   	<td>����</td>
   	<td>��ɫ</td>
   	<td>��ʽ</td>
   	<td>���˵��</td>
   	<td>����</td>
   	</tr>
<%
goodsControl allSelect=new goodsControl();

ResultSet rs = allSelect.getAll();

 while(rs.next()) { 
 %>  <tr>
     <td><%=rs.getInt(1) %></td>
     <td><%=rs.getString(2) %></td>
     <td><%=rs.getString(3) %></td>
     <td><%=rs.getInt(4) %></td>
     <td><%=rs.getInt(5) %></td>
     <td><%=rs.getInt(6) %></td>
     <td><%=rs.getDouble(7) %></td>
     <td><%=rs.getString(8) %></td>
     <td><%=rs.getString(9) %></td>
     <td><%=rs.getString(10) %></td>
     <td><%=rs.getString(11) %></td>
     <td><%=rs.getString(12) %></td>
     </tr> 
  <% } %>


   </table>
  </body>
</html>
