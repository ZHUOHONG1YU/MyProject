<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/22
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>addEmp</title>
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
</head>
<body>
    <div style="padding: 0px 0px 0px 380px; height: 100%; width:100%; background-image: url('${pageContext.request.contextPath}/img/258.jpg')">
        <div style="height: 60px; padding: 50px 0px 0px 80px">
        <h2>新员工入职</h2>
        </div>
        <div style="font-size: 18px">
            <c:if test="${param.rtype==1}">
                <p style="color:green;">新员工入职成功!</p>
            </c:if>
            <c:if test="${param.rtype==-1}">
                <p style="color:red;">新员工入职失败!</p>
            </c:if>
        </div>
        <form method="post" action="empAction/addEmp" onsubmit="return compare()">
            员工姓名:<input name="ename" id="emp-name"/><span></span><br/>
            员工年龄:<input name="eage" id="emp-age"/><span></span><br/>
            员工性别:<input type="radio" name="esex" value="1" checked/>男
                     <input type="radio" name="esex" value="0" />女<br/>
            员工爱好:<input type="checkbox" name="ehobby" value="阅读"/>阅读
                     <input type="checkbox" name="ehobby" value="体育"/>体育
                     <input type="checkbox" name="ehobby" value="学习"/>学习<br/>
            入职时间:<input name="eintime" id="emp-time"/><span></span><br/>
            入职部门:<select name="dno" >
                     <option value="">请选择部门</option>
                     </select><br/><br/>
            <input type="submit" value="新员工入职"/>
        </form>
        <a href="${pageContext.request.contextPath}/empAction/findEmpList"><input type="button" value="返回员工列表"></a>
        <a href="${pageContext.request.contextPath}/main.jsp"><input type="button" value="首页"></a>
    </div>
</body>
</html>
<script type="text/javascript">
    $(function(){
        //取出所有可选的部门
        $(":input[name='dno'] option:not(:first)").remove();
        $.post("empAction/selectDept","",function(data){
            $.each(data,function(i,v){
                var option="<option value='"+v[0]+"'>"+v[1]+"</option>";
                $(":input[name='dno']").append(option);
            });
        });
    });

        function compare() {
            var a = document.getElementById('emp-name').value;
            var b = document.getElementById('emp-age').value;
            var c = document.getElementById('emp-time').value;
            var d = '([0-9]{4})-([0-9]{2})-([0-9]{2})';
            var preg = '^(1[89]|[2-8]\d|90)$';
            if (a == null) {
                $("span").text("员工姓名不能为空").css("color", "red");
                return false;
            }
            if (a != preg) {
                $("span").text("电话号码不能小于13位！").css("color", "red");
                return false;
            }
            if(c!=d){
                $("span").text("日期格式不正确！").css("color", "red");
                return false;
            }else {
                return true;
            }
        }
</script>

