<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>广告发布</title>
    <!-- 引入css -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/lib/Hui-iconfont/1.0.7/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/lib/icheck/icheck.css" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/area/jquery.inputbox.css" />
    <link type="text/css" href="${path}/kindEditor/themes/default/default.css" />
    <link type="text/css" href="${path}/kindEditor/plugins/code/prettify.css" />
    <link type="text/css" rel="stylesheet" href="${path}/kindEditor/themes/default/default.css " />


    <link type="text/css" rel="stylesheet" href="${path}/resources/uploadimg/control/css/zyUpload.css" />




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

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 背景图管理 <span class="c-gray en">&gt;</span> 添加背景图 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>名称：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="名称" name="name">
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>类别：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <select name="classId" class="select" id="classifyList">

            </select>
            <script type="text/html" id="f4">
                {{each data as good}}
                <option value="{{good.id}}">{{good.name}}</option>
                {{/each}}
            </script>
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>拍摄图片：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <img width="120" height="120" id="zhaopian" src="">
            <input type="file" id="imgUrl" onchange="preview(this)"/>
            <input type="hidden" name="imgUrl"/>
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>预览图片：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <img width="120" height="120" id="zhaopian1" src="">
            <input type="file" id="imgUrl1" onchange="preview1(this)"/>
            <input type="hidden" name="previewImgUrl"/>
        </div>
    </div>
    <br>

    <br>
    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
            <input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick="release()">
        </div>
    </div>
</div>



<!-- 基本js -->
<script type="text/javascript" src="${path}/resources/lib/jquery/1.9.1/jquery.min.js"></script>

<script type="text/javascript" src="${path}/resources/area/js/jquery.ganged.js"></script>
<script type="text/javascript" src="${path}/resources/area/js/jquery.inputbox.js"></script>


<script type="text/javascript" src="${path}/resources/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="${path}/resources/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${path}/resources/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>



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
    findClassify();
    function findClassify() {
        Project.ajax("/video/back/img/class/list",null).ajaxOK(function(data) {
            $("#classifyList").html(template("f4",data));//作用到表格
        });
    }

    function release() {
        var classId=$("select[name=classId]").val();
        var name=$("input[name=name]").val();
        var imgUrl=$("input[name=imgUrl]").val();
        var previewImgUrl=$("input[name=previewImgUrl]").val();
        Project.ajax("/video/back/img/insert",{classId:classId,name:name,imgUrl:imgUrl,previewImgUrl:previewImgUrl}).ajaxOK(function(data) {

        },true);
    }


    function preview(file) {
        var prevDiv = document.getElementById('preview');
        if (file.files && file.files[0]) {
            var reader = new FileReader();
            reader.onload = function(evt) {
                prevDiv.innerHTML = '<img src="' + evt.target.result + '" width="100px" height="100px" />';
            }
            reader.readAsDataURL(file.files[0]);
        } else {
            prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
        }
        var fd = new FormData();
        fd.append("files",file.files[0]);
        Project.ajaxUploadFiles(fd).ajaxOK(function(data) {
            $("#zhaopian").attr("src",data.data[0]);
            $("input[name=imgUrl]").val(data.data[0]);
        });
    }

    function preview1(file) {
        var fd = new FormData();
        fd.append("files",file.files[0]);
        Project.ajaxUploadFiles(fd).ajaxOK(function(data) {
            $("#zhaopian1").attr("src",data.data[0]);
            $("input[name=previewImgUrl]").val(data.data[0]);
        });
    }


</script>
</body>
</html>