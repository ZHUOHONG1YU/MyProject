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
    <div align="center" style=" height:100%; width: 100%;background-image: url('${pageContext.request.contextPath}/img/147.jpg')">
        <div style="height: 60px; padding: 50px 0px 0px 0px;text-align: center">
            <h1>用户登录</h1>
        </div>
        <div style="padding: 190px 0px 0px 0px;">
            <c:if test="${param.rtype==1}">
                <p style="color:red;">用户名和密码错误!</p>
            </c:if>
            <form method="post" action="userAction/doLogin">
                用户名：<input name="uname"/><br>
                密&nbsp;&nbsp;&nbsp;码：<input type="password" name="upwd"/><br><br>
                <input type="submit" value="用户登录" style="margin: 0px 0px 0px 30px"/>
                <a href="addUser.jsp"><input type="button" value="用户注册"></a>
            </form>
        </div>
    </div>
</body>
</html>
