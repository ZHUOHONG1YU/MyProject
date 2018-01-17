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
        <h2>新员工入职</h2>
        <div style="font-size: 18px">
            <c:if test="${param.rtype==1}">
                <p style="color:green;">新员工入职成功!</p>
            </c:if>
            <c:if test="${param.rtype==-1}">
                <p style="color:red;">新员工入职失败!</p>
            </c:if>
        </div>
        <form method="post" action="empAction/addEmp">
            员工姓名:<input name="ename"/><br/>
            员工年龄:<input name="eage"/><br/>
            员工性别:<input type="radio" name="esex" value="1" checked/>男
                     <input type="radio" name="esex" value="0" />女<br/>
            员工爱好:<input type="checkbox" name="ehobby" value="阅读"/>阅读
                     <input type="checkbox" name="ehobby" value="体育"/>体育
                     <input type="checkbox" name="ehobby" value="学习"/>学习<br/>
            入职时间:<input name="eintime"/><br/>
            入职部门:<select name="dno" >
                     <option value="">请选择部门</option>
                     </select><br/>
            <input type="submit" value="新员工入职"/>
        </form>
        <a href="${pageContext.request.contextPath}/empAction/findEmpList"><input type="button" value="返回员工列表"></a>
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
</script>
