<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/21
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dept</title>
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div style="padding: 0px 0px 0px 200px;height: 100%; width:100%;background-image: url('img/258.jpg')">
    <div style="height: 60px; padding: 50px 0px 0px 220px">
    <h2>部门信息列表</h2>
    </div>
    <table id="tab" border="1" width="600" style="text-align:center">
        <tr>
            <td>编号</td><td>部门名称</td><td>部门人数</td>
        </tr>
    </table>
    <a href="main.jsp" ><input type="button" value="首页"></a>
</div>
</body>
</html>
<script type="text/javascript">
    function loadData(){
        $("#tab tr:not(:first)").remove();
        $.get("deptAction/findDeptList","",function (data) {
            $.each(data,function (i,v) {
                var tr="<tr>";
                tr+="<td>"+v[0]+"</td>";
                tr+="<td>"+v[1]+"</td>";
                tr+="<td>"+v[2]+"</td>";
                tr+="</tr>";
                $("#tab").append(tr);
            });
        });
    }
    window.onload=loadData;
</script>
