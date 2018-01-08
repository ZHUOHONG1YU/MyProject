package com.maven.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by Administrator on 2017/11/21.
 */
public class Personal {
    private int pno;
    private String pname;
    private String psex;
    private String ptel;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date pintime;
    private String paddress;
    private String pimage;

    public Personal() {
    }

    public Personal(int pno, String pname, String psex, String ptel, Date pintime, String paddress, String pimage) {
        this.pno = pno;
        this.pname = pname;
        this.psex = psex;
        this.ptel = ptel;
        this.pintime = pintime;
        this.paddress = paddress;
        this.pimage = pimage;
    }

    public int getPno() {
        return pno;
    }

    public void setPno(int pno) {
        this.pno = pno;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPsex() {
        return psex;
    }

    public void setPsex(String psex) {
        this.psex = psex;
    }

    public String getPtel() {
        return ptel;
    }

    public void setPtel(String ptel) {
        this.ptel = ptel;
    }

    public Date getPintime() {
        return pintime;
    }

    public void setPintime(Date pintime) {
        this.pintime = pintime;
    }

    public String getPaddress() {
        return paddress;
    }

    public void setPaddress(String paddress) {
        this.paddress = paddress;
    }

    public String getPimage() {
        return pimage;
    }

    public void setPimage(String pimage) {
        this.pimage = pimage;
    }
}
