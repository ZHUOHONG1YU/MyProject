<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/6
  Time: 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Users</title>
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
</head>
<body>
    <div id="tab" align="center">
        <h2>用户登录</h2>
        <c:if test="${param.rtype==1}">
            <p style="color:red;">用户名和密码错误!</p>
        </c:if>
        <form method="post" action="userAction/doLogin">
            用户名：<input name="uname"/><br>
            密&nbsp;&nbsp;&nbsp;码：<input type="password" name="upwd"/><br>
            <input type="submit" value="用户登录" style="margin: 0px 0px 0px 30px"/>
            <a href="addUser.jsp"><input type="button" value="用户注册"></a>
        </form>
    </div>
</body>
</html>
