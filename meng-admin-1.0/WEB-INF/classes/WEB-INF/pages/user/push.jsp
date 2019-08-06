<%--suppress HtmlUnknownTarget --%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!-- 引入tag.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
    <title>推送管理</title>
    <%@include file="../public/top.jsp" %>
<body style="margin: 2ex">
<div class="layui-col-md12">
    <div class="layui-card">
        <div class="layui-card-header">客户端标识下载</div>
        <div class="layui-card-body">
            <div class="layui-btn-container" style="margin-top: 20px; margin-bottom: 0;">
                <button class="layui-btn site-demo-active" data-type="setPercent"><a
                        href="${apiHost}/api/json/system/user/push/tokens/IOS/dow">苹果下载</a></button>
                <button class="layui-btn site-demo-active" data-type="loading"><a
                        href="${apiHost}/api/json/system/user/push/tokens/ANDROID/dow">安卓下载</a>
                </button>
            </div>
        </div>
    </div>
</div>
</body>
</html>