<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>用户主页面</title>
    <!-- 引入css -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/lib/Hui-iconfont/1.0.7/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/lib/icheck/icheck.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/css/style.css"/>
    <!-- 分页样式css -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/matrix-style.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/bootstrap.min.css"/>
    <!-- 引入图片悬浮css -->
    <link rel="stylesheet" id="spi-render-css-css" href="${path}/resources/imgshow/css/render.css?ver=3.5.2"
          type="text/css" media="all"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/imgshow/css/default.include.b2676e.css" media="all"/>
</head>
<body>
<section>
    <h3>快速送花</h3>
    <form id="fl_from">
        <label>
            <span>ID</span>
            <input name="id" required placeholder="资源ID" type="number">
        </label>
        <label>
            <span>数量随机开始</span>
            <input name="rangeOfQuantities.start" placeholder="20" type="number">
        </label>
        <label>
            <span>数量随机结束</span>
            <input name="rangeOfQuantities.end" placeholder="40" type="number">
        </label>
        <label>
            <span>时间间隔随机开始(秒)</span>
            <input name="intervalOfQuantities.start" placeholder="40000" type="number">
        </label>
        <label>
            <span>时间间隔随机结束(秒)</span>
            <input name="intervalOfQuantities.end" placeholder="200000" type="number">
        </label>
        <label>
            <select name="type">
                <option value="VIDEO">视频</option>
                <option value="VIDEO_UNDER_ACTIVITY">课程</option>
            </select>
        </label>
        <button type="submit">提交</button>
    </form>
</section>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户管理 <span
        class="c-gray en">&gt
