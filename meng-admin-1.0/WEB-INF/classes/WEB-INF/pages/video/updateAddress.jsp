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

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 视频管理 <span class="c-gray en">&gt;</span> 修改视频 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container" id="classifyList2">

</div>

<script type="text/html" id="f5">
    <br>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>地址：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="地址" name="address" value="{{data.address}}">
        </div>
    </div>
    <br>
    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
            <input class="btn btn-primary radius" id="btn" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick="release()">
        </div>
    </div>

</script>

<script type="text/html" id="f4">
    {{each data as good}}
    <option value="{{good.id}}">{{good.name}}</option>
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
    findVideo();
    function findClassify(id) {
        Project.ajax("/global/classify/list",null).ajaxOK(function(data) {
            $("#classifyList").html(template("f4",data));//作用到表格
            $("#classifyList option[value='"+id+"']").attr("selected",true);
        });
    }

    function findVideo() {
        var id="${id}";
        Project.ajax("/video/select/byid",{id:id}).ajaxOK(function(data) {
            $("#classifyList2").html(template("f5",data));//作用到表格
            findClassify(data.data.classifyId);
        });
    }




    function release() {
        var btn = document.getElementById('btn');
        btn.value = '上传中..';//将按钮value值改为同意
        btn.disabled = true;//将按钮disabled值改为false
        var id="${id}";
        var address = $("input[name=address]").val();
        var fd = new FormData();
        fd.append("id",id);
        fd.append("address",address);
        Project.ajaxUploadVideoFile('/video/admin/update',fd,{},true).ajaxOK(function(data) {
            btn.value = '提交';//将按钮value值改为同意
            btn.disabled = false;//将按钮disabled值改为false
        },true);
    }

    function preview(file) {
        var fd = new FormData();
        fd.append("files",file.files[0]);
        Project.ajaxUploadVideoFile('/video/upload/tenxun', fd).ajaxOK(function (data) {
            var src = data['data'];
            $("#zhaopian").attr("src",src);
            $("input[name=previewImg]").val(src);
        }, true);

    }


</script>
</body>
</html>