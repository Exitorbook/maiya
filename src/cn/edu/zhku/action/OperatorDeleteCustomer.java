package cn.edu.zhku.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.model.Customer;
import cn.edu.zhku.service.OperatorManagementService;

public class OperatorDeleteCustomer extends HttpServlet {

	OperatorManagementService operatorManagementService = new OperatorManagementService();
	//��ʾɾ����Ա����
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		./servlet/OperatorDeleteCustomer?requestCode=byId
		
		if (request.getParameter("requestCode") != null) {
			if (request.getParameter("requestCode").equals(new String("byId"))) {
				request.setAttribute("GenealViewOrSpecificView", new Integer(8));
				RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
				rd.forward( request, response);
			}
		}
	}

	//��Ӫ�������Աid��ɾ��֮
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		OperatorManagementService operatorManagementService = new OperatorManagementService();
		
		//������
//		��ݣ�operatorIdtenToDelCus��
//		��Ӫ��id:operatorIdToDelCus��
//		��Աid:cusid
//		Ȩ�����룺authpsw��
//		�����룺GenealViewOrSpecificView
		
		//���
		String opidentity = null;
		if (request.getParameter("operatorIdtenToDelCus") != null) {
			opidentity = request.getParameter("operatorIdtenToDelCus");
		}
		
		//id
		String operatorid =null;
		if(request.getParameter("operatorIdToDelCus") != null){
			
			operatorid = request.getParameter("operatorIdToDelCus");
		}
		
		//��Աid
		String cusid = null;
		if (request.getParameter("cusid") != null) {
			
			cusid = request.getParameter("cusid");
		}
		
		
		//��Ӫ�������Ȩ������
		String operatingAuthorityPsw = null;
		if (request.getParameter("authpsw") != null) {
			operatingAuthorityPsw = request.getParameter("authpsw");
			
		}
		
		//���������
		int GenealViewOrSpecificView = -2;
		if((request.getParameter("GenealViewOrSpecificView") != null)){
			GenealViewOrSpecificView = Integer.parseInt(request.getParameter("GenealViewOrSpecificView"));
		}
		
//		��Ӫ��ͨ��idɾ��cus��Ϣ�Ľ��� - ����1
//		��Ӫ������cus-idɾ������
//		����
		
//		if (GenealViewOrSpecificView == -3) {
//			if (request.getParameter("operatorIdToDelCus") != null && request.getParameter("operatorIdtenToDelCus") != null && request.getParameter("cusid") != null) {
//					boolean flag = false;
//					try {
//						flag = operatorManagementService.OperatorDeleteOthersInfo(opidentity, cusid,operatorid,2);
//					} catch (NumberFormatException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					} catch (ClassNotFoundException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					} catch (SQLException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					}
//					
//					if (flag) {
//						request.setAttribute("GenealViewOrSpecificView", new Integer(-3));
//						RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
//						rd.forward( request, response);
//					}
//			}		
//		}
		/*��Ӫ���ڵ���������--��ɾ��--����������Ȩ���������*/
		
		if (GenealViewOrSpecificView == 81) {
			
					//��֤��Ӫ�̵�֧������
					boolean authpsw = false;
					try {
						authpsw = operatorManagementService.QueryAuthorityPsw(operatingAuthorityPsw, opidentity, Integer.parseInt(operatorid), 0);
					} catch (NumberFormatException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					} catch (ClassNotFoundException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					if (authpsw) {
						boolean customersInfolList =  false;
						try {
							customersInfolList = operatorManagementService.OperatorDeleteOthersInfo(opidentity, cusid, operatorid,2);
							if (customersInfolList) {
								request.setAttribute("GenealViewOrSpecificView", new Integer(82));
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
					
			
				
						
			
		}
		
	}
}
