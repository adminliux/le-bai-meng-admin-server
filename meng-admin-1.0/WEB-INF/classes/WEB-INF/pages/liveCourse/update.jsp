<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    String htmlData = request.getParameter("content2") != null ? request.getParameter
            ("content2") : "";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>修改课程</title>
    <!-- 引入css -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/lib/Hui-iconfont/1.0.7/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/lib/icheck/icheck.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/area/jquery.inputbox.css"/>
    <link type="text/css" href="${path}/kindEditor/themes/default/default.css"/>
    <link type="text/css" href="${path}/kindEditor/plugins/code/prettify.css"/>
    <link type="text/css" rel="stylesheet" href="${path}/kindEditor/themes/default/default.css "/>
    <!-- 编辑器-->
    <link rel="stylesheet" href="${path}/kindEditor/themes/default/default.css"/>
    <link rel="stylesheet" href="${path}/kindEditor/plugins/code/prettify.css"/>
    <script charset="utf-8" src="${path}/kindEditor/js/kindEditor.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/lang/zh_CN.js"></script>
    <script type="text/javascript" src="${path}/resources/lib/jquery/1.9.1/jquery.min.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/code/prettify.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/baidumap/baidumap.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/anchor/anchor.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/autoheight/autoheight.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/clearhtml/clearhtml.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/emoticons/emoticons.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/filemanager/filemanager.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/image/image.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/table/table.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/flash/flash.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/media/media.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/template/template.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/link/link.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/multiimage/multiimage.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/pagebreak/pagebreak.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/quickformat/quickformat.js"></script>

    <link type="text/css" rel="stylesheet" href="${path}/resources/uploadimg/control/css/zyUpload.css"/>
    <style>
        input[type="radio"], input[type="checkbox"] {
            width: 20px;
        }
    </style>


</head>
<body>
<!--对话框  -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" style="width: 800px;">

    <div class="modal-dialog" role="document" style="width: 800px;">

        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新增</h4>
            </div>

            <div class="modal-body">
                <div id="demo" class="demo"></div>
            </div>

            <div class="modal-footer">
                <button type="button" id="btn_submit" class="btn btn-primary"
                        data-dismiss="modal">
                    <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>关闭
                </button>
            </div>

        </div>
    </div>
</div>

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 课程管理 <span
        class="c-gray en">&gt;</span> 修改课程 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container" id="classifyList2">
</div>
<div class="page-container">
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>简介：</label>
        <textarea name="content2" cols="100" rows="8" id="roomDesc"
                  style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
        <br/>
    </div>

    <br>
    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
            <input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick="release()">
        </div>
    </div>
</div>


<script type="text/html" id="f5">
    <br>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程名称：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="名称" name="roomTitle" value="{{data.roomTitle}}">
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程价格(单节)：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="课程价格(单节)" name="price" value="{{data.price}}"
                   onkeyup="value=value.replace(/[^\d.]/g,'')">
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程类别：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <select name="classifyId" class="select" id="classifyList">
            </select>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>状态：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <select name="status" class="select" id="statusType">
            </select>
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>老师ID：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="老师ID" name="userId" value="{{data.userId}}">
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程时间：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="beginTime"
                   style="width: 20%; height: 30px" placeholder="开始时间"
                   value="{{$timestampFormatYMDHM data.beginTime}}"/>
            -
            <input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="overTime"
                   style="width: 20%; height: 30px" placeholder="结束时间" value="{{$timestampFormatYMDHM data.overTime}}"/>
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>预览图：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <img width="120" height="120" id="zhaopian" src="{{data.previewImg}}">
            <input type="file" id="imgUrl" onchange="preview(this)"/>
            <input type="hidden" name="previewImg" value="{{data.previewImg}}"/>
        </div>
    </div>
    <br>


    <%--<div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>简介：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="老师ID" name="roomDesc" value="{{data.roomDesc}}">
        </div>
    </div>
    <br>--%>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>拼课结束时间：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" placeholder="拼课结束时间"
                   name="collageTime" value="{{$timestampFormatYMDHM data.collageTime}}">
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>拼课价格：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="拼课价格" name="spellPrice" value="{{data.spellPrice}}">
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>拼课人数</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="拼课人数" name="personNum" value="{{data.personNum}}">
        </div>
    </div>
    <br>


</script>

<script type="text/html" id="f4">
    {{each data as good}}
    <option value="{{good.id}}">{{good.name}}</option>
    {{/each}}
</script>
<script type="text/html" id="status_tp">
    {{each data as key,value }}
    <option value="{{value}}">{{key.explain}}</option>
    {{/each}}
</script>

<!-- 基本js -->
<script type="text/javascript" src="${path}/resources/lib/jquery/1.9.1/jquery.min.js"></script>

<script type="text/javascript" src="${path}/resources/area/js/jquery.ganged.js"></script>
<script type="text/javascript" src="${path}/resources/area/js/jquery.inputbox.js"></script>


