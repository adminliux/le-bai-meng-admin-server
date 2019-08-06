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

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 轮播管理 <span class="c-gray en">&gt;</span> 添加轮播图 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <br>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>发布类型：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select style="width: 100%;height: 3.5%" name="type" onchange="tiaozhuan()">
                    <option value="">请选择类型</option>
                    <option value="VIDEO">视频</option>
                    <option value="CURRICULUM">课程</option>
                    <option value="ACTIVITY">活动</option>
                    <option value="LIVE">直播</option>
                </select>
            </div>
        </div>
    <br>
<%--
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>轮播类型：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <select style="width: 100%;height: 3.5%" name="classifyId" class="select" onchange="findUser()" id="classifyList">

            </select>
            <script type="text/html" id="f4">
                <option value="">主页</option>

            </script>
        </div>
    </div>
    <br>--%>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>轮播对象：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <button type="button" class="btn btn-success" id="duixiang"></button>
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
        var type='${type}';
        var relationId='${relationId}';
        if(!cm.stringIsEmpty(type)){
            $("select[name=type]").val('${type}');
        }
        if(!cm.stringIsEmpty(relationId)){
            $("#duixiang").html('${relationId}');
        }
        Project.ajax("/global/classify/list",null).ajaxOK(function(data) {
            $("#classifyList").html(template("f4",data));//作用到表格
        });
    }

    function tiaozhuan() {
        $("#duixiang").html("");
        var type=$("select[name=type]").val();
        if(type=="VIDEO"){
            window.location.href='${path}/page/recommend/video/checkbox?type='+type;
        }else if(type=="CURRICULUM"){
            window.location.href='${path}/page/recommend/live/course/checkbox?type='+type;
        }else if(type=="ACTIVITY"){
            window.location.href='${path}/page/recommend/actcheckbox?type='+type;
        }else if(type=="LIVE"){
            window.location.href='${path}/page/recommend/live/checkbox?type='+type;
        }
    }
    
    function release() {
        var type='${type}';
        if(cm.stringIsEmpty(type)){
            alert("请选择类型");
            return false;
        }
        var relationId='${relationId}';
        if(cm.stringIsEmpty(relationId)){
            alert("请选择轮播对象");
            return false;
        }
        Project.ajax("/recommend/add",{type:type,relationId:relationId}).ajaxOK(function(data) {

        },true);
    }

</script>
</body>
</html>