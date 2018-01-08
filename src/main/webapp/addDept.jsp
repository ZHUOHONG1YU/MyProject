<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/21
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>addDept</title>
</head>
<body>
    <h2>添加班级</h2>
    <div style="font-size: 18px">
        <c:if test="${param.rtype==1}">
            <p style="color:green;">添加部门成功!</p>
        </c:if>
        <c:if test="${param.rtype==-1}">
            <p style="color:red;">添加部门失败!</p>
        </c:if>
    </div>
    <form method="post" action="deptAction/addDept">
        部门名称:<input name="dname"/>
        <input type="submit" value="添加部门"/>
    </form>
    <a href="${pageContext.request.contextPath}/main.jsp">首页</a>
</body>
</html>
