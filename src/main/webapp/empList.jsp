<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/22
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>emp</title>
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div align="center">
        <h2>人员信息列表</h2>
        <div style="font-size: 18px">
            <c:if test="${param.rtype==1}">
                <p style="color:green;">删除员工成功!</p>
            </c:if>
            <c:if test="${param.rtype==-1}">
                <p style="color:red;">删除员工失败!</p>
            </c:if>
        </div>
        <table border="1" width="1000" style="text-align:center">
            <tr>
                <td>员工编号</td><td>员工姓名</td>
                <td>员工年龄</td><td>员工性别</td>
                <td>员工爱好</td><td>入学时间</td>
                <td>部门名称</td><td>管理</td>
            </tr>
            <c:forEach items="${empList}" var="obj" varStatus="ids">
                <tr>
                    <td>${ids.count}</td><td>${obj[0].ename}</td>
                    <td>${obj[0].eage}</td><td>${obj[0].esex==1?"男":"女"}</td>
                    <td>${obj[0].ehobby}</td><td>${obj[0].eintime}</td>
                    <td>${obj[1].dname}</td>
                    <td><a href="${pageContext.request.contextPath}/empAction/getByIdEmp?eno=${obj[0].eno}">修改</a>|
                        <a href="${pageContext.request.contextPath}/empAction/deteleEmp?eno=${obj[0].eno}">删除</a></td>
                </tr>
            </c:forEach>
        </table>
</div>
        <a href="${pageContext.request.contextPath}/main.jsp" style="margin: 0px 0px 0px 5px">
            <input type="button" value="首页"></a>
</body>
</html>
