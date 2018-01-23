<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/17
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page  isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Personal</title>
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
</head>
<body>
    <div style="padding: 50px 0px 0px 20px; height: 100%; width:100%; background-image: url('${pageContext.request.contextPath}/img/258.jpg')">
        <div style="height: 60px; padding: 50px 0px 0px 0px;text-align: center">
            <h3>信息列表</h3>
        </div>
        <table id="tab" border="1px gray" width="1000px" style="text-align:center">
            <tr>
                <td>编号</td><td>姓名</td><td>性别</td>
                <td>联系电话</td><td>出生日期</td><td>家庭地址</td>
                <td>用户头像</td>
            </tr>
        </table>
        <a href="main.jsp" style="margin: 0px 0px 0px 5px"><input type="button" value="首页"></a>
    </div>
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
                    tr+="<td><img style='width:50px; height:50px' src='${pageContext.request.contextPath}/"+v.pimage+"'/></td>";
                    tr+="</tr>";
                    $("#tab").append(tr);
            });
        });
    }
    window.onload=loadData;
</script>
