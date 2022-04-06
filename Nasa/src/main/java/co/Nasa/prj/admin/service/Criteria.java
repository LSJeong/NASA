package co.Nasa.prj.admin.service;

public class Criteria {

	private int pageNum; //페이지번호
	private int amount; //한 페이지당 몇개의 데이터
	
	//구매자
	private String b_email;
	private String b_nickname;
	private String b_name;
	private String b_tel;
	private String b_address;
	private String b_rank;
	private String b_date;
	private String b_date2;
	
	
	//판매자
	private String s_email;
	private String s_nickname;
	private String s_name;
	private String s_tel;
	private String s_address;
	private String s_rank;
	private String s_date;
	private String s_date2;
	private String s_grad;
	
	
	public String getS_grad() {
		return s_grad;
	}
	public void setS_grad(String s_grad) {
		this.s_grad = s_grad;
	}
	private String re_type;
	private String re_reporter;
	private String re_date;
	private String re_date2;
	
	private String ser_title;
	private String ser_line;
	private String ser_team;
	
	private String cat_no;
	private String sub_no;
	
	private String pay_cate;
	private String pay_cate1;
	private String pay_date;
	private String pay_date2;
	

	
	public String getPay_date2() {
		return pay_date2;
	}
	public void setPay_date2(String pay_date2) {
		this.pay_date2 = pay_date2;
	}
	private String ser_cate;
	private String ser_sub_cate;
	private String power_date;
	private String power_date2;
	private String s_author;
	
	private String no_id;
	private String no_title;
	private String no_date;
	private String no_date2;
	
	private String email;
	private String name;
	private String nickname;
	private String status;
	private String gb;
	
	private String blackdate;
	private String blackdate2;
	
	public String getBlackdate() {
		return blackdate;
	}
	public void setBlackdate(String blackdate) {
		this.blackdate = blackdate;
	}
	public String getBlackdate2() {
		return blackdate2;
	}
	public void setBlackdate2(String blackdate2) {
		this.blackdate2 = blackdate2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getGb() {
		return gb;
	}
	public void setGb(String gb) {
		this.gb = gb;
	}
	public String getNo_id() {
		return no_id;
	}
	public void setNo_id(String no_id) {
		this.no_id = no_id;
	}
	public String getNo_title() {
		return no_title;
	}
	public void setNo_title(String no_title) {
		this.no_title = no_title;
	}
	public String getNo_date() {
		return no_date;
	}
	public void setNo_date(String no_date) {
		this.no_date = no_date;
	}
	public String getNo_date2() {
		return no_date2;
	}
	public void setNo_date2(String no_date2) {
		this.no_date2 = no_date2;
	}
	public Criteria() {
		this(1,10);
	}
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getB_email() {
		return b_email;
	}
	public void setB_email(String b_email) {
		this.b_email = b_email;
	}
	public String getB_nickname() {
		return b_nickname;
	}
	public void setB_nickname(String b_nickname) {
		this.b_nickname = b_nickname;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_tel() {
		return b_tel;
	}
	public void setB_tel(String b_tel) {
		this.b_tel = b_tel;
	}
	public String getB_address() {
		return b_address;
	}
	public void setB_address(String b_address) {
		this.b_address = b_address;
	}
	public String getB_rank() {
		return b_rank;
	}
	public void setB_rank(String b_rank) {
		this.b_rank = b_rank;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public String getB_date2() {
		return b_date2;
	}
	public void setB_date2(String b_date2) {
		this.b_date2 = b_date2;
	}
	public String getS_email() {
		return s_email;
	}
	public void setS_email(String s_email) {
		this.s_email = s_email;
	}
	public String getS_nickname() {
		return s_nickname;
	}
	public void setS_nickname(String s_nickname) {
		this.s_nickname = s_nickname;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_tel() {
		return s_tel;
	}
	public void setS_tel(String s_tel) {
		this.s_tel = s_tel;
	}
	public String getS_address() {
		return s_address;
	}
	public void setS_address(String s_address) {
		this.s_address = s_address;
	}
	public String getS_rank() {
		return s_rank;
	}
	public void setS_rank(String s_rank) {
		this.s_rank = s_rank;
	}
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public String getS_date2() {
		return s_date2;
	}
	public void setS_date2(String s_date2) {
		this.s_date2 = s_date2;
	}
	public String getRe_type() {
		return re_type;
	}
	public void setRe_type(String re_type) {
		this.re_type = re_type;
	}
	public String getRe_reporter() {
		return re_reporter;
	}
	public void setRe_reporter(String re_reporter) {
		this.re_reporter = re_reporter;
	}
	public String getRe_date() {
		return re_date;
	}
	public void setRe_date(String re_date) {
		this.re_date = re_date;
	}
	public String getRe_date2() {
		return re_date2;
	}
	public void setRe_date2(String re_date2) {
		this.re_date2 = re_date2;
	}
	public String getSer_title() {
		return ser_title;
	}
	public void setSer_title(String ser_title) {
		this.ser_title = ser_title;
	}
	public String getSer_line() {
		return ser_line;
	}
	public void setSer_line(String ser_line) {
		this.ser_line = ser_line;
	}
	public String getSer_team() {
		return ser_team;
	}
	public void setSer_team(String ser_team) {
		this.ser_team = ser_team;
	}
	public String getCat_no() {
		return cat_no;
	}
	public void setCat_no(String cat_no) {
		this.cat_no = cat_no;
	}
	public String getSub_no() {
		return sub_no;
	}
	public void setSub_no(String sub_no) {
		this.sub_no = sub_no;
	}
	public String getPay_cate() {
		return pay_cate;
	}
	public void setPay_cate(String pay_cate) {
		this.pay_cate = pay_cate;
	}
	public String getPay_cate1() {
		return pay_cate1;
	}
	public void setPay_cate1(String pay_cate1) {
		this.pay_cate1 = pay_cate1;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public String getSer_cate() {
		return ser_cate;
	}
	public void setSer_cate(String ser_cate) {
		this.ser_cate = ser_cate;
	}
	public String getSer_sub_cate() {
		return ser_sub_cate;
	}
	public void setSer_sub_cate(String ser_sub_cate) {
		this.ser_sub_cate = ser_sub_cate;
	}
	public String getPower_date() {
		return power_date;
	}
	public void setPower_date(String power_date) {
		this.power_date = power_date;
	}
	public String getPower_date2() {
		return power_date2;
	}
	public void setPower_date2(String power_date2) {
		this.power_date2 = power_date2;
	}
	public String getS_author() {
		return s_author;
	}
	public void setS_author(String s_author) {
		this.s_author = s_author;
	}
	
	
	
}
