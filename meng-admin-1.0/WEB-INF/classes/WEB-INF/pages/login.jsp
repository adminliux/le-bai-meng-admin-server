<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<!-- 引入tag.jsp -->
<%@include file="../pages/public/tag.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="${path}/resources/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resources/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resources/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resources/lib/Hui-iconfont/1.0.7/iconfont.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<div class="header"></div>
<div class="loginWraper">
    <div id="loginform" class="loginBox">
        <form class="form form-horizontal" action="index.html" method="post">
            <div class="row cl">
                <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
                <div class="formControls col-xs-8">
                    <input id="name" name="name" type="text" placeholder="账户" class="input-text size-L">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
                <div class="formControls col-xs-8">
                    <input id="password" name="password" type="password" placeholder="密码" class="input-text size-L">
                </div>
            </div>
            <%--<div class="row cl">--%>
            <%--<div class="formControls col-xs-8 col-xs-offset-3">--%>
            <%--<input  type="text" name="code" placeholder="验证码" style="height: 42px; width: 265px; margin-top: 10px">--%>
            <%--<img src="${path}/page/page/interface/get/code3" id="img" style="height: 42px;width: 90px;margin-top: 10px" onclick="changeImg()">--%>
            <%--</div>--%>
            <%--</div>--%>

            <div class="row cl">
                <div class="formControls col-xs-8 col-xs-offset-3">
                    <input name="" type="button" class="btn btn-success radius size-L" id="to-recover"
                           style="margin-right: 80px" onclick="login()" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
                    <input name="" type="reset" class="btn btn-default radius size-L"
                           value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
                </div>
            </div>
        </form>
    </div>
</div>
<div class="footer">@2018</div>
<!-- 引用js -->
<script type="text/javascript" src="${path}/resources/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${path}/resources/static/h-ui/js/H-ui.js"></script>

<script src="${path}/resources/js/template.js"></script>
<script src="${path}/resources/js/common.js"></script>
<script src="${path}/resources/js/promise.min.js"></script>
<script src="${path}/resources/js/project.js"></script>
<script src="${path}/resources/js/jquery.common.js"></script>
<script src="${path}/resources/js/jk_tools.js"></script>
<script type="text/javascript">
    function login() {
        //获取值
        var name = $("input[name=name]").val();
        var password = $("input[name=password]").val();
//        var code=$("input[name=code]").val();
        //判断是否为空
        if (!isValid(name, "登录名")) {
            return false;
        }
        if (!isValid(password, "密码")) {
            return false;
        }
//        if(!isValid(code,"验证码")){
//            return false;
//        }
        window.apiHost = "${path}";
        //调用登录接口
        Project.ajax("/api/admin/login", {name: name, password: password}, null, true).ajaxOK(function (data) {
            var code = data.code;
            if (code != 'SUCCESS') {
                alert("用户名或密码错误");
                return false;
            }
            //跳转到首页
            window.location.href = "${path}/page/page/interface/to/index";
        })
    }

    //回车键登录
    $(document).keyup(function (event) {
        if (event.keyCode == 13) {
            $("#to-recover").trigger("click");
        }
    });
</script>

<%--<!-- 验证码 -->--%>
<%--<script type="text/javascript">--%>
<%--function changeImg(){--%>
<%--var img = document.getElementById("img");--%>
<%--img.src = "${path}/page/page/interface/get/code3?"+Math.random();--%>
<%--}--%>
<%--</script>--%>


</body>
</html>
