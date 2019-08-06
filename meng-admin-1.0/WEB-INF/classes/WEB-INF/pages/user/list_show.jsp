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
            <th class="text-r" width="80">工作领域：</th>
            <td id="jobField"></td>
        </tr>
        <tr>
            <th class="text-r" width="80">工作职位：</th>
            <td id="jobPosition"></td>
        </tr>
        <tr>
            <th class="text-r" width="80">工作城市：</th>
            <td id="jobCity"></td>
        </tr>
        <tr>
            <th class="text-r" width="80">工作年限：</th>
            <td id="jobLife"></td>
        </tr>
        <tr>
            <th class="text-r" width="80">爱好：</th>
            <td id="likes"></td>
        </tr>
        <tr>
            <th class="text-r" width="80">常住地：</th>
            <td id="residentLocal"></td>
        </tr>
        <tr>
            <th class="text-r" width="80">常去地方：</th>
            <td id="oftenGoLocal"></td>
        </tr>
        <tr>
            <th class="text-r" width="80">做好得朋友地方：</th>
            <td id="mostFriendsLocal"></td>
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
        Project.ajax("/user/find/info",{id:id}).ajaxOK(function(data){
            $("#jobField").html(data.data.jobField);
            $("#jobPosition").html(data.data.jobPosition);
            $("#jobCity").html(data.data.jobCity);
            $("#jobLife").html(data.data.jobLife);
            $("#likes").html(data.data.likes);
            $("#residentLocal").html(data.data.residentLocal);
            $("#oftenGoLocal").html(data.data.oftenGoLocal);
            $("#birthLocalId").html(data.data.birthLocalId);
            $("#mostFriendsLocal").html(data.data.mostFriendsLocal);
        });
    }

</script>



</body>
</html>