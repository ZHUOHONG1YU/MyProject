<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/6
  Time: 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>addAdmins</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
    <body>
    <h2>用户注册</h2>
    <div style="font-size: 18px">
        <c:if test="${param.rtype==1}">
            <p style="color:green;">添加用户成功!</p>
        </c:if>
        <c:if test="${param.rtype==2}">
            <p style="color:red;">添加用户失败!</p>
        </c:if>
    </div>
    <form method="post" action="userAction/addUser2" onsubmit="return compare()">
        用户名：&nbsp;<input name="uname" id="user-name"><span></span><br>
        密&nbsp;&nbsp;码：<input name="upwd" id="password1"><span></span><br>
        重复密码：<input name="upwd1" id="password2"><span></span><br/>
        用户状态：<input name="utype" type="radio" value="2">超级管理员
        <input name="utype" type="radio" value="1">管理员
        <input name="utype" type="radio" value="0">普通用户<br/>
        <input type="submit" value="用户注册"/>
        <a href="${pageContext.request.contextPath}/main.jsp"><input type="button" value="取消注册"></a>
    </form>
</body>
</html>
<script type="text/javascript">
    function compare() {
        var err_count = 0;
        var a = document.getElementById('password1').value;
        var b = document.getElementById('password2').value;
        var c = document.getElementById('user-name').value;
        if (c.length < 6) {
            $("span:eq(0)").text("用户名不能小于六位！").css("color","red");
            err_count += 1;
        }
        if (a.length >= 6) {
            if (a != b) {
                $("span:eq(2)").text("两次密码不一致!").css("color","red");
                err_count += 1;
            }
        } else{
            $("span:eq(1)").text("密码长度小于六位！").css("color","red");
            err_count += 1;
        }
        if(err_count == 0){
            return true;
        }
        return false;
    }
</script>
