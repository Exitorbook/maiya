package cn.edu.zhku.model;

public class Order {

	private int id;//int(11) pk not null
	private int customerID;//int(11) not null
	private String customerName;//varc(45) NN
	private String customerAddress;//varc(255) NN
	private String customerPhone;//varc(15) NN
	
	private int idOfCart;//�����ж����Ʒid,�ԡ�;�����룬int(11) not null 
	private String status;//����״̬��enum('�ȴ���Ҹ���','����Ѹ���ȴ�ƽ̨ȷ��','�ȴ�����','�Ѳ��ַ���','�ȴ����ȷ���ջ�','��ȷ���ջ�','���׳ɹ�','���׹ر�','��������˿�ȴ�Э�̽��','���ȡ���˿�����','�����˿��ȴ�����','�˿�Э���Ѵ��','ȡ������','�˿�/�˻�Э���У��ȴ�Э����','Э���Ѵ�ɣ�ִ����','���Ͷ����ƽ̨','��ȷ�Ϸ�������ҷ����ۺ����',) default '���׹ر�';
	//���壺alter table maiya.order modify status enum('�ȴ���Ҹ���','����Ѹ���ȴ�ƽ̨ȷ��','�ȴ�����','�Ѳ��ַ���','�ȴ����ȷ���ջ�','��ȷ���ջ�','���׳ɹ�','���׹ر�','��������˿�ȴ�Э�̽��','���ȡ���˿�����','�����˿��ȴ�����','�˿�Э���Ѵ��','ȡ������','�˿�/�˻�Э���У��ȴ�Э����','Э���Ѵ�ɣ�ִ����','���Ͷ����ƽ̨','��ȷ�Ϸ�������ҷ����ۺ����') not null default '���׹ر�';
	
	//��ݷ�ʽ
	private String expressMode;//alter table maiya.order modify delivermode enum('EMS','��ͨ','Բͨ','��ͨ','�ϴ�','˳��','����','լ����','ȫ��','�°�') not null default 'Բͨ';
	
	//��ݷ���
	private double expressCharge;//double NN default 0.00
	
	//֧����ʽ
	private String payMode;//alter table maiya.order modify paymode enum('����֧��','΢��ɨһɨ֧��','��������',) not null default '����֧��';
	
	private String expressWorker;//���Ա���� varchar(45) NN def:С����
	private String expressWorkerPhone;//���Ա�绰 varchar(45) NN default:12345678999
	private String invoiceStypeAndInfo;//��Ʊ���ͼ���Ϣ��Ϣ varchar(255) default:���ӷ�Ʊ;������ϸ��
	private double totalMoney;//double NN default:0.00
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCustomerID() {
		return customerID;
	}
	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}
	
	
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerAddress() {
		return customerAddress;
	}
	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}
	
	
	public String getCustomerPhone() {
		return customerPhone;
	}
	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}
	
	public int getIdOfCart() {
		return idOfCart;
	}
	public void setIdOfCart(int idOfCart) {
		this.idOfCart = idOfCart;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getExpressMode() {
		return expressMode;
	}
	public void setExpressMode(String expressMode) {
		this.expressMode = expressMode;
	}
	public double getExpressCharge() {
		return expressCharge;
	}
	public void setExpressCharge(double expressCharge) {
		this.expressCharge = expressCharge;
	}
	public String getPayMode() {
		return payMode;
	}
	public void setPayMode(String payMode) {
		this.payMode = payMode;
	}
	public String getExpressWorker() {
		return expressWorker;
	}
	public void setExpressWorker(String expressWorker) {
		this.expressWorker = expressWorker;
	}
	public String getExpressWorkerPhone() {
		return expressWorkerPhone;
	}
	public void setExpressWorkerPhone(String expressWorkerPhone) {
		this.expressWorkerPhone = expressWorkerPhone;
	}
	public String getInvoiceStypeAndInfo() {
		return invoiceStypeAndInfo;
	}
	public void setInvoiceStypeAndInfo(String invoiceStypeAndInfo) {
		this.invoiceStypeAndInfo = invoiceStypeAndInfo;
	}
	public double getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(double totalMoney) {
		this.totalMoney = totalMoney;
	}
	
	
	
	
}
