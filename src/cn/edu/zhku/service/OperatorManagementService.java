package cn.edu.zhku.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.edu.zhku.DB.DB;
import cn.edu.zhku.dao.UserDao;
import cn.edu.zhku.model.Customer;
import cn.edu.zhku.model.Operator;
import cn.edu.zhku.model.Order;
import cn.edu.zhku.model.ShopInfo;

public class OperatorManagementService {
	UserDao userDao = new UserDao();
	public ShopInfo QueryShopsInfoDetails(int shopId) throws SQLException, ClassNotFoundException{
		
		return userDao.QueryShopInfo(shopId);
	}
	/**
	 * ��ʾ��һ��������Ϣ
	 * @param operatorId
	 * @param shopCurrentId
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public ShopInfo QueryNextShopInfoDetails(int operatorId,int shopCurrentId) throws SQLException, ClassNotFoundException{
//		v1.0 - err
//		UserDao userDao = new UserDao();
//		for (int i = 0; i < 10; i++) {
//			if(nextIsValidShopId(shopId+1)){
//				userDao.QueryShopInfo(shopId);
//				break;
//			}
//			else {
//				continue;
//			}
//		}
//		return userDao.QueryShopInfo(shopId);
		
//		UserDao userDao = new UserDao();
		int nextShopId = 0;
		List<?> userlist = userDao.query("operator",operatorId,0);
	    
		String shops = null;
		//��ȡ�����е���id��ɵ��ַ�����
	    for (Object object : userlist) {
	    	shops = ((Operator)object).getShops();
	    }
	    
	    String [] shopsArr = shops.split(";");
	    int [] shopsIdArr = new int[shopsArr.length];
	    	
	    for(int i = 0;i < shopsIdArr.length;i++){
	    	shopsIdArr[i] = Integer.parseInt(shopsArr[i]);
	    }
	    	
	    
		for (int i = 0; i < shopsIdArr.length; i++) {
			
			
			if(shopsIdArr[i] == shopCurrentId && i != shopsIdArr.length - 1){
				nextShopId = shopsIdArr[i + 1]; 
			}
			else if (shopsIdArr[i] == shopCurrentId && i == shopsIdArr.length - 1) {
				return null;
			}
			
		}
		return userDao.QueryShopInfo(nextShopId);
	}
	
//	err
//	public boolean nextIsValidShopId(int i) throws SQLException, ClassNotFoundException {
//		
//		UserDao userDao = new UserDao();
//		if (userDao.QueryShopInfo(i) != null) {
//			return true;
//		}
//		
//		return false;
//	}

	
	/**
	 * ��ѯ��һ��������Ϣ
	 * @param operatorId_forlast
	 * @param shopCurrentId_forlast
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public ShopInfo QueryLastShopInfoDetails(int operatorId_forlast,int shopCurrentId_forlast) throws SQLException, ClassNotFoundException {
//		UserDao userDao = new UserDao();
		int lastShopId = 0;
		List<?> userlist = userDao.query("operator",operatorId_forlast,0);
	    
		String shops = null;
		//��ȡ�����е���id��ɵ��ַ�����
	    for (Object object : userlist) {
	    	shops = ((Operator)object).getShops();
	    }
	    
	    String [] shopsArr = shops.split(";");
	    int [] shopsIdArr = new int[shopsArr.length];
	    	
	    for(int i = 0;i < shopsIdArr.length;i++){
	    	shopsIdArr[i] = Integer.parseInt(shopsArr[i]);
	    }
	    	
	    
		for (int i = 0; i < shopsIdArr.length; i++) {
			
			if(shopsIdArr[i] == shopCurrentId_forlast && i != 0){
				lastShopId = shopsIdArr[i - 1]; 
			}
			else if (shopsIdArr[i] == shopCurrentId_forlast && i == 0) {
				return null;
			}
		}
		return userDao.QueryShopInfo(lastShopId);
	}
	/**
	 * ��ѯʣ�µĵ�����Ϣ
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public List<ShopInfo> QueryTheRemainingShopInfoDetails(int operatoeId,String queryedShopIds) throws ClassNotFoundException, SQLException{
		
//		UserDao userDao = new UserDao();
		
		//�������ʾ��ҳ���ϵĵ��̵�id����
		String [] shopsArr = queryedShopIds.split(";");
    	int [] shopsIdArr = new int[shopsArr.length - 1];
    	
    	System.out.print("����ʾ�ĵ���id:");
    	for(int i = 0;i < shopsIdArr.length;i++){
    		shopsIdArr[i] = Integer.parseInt(shopsArr[i]);
    		System.out.print(shopsIdArr[i] + "  A");
    	}
    	//��ȡ���ݿ��У�operator���У�operatorId��Ӧ�ĵ���id���飨ȫ�����̣�
    	List <?> usersInfo = userDao.query("operator", operatoeId, 0);
    	
    	String shopIds = "";
    	
    	for (Object object : usersInfo) {
    		shopIds = ((Operator)object).getShops();
		}
    	//���ݿ��У������ȡ�������е���id
    	String [] shopsArr_all = shopIds.split(";");
    	int [] shopsIdArr_all = new int[shopsArr_all.length - 1];
    	
    	System.out.println("\n�����ݿ�-operator���ж����������е���idΪ��");
    	for(int i = 0;i < shopsIdArr_all.length;i++){
    		shopsIdArr_all[i] = Integer.parseInt(shopsArr_all[i]);
    		System.out.print(shopsIdArr_all[i] + " ");
    	}
    	//�ó���Ҫ��ʾ��ҳ���ϵ�ʣ�µĵ���id
    	List<Integer> intArrayList = new ArrayList<Integer>();
//    	for (ShopInfo integer : intArrayList) {
//			integer.add(0);
//		}
    	for (int i = 0; i < shopsIdArr_all.length; i++) {
			intArrayList.add(shopsIdArr_all[i]);
		}
    	
    	for (int i = 0; i < intArrayList.size(); i++) {
    		if (i == shopsIdArr.length) {
				break;
			}
    		else if (intArrayList.contains(new Integer(shopsIdArr[i]))) {
    			intArrayList.remove(new Integer(shopsIdArr[i]));
			}
    		
		}
    	//��������ݿ��ȡ���ĵ���idsΪ��
    	if (intArrayList.size() == 0) {
    		return null;
    	}
    	System.out.println("�Ƴ���");
    	for (Integer integer : intArrayList) {
			System.out.print(integer + " ");
		}
    	List<ShopInfo> theRemainingShopsId = new ArrayList<ShopInfo>();
    	
    	for (int i = 0 ; i < intArrayList.size() ; i++) {
    		theRemainingShopsId.add(userDao.QueryShopInfo(intArrayList.get(i).intValue()));
		}
    	System.out.println("l = "+theRemainingShopsId.size() + "   " + theRemainingShopsId.get(0).getShopId());
		return theRemainingShopsId;
		
	}
	
	
	/**
	 * ��Ӫ��ɾ��������Ϣ����Ա��Ϣ
	 * @param identity
	 * @param shopCurrentId
	 * @param operatorid
	 * @param requsetCode
	 * @return
	 * @throws SQLException
	 * @throws NumberFormatException
	 * @throws ClassNotFoundException
	 * @throws IOException
	 */
	public boolean OperatorDeleteOthersInfo(String identity,String CurrentId,String operatorid,int requsetCode) throws SQLException, NumberFormatException, ClassNotFoundException, IOException{
		if (identity.equals(new String("operator"))) {
			if (requsetCode == 1) {
				//��Ӫ��ɾ��������Ϣ
				boolean flag_shop = userDao.delelte(CurrentId, 22);
				//ɾ��seller���е�shopid��������������������̵������ߣ���ѵ��̵ļ�¼��Ϊ�գ���ʾ��������ʱû���̣�������Ҫ��Ӫ��ͨ�����ύ�����뿪��������飩
				int sellerId = userDao.getSellerIdByOperator(Integer.parseInt(CurrentId));
				boolean flag_seller = userDao.delelte(String.valueOf(sellerId), 210);
				System.out.println(identity + "   " + CurrentId + "   " + operatorid);
				//operator�У�shops�ļ�¼������Ӧ�ĸ��£���ɾ���������id
				List<?> operatorList = userDao.query(identity, Integer.parseInt(operatorid), 0);
				System.out.println("�ɹ�1��");
				
				Operator operator = null;
				for (Object object : operatorList) {
					operator = (Operator)object;
				}
				
				String shops  = operator.getShops();
	//userDao.updateShopsIdByOperator(identity);
				
				boolean flag_operator = userDao.updateShopsIdByOperator(shops,CurrentId,Integer.parseInt(operatorid),1);
				System.out.println("OperatorDeleteShop   servlet �ɹ�");
				if (flag_seller && flag_shop && flag_operator) {
					
					return true;
				}
				else {
					return false;
				}
			}
		//��Ӫ��ɾ����Ա��Ϣ
		else if (requsetCode == 2) {
			System.out.println("h");
			boolean flag_shop = userDao.delelte(CurrentId, 20);
						if (flag_shop ) {
							return true;
						}
						else {
							return false;
						}
		}
		
		}
		return false;
	}
	
	
	public boolean Synchronize(String operatorid,String opearatorIdentity,int reqCode) throws NumberFormatException, ClassNotFoundException, SQLException{
		
		//��������ͬ������ip��Ϣ���������Ժ�����
		if (reqCode == 1) {
			
		
		System.out.println("zl");
//		List<?> operatorList = userDao.query(opearatorIdentity, Integer.parseInt(operatorid), 0);
//		Operator operator = null;
//		for (Object object : operatorList) {
//			operator = (Operator)object;
//		}
//		
//		String shops  = operator.getShops();
//		System.out.println("123456" +shops);
		//��shop���ȡ��ȫ������id
		List<?> idOfShopList = userDao.query(opearatorIdentity, Integer.parseInt(operatorid), 11);
		
		String idOfShopString = "";
		
		for (Object object : idOfShopList) {
			idOfShopString += (String)object + ";";
		}
		System.out.println("1234567" + idOfShopString);
		
		Connection conn = null;

			conn = DB.DBConn();

			String sql = "UPDATE operator SET shops = ? where id = ?";

//			File file_edit = new File(jtf_open.getText());
//			FileInputStream fis_edit = new FileInputStream(file_edit);

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, idOfShopString);
			stmt.setString(2, operatorid);
//			stmt.setBinaryStream(5, fis_edit, (int) file_edit.length());
			if (stmt.executeUpdate() == 1) {
				DB.close(conn);
				return true;
			}
			
			DB.close(conn);
		}
		
