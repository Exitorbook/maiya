package cn.edu.zhku.model;

public class Operator {
	private int operatorId;
	private String operatorName;
	private String operatorPsw;
	private String operatingAuthorityPsw;
	//���񱨱�id
	private int financialStatementId;
	//������֧��������������ɨ΢�Ŷ�ά����ʽ֧��
	private String thirdPartyPayment;
	private String sellers;//��ӵ�е����ҵ�id,��Ӣ�ķֺŷָ�
	private String shops;//��ӵ�еĵ��̵�id,��Ӣ�ķֺŷָ�
	private String customers;//��ӵ�еĻ�Ա��id,��Ӣ�ķֺŷָ�
	private double turnover;//Ӫҵ��
	
	public double getTurnover() {
		return turnover;
	}
	public void setTurnover(double turnover) {
		this.turnover = turnover;
	}
	public int getOperatorId() {
		return operatorId;
	}
	public void setOperatorId(int operatorId) {
		this.operatorId = operatorId;
	}
	public String getOperatorName() {
		return operatorName;
	}
	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}
	public String getOperatorPsw() {
		return operatorPsw;
	}
	public void setOperatorPsw(String operatorPsw) {
		this.operatorPsw = operatorPsw;
	}
	public String getOperatingAuthorityPsw() {
		return operatingAuthorityPsw;
	}
	public void setOperatingAuthorityPsw(String operatingAuthorityPsw) {
		this.operatingAuthorityPsw = operatingAuthorityPsw;
	}
	public int getFinancialStatementId() {
		return financialStatementId;
	}
	public void setFinancialStatementId(int financialStatementId) {
		this.financialStatementId = financialStatementId;
	}
	public String getThirdPartyPayment() {
		return thirdPartyPayment;
	}
	public void setThirdPartyPayment(String thirdPartyPayment) {
		this.thirdPartyPayment = thirdPartyPayment;
	}
	public String getSellers() {
		return sellers;
	}
	public void setSellers(String sellers) {
		this.sellers = sellers;
	}
	public String getShops() {
		return shops;
	}
	public void setShops(String shops) {
		this.shops = shops;
	}
	public String getCustomers() {
		return customers;
	}
	public void setCustomers(String customers) {
		this.customers = customers;
	}
	
	
	
}
