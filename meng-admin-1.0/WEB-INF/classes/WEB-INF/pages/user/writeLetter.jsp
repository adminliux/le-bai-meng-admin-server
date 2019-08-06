<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!-- 引入tag.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
    <title>用户主页面</title>
    <%@include file="../public/top.jsp" %>
<body style="margin: 2ex">
<form class="layui-form layui-form-pane">
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">内容</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" name="content"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>进度</legend>
</fieldset>
<div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="demo">
    <div class="layui-progress-bar layui-bg-red" lay-percent="0%"></div>
</div>

<script>
    var $form = $("form");

    layui.use('element', function () {
        var $ = layui.jquery, element = layui.element;
        //触发事件
        var active = {
            setPercent: function () {
                //设置50%进度
                element.progress('demo', '50%')
            }
            , loading: function (othis) {
                var DISABLED = 'layui-btn-disabled';
                if (othis.hasClass(DISABLED)) return;

                //模拟loading
                var n = 0, timer = setInterval(function () {
                    n = n + Math.random() * 10 | 0;
                    if (n > 100) {
                        n = 100;
                        clearInterval(timer);
                        othis.removeClass(DISABLED);
                    }
                    element.progress('demo', n + '%');
                }, 300 + Math.random() * 1000);

                othis.addClass(DISABLED);
            }
        };

        $form.html5Validate(function () {
            var fm = $(this);
            fm.loading('toggle');
            var fd = fm.formSerialize();
            Project.ajax("/letter/write/letter/all", fd).ajaxOK(function () {
                fm.loading("stop");
                var othis = $(this), type = $(this).data('type');
                active[type] ? active[type].call(this, othis) : '';
            }, true);
            return false
        });
    });
</script>
</body>
</html>