		//��shop���ȡ��ȫ����Աid
		else if(reqCode == 2){
			List<?> idsList = userDao.query(opearatorIdentity, Integer.parseInt(operatorid), 12);
			
			String idsString = "";
			
			for (Object object : idsList) {
				idsString += (String)object + ";";
			}
			
			Connection conn = null;

				conn = DB.DBConn();

				String sql = "UPDATE operator SET customers = ? where id = ?";

//				File file_edit = new File(jtf_open.getText());
//				FileInputStream fis_edit = new FileInputStream(file_edit);

				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, idsString);
				stmt.setString(2, operatorid);
//				stmt.setBinaryStream(5, fis_edit, (int) file_edit.length());
				if (stmt.executeUpdate() == 1) {
					DB.close(conn);
					return true;
				}
				
				DB.close(conn);
		}
			
		return false;
	}
	
//	��Ӫ����֤����
//	����operatorIdToSynShop,operatorIdtenToSynShop
	public boolean AuthenticateShopCtrl(String operatorId,String operatorIdentity) throws ClassNotFoundException, SQLException, IOException{
		System.out.println("AuthenticateShopCtrl������");
		//��ѯshop���У�
		List<?> isValidShopList = userDao.QueryShopAllInfos(1);
		ShopInfo isValidShop = null;
		
		boolean flag = false;
		
		for (Object object : isValidShopList) {
			isValidShop = (ShopInfo)object;
			//Ϊ0��õ��̻�û��֤
			if (Integer.parseInt(isValidShop.getIsValidShop()) == 0) {
				System.out.println("3,shopid" + isValidShop.getShopId());
				userDao.updateShopsIdByOperator(null, String.valueOf(isValidShop.getShopId()), -1, 2);
				
				flag = true;
			}
		}
		
		//��Ϊ1�������ȫ����֤������false
			
		return flag;
	}
	
	
