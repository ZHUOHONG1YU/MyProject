<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/6
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>main</title>
</head>
<body>
    <h2>功能列表</h2>
    <h4>当前登录用户:${LoginUser.uname}
        <c:if test="${LoginUser.utype==1}">
            ,身份:超级管理员
        </c:if>
    </h4>
    <hr/>
    <ul>
        <c:if test="${LoginUser.utype==2}">
            <li>
                <a href="#">用户管理</a>
                <ol>
                    <li><a href="${pageContext.request.contextPath}/addAdminis.jsp"><input type="button" value="添加新用户"></a>
                    <li><a href="${pageContext.request.contextPath}/userList.jsp"><input type="button" value="用户管理"></a>
                </ol>
            </li>
        </c:if>
        <c:if test="${LoginUser.utype==2||LoginUser.utype==1}">
        <li><a href="#">部门管理</a>
            <ol>
                <li><a href="${pageContext.request.contextPath}/addDept.jsp"><input type="button" value="添加部门"></a>
                <li><a href="${pageContext.request.contextPath}/deptList.jsp"><input type="button" value="查看部门信息"></a>
            </ol>
        </li>
        <li><a href="#">人员管理</a>
            <ol>
                <li><a href="${pageContext.request.contextPath}/addEmp.jsp"><input type="button" value="添加人员"></a>
                <li><a href="${pageContext.request.contextPath}/empAction/findEmpList"><input type="button" value="查看人员信息"></a>
            </ol>
        </li>
        </c:if>
        <li><a href="#">信息管理</a>
            <ol>
                <li><a href="${pageContext.request.contextPath}/addpersonal.jsp"><input type="button" value="添加信息"></a>
                <c:if test="${LoginUser.utype==2||LoginUser.utype==1}">
                <li><a href="${pageContext.request.contextPath}/personalList.jsp"><input type="button" value="查看信息"></a>
                </c:if>
            </ol>
        </li>
    </ul>
</body>
</html>
