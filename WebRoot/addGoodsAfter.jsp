<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addGoodsAfter.jsp' starting page</title>
    
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
  
<table border="0" align="center" width="55%">
<caption><font size="5" color="black">��Ʒ��ӳɹ�</font></caption>
<tr>
<td >��Ʒ��ţ�</td>
<td ><label id="A1"><jsp:getProperty name="servletShop" property="goodsID"/></label>
</td>
</tr>

<tr>
<td >��Ʒ���ƣ�</td>
<td ><label id="A2"><jsp:getProperty name="servletShop" property="goodsName"/></label>
</td>
</tr>

<tr>
<td width="116" height="45">��Ʒ�۸�</td>
<td width="289" height="45">
<label id="A3"><jsp:getProperty name="servletShop" property="goodsPrice"/></label></input>
</td>
</tr>

<tr>
<td width="116" height="45">��������</td>
<td width="50" height="45">
<label id="A4"><jsp:getProperty name="servletShop" property="goodsIN"/></label>
</td>
</tr>

<tr>
<td width="116" height="45">��ע��</td>
<td width="289" height="45"><textarea name="beizhu" cols="50" rows="10"><jsp:getProperty name="servletShop" property="beizhu"/></textarea></td>
</tr>
<tr>
<td></td>
<td><a href="AddGoods.jsp"><input type="button" value="���������Ʒ"/></a></td>
</table>
</form>
  </body>
</html>
