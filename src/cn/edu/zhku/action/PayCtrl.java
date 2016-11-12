package cn.edu.zhku.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PseudoColumnUsage;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhku.dao.UserDao;
import cn.edu.zhku.model.Customer;
import cn.edu.zhku.service.CartService;

public class PayCtrl extends HttpServlet {

	CartService cartService = new CartService();
	
	UserDao userDao = new UserDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		if(request.getParameter("paypsw") != null && request.getParameter("id") != null 
//				&& request.getParameter("identity") != null && request.getParameter("idoforder") != null
//				&& request.getParameter("reqcode") != null ){
//				System.out.println("PayCtrl   Servlet��,paypsw = " + request.getParameter("payPsw") + "\n��Աid = "+request.getParameter("userId") 
//				+ "\n��� = " +request.getParameter("userIdentity") + 
//				"\n�ܼ� = " +request.getParameter("totalMoney") +
//				"\nrequestCode = " + request.getParameter("reqcode")
//				+"\n����id = " + request.getParameter("orderId")); 
					List<Customer> customers = null;
					try {
						customers = (List<Customer>)userDao.query(request.getParameter("userIdentity"), Integer.parseInt(request.getParameter("userId")), 0);
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
					Customer customer = null;
					for (Customer cus : customers) {
						customer = cus;
					}
					String paypsw = customer.getPayPsw();
					double balance = customer.getBalance();
					
//					System.out.println("read from customer.payPsw = " + paypsw+"\nbalance = " + balance);
					
					if (paypsw.equals(new String(request.getParameter("payPsw")))) {
						try {
							if(cartService.editCustomerBalance(Integer.parseInt(request.getParameter("userId")),
									Double.parseDouble(request.getParameter("totalMoney")),0)){
								System.out.println("����1");
								String status = cartService.readOrderStatus(Integer.parseInt(request.getParameter("orderId")));
								System.out.println("����2");
								if (cartService.editOrderStatus(Integer.parseInt(request.getParameter("orderId")),status)){
									System.out.println("����3");
									 if(request.getParameter("delCart") != null){
										 System.out.println("����4");
										if(request.getParameter("delCart").equals(new String("true"))){
											System.out.println("����5");
											  CartService cartService = new CartService();
											  int cartId = cartService.readCartIdInOrderStatus(Integer.parseInt(request.getParameter("orderId")));
											  System.out.println("����6");
//											  System.out.println("cartid11111111111111111111111111 =" + cartId);
//											  System.out.println("userId = " + request.getParameter("userId"));
											  if(cartService.CustomerDelCart(Integer.parseInt(request.getParameter("userId")), cartId, 0)){
												  System.out.println("����7");
															
												RequestDispatcher rd = request.getRequestDispatcher( "../PaySuccess.jsp" );
												rd.forward( request, response);
											  }
										}
									}
								}
							}	
							else if (userDao.editCustomerBalance(Integer.parseInt(request.getParameter("userId")),
								Double.parseDouble(request.getParameter("totalMoney")),0) == -1) {
								request.setAttribute("orderId",request.getParameter("orderId"));
								request.setAttribute("payPsw",request.getParameter("payPsw"));
								request.setAttribute("totalMoney",request.getParameter("totalMoney"));
								request.setAttribute("balance",balance);
//							request.setAttribute("GenealViewOrSpecificView", new Integer(6));
													
								RequestDispatcher rd = request.getRequestDispatcher( "../Chongzhi.jsp" );
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