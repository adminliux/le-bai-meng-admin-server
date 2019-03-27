<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!-- 引入tag.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
    <title>用户主页面</title>
    <%@include file="../public/top.jsp" %>
<body>
<script type="text/html" id="fieldset_tp">
    <fieldset class="layui-elem-field {{fClass}}">
        <legend data-name="{{opt}}">{{desc}}</legend>
    </fieldset>
</script>

<script type="text/html" id="select_enum_sin_tp">
    {{include 'fieldset_tp' config}}
    <div>
        {{each enums as it i}}
        <button data-val="{{i}}" class="layui-btn {{if !it.default}}{{config.selectionClassName}}{{/if}}"
                onclick="dataEnumSingleElectionChange(this)">
            {{it.explain}}
        </button>
        {{/each}}
    </div>
</script>

<script type="text/html" id="int_sin_tp">
    {{include 'fieldset_tp' config}}
    <div style="margin: 20px" id="{{config.opt}}" class="demo-slider"></div>
</script>
<script>
    //选中类名称
    var selectionClassName = "layui-btn-primary";

    /**
     * 枚举单选
     * @param type 配置类型
     * @param ok 返回成功回调
     */
    function findByType(type, ok) {
        Project.ajaxGet("/config/n/" + type, {}).ajaxOK(function (config) {
            config = config.data;
            if (ok) ok(config);
        });
    }

    /**
     * 枚举单选
     * @param type 配置类型
     */
    function dataEnumSingleElection(type) {
        findByType(type, function (config) {
            config.selectionClassName = selectionClassName;
            config.fClass = "site-demo-button";
            Project.ajaxGet("/enum/transformation/" + config.type, {}).ajaxOK(function (enumData) {
                enumData = enumData.data;
                var bean = config['bean'];
                if (bean) enumData[bean['value']].default = true;
                $(document.body).append(template("select_enum_sin_tp", {config: config, enums: enumData}));
            });
        });
    }

    /**
     * 整形单值
     * @param type 配置类型
     */
    function intSingle(type) {
        findByType(type, function (config) {
            config.fClass = "layui-field-title";
            var name = config['opt'];
            $(document.body).append(template("int_sin_tp", {config: config}));
            var data = config['data'];
            data.elem = '#' + name;
            var editTimer;
            data.change = function (value) {
                clearTimeout(editTimer);
                editTimer = setTimeout(function () {
                    intSingleChange(name, value);
                }, data['delayedSubmission'])
            };
            var bean = config['bean'];
            if (bean) data.value = [bean['value']];
            layui.use('slider', function () {
                data['showstep'] = data['showStep'];
                layui.slider.render(data);
            });
        });
    }

    /**
     * 整形单值修改
     * @param data 修改值
     * @param name 配置项
     */
    function intSingleChange(name, data) {
        configEdit(name, data, false, function (data) {
            layer.alert(data['msg']);
        });
    }

    /**
     * 配置修改提交
     * @param name 配置项
     * @param val 修改值
     * @param alertShow 显示提示框
     * @param ok 成功回调
     */
    function configEdit(name, val, alertShow, ok) {
        Project.ajax("/config/n/" + name, {value: val}).ajaxOK(function (data) {
            if (ok) ok(data);
        }, alertShow);
    }

    /**
     * 枚举单选修改
     * @param el 节点信息
     */
    function dataEnumSingleElectionChange(el) {
        var $el = $(el), val = $el.attr("data-val"), name = $el.parent().prev().find("legend").attr("data-name");
        if (!$el.hasClass(selectionClassName)) return;
        configEdit(name, val, true, function () {
            var siblings = $el.siblings();
            siblings.addClass(selectionClassName);
            $el.removeClass(selectionClassName);
        });
    }

    //购买设置
    dataEnumSingleElection("COURSE_SECTION_BONUS_DEDUCTION");
    dataEnumSingleElection("PRIVILEGE_DISCOUNT_FOR_COURSE_SECTION");
    dataEnumSingleElection("COURSE_BONUS_DEDUCTION");
    dataEnumSingleElection("PRIVILEGE_DISCOUNT_FOR_COURSE");
    intSingle("ONE_DAY_FLOP_TIMES");
    intSingle("ONE_USER_TAG_BIG_SIZE");
</script>
</body>
</html>