package com.maven.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;

@Entity
@Table(name = "Emp")
public class Emp {

	private int eno;
	private String ename;
	private int eage;
	private int esex;
	private String ehobby;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String eintime;

	private Dept dept;

	public Emp() {
	}

	public Emp(int eno, String ename, int eage, int esex, String ehobby, String eintime) {
		this.eno = eno;
		this.ename = ename;
		this.eage = eage;
		this.esex = esex;
		this.ehobby = ehobby;
		this.eintime = eintime;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public int getEage() {
		return eage;
	}

	public void setEage(int eage) {
		this.eage = eage;
	}

	public int getEsex() {
		return esex;
	}

	public void setEsex(int esex) {
		this.esex = esex;
	}

	public String getEhobby() {
		return ehobby;
	}

	public void setEhobby(String ehobby) {
		this.ehobby = ehobby;
	}

	@Column(columnDefinition = "date")
	public String getEintime() {
		return eintime;
	}

	public void setEintime(String eintime) {
		this.eintime = eintime;
	}

	@ManyToOne(cascade=CascadeType.REFRESH,fetch=FetchType.LAZY)
	@JoinColumn(name="edno")
	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}
}
