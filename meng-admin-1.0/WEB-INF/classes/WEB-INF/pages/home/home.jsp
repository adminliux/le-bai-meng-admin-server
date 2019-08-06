<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>


    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/lib/Hui-iconfont/1.0.7/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/lib/icheck/icheck.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/css/style.css"/>

</head>
<body>
<div class="page-container">
    <p class="f-20 text-success">欢迎使用后台管理系统</p>
    <p>用户名：<font color="blue" name="adminName"></font></p>
    <p>角 色：<font color="blue" name="adminType"></font></p>
    <p>登录时间：<font color="red" name="loginTime"></font></p>
    <p>上一次登录时间：<font color="red" name="lastTime"></font></p>
    <p>注册时间：<font color="red" name="gmtDatetime"></font></p>
    <br>
    <%--<table class="table table-border table-bordered table-bg">--%>
    <%--<thead>--%>
    <%--<tr>--%>
    <%--<th colspan="7" scope="col">信息统计</th>--%>
    <%--</tr>--%>
    <%--<tr class="text-c">--%>
    <%--<th>统计</th>--%>
    <%--<th>资讯库</th>--%>
    <%--<th>图片库</th>--%>
    <%--<th>产品库</th>--%>
    <%--<th>用户</th>--%>
    <%--<th>管理员</th>--%>
    <%--</tr>--%>
    <%--</thead>--%>
    <%--<tbody>--%>
    <%--<tr class="text-c">--%>
    <%--<td>总数</td>--%>
    <%--<td>92</td>--%>
    <%--<td>9</td>--%>
    <%--<td>0</td>--%>
    <%--<td>8</td>--%>
    <%--<td>20</td>--%>
    <%--</tr>--%>
    <%--<tr class="text-c">--%>
    <%--<td>今日</td>--%>
    <%--<td>0</td>--%>
    <%--<td>0</td>--%>
    <%--<td>0</td>--%>
    <%--<td>0</td>--%>
    <%--<td>0</td>--%>
    <%--</tr>--%>
    <%--<tr class="text-c">--%>
    <%--<td>昨日</td>--%>
    <%--<td>0</td>--%>
    <%--<td>0</td>--%>
    <%--<td>0</td>--%>
    <%--<td>0</td>--%>
    <%--<td>0</td>--%>
    <%--</tr>--%>
    <%--<tr class="text-c">--%>
    <%--<td>本周</td>--%>
    <%--<td>2</td>--%>
    <%--<td>0</td>--%>
    <%--<td>0</td>--%>
    <%--<td>0</td>--%>
    <%--<td>0</td>--%>
    <%--</tr>--%>
    <%--<tr class="text-c">--%>
    <%--<td>本月</td>--%>
    <%--<td>2</td>--%>
    <%--<td>0</td>--%>
    <%--<td>0</td>--%>
    <%--<td>0</td>--%>
    <%--<td>0</td>--%>
    <%--</tr>--%>
    <%--</tbody>--%>
    <%--</table>--%>

</div>

<script type="text/javascript" src="${path}/resources/lib/jquery/1.9.1/jquery.min.js"></script>
<script src="${path}/resources/js/jquery.js"></script>
<script src="${path}/resources/js/template.js"></script>
<script src="${path}/resources/js/common.js"></script>
<script src="${path}/resources/js/promise.min.js"></script>
<script src="${path}/resources/js/project.js"></script>
<script src="${path}/resources/js/jquery.common.js"></script>
<script>
    findUser();

    function findUser() {
        window.apiHost = "${path}";
        Project.ajax("/api/admin/find/admin/user", null,null, true).ajaxOK(function (data) {
            $("font[name=adminName]").text(data.data.data.name);
            if (data.data.data.type === 0) {
                $("font[name=adminType]").text("超级管理员");
            } else {
                $("font[name=adminType]").text("普通管理员");
            }
            $("font[name=loginTime]").text(cm.timestampFormatYMDHMS(data.data.data.loginTime) + "");
            $("font[name=gmtDatetime]").text(cm.timestampFormatYMDHMS(data.data.data.gmtDatetime) + "");
            $("font[name=lastTime]").text(cm.timestampFormatYMDHMS(data.data.data.lastTime) + "");
        });
    }
</script>
</body>
</html>