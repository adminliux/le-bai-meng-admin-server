<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>用户信息弹出框</title>
    <!-- 引入css -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/lib/Hui-iconfont/1.0.7/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/lib/icheck/icheck.css" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/css/style.css" />

</head>
<body>
<%--<div class="cl pd-20" style=" background-color:#5bacb6">--%>
    <%--<img class="avatar size-XL l" id="img">--%>
    <%--<dl style="margin-left:80px; color:#fff">--%>
        <%--<dt><span class="f-18" id="name"></span> 余额：<span class="pl-10 f-12" id="money"></span></dt>--%>
        <%--<dd class="pt-10 f-12" style="margin-left:0">这家伙很懒，什么也没有留下</dd>--%>
    <%--</dl>--%>
<%--</div>--%>
<div class="pd-20">
    <table class="table">
        <tbody>
        <tr>
            <th class="text-r" width="80">账户ID：</th>
            <td id="accountId"></td>
        </tr>
        <tr>
            <th class="text-r" width="80">昵称：</th>
            <td id="nickname"></td>
        </tr>
        <tr>
            <th class="text-r" width="80">手机号：</th>
            <td id="phoneNumber"></td>
        </tr>
        <tr>
            <th class="text-r" width="80">角色：</th>
            <td id="type"></td>
        </tr>
        </tbody>
    </table>
</div>
<script src="${path}/resources/js/jquery.js"></script>
<script src="${path}/resources/js/template.js"></script>
<script src="${path}/resources/js/common.js"></script>
<script src="${path}/resources/js/promise.min.js"></script>
<script src="${path}/resources/js/project.js"></script>
<script src="${path}/resources/js/jquery.common.js"></script>
<script type="text/javascript">
    /**
     * 查询用户信息方法(悬浮框里的内容)
     * id:跳转传过来的用户id
     * */
    findUserData();
    function findUserData(){
        var id='${id}';
        Project.ajax("/user/find/user/info",{id:id},null,true).ajaxOK(function(data){
            $("#accountId").html(data.data.accountId);
            $("#nickname").html(data.data.nickname);
            $("#phoneNumber").html(data.data.phoneNumber);
            if(data.data.type=="TEACHER"){
                $("#type").html("老师");
            }else{
                $("#type").html("普通用户");
            }
        });
    }

</script>



</body>
</html>