<script type="text/javascript" src="${path}/resources/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="${path}/resources/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${path}/resources/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${path}/resources/datePicker/WdatePicker.js"></script>


<!-- 核心js -->
<script src="${path}/resources/js/jquery.js"></script>
<script src="${path}/resources/js/template.js"></script>
<script src="${path}/resources/js/common.js"></script>
<script src="${path}/resources/js/promise.min.js"></script>
<script src="${path}/resources/js/project.js"></script>
<script src="${path}/resources/js/jquery.common.js"></script>
<script src="${path}/resources/js/jk_tools.js"></script>

<script type="text/javascript" src="${path}/kindEditor/js/kindEditor.js"></script>
<script type="text/javascript" src="${path}/kindEditor/lang/zh_CN.js"></script>
<script type="text/javascript"
        src="${path}/kindEditor/plugins/code/prettify.js"></script>


<!-- 上传图片 -->
<script type="text/javascript" src="${path}/resources/uploadimg/control/js/zyUpload.js"></script>
<script type="text/javascript" src="${path}/resources/uploadimg/core/zyFile.js"></script>
<script type="text/javascript" src="${path}/resources/uploadimg/demo.js"></script>
<script type="text/javascript" src="${path}/resources/uploadimg/control/js/bootstrap.min.js"></script>

<script type="text/javascript">
    var editor;
    KindEditor.ready(function (K) {
        editor = K.create('textarea[name="content2"]', {
            cssPath: '${path}/kindEditor/plugins/code/prettify.css',
            uploadJson: '${path}/kindEditor/jsp/upload_json.jsp',
            fileManagerJson: '${path}/kindEditor/jsp/file_manager_json.jsp',
            allowFileManager: true,
            afterCreate: function () {
                var self = this;
                K.ctrl(document, 13, function () {
                    self.sync();
                    document.forms['example'].submit();
                });
                K.ctrl(self.edit.doc, 13, function () {
                    self.sync();
                    document.forms['example'].submit();
                });
            }
        });
        prettyPrint();
        findVideo();
    });


    function findClassify(id, status) {
        Project.ajax("/global/classify/list").ajaxOK(function (data) {
            $("#classifyList").html(template("f4", data));//作用到表格
            $("#classifyList option[value='" + id + "']").attr("selected", true);

            var $sy = $("#statusType");
            //状态管理
            Project.ajax("/enum/type", {type: "LiveCourseStatus"}).ajaxOK(function (data) {
                $sy.append(template("status_tp", data));
                $sy.val(status);
            });
        });
    }

    function findVideo() {
        var id = "${id}";
        Project.ajax("/live/live/course/detail", {id: id}).ajaxOK(function (data) {
            $("#classifyList2").html(template("f5", data));//作用到表格
            editor.html(data.data.roomDesc);
            findClassify(data.data.classifyId, data.data.status);
        });
    }

    function release() {
        var id = "${id}";
        var classifyId = $("select[name=classifyId]").val();
        var roomTitle = $("input[name=roomTitle]").val();
        var userId = $("input[name=userId]").val();
        var previewImg = $("input[name=previewImg]").val();
        var price = $("input[name=price]").val();
        var beginTime = $("input[name=beginTime]").val();
        var overTime = $("input[name=overTime]").val();
        var personNum = $("input[name=personNum]").val();
        var spellPrice = $("input[name=spellPrice]").val();
        var collageTime = $("input[name=collageTime]").val();
        var status = $("select[name=status]").val();
        var roomDesc = editor.html();

        if ("NaN-aN-aN aN:aN" == overTime) {
            overTime = "1960-05-08 00:00:00";
        }
        if (isNaN(personNum)) {
            alert("拼班人数不合法");
            return;
        }
        if (isNaN(spellPrice)) {
            alert("拼班价不合法");
            return;
        }

        var p = $.extend({id: id}, {price: price}, {userId: userId}, {previewImg: previewImg}, {roomDesc: roomDesc},
            {classifyId: classifyId}, {roomDesc: roomDesc}, {roomTitle: roomTitle}, {beginTime: beginTime}, {overTime: overTime},
            {personNum: personNum}, {spellPrice: spellPrice}, {collageTime: collageTime}, {status: status});
        Project.ajax("/live/update", p).ajaxOK(function (data) {
        }, true);
    }

    function preview(file) {
        var fd = new FormData();
        fd.append("files", file.files[0]);
        Project.ajaxUploadFiles(fd).ajaxOK(function (data) {
            $("#zhaopian").attr("src", data.data[0]);
            $("input[name=previewImg]").val(data.data[0]);
        });
    }


</script>
</body>
</html>
<%!
    private String htmlspecialchars(String str) {
        str = str.replaceAll("&", "&amp;");
        str = str.replaceAll("<", "&lt;");
        str = str.replaceAll(">", "&gt;");
        str = str.replaceAll("\"", "&quot;");
        return str;
    }
%>
