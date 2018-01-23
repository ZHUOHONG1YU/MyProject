<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/6
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page isErrorPage="false" contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>main</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div id="wde" style="height: 100%; width: 100%; border: solid 1px black;background-image: url('${pageContext.request.contextPath}/img/258.jpg')">
    <div style="height: 60px; padding: 50px 0px 0px 450px">
        <h2>功能列表</h2>
    </div>
        <h4 style="color: red;">当前登录用户:${LoginUser.uname}
            <c:if test="${LoginUser.utype==2}">
                ,身份:超级管理员
            </c:if>
            <c:if test="${LoginUser.utype==1}">
                ,身份:管理员
            </c:if>
            <c:if test="${LoginUser.utype==0}">
                ,身份:普通用户
            </c:if>
        </h4>
        <ul>
            <c:if test="${LoginUser.utype==2}">
                <li>
                    <input type="button" id="no1" value="用户管理"/>
                    <div id="no1_div" style="display: none">
                        <ol>
                            <li><a href="${pageContext.request.contextPath}/addAdminis.jsp"><input type="button" value="添加用户"></a>
                            <li><a href="${pageContext.request.contextPath}/userList.jsp"><input type="button" value="用户管理"></a>
                        </ol>
                    </div>
                </li>
            </c:if>
            <c:if test="${LoginUser.utype==2||LoginUser.utype==1}">
                <li>
                    <input type="button" id="no2" value="部门管理"/>
                    <div id="no2_div" style="display: none">
                        <ol>
                            <li><a href="${pageContext.request.contextPath}/addDept.jsp"><input type="button" value="添加部门"></a>
                            <li><a href="${pageContext.request.contextPath}/deptList.jsp"><input type="button" value="查看部门信息"></a>
                        </ol>
                    </div>
            </li>
            <li><input type="button" id="no3" value="人员管理"/>
                <div id="no3_div" style="display: none">
                    <ol>
                        <li><a href="${pageContext.request.contextPath}/addEmp.jsp"><input type="button" value="添加人员"></a>
                        <li><a href="${pageContext.request.contextPath}/empAction/findEmpList"><input type="button" value="查看人员信息"></a>
                    </ol>
                </div>
            </li>
            </c:if>
            <li><input type="button" id="no4" value="信息管理"/>
                <div id="no4_div" style="display: none">
                    <ol>
                        <li><a href="${pageContext.request.contextPath}/addpersonal.jsp"><input type="button" value="添加信息"></a>
                        <li><a href="${pageContext.request.contextPath}/personalList.jsp"><input type="button" value="查看信息"></a>
                    </ol>
                </div>
            </li>
            <li><a href="${pageContext.request.contextPath}/index.jsp"><input type="button" id="no5" value="退出登录"/></a>
            </li>
        </ul>
</div>
</body>
</html>
<script type="text/javascript">
    $("#no1").click(function () {
        var isClose = $("#no1_div").css("display")=="block";
        if(isClose){
            $("#no1_div").css("display","none");return;
        }
        $("#no1_div").css("display","block");
    });

    $("#no2").click(function () {
        var isClose = $("#no2_div").css("display")=="block";
        if(isClose){
            $("#no2_div").css("display","none");return;
        }
        $("#no2_div").css("display","block");
    });

    $("#no3").click(function () {
        var isClose = $("#no3_div").css("display")=="block";
        if(isClose){
            $("#no3_div").css("display","none");return;
        }
        $("#no3_div").css("display","block");
    });

    $("#no4").click(function () {
        var isClose = $("#no4_div").css("display")=="block";
        if(isClose){
            $("#no4_div").css("display","none");return;
        }
        $("#no4_div").css("display","block");
    });

    $("#no5").click(function () {
        alert("已退出登录");
    });

</script>
