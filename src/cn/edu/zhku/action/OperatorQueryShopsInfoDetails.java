package cn.edu.zhku.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.enterprise.inject.New;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.dao.UserDao;
import cn.edu.zhku.model.Operator;
import cn.edu.zhku.model.ShopInfo;
import cn.edu.zhku.service.OperatorManagementService;

public class OperatorQueryShopsInfoDetails extends HttpServlet {

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		PrintWriter out = response.getWriter();
//		shopId-->���ڲ�ѯ��ǰ��Ʒ���飬������Ӫ����ҳ->��ѯ����->��ʾ��������->�������һ������->�鿴��������
		String shopId = request.getParameter("shopId");
		
//		����һ����������Ϣ
//		shopCurrentId_forlast
//		operatorId_forlast
		String shopCurrentId_forlast = request.getParameter("shopCurrentId_forlast");
		String operatorId_forlast = request.getParameter("operatorId_forlast");
		
		//"��һ��"������Ϣ
		String shopCurrentId = request.getParameter("shopCurrentId");
		String operatorId = request.getParameter("operatorId");
		
//		operatorId_queryTheLeft����ʾ��Ӫ����ҳ����ʾ����������id�ַ������÷ֺŷָ���,�����ó���������"���������Ϣ"��id,����������ʾ��3�����̵�id��
		String operatorId_queryTheLeft = request.getParameter("operatorId_queryTheLeft");
		System.out.println("\"��ѯ���������Ϣ\"��ť�У�������Servle�е���Ӫ��id:" + operatorId_queryTheLeft);
		
//		idsInshopInfos_queryTheLeft�����ڲ�ѯ����������飬������Ӫ����ҳ->��ѯ����->��ʾ��������->�Ա߾Ϳ��Ե��"�鿴���������ϸ��Ϣ"
		String idsInshopInfos_queryTheLeft = request.getParameter("idsInshopInfos_queryTheLeft");
		
		int shopID = 0;
		if (shopCurrentId != null) {
			
			shopID = Integer.parseInt(shopCurrentId);
		}
		
		OperatorManagementService operatorManagementService = new OperatorManagementService();
		
		//��ѯ��ǰ��Ʒ����
		try {
			//��ʾ������ĵ�����Ϣ
			if(shopId !=null){
				
				ShopInfo shopInfo = operatorManagementService.QueryShopsInfoDetails(Integer.parseInt(shopId));
				
				request.setAttribute("shopInfoDetails", shopInfo);
				request.setAttribute("GenealViewOrSpecificView", new Integer(1));
				
				RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
				rd.forward( request, response);
			}
			//��ʾ��һ��������Ϣ
			else if(shopCurrentId != null){
				
			    
				ShopInfo shopInfo = operatorManagementService.QueryNextShopInfoDetails(Integer.parseInt(operatorId),shopID);
				if(shopInfo != null){
					
					request.setAttribute("shopInfoDetails", shopInfo);
				}else if(shopInfo == null){
					
					request.setAttribute("shopInfoDetails", null);
				}
				request.setAttribute("GenealViewOrSpecificView", new Integer(2));
				RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
				rd.forward( request, response);
				
			}
			//��ʾ��һ��������Ϣ
			else if (shopCurrentId_forlast != null) {
				ShopInfo shopInfo = operatorManagementService.QueryLastShopInfoDetails(Integer.parseInt(operatorId_forlast),Integer.parseInt(shopCurrentId_forlast));
				if(shopInfo != null){
					
					request.setAttribute("shopInfoDetails", shopInfo);
				}else if(shopInfo == null){
					
					request.setAttribute("shopInfoDetails", null);
				}
				request.setAttribute("GenealViewOrSpecificView", new Integer(2));
				RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
				rd.forward( request, response);
			}
			//��ѯ�������
			else if (operatorId_queryTheLeft != null) {
				System.out.println("��ѯ������̲����У���������Ӫ��id(operatorId_queryTheLeft)��" + operatorId_queryTheLeft + "\n"
						+"�Ѿ���ʾ����Ӫ����ҳ�ϵĵ���id(idsInshopInfos_queryTheLeft)��"+ idsInshopInfos_queryTheLeft);
				List<ShopInfo> theRemainingshopIds = operatorManagementService.QueryTheRemainingShopInfoDetails(Integer.parseInt(operatorId_queryTheLeft), idsInshopInfos_queryTheLeft);
				request.setAttribute("theRemainingshopIds", theRemainingshopIds);
				request.setAttribute("GenealViewOrSpecificView", new Integer(2));
				RequestDispatcher rd = request.getRequestDispatcher( "../PersonalHomePageOperator.jsp" );
				rd.forward( request, response);
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
