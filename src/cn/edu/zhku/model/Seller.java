package cn.edu.zhku.model;

public class Seller {

	private int id;//int(11) not null
	private String name;//varchar(45) not null
	private String psw;//varchar(20) not null
	//�Ƿ���Ч��֤������
	private String isValidSeller;//enum('0','1') 0λ��Ч��֤���ң�1Ϊ��Ч ;ALTER TABLE `maiya`.`seller` modify isValidSeller enum('0','1') NOT NULL default '0';
	private String shopId;//һ������ֻ����1��0�����̣�int(11) ��ʱ�޵��̱�־Ϊnull����Ĭ��Ϊnull
	//Ӫҵ��
	private double turnOver;//double not null Ĭ��Ϊ0.00
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPsw() {
		return psw;
	}
	public void setPsw(String psw) {
		this.psw = psw;
	}
	public String getIsValidSeller() {
		return isValidSeller;
	}
	public void setIsValidSeller(String isValidSeller) {
		this.isValidSeller = isValidSeller;
	}
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public double getTurnOver() {
		return turnOver;
	}
	public void setTurnOver(double turnOver) {
		this.turnOver = turnOver;
	}
	
	
	
}
