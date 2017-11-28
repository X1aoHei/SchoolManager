package jdbc;

public class Student {
	private String stuid;
	
	private String sname;
	private String sex;
	private int age;
	private String birthday;
	private String classname;
	public String getStuid() {
		return stuid;
	}
	public void setStuid(String stuid) {
		this.stuid = stuid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	public Student(String stuid,String sname,String sex,int age,String birthday,String classname){
		super();
		this.stuid = stuid;
		this.sname = sname;
		this.sex = sex;
		this.age = age;
		this.birthday = birthday;
		this.classname = classname;
	}
	public Student() {
		// TODO Auto-generated constructor stub
		super();
		this.stuid = stuid;
		this.sname = sname;
		this.sex = sex;
		this.age = age;
		this.birthday = birthday;
		this.classname = classname;
	}
}
