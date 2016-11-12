package cn.edu.zhku.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.service.OperatorManagementService;

public class OperatorDeleteShop extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		��Ӫ��ͨ��idɾ��������Ϣ�Ľ��� - ����1
//		./servlet/OperatorDeleteShop?requestCode=byId
		String reqCode = null;
		if (request.getParameter("requestCode") != null) {
			
			reqCode = request.getParameter("requestCode");
		}
		
//		request.setAttribute("GenealViewOrSpecificView", new Integer(3));
//		request.setAttribute("shopCurrentId_deleteShop", shopCurrentId_deleteShop);
		if (reqCode.equals("byId")) {
			request.setAttribute("GenealViewOrSpecificView", new Integer(4));
			RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
			rd.forward( request, response);
		}
		
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		OperatorManagementService operatorManagementService = new OperatorManagementService();
		
		String operatorid =null;
		if(request.getParameter("operatorIdForDeleteShops") != null){
			
			operatorid = request.getParameter("operatorIdForDeleteShops");
		}
		
		
		String userIdentity = request.getParameter("userIdentity");
		
		String shopCurrentId_deleteShop = request.getParameter("shopCurrentId_deleteShop");
		
//		��Ӫ�������Ȩ������
		String operatingAuthorityPsw = request.getParameter("operatingAuthorityPsw");
		int GenealViewOrSpecificView = -2;
		if((request.getParameter("GenealViewOrSpecificView") != null)){
			GenealViewOrSpecificView = Integer.parseInt(request.getParameter("GenealViewOrSpecificView"));
		}
		
		
		
//		��Ӫ��ͨ��idɾ��������Ϣ�Ľ��� - ����1
//		��Ӫ���������idɾ������
//		����
//		operatorIdToDelShop
//		operatorIdtenToDelShop
		
		if (GenealViewOrSpecificView == 41) {
			if (request.getParameter("operatorIdToDelShop") != null && request.getParameter("operatorIdtenToDelShop") != null && request.getParameter("shopid") != null) {

				userIdentity = request.getParameter("operatorIdtenToDelShop");
				shopCurrentId_deleteShop = request.getParameter("shopid");
				operatorid = request.getParameter("operatorIdToDelShop");
				
				System.out.println("id ����� ��Ҫɾ���ĵ���id��" + request.getParameter("operatorIdToDelShop") + "   " + request.getParameter("operatorIdtenToDelShop") + "   " + request.getParameter("shopid"));			}
			
				try {
					boolean flag_deleteShopInfoInShopTable = operatorManagementService.OperatorDeleteOthersInfo(userIdentity, shopCurrentId_deleteShop,operatorid,1);
					
					if (flag_deleteShopInfoInShopTable) {
						request.setAttribute("GenealViewOrSpecificView", new Integer(31));
						RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
						rd.forward( request, response);
					}
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
		
		//����Ӫ����ҳ����Ӫ������Ȩ�����룬ɾ��������Ϣ
		else if(GenealViewOrSpecificView == 3){
			if(operatingAuthorityPsw != null){
				System.out.println("��opdeshop���棬��ݣ�" + userIdentity + "  ��ǰ����id:" +shopCurrentId_deleteShop +"   Ȩ�����룺"+operatingAuthorityPsw + "  �����루3������" + GenealViewOrSpecificView);
				try {
					boolean flag_deleteShopInfoInShopTable = operatorManagementService.OperatorDeleteOthersInfo(userIdentity, shopCurrentId_deleteShop,operatorid,1);
					/*ɾ�����ݿ�����ع����ļ�¼��������->������*/
					//��֤Ȩ������
	//				boolean flag_authPsw = operatorManagementService.OperatorDeleteOthersInfo(identity, CurrentId, operatorid, requsetCode)
					if (flag_deleteShopInfoInShopTable) {
						request.setAttribute("GenealViewOrSpecificView", new Integer(31));
						RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
						rd.forward( request, response);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
			}
			
			
		}
		/*��Ӫ���ڵ���������--��ɾ��--����������Ȩ���������*/
		else if(request.getParameter("GenealViewOrSpecificView") == null){
			
			
		
		
			
			request.setAttribute("userIdentity", userIdentity);
			request.setAttribute("GenealViewOrSpecificView", new Integer(3));
			request.setAttribute("shopCurrentId_deleteShop", shopCurrentId_deleteShop);
			
			RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
			rd.forward( request, response);
		}
			
			
			
	}

}
