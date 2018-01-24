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
<head>
    <title>addAdmins</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
    <div style="padding: 0px 0px 0px 380px;height: 100%; width:100%; background-image: url('${pageContext.request.contextPath}/img/258.jpg')">
    <div style="height: 60px; padding: 50px 0px 0px 80px">
    <h2>用户注册</h2>
    </div>
    <div style="font-size: 18px">
        <c:if test="${param.rtype==1}">
            <p style="color:green;">添加用户成功!</p>
        </c:if>
        <c:if test="${param.rtype==2}">
            <p style="color:red;">添加用户失败!</p>
        </c:if>
    </div>
      <div id="yh"></div>
    <form method="post" action="userAction/addUser2">
        用户名称：<input name="uname" id="user-name"><span></span><br>
        输入密码：<input name="upwd" id="password1"><span></span><br>
        重复密码：<input name="upwd1" id="password2"><span></span><br/>
        用户状态：<input name="utype" type="radio" value="2">超级管理员
        <input name="utype" type="radio" value="1">管理员
        <input name="utype" type="radio" value="0">普通用户<br/><br/>
        <input type="button" value="用户注册" onclick="compare()"/>
        <a href="${pageContext.request.contextPath}/main.jsp"><input type="button" value="取消注册"></a>
    </form>
    <a href="main.jsp">
        <input type="button" value="首页"></a>
    </div>
</body>
</html>
<script type="text/javascript">
    function compare() {
        var err_count = 0;
        var a = document.getElementById('password1').value;
        var b = document.getElementById('password2').value;
        var c = document.getElementById('user-name').value;

        var param = $("form:eq(0)").serialize();
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
            $.post("userAction/addUser3",param,function(data){
                //$.each(data, function (i,v) {
                    if(!data) {
                        $("span:eq(0)").text("用户名已存在！").css("color", "red");
                        $("#yh").text("");
                    }else {
                        $("span:eq(0)").text("");
                        $("#yh").text("添加成功！").css("color", "green");
                    }
                //})
            });
        }
    }
</script>