</span> 会员列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
    <!-- 条件查询start -->
    <div class="text-c"> <span class="select-box inline">
		<form id="From">
		<select name="type" class="select" onchange="findUser()">
			<option value="">全部用户</option>
			<option value="TEACHER">老师</option>
			<option value="USER">用户</option>
		</select>
		</span>
        &nbsp
        <span class="select-box inline">
		<select name="sort" class="select" onchange="findUser()">
			<option value="0">时间倒序</option>
			<option value="1">时间正序</option>
			<option value="2">等级倒序</option>
			<option value="3">等级正序</option>
			<option value="4">收花数倒序</option>
			<option value="5">收花数正序</option>
		</select>
		</span>
        &nbsp
        <span class="select-box inline">
		<select name="gender" class="select" onchange="findUser()">
			<option value="">全部性别</option>
			<option value="MALE">男</option>
			<option value="FEMALE">女</option>
		</select>
		</span>
        <br><br/>
        &nbsp日期范围：
        <input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="startTime"
               style="width: 10%; height: 30px" placeholder="开始时间"/>
        -
        <input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="endTime"
               style="width: 10%; height: 30px" placeholder="结束时间"/>
        <input type="text" name="id" placeholder="id" style="width:7%">
        &nbsp
        <input type="text" name="nickname" placeholder=" 用户名称" style="width:7%">
        &nbsp
        <input type="text" name="phoneNumber" placeholder="手机号" style="width:10%">
        &nbsp
        <input type="text" name="accountId" placeholder="账户ID" style="width:7%">
        &nbsp
        <input type="text" name="beginGrade" placeholder="等级范围" style="width:7%">
        -
        <input type="text" name="endGrade" placeholder="等级范围" style="width:7%">
        &nbsp
        <input type="text" name="beginGetGiftSum" placeholder="收花数范围" style="width:7%">
        -
        <input type="text" name="endGetGiftSum" placeholder="收花数范围" style="width:7%">

        </from>
        <a class="btn btn-success" onclick="findUser()"><i class="Hui-iconfont">&#xe665;</i> 查询</a>
    </div>
    <!-- 条件查询end -->
    <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="1">本页共有:<strong id="size"></strong> 条</span> <span class="r">共有数据：<strong
            id="total"></strong> 条</span></div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover" style="white-space: nowrap">
            <thead>
            <tr class="text-c">
                <%--<th width="25"><input type="checkbox" name="" value=""></th>--%>
                <th width="80">用户ID</th>
                <th width="75">昵称</th>
                <th width="120">账户ID</th>
                <th width="120">等级</th>
                <th width="120">收花数</th>
                <th width="120">头像</th>
                <th width="120">手机号码</th>
                <th width="120">出生年月</th>
                <th width="120">账户余额</th>
                <th width="120">个性签名</th>
                <th width="120">婚姻状况</th>
                <th width="75">性别</th>
                <th width="75">角色</th>
                <th width="75">年龄</th>
                <th width="75">注册时间</th>
                <th width="120">操作</th>
            </tr>
            </thead>
            <tbody id="goodList">
            </tbody>
        </table>
        <script type="text/html" id="f1">
            {{each data.list as good}}
            <tr>
                <%--<td style="text-align:center;vertical-align:middle;"><input type="checkbox" value="" name=""></td>--%>
                <td style="text-align:center;vertical-align:middle;">{{good.id}}</td>
                <td style="text-align:center;vertical-align:middle;"><u style="cursor:pointer" class="text-primary"
                                                                        onclick="member_show(' ','${path}/page/user/user/show?id='+'{{good.info.id}}','10001','360','400')"><font
                        color="#4169e1">{{good.nickname}}</font></u></td>
                <td style="text-align:center;vertical-align:middle;">{{good.accountId}}</td>
                <td style="text-align:center;vertical-align:middle;">
                    {{if good.info!=null}}{{good.info.grade}}{{/if}}
                </td>
                <td style="text-align:center;vertical-align:middle;">
                    {{if good.info!=null}}{{good.info.getGiftSum}}{{/if}}
                </td>
                <td>{{if good.headPortrait==NULL}}无{{else if good.headPortrait!=NULL}}
                    <a class="sit-preview"
                       href="{{good.headPortrait}}"
                       onMouseOver="biggerr()"><img src="{{good.headPortrait}}" data-preview-url="{{good.headPortrait}}"
                                                    style="cursor:pointer;width:60px;height:60px;"/></a>{{/if}}
                </td>
                <td style="text-align:center;vertical-align:middle;">{{good.phoneNumber}}</td>
                <td style="text-align:center;vertical-align:middle;">
                    {{if good.birthday==NULL}}{{else}}{{$timestampFormatYMD good.birthday}}{{/if}}
                </td>
                <td style="text-align:center;vertical-align:middle;">{{good.balance}}</td>
                <td style="text-align:center;vertical-align:middle;">{{good.signature}}</td>
                <td style="text-align:center;vertical-align:middle;">{{if good.maritalStatus =="MARRIED"}}已婚
                    {{ else if good.maritalStatus =="SINGLE"}}单身{{/if}}
                </td>
                <td style="text-align:center;vertical-align:middle;">{{if good.gender=="MALE"}}男{{else}}女{{/if}}</td>
                <td style="text-align:center;vertical-align:middle;">{{if good.type=="TEACHER"}}老师{{else}}用户{{/if}}</td>
                <td style="text-align:center;vertical-align:middle;">{{good.age}}</td>

                <%--<td style="text-align:center;vertical-align:middle;">--%>
                <%--{{if good.state==0}}--%>
                <%--{{if good.idfAuditStatus=='NO_SUBMIT_AUDIT'}}<span class="label badge-warning radius">未提交审核</span>--%>
                <%--{{else if good.idfAuditStatus=='PENDING_AUDIT'}}<span class="label badge-primary radius">待审核</span>--%>
                <%--{{else if good.idfAuditStatus=='AUDIT_PASS'}}<span class="label badge-success radius">审核通过</span>--%>
                <%--{{else if good.idfAuditStatus=='NO_AUDIT_PASS'}}<span class="label radius">审核未通过</span>--%>
                <%--{{/if}}--%>
                <%--{{else if good.state==1}}--%>
                <%--<span class="label label-danger radius">已停用</span>--%>
                <%--{{/if}}--%>
                <%--</td>--%>

                <td style="text-align:center;vertical-align:middle;">{{$timestampFormatYMDHM good.gmtDatetime}}</td>

                <!-- 用户审核 -->
                <td style="text-align:center;vertical-align:middle;">
                    <a onClick="article_shenhe(this,'{{good.id}}')" title="修改"><font color="#5a98de">修改</font></a>
                    <%--{{if good.idfAuditStatus=='PENDING_AUDIT' && good.state==0}}<!-- 处于待审核并且state=0 -->--%>
                    <%--<a onClick="article_shenhe(this,'{{good.id}}')"  title="审核"><font color="#5a98de">去审核</font></a>--%>
                    <%--{{else if good.idfAuditStatus=='NO_AUDIT_PASS'}}<font color="#dcdcdc">未通过</font>--%>
                    <%--{{else if good.idfAuditStatus=='AUDIT_PASS'}}<font color="#7fff00">已审和核</font>--%>
                    <%--{{else if good.idfAuditStatus=='NO_SUBMIT_AUDIT'}}<font color="#ff7f50">未提交审核</font>--%>
                    <%--{{else if good.idfAuditStatus!=NULL && good.state==1}}<font color="red">停用中</font>--%>
                    <%--{{/if}}--%>
                    &nbsp<!-- 用户停用启用 -->
                    <%--<img src="${path}/resources/static/h-ui/images/validform/iconpic-error.png"--%>
                    <%--onClick="member_stop(this,'{{good.id}}')" title="拉黑">--%>
                    <%--&nbsp--%>
                    <%--<img src="${path}/resources/static/h-ui/images/validform/iconpic-right.png"--%>
                    <%--onClick="member_start(this,'{{good.id}}')" title="启用">--%>
                </td>
            </tr>
            {{/each}}
        </script>

    </div>

    <!-- 分页 -->
    <div class="pagination alternate" align="center">
        <ul id="page"></ul>
    </div>

    <script type="text/html" id="f2">
        <!-- 分页 -->
        {{if data.prePage==0}}
        <li class="disabled"><a>上一页</a></li>
        {{else}}
        <li class="disabled"><a onclick="findUser({{data.prePage}})">上一页</a></li>
        {{/if}}
        {{each data.navigatepageNums as n}}
        <li class="active"><a onclick="findUser({{n}})">{{n}}</a></li>
        {{/each}}
        {{if data.nextPage==0}}
        <li class="disabled"><a>下一页</a></li>
        {{else}}
        <li class="disabled"><a onclick="findUser({{data.nextPage}})">下一页</a></li>
        {{/if}}
    </script>

    <script type="text/javascript" src="${path}/resources/lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="${path}/resources/lib/layer/2.1/layer.js"></script>
    <script type="text/javascript" src="${path}/resources/lib/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${path}/resources/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="${path}/resources/static/h-ui/js/H-ui.js"></script>
    <script type="text/javascript" src="${path}/resources/static/h-ui.admin/js/H-ui.admin.js"></script>


    <script src="${path}/resources/js/jquery.js"></script>
    <script src="${path}/resources/js/jquery-html5Validate-min.js"></script>
    <script src="${path}/resources/js/template.js"></script>
    <script src="${path}/resources/js/common.js"></script>
    <script src="${path}/resources/js/promise.min.js"></script>
    <script src="${path}/resources/js/project.js"></script>
    <script src="${path}/resources/js/jquery.common.js"></script>
    <!-- 图片悬浮js -->
    <script type="text/javascript" src="${path}/resources/imgshow/js/async-share.js?ver=3.5.2"></script>
    <script type="text/javascript" src="${path}/resources/imgshow/js/default.include-footer.304291.js"></script>
    <!-- 日期控件 -->
    <script type="text/javascript" src="${path}/resources/datePicker/WdatePicker.js"></script>
    <script type="text/javascript">
        findUser();

        function findUser(pageNum) {
            var startTime = $("input[name=startTime]").val();
            var endTime = $("input[name=endTime]").val();
            if (chkIsNull(startTime) && !chkIsNull(endTime)) {
                alert("开始时不能为空");
                return false;
            }
            if (!chkIsNull(startTime) && chkIsNull(endTime)) {
                alert("结束时间不能为空");
                return false;
            }
            var fromList = $("#From").formSerialize();
            var p = $.extend({pageNum: pageNum}, fromList);
//        var level=$("select[name=level]").val();
//        var idfAuditStatus=$("select[name=idfAuditStatus]").val();
//        var gender=$("select[name=gender]").val();
//        var startTime=$("input[name=startTime]").val();
//        var endTime=$("input[name=endTime]").val();
//        var userName=$("input[name=userName]").val();
//        var phoneNumber=$("input[name=phoneNumber]").val();
//        var idNumber=$("input[name=idNumber]").val();
//        var drivingLicenseId=$("input[name=drivingLicenseId]").val();
            Project.ajax("/user/find/user/and/info", p).ajaxOK(function (data) {
                $("#goodList").html(template("f1", data));//作用到表格
                $("#page").html(template("f2", data));//作用到分页
                $("#total").html(data.data.total);//作用到统计total
                $("#size").html(data.data.size);//作用到统计每页显示size
                biggerr();//初始页
                // 面调用图片悬浮放大方法
            });
        }

        function chkIsNull(data) {
            return data == "" || data == null || data == "undefine";
        }

        /*
        * 审核用户
        * obj：无效
        * id:用户id
        * */
        function article_shenhe(obj, id) {//id为用户的id，obj没用到
            layer_show("修改", "${path}/page/user/no/through?id=" + id, 800, 560);
        }

        /*
        * 用户-停用(拉黑)
        * obj：无效
        * id：用户id
        * **/
        function member_stop(obj, id) {//id为用户的id，obj没用到
            layer.confirm('确认要删除该用户吗？', function (index) {
                layer.msg('已删除!', {icon: 5, time: 1000});
                Project.ajax("/user/delete", {id: id}).ajaxOK(function (data) {
                    findUser();//刷新
                });
            });
        }

        /*
         * 用户-启用
         * obj：无效
         * id：用户id
         * **/
        function member_start(obj, id) {//id为用户的id，obj没用到
            layer.confirm('确认要启用该用户吗？', function (index) {
                layer.msg('已启用!', {icon: 6, time: 1000});
                var state = '0';//启用用户
                Project.ajax("/api/user/updateState", {id: id, state: state}).ajaxOK(function (data) {
                    findUser();//刷新
                });
            });
        }

        /**
         * 弹出用户信息悬浮框
         * */
        function member_show(title, url, id, w, h) {
            layer_show(title, url, w, h);
        }


        //图片悬浮事件处理
        function biggerr() {
            jQuery(".sit-preview").smartImageTooltip({
                previewTemplate: "simple",
                imageWidth: "350px"
            });
        }

        $("#fl_from").html5Validate(function () {
            try {
                var param = $("#fl_from").formSerialize();
                Project.ajax("/video/flower/delivery/batch", param).ajaxOK(function () {
                }, true);
            } catch (e) {
                alert(e.message);
            }
            return false;
        });
    </script>

</body>
</html>