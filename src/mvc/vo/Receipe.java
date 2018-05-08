package mvc.vo;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class Receipe {
private String email;
private int no;
private String fname;
private String addmat;
private String addnum;
private int pnum;
private String proce;
private double kcal;
private double car;
private double pro;
private double fat;
private MultipartFile[] report;
private ArrayList<ReceipeFile> rnames;
public Receipe() {
	super();
	// TODO Auto-generated constructor stub
}
public Receipe(String email, int no, String fname, String addmat, String addnum, int pnum, String proce, double kcal,
		double car, double pro, double fat) {
	super();
	this.email = email;
	this.no = no;
	this.fname = fname;
	this.addmat = addmat;
	this.addnum = addnum;
	this.pnum = pnum;
	this.proce = proce;
	this.kcal = kcal;
	this.car = car;
	this.pro = pro;
	this.fat = fat;
}
public Receipe(String email, int no, String fname, String addmat, String addnum, int pnum, String proce, double kcal,
		double car, double pro, double fat, MultipartFile[] report, ArrayList<ReceipeFile> rnames) {
	super();
	this.email = email;
	this.no = no;
	this.fname = fname;
	this.addmat = addmat;
	this.addnum = addnum;
	this.pnum = pnum;
	this.proce = proce;
	this.kcal = kcal;
	this.car = car;
	this.pro = pro;
	this.fat = fat;
	this.report = report;
	this.rnames = rnames;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public String getFname() {
	return fname;
}
public void setFname(String fname) {
	this.fname = fname;
}
public String getAddmat() {
	return addmat;
}
public void setAddmat(String addmat) {
	this.addmat = addmat;
}
public String getAddnum() {
	return addnum;
}
public void setAddnum(String addnum) {
	this.addnum = addnum;
}
public int getPnum() {
	return pnum;
}
public void setPnum(int pnum) {
	this.pnum = pnum;
}
public String getProce() {
	return proce;
}
public void setProce(String proce) {
	this.proce = proce;
}
public double getKcal() {
	return kcal;
}
public void setKcal(double kcal) {
	this.kcal = kcal;
}
public double getCar() {
	return car;
}
public void setCar(double car) {
	this.car = car;
}
public double getPro() {
	return pro;
}
public void setPro(double pro) {
	this.pro = pro;
}
public double getFat() {
	return fat;
}
public void setFat(double fat) {
	this.fat = fat;
}
public MultipartFile[] getReport() {
	return report;
}
public void setReport(MultipartFile[] report) {
	this.report = report;
}
public ArrayList<ReceipeFile> getRnames() {
	return rnames;
}
public void setRnames(ArrayList<ReceipeFile> rnames) {
	this.rnames = rnames;
}



}
