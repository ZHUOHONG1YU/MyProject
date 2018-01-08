<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/6
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users</title>
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
</head>
<body>
    <h3>用户列表</h3>
        <table id="tab" border="1px gray" width="800px" style="text-align:center">
            <tr>
                <td>编号</td><td>名称</td><td>密码</td>
                <td>状态</td><td>类型</td><td>管理</td>
            </tr>
        </table>
        <a href="main.jsp"><input type="button" value="首页"></a>
</body>
</html>
<script type="text/javascript">
    function loadData(){
        $("#tab tr:not(:first)").remove();
        $.get("userAction/findUserList","",function(data){
            $.each(data,function(i,v){
                if(!(v.utype==1||v.utype==2)){
                    var tr="<tr>";
                    tr+="<td>"+(i+1)+"</td>";
                    tr+="<td>"+v.uname+"</td>";
                    tr+="<td>"+'******'+"</td>";
                    tr+="<td>"+(v.ustatus==1?"正常":"销户")+"</td>";
                    tr+="<td>"+(v.utype==1?"超级管理员":"普通用户")+"</td>";
                    tr+="<td><a href='#'>修改</a>|";
                    tr+="<a href=''>销户</a></td>";
                    tr+="</tr>";
                    $("#tab").append(tr);
                }
            });
        });
    }
    window.onload=loadData;
</script>