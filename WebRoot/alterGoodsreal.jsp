<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'alterGoodsreal.jsp' starting page</title>
    
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
  <jsp:useBean id="servletShop" class="cn.edu.zhku.entity.Goods" scope="session"/>
     <script type="text/javascript" src="check_alterGoods_Message.js"></script>
<form name="alterGoods" method="post" action="servlet/alterServlet" onsubmit="return check(alterGoods);">
<table border="0" align="center" width="60%">
<tr>
<td >��Ʒ��ţ�</td>
<td ><input type="text" name="goodsID" size="19" value="<jsp:getProperty name="servletShop" property="goodsID"/>" readonly>
</td>
</tr>

<tr>
<td >��Ʒ���ƣ�</td>
<td ><input type="text" name="goodsName" size="19" value="<jsp:getProperty name="servletShop" property="goodsName"/>"><label id="A2"></label>
</td>
</tr>

<tr>
<td width="116" height="45">��Ʒ�۸�</td>
<td width="289" height="45"><input type="text" name="goodsPrice" size="19" value="<jsp:getProperty name="servletShop" property="goodsPrice"/>">
<label id="A3"></label>
</td>
</tr>

<tr>
<td width="116" height="45">�������</td>
<td width="50" height="45"><input type="text" name="goodsLess" size="19" value="<jsp:getProperty name="servletShop" property="goodsLess"/>">
<label id="A4" color="red"></label>
</td>
</tr>

<tr>
<td width="116" height="45">��ע��</td>
<td width="289" height="45"><textarea name="beizhu" cols="50" rows="10" >
<jsp:getProperty name="servletShop" property="beizhu"/>
</textarea><label id="A7"></label></td>
</tr>
<tr height="40px">
					<td colspan="2" align="center">
						<input type="submit" name="submit" value="ȷ��" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" name="reset" value="�ָ�" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</table>
</form>
  </body>
</html>