//	��Ӫ�̲鿴��Ա��Ϣ����¼���롢֧��������⣩
	public List<Customer> QueryCustomersInfo(String operatorIdentity,int operatorId) throws ClassNotFoundException, SQLException{
		
		if (operatorIdentity.equals(new String("operator"))) {
			return (List<Customer>)userDao.query(operatorIdentity, operatorId, 13);
		}
		
		return null;
	}
	/**
	 * ��Ӫ�̻�ȡȨ������
	 * @param input
	 * @param identity
	 * @param id
	 * @param requestCode
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public boolean QueryAuthorityPsw(String input,String identity,int id,int requestCode) throws ClassNotFoundException, SQLException{
		//reqcode=0
		List<Operator> operatorList = (List<Operator>)userDao.query(identity, id, requestCode);
		
		String getString = null;
		for (Operator operator : operatorList) {
			getString = operator.getOperatingAuthorityPsw();
		}
		
		if (input.equals(new String(getString))) {
			return true;
		}
		return false;
	}
	public boolean edit(Operator operator,int requestCode) throws SQLException, IOException {
		
		if (userDao.edit(operator, requestCode)) {
			return true;
		}
		
		
		return false;
	}

	public List<Order> queryOrders() throws ClassNotFoundException, SQLException{
		
		List<Order> ordersList = userDao.queryOrdersByOperator(0,0);
		
		if (ordersList != null) {
			return ordersList;
		}
		
		return null;
		
	}

}
