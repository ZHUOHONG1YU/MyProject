<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/2
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>updateEmp</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
<body>
        <h2>修改员工信息</h2>
        <div style="font-size: 18px">
            <c:if test="${param.rtype==1}">
                <p style="color:green;">修改员工成功!</p>
            </c:if>
            <c:if test="${param.rtype==-1}">
                <p style="color:red;">修改员工失败!</p>
            </c:if>
        </div>
        <form method="post" action="${pageContext.request.contextPath}/empAction/updateEmp">
                    <input name="eno" type="hidden" value="${empList.eno}">
            员工姓名:<input name="ename" value="${empList.ename}"/><br/>
            员工年龄:<input name="eage" value="${empList.eage}"/><br/>
            员工性别:<input type="radio" name="esex" value="1"/>男
            <input type="radio" name="esex" value="0" />女<br/>
            员工爱好:<input type="checkbox" name="ehobby" value="阅读"/>阅读
            <input type="checkbox" name="ehobby" value="体育"/>体育
            <input type="checkbox" name="ehobby" value="学习"/>学习<br/>
            入职时间:<input name="eintime" value="${empList.eintime}"/><br/>
            入职部门:<select name="dno" >
            <option value="0">请选择部门</option>
            <c:forEach items="${deptList}" var="obj" varStatus="ids">
                <option value="${obj[0]}">${obj[1]}</option>
            </c:forEach>
            </select><br/>
            <input type="submit" value="修改员工"/>
        </form>
        <a href="${pageContext.request.contextPath}/empAction/findEmpList"><input type="button" value="返回员工列表"></a>
</body>
</html>
<script type="text/javascript">
        var sex=document.forms[0].esex;
        if(sex[0].value=='${empList.esex}') {
            sex[0].checked = true;
        }else {
            sex[1].checked = true;
        }

        var hobby="${empList.ehobby}";
        var hobbys=$("input:checkbox");//所有复选框
        for (var i = 0; i < hobbys.length; i++) {
            if(hobby.indexOf(hobbys[i].value)>=0)
                hobbys[i].checked=true;
        }

        var dno = "${empList.dept.dno}";
        $("option[value='"+dno+"']").attr("selected", true);
</script>
