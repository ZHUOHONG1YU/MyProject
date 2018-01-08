package com.maven.entity;

import javax.persistence.*;

/**
 * Created by Administrator on 2017/10/31.
 */
@Entity
@Table(name="tb_users")
public class Users {
    private int uno;
    private String uname;
    private String upwd;
    private int utype; //2:超级管理员 1:管理员 0:普通用户
    private int ustatus=1;//1:正常  0:锁定

    public Users() {
    }

    public Users(int uno, String uname, String upwd, int utype, int ustatus) {
        this.uno = uno;
        this.uname = uname;
        this.upwd = upwd;
        this.utype = utype;
        this.ustatus = ustatus;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getUno() {
        return uno;
    }

    public void setUno(int uno) {
        this.uno = uno;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public int getUtype() {
        return utype;
    }

    public void setUtype(int utype) {
        this.utype = utype;
    }

    public int getUstatus() {
        return ustatus;
    }

    public void setUstatus(int ustatus) {
        this.ustatus = ustatus;
    }

}
