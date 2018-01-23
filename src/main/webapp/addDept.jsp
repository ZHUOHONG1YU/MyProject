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
<div style="padding: 0px 0px 0px 350px;height: 100%; width:100%;background-image: url('${pageContext.request.contextPath}/img/258.jpg')">
    <div style="height: 60px; padding: 50px 0px 0px 80px">
    <h2>添加部门</h2>
    </div>
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
    <a href="${pageContext.request.contextPath}/main.jsp"><input type="button" value="首页"></a>
</div>
</body>
</html>
