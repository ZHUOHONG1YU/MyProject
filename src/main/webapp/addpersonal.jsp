<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/6
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>Personal</title>
</head>
<body>
    <div style="padding: 0px 0px 0px 380px; height: 100%; width:100%; background-image: url('${pageContext.request.contextPath}/img/258.jpg')">
        <div style="height: 60px; padding: 50px 0px 0px 80px">
            <h2>完善个人信息</h2>
        </div>
        <form method="post" action="PersonalAction/addPersonal" enctype="multipart/form-data">
        用户姓名：<input name="pname"><br/>
        性&nbsp;&nbsp;&nbsp;别：
        <input type="radio" name="psex" value="男" checked>男
        <input type="radio" name="psex" value="女">女<br/>
        联系电话：<input name="ptel"><br/>
        出生日期：<input name="pintime" type="date"><br/>
        家庭地址：<input name="paddress"><br/>
        用户图像：<input type="file" name="psimage"><br/><br/>
            <input type="submit" value="保存信息">
            <a href="main.jsp"><input type="button" value="取消保存"></a>
        </form>
        <a href="main.jsp" ><input type="button" value="首页"></a>
    </div>
</body>
</html>
