package cn.edu.zhku.model;

public class ShopInfo {
	
	private int shopId;//int(11) pk not null
	private String shopName;//varchar(45) not null
	private int sellerId;//һ�����Ҷ�Ӧһ������int(11) not null 
	//�Ƿ���Ч��֤����
	private String isValidShop;//enum('0','1') 0λ��Ч��֤���̣�1Ϊ��Ч ;ALTER TABLE `maiya`.`seller` modify isValidSeller enum('0','1') NOT NULL default '0';
	//����Ӫҵ��
	private double shopTurnOver;//double
	//���̵���
	private String shopGoodsId;//��Ʒid�ַ������á�;���ָ�  varchar(255) not null Ĭ�ϣ�����
	//���̶���
	private String shopOrdersId;//����id�ַ������á�;���ָ�  varchar(255) not null Ĭ�ϣ�����
	public int getShopId() {
		return shopId;
	}
	public void setShopId(int shopId) {
		this.shopId = shopId;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public String getIsValidShop() {
		return isValidShop;
	}
	public void setIsValidShop(String isValidShop) {
		this.isValidShop = isValidShop;
	}
	public double getShopTurnOver() {
		return shopTurnOver;
	}
	public void setShopTurnOver(double shopTurnOver) {
		this.shopTurnOver = shopTurnOver;
	}
	public String getShopGoodsId() {
		return shopGoodsId;
	}
	public void setShopGoodsId(String shopGoodsId) {
		this.shopGoodsId = shopGoodsId;
	}
	public String getShopOrdersId() {
		return shopOrdersId;
	}
	public void setShopOrdersId(String shopOrdersId) {
		this.shopOrdersId = shopOrdersId;
	}
	
	
	
}
