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

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 广播管理 <span class="c-gray en">&gt;</span> 修改广播 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container" id="classifyList1">

</div>



<script type="text/html" id="f5">

        <br>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>请输入标题：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="请输入标题" name="title" value="{{data.title}}">
            </div>
        </div>
        <br>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>请输入标签：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select name="classify" class="select" id="classifyList">
                </select>

            </div>
        </div>
        <br>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>预览图：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <img width="120" height="120" id="zhaopian" src="{{data.bannerImages}}">
                <input type="file" id="imgUrl" onchange="preview(this)"/>
                <input type="hidden" name="bannerImages" value="{{data.bannerImages}}" />
            </div>
        </div>
        <br>
        {{if data.videoSrc!=null}}
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">原有视频：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <video controls="controls" src="{{data.videoSrc}}">
                </video>
            </div>
        </div>
        <br>
        {{/if}}
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">修改视频：</label>
            <div class="formControls col-xs-8 col-sm-9">

                <input type="file" id="video"/>
            </div>
        </div>
        <br>

        <br>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" id="btn" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick="release()">
            </div>
        </div>
</script>


<script type="text/html" id="f4">
    {{each data as good}}
    <option value="{{good}}">{{good}}</option>
    {{/each}}
</script>



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

    function findClassify(cc) {
        var name="NOTICE_CLASS";
        Project.ajax("/global/config/find",{name:name},null,true).ajaxOK(function(data) {
            $("#classifyList").html(template("f4",data));//作用到表格
            $("#classifyList option[value='"+cc+"']").attr("selected",true);
        });
    }

    findUser();
    function findUser(){
        var id="${id}";
        Project.ajax("/notice/qcb/find/byid",{id:id},null,true).ajaxOK(function(data) {
            $("#classifyList1").html(template("f5",data));//作用到表格
            findClassify(data.data.classify);
        });
    }



    function release() {
        //获得该button对象
        var btn = document.getElementById('btn');
        btn.value = '上传中..';//将按钮value值改为同意
        btn.disabled = true;//将按钮disabled值改为false
        var id="${id}";
        var file=$("#video")[0].files[0];
        var title = $("input[name=title]").val();
        var classify  = $("select[name=classify]").val();
        var bannerImages=$("input[name=previewImg]").val();
        var publishUserId=2;
        var fd = new FormData();
        fd.append("files",file);
        fd.append("id",id);
        fd.append("title",title);
        fd.append("classify",classify);
        fd.append("status",status);
        fd.append("bannerImages",bannerImages);
        fd.append("publishUserId",publishUserId);
        Project.ajaxUploadVideoFile('/notice/qcb/admin/update',fd,{},true).ajaxOK(function(data) {
            btn.value = '提交';//将按钮value值改为同意
            btn.disabled = false;//将按钮disabled值改为false
        },true);
    }


    function preview(file) {
        var fd = new FormData();
        fd.append("files",file.files[0]);
        var selectedFile = document.getElementById('imgUrl').files[0];
        var filename = selectedFile.name;


        Project.ajaxUploadVideoFile('/video/upload/tenxun', fd, null, true).ajaxOK(function (data) {
            var src = data['data'];
            $("#zhaopian").attr("src",src);
            $("input[name=bannerImages]").val(src);
        }, true);
//        Project.ajaxUploadFiles(fd).ajaxOK(function(data) {
//
//            $("#zhaopian").attr("src",data.data[0]);
//            $("input[name=previewImg]").val(data.data[0]);
//        });

    }

</script>
</body>
</html>