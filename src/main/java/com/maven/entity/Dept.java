package com.maven.entity;

import javax.persistence.*;

@Entity
@Table(name="dept")
public class Dept {

	private int dno;
	private String dname;

	public Dept() {
	}

	public Dept(int dno, String dname) {
		this.dno = dno;
		this.dname = dname;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}
}
