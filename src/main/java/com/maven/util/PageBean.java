package com.maven.util;
import java.util.List;

/**
 * Created by Administrator on 2017/11/22.
 */
public class PageBean {

    private int cpage=1;//当前页
    private int showNum=5;//每页显示多少条数据，默认5条
    private int allPage=0;//总页数
    private int allNum=0;//数据总条数

    private List result;

    public PageBean() {
    }

    public PageBean(int cpage, int showNum, int allPage, int allNum) {
        this.cpage = cpage;
        this.showNum = showNum;
        this.allPage = allPage;
        this.allNum = allNum;
    }

    public int getCpage() {
        return cpage;
    }

    public void setCpage(int cpage) {
        this.cpage = cpage;
    }

    public int getShowNum() {
        return showNum;
    }

    public void setShowNum(int showNum) {
        this.showNum = showNum;
    }

    public int getAllPage() {
        return allPage;
    }

    public void setAllPage(int allPage) {
        this.allPage = allPage;
    }

    public int getAllNum() {
        return allNum;
    }

    public void setAllNum(int allNum) {
        this.allNum = allNum;
        //如果已经知道了总条数了，可以计算出总页数
        if(this.allNum%this.showNum==0)
            this.allPage=this.allNum/this.showNum;
        else
            this.allPage=this.allNum/this.showNum+1;
    }

    public List getResult() {
        return result;
    }

    public void setResult(List result) {
        this.result = result;
    }
}
