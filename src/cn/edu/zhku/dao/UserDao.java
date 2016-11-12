package cn.edu.zhku.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.ldap.Rdn;

import cn.edu.zhku.DB.*;
import cn.edu.zhku.model.*;

public class UserDao {

	// ����
	/*
	public boolean add(User user, String identity) throws SQLException,
			IOException {
		Connection conn = null;

		String id = user.getId();
		String name = user.getName();
		String psw = user.getPsw();
		String sex = user.getSex();
		String age = user.getAge();
		String birthday = user.getBirthday();
		String note = user.getNote();
		// String pic = user.getAge();

		String sql = "";
		try {
			conn = DB.DBConn();

			if (identity.equals(new String("commonUser"))) {
				sql = "INSERT INTO user " + "VALUES(?,?,?,?,?,?,?)";
			} else if (identity.equals(new String("superUser"))) {
				sql = "INSERT INTO superuser " + "VALUES(?,?,?,?,?,?,?)";

			}
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, name);
			stmt.setString(3, psw);
			stmt.setString(4, sex);
			stmt.setString(5, age);
			stmt.setString(6, birthday);
			stmt.setString(7, note);
			// stmt.setString(8, pic);
			stmt.executeUpdate();

			DB.close(conn);
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}
*/
	// ɾ��
	/**
	 * ��������ɾ����ͨ�û���Ϣ
	 * 
	 * @param name
	 * @return
	 * @throws SQLException
	 */
	public boolean delelte(String id, int requestCode) throws SQLException {
		Connection conn = null;

		String sql = "";
		try {
			conn = DB.DBConn();
			// ��Աɾ���Լ����˺�
			if (requestCode == 0) {
				sql = "delete from customer where id = '" + id + "'";

			}
			// ����ɾ���Լ����˺�
			else if (requestCode == 1) {
				sql = "delete from seller where id = '" + id + "'";
			}
			// ���Ҳ���ɾ����Ա���˺�
			
			// ��Ӫ��ɾ����Ա��Ϣ
			else if (requestCode == 20) {
				sql = "delete from customer where id = '" + id + "'";
			}
			// ��Ӫ��ɾ��������Ϣ��������¼
			else if (requestCode == 21) {
				sql = "delete from seller where id = '" + id + "'";
			}
			//��Ӫ��ɾ�����ҵĵ�����Ϣ
			else if (requestCode == 210) {
//				�ο���UPDATE testmysql SET name = ?,sex = ?,birthday = ?"
//						+ ",note = ?,pic = ? where id = ?
				sql = "update seller set shopid = null where id = '" + id +"'";
			}
			// ��Ӫ��ɾ��������Ϣ
			else if (requestCode == 22) {
				sql = "delete from shop where id = '" + id + "'";
			}
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			DB.close(conn);
			return true;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * �˿�ɾ����Ϣ�����ﳵ���ȣ�
	 * @param customerId
	 * @param requestCode
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException 
	 */
	public boolean deleteByCustomer(int customerId, int idOfCart,int requestCode) throws SQLException, ClassNotFoundException{
		Connection conn = DB.DBConn();

		Statement stmt = conn.createStatement();
		String sql = "";
		//�˿�ɾ�����ﳵ�ļ�¼��ÿ��ɾ��һ����
		if (requestCode == 0) {
			sql = "delete from cart where idofcustomer = '" + customerId + "' and idofcart = '" + idOfCart + "'";
		}
		//�¶�����ɾ�����ﳵ����Ϣ�����ݶ����ţ�
		else if (requestCode == 1 && customerId == 0) {
			sql = "delete from cart where idofcart = '" + idOfCart + "'";
		}
		
		if (stmt.executeUpdate(sql) == 1) {
			
			DB.close(conn);
			return true;
		}
		
		DB.close(conn);
		
		return false;
	}

	// ��ѯ
	/**
	 * ��Ա�����̡���Ӫ����identity��¼����ѯ��Ϣ(��ѯ�����Լ���ݵĸ�����Ϣ)
	 * ��
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<?> query(String identity, int id, int requestCode)
			throws ClassNotFoundException, SQLException {
		Connection conn = DB.DBConn();

		String sql = null;
		
		Statement stmt = conn.createStatement();
		// ���ڹ˿͡�����������Ӫ�̵�¼��֤�����е����ݿ��ѯ,���Ժ�鿴������Ϣ
		if (requestCode == 0) {
			if (identity.equals(new String("customer"))) {
				List<Customer> userList = new ArrayList<Customer>();
				sql = "SELECT * FROM " + identity +" where id = '" + id + "'";
				ResultSet rs = stmt.executeQuery(sql);

				while (rs.next()) {

					int userid = rs.getInt(1);
					String name = rs.getString(2);
					String psw = rs.getString(3);
					String payPsw = rs.getString(4);
					String phone = rs.getString(5);
					double balance = rs.getDouble(6);
					String ordersId = rs.getString(7);
					String deliveryAddress = rs.getString(8);
					String isValidCustomer = rs.getString(9);

					Customer user = new Customer();
					user.setId(userid);
					user.setName(name);
					user.setPsw(psw);
					user.setPayPsw(payPsw);
					user.setPhone(phone);
					user.setBalance(balance);
					user.setOrdersId(ordersId);
					user.setDeliveryAddress(deliveryAddress);
					user.setIsValidCustomer(isValidCustomer);
					
					userList.add(user);
				}
				DB.close(conn);
				return userList;
				
			} 
			//ע�⣺
			//���񱨱�id
			//������֧���������ƻ���΢��������ά��֧��
			else if (identity.equals(new String("seller"))) {
				List<Seller> userList = new ArrayList<Seller>();
				sql = "SELECT * FROM " + identity +" where id = '" + id + "'";
				ResultSet rs = stmt.executeQuery(sql);

				while (rs.next()) {

					int userid = rs.getInt(1);
					String name = rs.getString(2);
					String psw = rs.getString(3);
					String isValidSeller = rs.getString(4);
					String shopId = rs.getString(5);

					Seller user = new Seller();
					user.setId(userid);
					user.setName(name);
					user.setIsValidSeller(isValidSeller);
					user.setShopId(shopId);
					
					userList.add(user);
				}
				DB.close(conn);
				return userList;
			}else if (identity.equals(new String("operator"))) {
				List<Operator> userList = new ArrayList<Operator>();
				
				sql = "SELECT * FROM " + identity + " where id = '" + id + "'";
				ResultSet rs = stmt.executeQuery(sql);

				while (rs.next()) {

					int userid = rs.getInt(1);
					String name = rs.getString(2);
					String psw = rs.getString(3);
					String operatingAuthorityPsw = rs.getString(4);
					//���񱨱�id
					int financialStatementId = rs.getInt(5);
					//������֧���������ƻ���΢��������ά��֧��
					String thirdPartyPayment = rs.getNString(6);
					String sellers = rs.getString(7);
					String shops = rs.getString(8);
					String cumstomers = rs.getString(9);
					double turnover = rs.getDouble(10);

					Operator user = new Operator();
					
					user.setOperatorId(userid);
					user.setOperatorName(name);
					user.setOperatorPsw(psw);
					user.setOperatingAuthorityPsw(operatingAuthorityPsw);
					user.setFinancialStatementId(financialStatementId);
					user.setThirdPartyPayment(thirdPartyPayment);
					user.setSellers(sellers);
					user.setShops(shops);
					user.setCustomers(cumstomers);
					user.setTurnover(turnover);
					userList.add(user);
				}
				DB.close(conn);
				return userList;
			}
		}
		
		// ��Ӫ��ͬ��������Ϣ-->��ѯ���̣�Shop����Ϣ
		else if (requestCode == 11) {
			if (identity.equals(new String("operator"))) {
				sql = "SELECT id FROM shop";
				
				ResultSet rs = stmt.executeQuery(sql);

				List<String> idOfShopList = new ArrayList<String>();
				
				String idOfShop = null;
				int i = 0;
//				System.out.println("list��С��"+idOfShopList.size());
				while (rs.next()) {

					idOfShop = rs.getString(1);
					System.out.println(idOfShop + idOfShopList.size()+ " ");
					idOfShopList.add(idOfShop);
					i++;
				}
				DB.close(conn);
				return idOfShopList;
			}
		}
		// ��Ӫ��ͬ����Ա��Ϣ-->��ѯ��Ա��Ϣ
		else if (requestCode == 12) {
			if (identity.equals(new String("operator"))) {
				sql = "SELECT id FROM customer";
				
				ResultSet rs = stmt.executeQuery(sql);
				
				List<String> idOfShopList = new ArrayList<String>();
				
				String idsOfCustomer = null;
				while (rs.next()) {
					
					idsOfCustomer = rs.getString(1);
					idOfShopList.add(idsOfCustomer);
				}
				DB.close(conn);
				return idOfShopList;
			}
		}
		
		//��Ӫ�̲鿴��Ա������Ϣ��֧�����롢��¼������⣩
		else if (requestCode == 13) {
			if (identity.equals(new String("operator"))) {
				sql = "SELECT * FROM customer";
				
				ResultSet rs = stmt.executeQuery(sql);

				List<Customer> customerList = new ArrayList<Customer>();
				
				 int ID;//int(11) NN
				 String name;//varc(45) NN
//				 String psw;//varc(20) NN
//				 String payPsw;//varc(20) NN
				
				 String phone;//varc(11) NN
				 double balance;//double NN def :0.00
				
				 String ordersId;//varc(255) ��Ӣ�ķֺŷָ�
				 String deliveryAddress;//varc(255) 
				 String isValidCustomer;//varc(1) Ĭ�ϣ�0��δ��֤��
				
				 Customer customer = null;
				 
				 while (rs.next()) {

					 customer = new Customer();
//					ID = rs.getInt(1);
					name = rs.getString(2);
					
					phone = rs.getString(5);
					balance = rs.getDouble(6);
					
					ordersId = rs.getString(7);//varc(255) ��Ӣ�ķֺŷָ�
					deliveryAddress = rs.getString(8);//varc(255) 
					isValidCustomer = rs.getString(9);
					
					customer.setId(rs.getInt(1));
					customer.setName(name);
					customer.setPhone(phone);
					customer.setBalance(balance);
					customer.setOrdersId(ordersId);
					customer.setDeliveryAddress(deliveryAddress);
					customer.setIsValidCustomer(isValidCustomer);
					
					customerList.add(customer);
				}
				DB.close(conn);
				return customerList;
			}
		}
		//һ��˿�������Ʒ
//		else if(requestCode == 2){
//			List<Goods> goodsliList =  new ArrayList<Goods>();
//			
//			for (Goods goods : goodsliList) {
//				goods.QueryGood(0);
//			}
//			System.out.println("goods��С:"+goodsliList.size());
//			return goodsliList;
//		}
//		//�����ڲ鿴��������
//		else if (requestCode == 12) {
//			if (id == null || id == "") {
//				if (identity.equals(new String("seller"))) {
//					sql = "SELECT * FROM shop";
//				}
//			}
//		}
//		// �����û��鿴��һ����ͨ�û���Ϣ���������
//		else if (requestCode == 2) {
//			if (identity.equals(new String("superUser"))) {
//				sql = "SELECT * FROM user where id = '" + id + "'";
//			}
//		}
		

//		ResultSet rs = stmt.executeQuery(sql);
//
//		while (rs.next()) {
//
//			String userid = rs.getString(1);
//			String name = rs.getString(2);
//			String psw = rs.getString(3);
//			String phone = rs.getString(4);
//			String balance = rs.getString(5);
//			String orders = rs.getString(6);
//			String deliveryAddress = rs.getString(7);
//
//			User user = new User();
//			user.setId(userid);
//			user.setName(name);
//			user.setPsw(psw);
////			user.setSex(sex);
////			user.setAge(age);
////			user.setBirthday(birthday);
////			user.setNote(note);
//
//			user.setPhone(phone);
//			user.setBalance(balance);
//			user.setDeliveryAddress(deliveryAddress);
//			userList.add(user);
//		}
//		DB.close(conn);
		return null;
	}

	// �޸�
	/**
	 * ��ͨ�û��޸���Ϣ
	 * 
	 * @param user
	 * @return
	 * @throws SQLException
	 * @throws IOException
	 */
	/*
	public boolean edit(User user, int requestCode) throws SQLException,
			IOException {
		Connection conn = null;

		String id = user.getId();
		String name = user.getName();
		String psw = user.getPsw();
		String sex = user.getSex();
		String age = user.getAge();
		String birthday = user.getBirthday();
		String note = user.getNote();

		// System.out.println(name+psw+age);
		try {
			conn = DB.DBConn();

			String sql = "";
			// �����û��޸���ͨ�û���Ϣ
			if (requestCode == 0 && psw == null) {
				sql = "UPDATE user SET name = ?,sex = ?,age = ?"
						+ ",birthday = ?,note = ? where id = ?";
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, name);
				stmt.setString(2, sex);
				stmt.setString(3, age);
				stmt.setString(4, birthday);
				stmt.setString(5, note);
				stmt.setString(6, id);
				stmt.executeUpdate();
			}
			// �����û��޸��Լ�����Ϣ
			else if (requestCode == 1) {
				sql = "UPDATE superuser SET name = ?,psw = ?,sex = ?,age = ?"
						+ ",birthday = ?,note = ? where id = ?";
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, name);
				stmt.setString(2, psw);
				stmt.setString(3, sex);
				stmt.setString(4, age);
				stmt.setString(5, birthday);
				stmt.setString(6, note);
				stmt.setString(7, id);
				stmt.executeUpdate();
			}
			// ��ͨ�û��޸��Լ�����Ϣ
			else if (requestCode == 2) {
				sql = "UPDATE user SET name = ?,psw = ?,sex = ?,age = ?"
						+ ",birthday = ?,note = ? where id = ?";
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, name);
				stmt.setString(2, psw);
				stmt.setString(3, sex);
				stmt.setString(4, age);
				stmt.setString(5, birthday);
				stmt.setString(6, note);
				stmt.setString(7, id);
				stmt.executeUpdate();
			}

			DB.close(conn);
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}
*/
	/**Ԥ������
	 * 
	 * ����ͷ��
	 * 
	 * @param i
	 * @param f
	 * @return
	 * @throws SQLException
	 * @throws IOException
	 */
	public boolean addPic(int id, String filePath, int identity)
			throws SQLException, IOException {
		Connection conn = null;

		String sql = "";
		try {
			conn = DB.DBConn();
			if (identity == 0) {
				sql = "INSERT INTO user(id,pic)" + "VALUES(?,?)";

			}
			PreparedStatement stmt = conn.prepareStatement(sql);

			File file = new File(filePath);

			FileInputStream fis = new FileInputStream(file);

			stmt.setString(1, "" + id);
			stmt.setBinaryStream(2, fis, (int) file.length());

			stmt.executeUpdate();

			DB.close(conn);
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * ��֤��Ӫ�̵�¼��Ϣ����Ч��
	 * 
	 * @param userid
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	
	//ͳһ��User(id��name��psw)
	public boolean isValidUser(String identity,String userid,String password) throws ClassNotFoundException,
			SQLException {
		boolean flag = false;
		Connection conn = DB.DBConn();

		String sql = "SELECT * FROM " + identity + " where id = '" + userid + "'";

		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery(sql);

		User user = new User();
		if (rs.next()) {

//			String id = rs.getString(1);
//			String name = rs.getString(2);
			String psw = rs.getString(3);
			// String sex = rs.getString(4);
			// String age = rs.getString(5);
			// String birthday = rs.getString(6);
			// String note = rs.getString(7);

			// User user = new User();
//			user.setId(id);
//			user.setName(name);
			user.setPsw(psw);
			// user.setSex(sex);
			// user.setAge(age);
			// user.setBirthday(birthday);
			// user.setNote(note);
			//		
			// userList.add(user);

		}
		DB.close(conn);
		if (user.getPsw().equals(password)) {
			
			flag = true;
		}
		else if(!user.getPsw().equals(password)){
			flag = false;
			
		}
		return flag;
	}
	
	/**
	 * ��Ӫ�̸���shopid�鿴������Ϣ
	 * @param shopId
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public ShopInfo QueryShopInfo(int shopId) throws SQLException, ClassNotFoundException {
		Connection conn = DB.DBConn();

		String sql = null;
		
		Statement stmt = conn.createStatement();
		
		ShopInfo shopInfo = new ShopInfo();
		
		sql = "SELECT * FROM shop where id = '" + shopId + "'";
		ResultSet rs = stmt.executeQuery(sql);

		
		if (rs.next()) {

			int shopID = rs.getInt(1);
			String shopName = rs.getString(2);
			//����id
			int sellerId = rs.getInt(3);
			//�Ƿ���Ч��֤����
			String isValidShop = rs.getString(4); 
			
			double shopTurnOver = rs.getDouble(5);
			//��Ʒids
			String shopGoodsId = rs.getString(6);
			//����s
			String shopOrdersId = rs.getString(7);

			shopInfo.setShopId(shopID);
			shopInfo.setShopName(shopName);
			shopInfo.setSellerId(sellerId);
			shopInfo.setIsValidShop(isValidShop);
			shopInfo.setShopTurnOver(shopTurnOver);
			shopInfo.setShopGoodsId(shopGoodsId);
			shopInfo.setShopOrdersId(shopOrdersId);
				
		}
		DB.close(conn);
		return shopInfo;
		
	}
	
	
	public int getSellerIdByOperator(int shopCurrentId) throws SQLException, ClassNotFoundException {
		String sql = null;
		
		Connection conn = DB.DBConn();
		
		sql = "SELECT id FROM seller where shopid = '" + shopCurrentId + "'";
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs.next()) {

			int userid = rs.getInt(1);
//			System.out.println("��seller���У�getSellerIdByOperator�������õ����ҵ�id");
			return userid;
		}
		DB.close(conn);
		
		return -1;
		
	}
	
	
	/**
	 * 1��requstCode = 1,������Ӫ����֤���̣���Ҫ��ѯ���̵�isvalidshop��״̬��Ŀǰֻ�ܵõ�id�ʹ���֤״̬����
	 * 2����Ӫ������֤���̲����У��鿴δ��֤�ĵ���
	 * @param requstCode
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
//		requstCode = 1,������Ӫ����֤���̣���Ҫ��ѯ���̵�isvalidshop��״̬
	public List<?> QueryShopAllInfos(int requstCode) throws SQLException, ClassNotFoundException{
		Connection conn = DB.DBConn();

		String sql = null;
		
		Statement stmt = conn.createStatement();
		
//		requstCode = 1,������Ӫ����֤���̣���Ҫ��ѯ���̵�isvalidshop��״̬
		if (requstCode == 1) {
			List<ShopInfo> isValidShopList = new ArrayList<ShopInfo>();
			
			sql = "SELECT * FROM shop";
			ResultSet rs = stmt.executeQuery(sql);
			ShopInfo shopInfo;
			while (rs.next()) {
				shopInfo = new ShopInfo();
				shopInfo.setShopId(rs.getInt(1));
//				shopInfo.setShopName(rs.getString(2));;
//				shopInfo.setSellerId(rs.getInt(3));
				shopInfo.setIsValidShop(rs.getString(4));
//				shopInfo.setIsValidShop(rs.getString(4));
				isValidShopList.add(shopInfo);
			}
			DB.close(conn);
			return isValidShopList;
		}
		//��Ӫ������֤���̲����У��鿴δ��֤�ĵ���
		else if (requstCode == 2) {
//			System.out.println("��Ӫ�̲��Ǵ���֤���̣�");
			
		List<ShopInfo> inValidShopList = new ArrayList<ShopInfo>();
		
		sql = "SELECT * FROM shop";
		ResultSet rs = stmt.executeQuery(sql);
		ShopInfo shopInfo;
		while (rs.next()) {
			shopInfo = new ShopInfo();
			if (rs.getString(4).equals(new String("0"))) {
				shopInfo.setShopId(rs.getInt(1));
				shopInfo.setIsValidShop(rs.getString(4));
				
				inValidShopList.add(shopInfo);
			}
		}
		DB.close(conn);
		return inValidShopList;
		}
		
		return null;
	}
	
	/**
	 * ��Ӫ�̸�����Ӫ�̱���ӵ�еĵĵ���id,����ĵ��̱��е�isvalidshop��������֤״̬��
	 * @param shopsIdString
	 * @param shopCurrentID
	 * @param operatorId
	 * @param requestCode
	 * @return
	 * @throws SQLException
	 * @throws IOException
	 * @throws ClassNotFoundException 
	 */
//	��Ӫ�̸�����Ӫ�̱����ӵ�еĵ���id,����ĵ��̱��е�isvalidshop��������֤״̬��
	public boolean updateShopsIdByOperator(String shopsIdString , String shopCurrentID,int operatorId,int requestCode) throws SQLException, IOException, ClassNotFoundException {
		
//		System.out.println("��updateShopsIdByOperator���õ��Ĵ�Operator���в鵽��shopids�ַ���Ϊ��" + shopsIdString + "��ǰ����id"+shopCurrentID +"��Ӫ��id" + operatorId);
		
	//��Ӫ�̸�����Ӫ�̱����ӵ�еĵ���id
	//��ɾ��������Ϣ�Ĺ����У���Ҫͬ������Operator���е�shopsId���ַ�������Ϣ����ɾ���������id
		if (requestCode == 1) {
	

		
		//���Operator���У��ƶ���Ӫ���˺��������ӵ�е����е��̵�id����-������
				String [] shopsArr = shopsIdString.split(";");
//				System.out.println("shopids���鳤��Ϊ =" + shopsArr.length + "���һ��Ԫ�� = " + shopsArr[shopsArr.length - 1]);
		    	int [] shopsIdArr = new int[shopsArr.length];
		    	
//		    	System.out.print("����ʾ�ĵ���id:");
//		    	for(int i = 0;i < shopsIdArr.length;i++){
//		    		shopsIdArr[i] = Integer.parseInt(shopsArr[i]);
//		    		System.out.print(shopsIdArr[i] + "  A");
//		    	}
		    	
//		    	//��ȡ���ݿ��У�operator���У�operatorId��Ӧ�ĵ���id���飨ȫ�����̣�
//		    	List <?> usersInfo = query("operator", operatoeId, 0);
//		    	
//		    	String shopIds = "";
//		    	
//		    	for (Object object : usersInfo) {
//		    		shopIds = ((Operator)object).getShops();
//				}
		    	//���ݿ��У������ȡ�������е���id
		    	
//		    	System.out.println("\nz��updateShopsIdByOperatorzhing,\n�ַ�������ת����int���飺");
		    	for(int i = 0;i < shopsIdArr.length;i++){
		    		shopsIdArr[i] = Integer.parseInt(shopsArr[i]);
		    		System.out.print(shopsIdArr[i] + " ");
		    	}
		    	
		    	//�ó���ȥɾ�����ض�����id�����ַ�������ʣ�µ��ַ���
		    	List<Integer> intArrayList = new ArrayList<Integer>();
		    	for (int i = 0; i < shopsIdArr.length; i++) {
					intArrayList.add(shopsIdArr[i]);
				}
		    	
		    	for (int i = 0; i < intArrayList.size(); i++) {
		    		if(intArrayList.contains(new Integer(shopCurrentID))) {
		    			intArrayList.remove(new Integer(shopCurrentID));
					}
		    		
				}
		    	
//		    	System.out.println("�Ƴ���");
		    	for (Integer integer : intArrayList) {
					System.out.print(integer + " ");
				}
		    	
		    	String result = "";
		    	for (int i = 0; i < intArrayList.size(); i++) {
					result += intArrayList.get(i) +";";
				}
		    	
//		    	System.out.println(result);
		    	
		    	Operator operator = new Operator();
		    	
		    	operator.setOperatorId(operatorId);
		    	operator.setShops(result);
		    	
		    	if(edit(operator,1)){
		    		return true;
		    	}
		}
		
		//��Ӫ�̸��ĵ��̵���֤״̬
//		������if (userDao.updateShopsIdByOperator(null, String.valueOf(isValidShop.getSellerId()), 0, 2)) {
//			
		else if (requestCode == 2) {
			
			Connection conn = null;

			conn = DB.DBConn();

			//�ο�:"UPDATE operator SET shops = ? where id = ?";
			String sql = "UPDATE shop SET isvalidshop = ? where id = ?";

			
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, "1");
			stmt.setString(2, shopCurrentID);
			if (stmt.executeUpdate() == 1) {
				DB.close(conn);
				System.out.println("shopCurrentID = "+shopCurrentID + "�޸ĳɹ���");
				return true;
			}
			else {
				return false;
			}
			
			
		}
		return false;
				
	}
	
	
	/**
	 * ����Operator����edit��Ӫ����Ϣ(����id��Ϣ)
	 * @param operator
	 * @return
	 * @throws SQLException
	 * @throws IOException
	 */
	public boolean edit(Operator operator , int requestCode) throws SQLException, IOException {
		Connection conn = null;

		//��Ӫ��ͬ������id
		if (requestCode == 1) {
			
		
		String id = String.valueOf(operator.getOperatorId());
		String shopsid = operator.getShops();
//		String name = user.getName();
//		String sex = user.getSex();
//		String birthday = user.getBirthday();
//		String note = user.getNote();

		try {
			conn = DB.DBConn();

			String sql = "UPDATE operator SET shops = ? where id = ?";

//			File file_edit = new File(jtf_open.getText());
//			FileInputStream fis_edit = new FileInputStream(file_edit);

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, shopsid);
			stmt.setString(2, id);
//			stmt.setString(3, birthday);
//			stmt.setString(4, note);
//			stmt.setBinaryStream(5, fis_edit, (int) file_edit.length());
//			stmt.setString(6, id);
			if (stmt.executeUpdate() == 1) {
				DB.close(conn);
				return true;
			}
			return false;
			
//			fis_edit.close();
			
//			�ο�sql = "update seller set shopid = '' where id = '" + id +"'";

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 
			
		
		}
		//��Ӫ���޸��Լ�����Ϣ
		else if (requestCode == 2) {
			String id = ""+operator.getOperatorId();
			String name = operator.getOperatorName();
			String psw = operator.getOperatorPsw();
			String authoritypsw = operator.getOperatingAuthorityPsw();
			String thirdpartpay = operator.getThirdPartyPayment();
			String financialstatementid = ""+operator.getFinancialStatementId();
			String sellersid = operator.getSellers();
			String shopsid = operator.getShops();
			String customerid = operator.getCustomers();
			
//			String id = String.valueOf(operator.getOperatorId());
//			String shopsid = operator.getShops();
			
			try {
				conn = DB.DBConn();

				String sql = "UPDATE operator SET name = ? , psw = ? , operatingauthoritypsw = ?"
						+ " , financialstatementid = ? , thirdpartypayment = ? , sellers = ? , "
						+ "shops = ? , customers = ? where id = ?";

				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, name);
				stmt.setString(2, psw);
				stmt.setString(3, authoritypsw);
				stmt.setString(4, financialstatementid);
				stmt.setString(5, thirdpartpay);
				stmt.setString(6, sellersid);
				stmt.setString(7, shopsid);
				stmt.setString(8, customerid);
				stmt.setString(9, id);
//				stmt.setBinaryStream(5, fis_edit, (int) file_edit.length());
//				stmt.setString(6, id);
				if (stmt.executeUpdate() == 1) {
					DB.close(conn);
					return true;
				}
				return false;
				
//				fis_edit.close();
//				�ο�sql = "update seller set shopid = '' where id = '" + id +"'";

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} 
			
		}
		//�����Ѹ���
		
		return false;
	}

	/**
	 * yys��ѯ����Ϊ��֤�ĵ���---��ʾδ��֤���̣�id����֤״̬)�Ľ���
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<ShopInfo> QueryAllInvalidShops() throws ClassNotFoundException, SQLException {
		
		List<?> allInvalidShops = QueryShopAllInfos(2);
		
		if (allInvalidShops != null) {
			return (List<ShopInfo>)allInvalidShops;
		}
		return null;
	}

	//��¼��ҳ��ѯ��Ʒ
	public Goods QueryGoods(int id) throws SQLException, ClassNotFoundException{
		Connection conn = DB.DBConn();

//		List<Goods> = new 
		String sql = null;
		
		Statement stmt = conn.createStatement();
		
		sql = "SELECT * FROM goods where id = '" + id + "'";
		ResultSet rs = stmt.executeQuery(sql);

		//���ڱ���ѯȫ����Ʒ�ķ�������
		if (id ==0 ) {
			Goods good = new Goods();
			while (rs.next()) {

				int ID = rs.getInt(1);
				String name = rs.getString(2);
//				System.out.println("1 = " + name);
				//����
				String sort = rs.getString(3);
				
				//����
				int totalvolume = rs.getInt(4);
				//������
				int salesvolume = rs.getInt(5);
				//ʣ��
				int left = rs.getInt(6);
				
				double price = rs.getDouble(7);
				
				String introduce = rs.getString(8);
				String color = rs.getString(9);
				String style = rs.getString(10);
				String specification = rs.getString(11);
				String evaluation = rs.getString(12);
				String picturepath = rs.getString(13);
				
				good.setId(ID);
				good.setName(name);
				good.setSort(sort);
				good.setTotalvolume(totalvolume);
				good.setSalesvolume(salesvolume);
				good.setKucun(left);
				good.setPrice(price);
				good.setIntroduce(introduce);
				good.setColor(color);
				good.setStyle(style);
				good.setSpecification(specification);
				good.setEvaluation(evaluation);
				good.setPicturepath(picturepath);
					
				
			}
			DB.close(conn);
			return good;
		}
		//��ѯ�ض�id����Ʒ
		else {
			
		
		Goods good = new Goods();
		while (rs.next()) {

			int ID = rs.getInt(1);
			String name = rs.getString(2);
//			System.out.println("1 = " + name);
			//����
			String sort = rs.getString(3);
			
			//����
			int totalvolume = rs.getInt(4);
			//������
			int salesvolume = rs.getInt(5);
			//ʣ��
			int left = rs.getInt(6);
			
			double price = rs.getDouble(7);
			
			String introduce = rs.getString(8);
			String color = rs.getString(9);
			String style = rs.getString(10);
			String specification = rs.getString(11);
			String evaluation = rs.getString(12);
			String picturepath = rs.getString(13);
			
			good.setId(ID);
			good.setName(name);
			good.setSort(sort);
			good.setTotalvolume(totalvolume);
			good.setSalesvolume(salesvolume);
			good.setKucun(left);
			good.setPrice(price);
			good.setIntroduce(introduce);
			good.setColor(color);
			good.setStyle(style);
			good.setSpecification(specification);
			good.setEvaluation(evaluation);
			good.setPicturepath(picturepath);
				
			
		}
		DB.close(conn);
		return good;
		}
	}
	
	
//	public static void main(String[] args) throws ClassNotFoundException, SQLException {
//		UserDao userDao = new UserDao();
//		
//		Goods goods = userDao.QueryGoods(401);
//		System.out.println("picpath = " + goods.getPicturepath());
//	}
	
	/**
	 * ��������ѯ��Ʒ
	 * @param sort
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public List<Goods> queryGoodsList(String sort) throws SQLException, ClassNotFoundException{
		Connection conn = DB.DBConn();

//		List<Goods> = new 
		String sql = null;
		
		Statement stmt = conn.createStatement();
		
		sql = "SELECT * FROM goods where class = '" + sort + "'";
		ResultSet rs = stmt.executeQuery(sql);
		
		List<Goods> goodsList = new ArrayList<Goods>();
		
		Goods good = null;
		while (rs.next()) {

			good = new Goods();
			int ID = rs.getInt(1);
			String name = rs.getString(2);
//			System.out.println("1 = " + name);
			//����
			String Sort = rs.getString(3);
			
			//����
			int totalvolume = rs.getInt(4);
			//������
			int salesvolume = rs.getInt(5);
			//ʣ��
			int left = rs.getInt(6);
			
			double price = rs.getDouble(7);
			
			String introduce = rs.getString(8);
			String color = rs.getString(9);
			String style = rs.getString(10);
			String specification = rs.getString(11);
			String evaluation = rs.getString(12);
			String picturepath = rs.getString(13);
			
			good.setId(ID);
			good.setName(name);
			good.setSort(Sort);
			good.setTotalvolume(totalvolume);
			good.setSalesvolume(salesvolume);
			good.setKucun(left);
			good.setPrice(price);
			good.setIntroduce(introduce);
			good.setColor(color);
			good.setStyle(style);
			good.setSpecification(specification);
			good.setEvaluation(evaluation);
			good.setPicturepath(picturepath);
				
			goodsList.add(good);
			
		}
		DB.close(conn);
		return goodsList;
	}
	
	public List<Goods> queryGoodsList() throws SQLException, ClassNotFoundException{
		Connection conn = DB.DBConn();

//		List<Goods> = new 
		String sql = null;
		
		Statement stmt = conn.createStatement();
		
		sql = "SELECT * FROM goods";
		ResultSet rs = stmt.executeQuery(sql);
		
		List<Goods> goodsList = new ArrayList<Goods>();
		
		Goods good = null;
		while (rs.next()) {

			good = new Goods();
			int ID = rs.getInt(1);
			String name = rs.getString(2);
//			System.out.println("1 = " + name);
			//����
			String sort = rs.getString(3);
			
			//����
			int totalvolume = rs.getInt(4);
			//������
			int salesvolume = rs.getInt(5);
			//ʣ��
			int left = rs.getInt(6);
			
			double price = rs.getDouble(7);
			
			String introduce = rs.getString(8);
			String color = rs.getString(9);
			String style = rs.getString(10);
			String specification = rs.getString(11);
			String evaluation = rs.getString(12);
			String picturepath = rs.getString(13);
			
			good.setId(ID);
			good.setName(name);
			good.setSort(sort);
			good.setTotalvolume(totalvolume);
			good.setSalesvolume(salesvolume);
			good.setKucun(left);
			good.setPrice(price);
			good.setIntroduce(introduce);
			good.setColor(color);
			good.setStyle(style);
			good.setSpecification(specification);
			good.setEvaluation(evaluation);
			good.setPicturepath(picturepath);
				
			goodsList.add(good);
			
		}
		DB.close(conn);
		return goodsList;
	}

	public boolean addToCart(Cart cart) throws ClassNotFoundException, SQLException {
		
//		private int idOfCart;//int(11) pk NN
//		private int idOfCustomer;//int(11) NN
//		private int idOfGoods;//int(11) NN
//		private int numOfGoods;//int(11) NN
//		private double totalMoney;
		
		
//		int idOfCart = cart.getIdOfCart();
		int idOfCustomer = cart.getIdOfCustomer();
		int idOfGoods = cart.getIdOfGoods();
		int numOfGoods = cart.getNumOfGoods();
		double totalMoney = cart.getTotalMoney();
		
		Connection conn = DB.DBConn();
		
		//int �ó��������е����ֵ����1��Ϊ��ǰ���붩���Ķ�����
//		int maxIdOfCart = maxIdOfCart();
		
//		System.out.println("maxIdOfCart11 = " + maxIdOfCart);
		
		try {
			conn = DB.DBConn();
//			File pic_file = new File(pic);
//			FileInputStream pic_fis = new FileInputStream(pic_file);

			String sql = "INSERT INTO cart "
					+ "VALUES(?,?,?,?,?)";
			PreparedStatement stmt = conn.prepareStatement(sql);
//			stmt.setString(1, id);
			
			stmt.setInt(1, readMaxIdOfCartFromCart() + 1);
//			System.out.println("readmaxidofcartformgoodsintransit() + 1 = " + (readmaxidofcartformgoodsintransit()));
			stmt.setInt(2, idOfCustomer);
			stmt.setInt(3, idOfGoods);
			stmt.setInt(4, numOfGoods);
			stmt.setDouble(5, totalMoney);
//			stmt.setBinaryStream(5, pic_fis, (int) pic_file.length());
			
			if(stmt.executeUpdate() == 1){
				DB.close(conn);
				return true;
			}else {
				return false;
			}
				
//			pic_fis.close();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 
		return false;
	}

	
	public int readMaxIdOfCartFromCart() throws SQLException, ClassNotFoundException {
		
		Connection conn = DB.DBConn();
		String sql = null;
		Statement stmt = conn.createStatement();
		
		sql = "SELECT * FROM cart";
		ResultSet rs = stmt.executeQuery(sql);
		
		int maxid = 0;
		
		List<Integer> idsIntegers = new ArrayList<Integer>();
		while (rs.next()) {
			
			idsIntegers.add(rs.getInt(1));
		}
		
		if(idsIntegers != null){
			System.out.println("cg?" + idsIntegers.size());
			if (idsIntegers.size() == 1) {
				return idsIntegers.get(0).intValue();
			}
			for (int i = 1;i < idsIntegers.size();i++) {
				if (idsIntegers.get(i) > idsIntegers.get(i-1)) {
					maxid = idsIntegers.get(i);
				}
			}
			System.out.println("cart��������id = " + maxid);
			
		}
		return maxid;
		
	}

	/**
	 * �鿴���ﳵ��int idOfCustomer,int idOfCart��
	 * @param idOfCustomer
	 * @param idOfCart
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public Cart QueryCartInfoByCus(int idOfCustomer,int idOfCart) throws ClassNotFoundException, SQLException{
		Cart cart = new Cart();
		
		Connection conn = DB.DBConn();
		String sql = null;
		Statement stmt = conn.createStatement();
		
		sql = "SELECT * FROM cart where idofcustomer = '" + idOfCustomer + "' and idofcart = '"
				+ idOfCart + "'";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs.next()) {
			
			cart.setIdOfCart(rs.getInt(1));
			cart.setIdOfCustomer(rs.getInt(2));
			cart.setIdOfGoods(rs.getInt(3));
			cart.setNumOfGoods(rs.getInt(4));
			cart.setTotalMoney(rs.getDouble(5));
		}
		if(cart != null){
			DB.close(conn);
			return cart;
		}else {
			return null;
		}
		
	}
	
	public int maxIdOfCart() throws SQLException, ClassNotFoundException {
		
		Connection conn = DB.DBConn();
		String sql = null;
		Statement stmt = conn.createStatement();
		
		
		sql = "SELECT idofcart FROM cart";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		List<Integer> idsofcart = new ArrayList<Integer>();
		
//		for (Integer integer : idsofcart) {
//			if (!rs.next()){
//				break;
//			}
		
			while (rs.next()) {
				idsofcart.add(rs.getInt(1));
//				System.out.println("�ж����� �� " +idsofcart.get(i));
			}
			
//		System.out.println("list<Integer> size = " + idsofcart.size());
		//һ�ŵ��ͷ�����һ�ŵ���
		if (idsofcart.size() == 0) {
			return 0;
		}
			
		else if (idsofcart.size() == 1) {
			return idsofcart.get(0).intValue();
		}
		
		//���򣬵���maxInt(List<Integer>)�ó������е����ֵ
		else if(maxInt(idsofcart) != 0){
			System.out.println("maxInt(idsofcart) = " + maxInt(idsofcart));
			return maxInt(idsofcart);
		}
		
		//Ĭ�Ϸ���0
//		if (idsofcart.size() == 0) {
//			System.out.println("list = null");
//		}
		return 0;
	}

	public int maxInt(List<Integer> idsoOfCart) {
		//���ֵ��ʼ��Ϊ0
		int max = 0;
		
		
		
		if (idsoOfCart != null) {
			
			for (int i = 1; i < idsoOfCart.size(); i++) {
				if(idsoOfCart.get(i) > idsoOfCart.get(i - 1)){
					max = idsoOfCart.get(i).intValue();
					System.out.println("222222222order����������" + idsoOfCart.get(i));
				}
			}
		}
		
		return max;
	}

	/**
	 * ��ȡָ����Աid��ȫ�����ﳵ��Ϣ
	 * @param customerId
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public List<Cart> readGoodsInTransit(int customerId,int idofcart) throws SQLException, ClassNotFoundException {
		
		Connection conn = DB.DBConn();

		String sql = null;
		
		Statement stmt = conn.createStatement();
		if (idofcart == 0) {
			
			sql = "SELECT * FROM goodsintransit where idofcustomer = '" + customerId + "'";
		}
		else if (idofcart != 0) {
			
			sql = "SELECT * FROM goodsintransit where idofcustomer = '" + customerId + "' and idofcart = '" + idofcart + "'";
		}
		
		ResultSet rs = stmt.executeQuery(sql);
		
		List<Cart> carts = new ArrayList<Cart>();
		
		Cart cart = null;
		
		while (rs.next()) {

			cart = new Cart();
			
			int idOfCart = rs.getInt(1);
			int idOfCustomer = rs.getInt(2);
			int idOfGoods = rs.getInt(3);
			int numOfGoods = rs.getInt(4);
			double totalMoney = rs.getDouble(5);
			
			cart.setIdOfCart(idOfCart);
			cart.setIdOfCustomer(idOfCustomer);
			cart.setIdOfGoods(idOfGoods);
			cart.setNumOfGoods(numOfGoods);
			cart.setTotalMoney(totalMoney);
			
			carts.add(cart);
		}
		
		if (carts != null) {
			return carts;
		}
		
		return null;
	}
	
	
	/**
	 * �˿Ͳ鿴���ﳵ��Ϣ
	 * @param customerId
	 * @param idofcart
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public List<Cart> readCart(int customerId,int idofcart) throws SQLException, ClassNotFoundException {
		
		Connection conn = DB.DBConn();
		
		String sql = null;
		
		Statement stmt = conn.createStatement();
		if (idofcart == 0) {
			
			sql = "SELECT * FROM cart where idofcustomer = '" + customerId + "'";
		}
		else if (idofcart != 0) {
			
			sql = "SELECT * FROM cart where idofcustomer = '" + customerId + "' and idofcart = '" + idofcart + "'";
		}
		
		ResultSet rs = stmt.executeQuery(sql);
		
		List<Cart> carts = new ArrayList<Cart>();
		
		Cart cart = null;
		
		while (rs.next()) {
			
			cart = new Cart();
			
			int idOfCart = rs.getInt(1);
			int idOfCustomer = rs.getInt(2);
			int idOfGoods = rs.getInt(3);
			int numOfGoods = rs.getInt(4);
			double totalMoney = rs.getDouble(5);
			
			cart.setIdOfCart(idOfCart);
			cart.setIdOfCustomer(idOfCustomer);
			cart.setIdOfGoods(idOfGoods);
			cart.setNumOfGoods(numOfGoods);
			cart.setTotalMoney(totalMoney);
			
			carts.add(cart);
		}
		
		if (carts != null) {
			return carts;
		}
		
		return null;
	}
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		UserDao userDao = new UserDao();
		
//		if(userDao.deleteByCustomer(12, 0)){
//			System.out.println("�ɹ�");
//		}
		
//		List<Integer> intArr = new ArrayList<Integer>();
//		
//		intArr.add(1);
//		intArr.add(2);
		
		
//		int max = userDao.maxOrderId();
		
		
//		int max = userDao.maxIdOfCart();
//		
//		System.out.println("userDao.maxOrderId()�У�max = " + max);
//		System.out.println("�������У�idmax��"+userDao.maxIdOfCart());
		
		
		
//		if(userDao.QueryCartInfoByCus(201, 101) != null){
//			
//			
//			System.out.println("���飺\n"+userDao.QueryCartInfoByCus(201, 101).getIdOfCart()+"  "+userDao.QueryCartInfoByCus(201, 101).getIdOfCustomer() + "  " +userDao.QueryCartInfoByCus(201, 101).getIdOfGoods() + "  " + userDao.QueryCartInfoByCus(201, 101).getNumOfGoods() + "  " + userDao.QueryCartInfoByCus(201, 101).getTotalMoney());
//		}
//		if(userDao.CustomerAddOrder(201, 101)){
//			
//			
//			System.out.println("��ӹ��ﳵ�ɹ���");
//		}
		
		if (userDao.CartAddToGoodsInTransit(1, 2, 3, 4, 5)) {
			System.out.println("cg");
		}
		
		
	}

	
	/**
	 * ���Ӷ���(int customerId, int idOfCart)
	 * @param customerId
	 * @param idOfCart
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public boolean CustomerAddOrder(int customerId, int idOfCart) throws SQLException, ClassNotFoundException {
		
		Cart cart = QueryCartInfoByCus(customerId, idOfCart);
		
		List<Customer> customers =  (List<Customer>)query("customer", customerId, 0);
//		System.out.println("select form custoer �ɹ�");
		Customer customer = null;
		
		
		for (Customer cus : customers) {
			customer = cus;
		}
		
		Connection conn = DB.DBConn();
		
//		String sql = "UPDATE customerorder SET customername = ? where idoforder = ?";

//		File file_edit = new File(jtf_open.getText());
//		FileInputStream fis_edit = new FileInputStream(file_edit);

//		PreparedStatement stmt = conn.prepareStatement(sql);
//		stmt.setString(1, "11");
//		stmt.setString(2, "601");
//		stmt.setString(3, birthday);
//		stmt.setString(4, note);
//		stmt.setBinaryStream(5, fis_edit, (int) file_edit.length());
//		stmt.setString(6, id);
//		if (stmt.executeUpdate() == 1) {
//			DB.close(conn);
//			return true;
//		}else {
//			return false;
//		}
		
//			String sql = "update order set customername = 'qq' where idoforder = '601' ";
//			
//			Statement stmt = conn.createStatement();
//
//			if(stmt.executeUpdate(sql) == 1){
//				DB.close(conn);
//				return true;
//			}else {
//				return false;
//			}
			
			String sql = null;
			
			
			
			sql = "INSERT INTO customerorder "
					+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			//idoforder
//			System.out.println(" maxOrderId() + 100 = " + ( maxOrderId() + 100));
			stmt.setInt(1, maxOrderId() + 1);
//			System.out.println("1");
			
			//
			stmt.setInt(2, customerId);
//			System.out.println("2");
			
			stmt.setString(3, customer.getName());
//			System.out.println("3");
			
			//�ջ���ַ
			stmt.setString(4, customer.getDeliveryAddress());
//			System.out.println("4");
			
			//�ֻ�����
			stmt.setString(5, customer.getPhone());
//			System.out.println("5");
			
			//���ﳵid
			stmt.setInt(6, idOfCart);
//			System.out.println("6");
			
			//����״̬
			stmt.setString(7, "�ȴ���Ҹ���");
//			System.out.println("7");
			
			//��ݷ�ʽ
			stmt.setString(8, "��ͨ");
//			System.out.println("8");
			
			//��ݷ�
			stmt.setDouble(9,0);
//			System.out.println("9");
			
			//֧����ʽ
			stmt.setString(10, "����֧��");
//			System.out.println("10");
			
			//���Ա����
			stmt.setString(11, "С����");
//			System.out.println("11");
			
			//���Ա��ϵ�绰
			stmt.setString(12, "12312312311");
//			System.out.println("12");
			
			//��Ʊ���ͺ�ѧϰ
			stmt.setString(13,"���ӷ�Ʊ");
//			System.out.println("13");
			
			//�ܼ�
			stmt.setDouble(14, cart.getTotalMoney());
//			System.out.println("14");
			
//			stmt.setBinaryStream(5, pic_fis, (int) pic_file.length());
			
			
//			stmt.setInt(1, 889);
//			stmt.setString(2, "Сʱ2");
//			stmt.setInt(3, 1234);
//			stmt.setString(4, "1");
//			stmt.setString(5, "111");
//			stmt.setString(6, "222");
//			stmt.setString(7, "333");
//			
			if(stmt.executeUpdate() == 1){
				DB.close(conn);
				return true;
			}else {
				return false;
			}
	
	}

	public int maxOrderId() throws ClassNotFoundException, SQLException {
		
		Connection conn = DB.DBConn();
		String sql = null;
		Statement stmt = conn.createStatement();
		
		int maxid = 0;
		
		sql = "SELECT * FROM customerorder";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		List<Integer> idoforder = new ArrayList<Integer>();
		
//����		if (!rs.next()) {
//			return 0;
//		}
		while (rs.next()) {
			idoforder.add(rs.getInt(1));
		}
			
		if(idoforder != null){
			if (idoforder.size() == 1) {
				return idoforder.get(0).intValue();
			}
			for (int i = 1;i < idoforder.size();i++) {
				if (idoforder.get(i) > idoforder.get(i-1)) {
					maxid = idoforder.get(i);
				}
			}
			System.out.println("order��������id = " + maxid);
			
		}
		return maxid;
//		System.out.println("list<Integer> size = " + idoforder.size());
		//һ�ŵ��ͷ�����һ�ŵ���
//		if (idoforder.size() == 0) {
//			return 0;
//		}
//		else if (idoforder.size() == 1) {
//			return idoforder.get(0).intValue();
//		}
//		
//		//���򣬵���maxInt(List<Integer>)�ó������е����ֵ
//		else if(mant(idoforder) != 0){
//			System.out.println("���������棬��󶩵���"+maxInt(idoforder));
//			return maxInt(idoforder);
//		}
//		return 0;
	}

	/**
	 * �˿Ͳ�ѯ����
	 * @param customerId
	 * @param idOfCart
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<Order> queryOrder(int customerId ,int idOfCart) throws ClassNotFoundException, SQLException {
		
		Connection conn = DB.DBConn();

		String sql = null;
		
		Statement stmt = conn.createStatement();
		
		List<Order> orderList = new ArrayList<Order>();
		//��ѯָ����Աid��ȫ������
		if (idOfCart == 0) {
			
			sql = "SELECT * FROM customerorder where customerid = '" + customerId +"'";
		}
		//��ѯָ����Աid�͹��ﳵid��ȫ������
		else if(idOfCart != 0){
			
			sql = "SELECT * FROM customerorder where customerid = '" + customerId +"' and idofcart = '" + idOfCart + "'";
		}
		//��Ӫ�̲�ѯȫ������
		else if(idOfCart == 0 && customerId == 0){
			
			sql = "SELECT * FROM customerorder";
		}
		System.out.println(idOfCart + "<- ->" + customerId);
		ResultSet rs = stmt.executeQuery(sql);

		Order order = null;
		while (rs.next()) {

			int idoforder = rs.getInt(1);
			int customerid = rs.getInt(2);
			String customername = rs.getString(3);
			String customeraddress = rs.getString(4);
			String customerphone = rs.getString(5);
			
			int idofcart = rs.getInt(6);
			String status = rs.getString(7);
			String expressmode = rs.getString(8);
//			System.out.println("��ݷ�ʽ = " + expressmode);
			double expresscharge = rs.getDouble(9);
			String paymode = rs.getString(10);
			String expressworker = rs.getString(11);
			String expressworkerphone = rs.getString(12);
			String invoicestypeandinfo = rs.getString(13);
//			System.out.println("��Ʊ���ͼ���Ϣ = " + invoicestypeandinfo);
			double totalmoney = rs.getDouble(14);

			
			order = new Order();
			
			order.setId(idoforder);
			order.setCustomerID(customerid);
			order.setCustomerName(customername);
			order.setCustomerAddress(customeraddress);
			order.setCustomerPhone(customerphone);
			order.setIdOfCart(idofcart);
			order.setStatus(status);
			order.setExpressMode(expressmode);
			order.setExpressCharge(expresscharge);
			order.setPayMode(paymode);
			order.setExpressWorker(expressworker);
			order.setExpressWorkerPhone(expressworkerphone);
			order.setInvoiceStypeAndInfo(invoicestypeandinfo);
			order.setTotalMoney(totalmoney);
			
			
			orderList.add(order);
		}
		DB.close(conn);
		if (orderList != null) {
			
			return orderList;
		}
		
		return null;
	}

	/**
	 * ��ȡ��һ���ﳵ
	 * @param idofcart
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public Cart readSingleProduct(int idofcart) throws ClassNotFoundException, SQLException {
		
		Connection conn = DB.DBConn();

		String sql = null;
		
		Statement stmt = conn.createStatement();
		
		sql = "SELECT * FROM cart where idofcart = '" + idofcart + "'";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		Cart cart = new Cart();
		
		while (rs.next()) {

			int idOfCart = rs.getInt(1);
			int idOfCustomer = rs.getInt(2);
			int idOfGoods = rs.getInt(3);
			int numOfGoods = rs.getInt(4);
			double totalMoney = rs.getDouble(5);
			
			cart.setIdOfCart(idOfCart);
			cart.setIdOfCustomer(idOfCustomer);
			cart.setIdOfGoods(idOfGoods);
			cart.setNumOfGoods(numOfGoods);
			cart.setTotalMoney(totalMoney);
			
		}
		
		if (cart != null) {
			return cart;
		}
		
		return null;
	}

	
	/**
	 * �ѹ��ﳵ�е���Ϣͬ�����ӵ�goodintransit���У�����Ϊ�µ���cart���еļ�¼��ɾ����������Ҫ���goodintransit��ֵһ�����ϣ�
	 * �����Ժ���¶�����ģ�����֧���Ȳ�����������Ϣ��ѯ
	 * @param customerid
	 * @param cartid
	 * @param idofgoods
	 * @param numofgoods
	 * @param totalmoney
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public boolean CartAddToGoodsInTransit(int customerid, int cartid,
			int idofgoods, int numofgoods, double totalmoney) throws ClassNotFoundException, SQLException {
		
		Connection conn = DB.DBConn();
		
			conn = DB.DBConn();

			String sql = "INSERT INTO goodsintransit(idofcart,idofcustomer,idofgoods,numofgoods,totalmoney) "
					+ "VALUES(?,?,?,?,?)";
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, cartid);
			stmt.setInt(2, customerid);
			stmt.setInt(3, idofgoods);
			stmt.setInt(4, numofgoods);
			stmt.setDouble(5, totalmoney);
			
			if(stmt.executeUpdate() == 1){
				DB.close(conn);
				return true;
			}else {
				return false;
			}
	}

	public List<Order> queryOrdersByOperator(int idofcustomer, int requestCode) throws ClassNotFoundException, SQLException {
		Connection conn = DB.DBConn();

		String sql = null;
		
		Statement stmt = conn.createStatement();
		
		sql = "SELECT * FROM orders";
		
		
		List<Order> orderList = new ArrayList<Order>();
		
		if (requestCode == 0 && idofcustomer == 0) {
			
			sql = "SELECT * FROM customerorder";
		}
		else if(requestCode != 0 && idofcustomer != 0){
			
			sql = "SELECT * FROM customerorder where customerorder = '" + idofcustomer +"'";
		}
		ResultSet rs = stmt.executeQuery(sql);

		Order order = null;
		
		while (rs.next()) {

			int idoforder = rs.getInt(1);
			int customerid = rs.getInt(2);
			String customername = rs.getString(3);
			String customeraddress = rs.getString(4);
			String customerphone = rs.getString(5);
			
			int idofcart = rs.getInt(6);
			String status = rs.getString(7);
			String expressmode = rs.getString(9);
			double expresscharge = rs.getDouble(9);
			String paymode = rs.getString(10);
			String expressworker = rs.getString(11);
			String expressworkerphone = rs.getString(12);
			String invoicestypeandinfo = rs.getString(13);
			double totalmoney = rs.getDouble(14);

			order = new Order();
			
			order.setId(idoforder);
			order.setCustomerID(customerid);
			order.setCustomerName(customername);
			order.setCustomerAddress(customeraddress);
			order.setCustomerPhone(customerphone);
			order.setIdOfCart(idofcart);
			order.setStatus(status);
			order.setExpressMode(expressmode);
			order.setExpressCharge(expresscharge);
			order.setPayMode(paymode);
			order.setExpressWorker(expressworker);
			order.setExpressWorkerPhone(expressworkerphone);
			order.setInvoiceStypeAndInfo(invoicestypeandinfo);
			order.setTotalMoney(totalmoney);
			
			
			orderList.add(order);
		}
		DB.close(conn);
		if (orderList != null) {
			
			return orderList;
		}
		
		return null;
	}
	
	
	public boolean editCustomerOrderStatus(int customerid,int requestCode) throws SQLException, ClassNotFoundException {
		Connection conn = DB.DBConn();

		String sql = null;
		if (requestCode == 11) {

			try {
				conn = DB.DBConn();

				sql = "UPDATE customerorder SET status = ? where idoforder = ?";

//				File file_edit = new File(jtf_open.getText());
//				FileInputStream fis_edit = new FileInputStream(file_edit);

				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, "�����Ѹ���");
				stmt.setInt(2, customerid);
//				stmt.setString(3, birthday);
//				stmt.setString(4, note);
//				stmt.setBinaryStream(5, fis_edit, (int) file_edit.length());
//				stmt.setString(6, id);
				if (stmt.executeUpdate() == 1) {
					DB.close(conn);
					return true;
				}
				return false;
				
//				fis_edit.close();
				
//				�ο�sql = "update seller set shopid = '' where id = '" + id +"'";

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} 
				
			
		}
		return false;
	}

	/**
	 * ��Ա����Ӫ��ɾ��������ÿ��ɾ��һ����
	 * @param orderId
	 * @param requestCode
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public boolean delOrder(int orderId, int requestCode) throws SQLException, ClassNotFoundException {

		Connection conn = DB.DBConn();

		Statement stmt = conn.createStatement();
		String sql = "";
		//��Աɾ��������ÿ��ɾ��һ����
		if (requestCode == 0) {
			sql = "delete from customerorder where idoforder = '" + orderId + "'";
		}
		//��Ӫ��ɾ��������������Ȩ������
		else if (requestCode == 1 ) {
			sql = "delete from customerorder where idoforder = '" + orderId + "'";
		}
		
		if (stmt.executeUpdate(sql) == 1) {
			
			DB.close(conn);
			return true;
		}
		
		DB.close(conn);
		
		return false;
	}
	
	//��ѯ����״̬
	public String readOrderStatus(int orderId) throws SQLException, ClassNotFoundException {
		
		Connection conn = DB.DBConn();

		String sql = null;
		
		Statement stmt = conn.createStatement();
		sql = "SELECT status FROM customerorder where idoforder = '" + orderId +"'";
		ResultSet rs = stmt.executeQuery(sql);
		String status = null;
		if (rs.next()) {

			status = rs.getString(1);
		}
		DB.close(conn);
		if (status != null) {
			
			return status;
		}
		
		return null;
	}

	/**
	 * ���ݶ������ͻ�Աid�޸�customer������
	 * @param customerId
	 * @param totalMoney
	 * @return -1(����) 1(������)
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public int editCustomerBalance(int customerId,double totalMoney,int requestCode) throws SQLException, ClassNotFoundException {

		Connection conn = DB.DBConn();

		String sql = null;
		
		conn = DB.DBConn();

		Statement stmt = conn.createStatement();
		
		sql = "SELECT balance FROM customer where id = '" + customerId +"'";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		double balance = 0.0;
		
		if (rs.next()) {

			balance = rs.getDouble(1);
//			System.out.println("balance = " + balance);
		}
		
		//��Ա��������ȥ���
		if (requestCode == 0) {
			
				balance -= totalMoney;
		}
		//��Ա�˻��ɹ����յ�ȫ���˿�
		else if (requestCode == 1) {
				balance += totalMoney;
			
		}
		
//		System.out.println("now,balance = " + balance);
		if (balance >= 0) {
			sql = "UPDATE customer SET balance = " + balance + " where id = '" + customerId + "'";
			
			if (stmt.executeUpdate(sql) == 1) {
				DB.close(conn);
				return 1;
			}else {
				return -1;
			}
		}
//		fis_edit.close();
				
//		�ο�sql = "update seller set shopid = '' where id = '" + id +"'";
		return -1;
	}

	/**
	 * ��ֵҳ����֤��Ա��ݡ�id��֧���������Ч��
	 * @param customerId
	 * @param userIdentity
	 * @param payPsw
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public boolean isValidCustomer(int customerId, String userIdentity,
			String payPsw) throws ClassNotFoundException, SQLException {
		Connection conn = DB.DBConn();
		String sql = null;
		
		conn = DB.DBConn();
		Statement stmt = conn.createStatement();
//		System.out.println("1");
		List<Customer> customers =  (List<Customer>)query(userIdentity, customerId, 0);
		Customer customer = null;
		
		if (customers == null) {
			return false;
		}
		else if (customers != null) {
			
		
			for (Customer cus : customers) {
				customer = cus;
			}
			
			if (customer.getPayPsw().equals(payPsw)) {
				return true;
			}
			else {
				return false;
			}
		
		}
		return false;
	}

	/**
	 * ��Ա����֧�����룬�����˻������㣬֧���ɹ��󣬸��Ķ���״̬:
	 * 1���ȴ���Ҹ���->�����Ѹ���
	 * @param orderId
	 * @param status
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public boolean editOrderStatus(int orderId, String status) throws SQLException, ClassNotFoundException {
		Connection conn = DB.DBConn();

		String sql = null;
		conn = DB.DBConn();

		sql = "UPDATE customerorder SET status = ? where idoforder = ?";

		PreparedStatement stmt = conn.prepareStatement(sql);
		//��Ҳ���
		if (status.equals("�ȴ���Ҹ���")) {
			
			stmt.setString(1, "����Ѹ���ȴ�ƽ̨ȷ��");
		}
		//���Ҳ���
		else if (status.equals(new String("����Ѹ���ȴ�ƽ̨ȷ��"))) {
			stmt.setString(1, "�����ѷ���");
		}
		//��Ҳ���
		else if (status.equals(new String("�����ѷ���"))) {
			stmt.setString(1, "������ջ�");
		}
		//���Ҳ���
		else if (status.equals(new String("������ջ�"))) {
			stmt.setString(1, "���׳ɹ����رս���");
		}
		//
//		else if (status.equals(new String("���׳ɹ����رս���"))) {
//			stmt.setString(1, "�����˻���");
//		}
		//��Ҳ���
		else if (status.equals(new String("tuihuo"))) {
			stmt.setString(1, "��������˻�");
		}
		//���Ҳ���
		else if (status.equals(new String("��������˻�"))) {
			stmt.setString(1, "���������˻�Э���Ѵ��");
		}
		//��Ҳ���
		else if (status.equals(new String("huanhuo"))) {
			stmt.setString(1, "������뻻��");
		}
		//���Ҳ���
		else if (status.equals(new String("������뻻��"))) {
			stmt.setString(1, "�������뻻��Э���Ѵ��");
		}
		stmt.setInt(2, orderId);
		if (stmt.executeUpdate() == 1) {
			DB.close(conn);
			return true;
		}
		return false;
	}

	/**
	 * ��Ա��ֵ�˻����
	 * @param parseInt ��Աid
	 * @param parseDouble Ҫ��ֵ�Ľ��
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public boolean chongzhiBalance(int parseInt, double parseDouble) throws SQLException, ClassNotFoundException {
		Connection conn = DB.DBConn();

		String sql = null;
		conn = DB.DBConn();

		sql = "SELECT balance FROM customer where id = '" + parseInt +"'";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		double balance = 0.0;
		
		if (rs.next()) {

			balance = rs.getDouble(1);
//			System.out.println("chongzhiBalance�����У���ǰbalance = " + balance);
		}
		System.out.println("֮ǰ��balance"+balance);
		balance += parseDouble;
		sql = "UPDATE customer SET balance = " + balance + " where id = '" + parseInt+"'";

			
		if (stmt.executeUpdate(sql) == 1) {
			DB.close(conn);
			return true;
		}
		DB.close(conn);
		return false;
	}

	/**
	 * ���ݶ�����ѯ���ﳵ�����ڶ���״̬����Ϊ������Ѹ���ȴ�ƽ̨ȷ�ϡ���ɾ����Ӧ�Ĺ��ﳵ��¼
	 * @param orderId
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public int readCartIdInOrderStatus(int orderId) throws SQLException, ClassNotFoundException {
		Connection conn = DB.DBConn();

		String sql = null;
		conn = DB.DBConn();

		sql = "SELECT idofcart FROM customerorder where idoforder = '" + orderId +"'";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		int cartId = -1;
		if (rs.next()) {

			cartId = rs.getInt(1);
		}
		if (cartId != -1) {
			return cartId;
		}
		return cartId;
	}

	/**
	 * ��ѯ�������ܶ�-���ó���Ӫ�̵�Ӫҵ��
	 * @param orderId
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public double readOrderMoney(int orderId) throws SQLException, ClassNotFoundException {

		Connection conn = DB.DBConn();

		String sql = null;
		
		Statement stmt = conn.createStatement();
		sql = "SELECT totalmoney FROM customerorder where idoforder = '" + orderId +"'";
		ResultSet rs = stmt.executeQuery(sql);
		double totalmoney = 0.0;
		if (rs.next()) {

			totalmoney = rs.getDouble(1);
		}
		DB.close(conn);
		if (totalmoney != 0) {
			
			return totalmoney;
		}
		
		return totalmoney;
	}
	
	/**
	 * �ڶ����ж�ȡ��Աid�������޸Ļ�Ա�����������˻�)
	 * @param orderId
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public int readCustomerIdInOrder(int orderId) throws SQLException, ClassNotFoundException {
		
		Connection conn = DB.DBConn();
		
		String sql = null;
		
		Statement stmt = conn.createStatement();
		sql = "SELECT customerid FROM customerorder where idoforder = '" + orderId +"'";
		ResultSet rs = stmt.executeQuery(sql);
		int customerId = -1;
		if (rs.next()) {
			
			customerId = rs.getInt(1);
		}
		DB.close(conn);
		if (customerId != -1) {
			
			return customerId;
		}
		
		return customerId;
	}

	public boolean editOperatorTurnOver(int operatorId, double totalMoney,int requestCode) throws ClassNotFoundException, SQLException {

		List<Operator> operators = (List<Operator>)query("operator", operatorId, 0);
		
		Operator operator = null;
		
		for (Operator op : operators) {
			operator = op;
		}
				
		double turnover = 0.0;
		if (requestCode == 1) {
			
			turnover = operator.getTurnover() + totalMoney;
		}
		else if(requestCode == 0){
			turnover = operator.getTurnover() - totalMoney;
			
		}
		if (turnover < 0) {
			return false;
		}
		
		Connection conn = DB.DBConn();

		String sql = null;
		
		conn = DB.DBConn();

		Statement stmt = conn.createStatement();
		
		sql = "UPDATE operator SET turnover = " + turnover + " where id = '" + operatorId + "'";
			
		if (stmt.executeUpdate(sql) == 1) {
			DB.close(conn);
			return true;
		}else {
			DB.close(conn);
			return false;
		}
	}

	/**
	 * ��Ա�޸���Ϣ
	 * @param customer
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public boolean editCustomerInfo(Customer customer) throws ClassNotFoundException, SQLException {
		
		Connection conn = DB.DBConn();

		String sql = null;
		conn = DB.DBConn();

		sql = "UPDATE customer SET name = ?,psw = ?,paypsw = ?,phone = ?,deliveryaddresses = ? where id = ?";

		PreparedStatement stmt = conn.prepareStatement(sql);
			
		stmt.setString(1, customer.getName());
		stmt.setString(2, customer.getPsw());
		stmt.setString(3, customer.getPayPsw());
		stmt.setString(4, customer.getPhone());
		stmt.setString(5, customer.getDeliveryAddress());
		stmt.setInt(6, customer.getId());
		if (stmt.executeUpdate() == 1) {
			DB.close(conn);
			return true;
		}
		DB.close(conn);
		return false;
	}

	/**
	 * ������ݺ�С������id
	 * @param identity
	 * @param customerName
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public int queryIdByName(String identity, String customerName) throws ClassNotFoundException, SQLException {
		Connection conn = DB.DBConn();

		String sql = null;
		
		Statement stmt = conn.createStatement();
		if (identity.equals(new String("customer"))) {
			
			sql = "SELECT id FROM customer where name = '" + customerName +"'";
		}
		ResultSet rs = stmt.executeQuery(sql);
		int id = -1;
		if (rs.next()) {

			id = rs.getInt(1);
		}
		DB.close(conn);
		if (id != -1) {
			
			return id;
		}
		
		return id;
		
	}

	public boolean addGoodsInfo(Goods goods) throws SQLException, ClassNotFoundException {
		
		Connection conn = DB.DBConn();
		
			conn = DB.DBConn();

			String sql = "INSERT INTO goods "
					+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = conn.prepareStatement(sql);
//			stmt.setString(1, id);
			
			stmt.setInt(1, goods.getId());
			stmt.setString(2, goods.getName());
			stmt.setString(3, goods.getSort());
			stmt.setInt(4, goods.getTotalvolume());
			stmt.setInt(5, 0);
			stmt.setInt(6, (goods.getTotalvolume() - 0));
			stmt.setDouble(7, goods.getPrice());
			stmt.setString(8, goods.getIntroduce());
			stmt.setString(9,goods.getColor() );
			stmt.setString(10,goods.getStyle() );
			stmt.setString(11,goods.getSpecification() );
			stmt.setString(12,"" );
			stmt.setString(13, goods.getPicturepath());
			
			if(stmt.executeUpdate() == 1){
				DB.close(conn);
				return true;
			}else {
				return false;
			}

	}

	public boolean editGoodsInfo(Goods goods) throws ClassNotFoundException, SQLException {
		Connection conn = DB.DBConn();
		
		conn = DB.DBConn();

		String sql = null;
//		"INSERT INTO goods "
//				+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		sql = "UPDATE goods SET name = ?,class = ?,totalvolume = ?,salesvolume = ?,kucun = ?"
				+ ",price = ?,introduce = ?,color = ?,style = ?,specification = ?,evaluation = ?,"
				+ "picturepath = ? where id = ?";

		PreparedStatement stmt = conn.prepareStatement(sql);
//		stmt.setString(1, id);
		
		stmt.setString(1, goods.getName());
		stmt.setString(2, goods.getSort());
		stmt.setInt(3, goods.getTotalvolume());
		stmt.setInt(4, goods.getSalesvolume());
		stmt.setInt(5, (goods.getTotalvolume() - goods.getSalesvolume()));
		stmt.setDouble(6, goods.getPrice());
		stmt.setString(7, goods.getIntroduce());
		stmt.setString(8,goods.getColor() );
		stmt.setString(9,goods.getStyle() );
		stmt.setString(10,goods.getSpecification() );
		stmt.setString(11,goods.getEvaluation() );
		stmt.setString(12, goods.getPicturepath());
		stmt.setInt(13, goods.getId());
		
		if(stmt.executeUpdate() == 1){
			DB.close(conn);
			return true;
		}else {
			DB.close(conn);
			return false;
		}
	}	
}