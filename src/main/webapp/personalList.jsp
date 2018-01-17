<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/17
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Personal</title>
</head>
<body>
    <div align="center">
        <h3>信息列表</h3>
        <table id="tab" border="1px gray" width="800px" style="text-align:center">
            <tr>
                <td>编号</td><td>姓名</td><td>性别</td>
                <td>联系电话</td><td>出生日期</td><td>家庭地址</td>
                <td>用户头像</td><td>管理</td>
            </tr>
        </table>
    </div>
<a href="main.jsp" style="margin: 0px 0px 0px 105px"><input type="button" value="首页"></a>
</body>
</html>
<script type="text/javascript">
    function loadData(){
        $("#tab tr:not(:first)").remove();
        $.get("PersonalAction/findPersonal","",function(data){
            $.each(data,function(i,v){
                    var tr="<tr>";
                    tr+="<td>"+(i+1)+"</td>";
                    tr+="<td>"+v.pname+"</td>";
                    tr+="<td>"+v.psex+"</td>";
                    tr+="<td>"+v.ptel+"</td>";
                    tr+="<td>"+v.pintime+"</td>";
                    tr+="<td>"+v.paddress+"</td>";
                    tr+="<td>"+v.pimage+"</td>";
                    tr+="</tr>";
                    $("#tab").append(tr);
            });
        });
    }
    window.onload=loadData;
</script>
