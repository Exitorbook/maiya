<%@ page language="java" import="java.util.*,cn.edu.zhku.service.ChongzhiService" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��ֵҳ��</title>
    
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
  }
  %>
    <%
    ChongzhiService chongzhiService = new ChongzhiService();
    
   	 	if(chongzhiService.isValidCustomer((Integer)session.getAttribute("userId"),
   	 		(String)session.getAttribute("userIdentity"),request.getParameter("payPsw"))){
     %>
     
     <form action="./servlet/ChongzhiDaoZhanghu" method="post" class="tab2">
     <table> 
     
     	<tr class="hide" ><td></td><td><input type="text" name="orderId" class="hide" value="<%=request.getAttribute("orderId")%>"/></td></tr>
     	<tr class="hide" ><td></td><td><input type="text" name="userId" class="hide" value="<%=session.getAttribute("userId")%>"/></td></tr>
     	<tr class="hide" ><td></td><td><input type="text" name="userIdentity" class="hide" value="<%=session.getAttribute("userIdentity")%>"/></td></tr>
     	<tr class="hide" ><td></td><td><input type="text" name="totalMoney" class="hide" value="<%=request.getParameter("totalMoney")%>"/></td></tr>
     	<tr><td>��ǰ���Ϊ:<%=request.getAttribute("balance") %>,���ֵ��</td><td></td></tr>
     	<tr><td>��ѡ��֧����ʽ:</td>
     	
     	<td>
     	<select name="chongzhifangshi" class="">
			<option value="zhifubao">֧����</option>
			<option value="weixin">΢��</option>
		</select>
     	</td>
     	
     	</tr>
     	<tr><td>��ֵ���:</td><td><input type="text" name="money" value="" size="40"/></td></tr>
     	<tr><td>֧������:</td><td><input type="password" name="payPsw" value="" size="40"/></td></tr>
     	<tr><td><input type="submit" name="" value="ȷ��"/></td><td><input type="button" name="" value="����" onclick=""/></td></tr>
     	<tr></tr>
     </table>
     </form>
     
     <%
     
     }
    
     /* �ڸ�����ҳ��ֵ */
     else{
      %>
      
      <form action="./servlet/ChongzhiDaoZhanghu" method="post">
     <table>
     
     	<tr class="hide"><td>��ֵλ��</td><td><input type="text" name="position" value="personalHomePage"/></td></tr>
     	<tr class="hide"><td>����id</td><td><input type="text" name="orderId" value="<%=request.getAttribute("orderId")%>"/></td></tr>
     	<tr class="hide"><td>�û�id</td><td><input type="text" name="userId" value="<%=session.getAttribute("userId")%>"/></td></tr>
     	<tr class="hide"><td>���</td><td><input type="text" name="userIdentity" value="<%=session.getAttribute("userIdentity")%>"/></td></tr>
     	<tr class="hide"><td>�ܼ�</td><td><input type="text" name="totalMoney" value="<%=request.getParameter("totalMoney")%>"/></td></tr>
     	<tr><td>��ѡ��֧����ʽ:</td>
     	
     	<td>
     	<select name="chongzhifangshi" class="">
			<option value="zhifubao">֧����</option>
			<option value="weixin">΢��</option>
		</select>
     	</td>
     	
     	</tr>
     	<tr><td>��ֵ���:</td><td><input type="text" name="money" value="" size="40"/></td></tr>
     	<tr><td>֧������:</td><td><input type="password" name="payPsw" value="" size="40"/></td></tr>
     	<tr><td><input type="submit" name="" value="ȷ��"/></td><td><input type="button" name="" value="����" onclick="javascript:history.back(-1);"/></td></tr>
     	<tr></tr>
     </table>
     </form>
      <%
       }
       %>
  </body>
</html>
