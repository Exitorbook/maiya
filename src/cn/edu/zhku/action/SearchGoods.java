package cn.edu.zhku.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.enterprise.inject.New;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.zhku.model.Goods;
import cn.edu.zhku.service.SearchService;

public class SearchGoods extends HttpServlet {

	SearchService searchService = new SearchService();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("GB2312");
		String search = request.getParameter("sort");
		System.out.println("class = " + request.getParameter("sort"));
		
		List<Goods> goodsList = null;
		try {
			if (search.equals(new String("sb"))) {
				search = "���";
			}
			else if (search.equals(new String("jp"))) {
				search = "����";
				
			}
			else if (search.equals(new String("xsq"))) {
				search = "��ʾ��";
				
			}
			else if (search.equals(new String("yxsb"))) {
				search = "�ֱ�";
				
			}
			else if (search.equals(new String("nc"))) {
				search = "�ڴ�";
				
			}
			else if (search.equals(new String("zb"))) {
				search = "����";
				
			}
			else if (search.equals(new String("yp"))) {
				search = "Ӳ��";
				
			}
			else if (search.equals(new String("xk"))) {
				search = "�Կ�";
				
			}
			else if (search.equals(new String("jx"))) {
				search = "����";
				
			}
			else if (search.equals(new String("cpu"))) {
				search = "cpu";
				
			}
			
			goodsList = searchService.searchGoodsList(search);
			
			System.out.println("1st" + goodsList.get(0).getName());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session=request.getSession(true);
		session.setAttribute("goodsList", goodsList);
		//��ת��ע��ɹ�ҳ��
		request.getRequestDispatcher("../search.jsp").forward(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("GB2312");
		String search = request.getParameter("search");
		
		System.out.println("search" + search);
		List<Goods> goodsList = null;
		try {
			if (search.endsWith(new String("�ֱ�")) || search.equals(new String("��Ϸ�ֱ�"))) {
				goodsList = searchService.searchGoodsList("�ֱ�");
				
			}else {
				
				goodsList = searchService.searchGoodsList(search);
			}
			
			System.out.println("1st" + goodsList.get(0).getName());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session=request.getSession(true);
		session.setAttribute("goodsList", goodsList);
		//��ת��ע��ɹ�ҳ��
		request.getRequestDispatcher("../search.jsp").forward(request, response);
		
	}

}
