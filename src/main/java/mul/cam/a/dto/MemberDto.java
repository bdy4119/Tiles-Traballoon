package mul.cam.a.dto;

import java.io.Serializable;

public class MemberDto implements Serializable{
	
	private String id;
	private String pwd;
	private String name;
	private String nickname;
	private String email;
	private String address;
	private String phonenumber;
	private int auth;
	
	public MemberDto() {
	}

	public MemberDto(String id, String pwd, String name, String nickname, String email, String address,
			String phonenumber, int auth) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.address = address;
		this.phonenumber = phonenumber;
		this.auth = auth;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pwd=" + pwd + ", name=" + name + ", nickname=" + nickname + ", email=" + email
				+ ", address=" + address + ", phonenumber=" + phonenumber + ", auth=" + auth + "]";
	}

	

	
}
