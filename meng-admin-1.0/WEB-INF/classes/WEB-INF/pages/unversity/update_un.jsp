<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>大学</title>
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
				<h4 class="modal-title" id="myModalLabel">修改</h4>
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
<div class="page-container" id="classifyList2">

</div>
<script type="text/html"  id="f5">
	<br>

	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>大学名称：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" placeholder="名称" name="title" value="{{data.unName}}">
		</div>
	</div>
	<br>


	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>大学封面：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<img width="120" height="120" id="zhaopian" src="{{data.unLook}}">
			<input type="file" id="imgUrl" onchange="preview(this)"/>
			<input type="hidden" name="previewImg" value="{{data.unLook}}"/>
		</div>
	</div>

	<br>

	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>大学简介：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" placeholder="大学简介" name="birefInfo" value="{{data.birefInfo}}">
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
	findUn();

    function findUn() {
        var id="${unId}";
        Project.ajax("/unversity/find/un/bykey",{id:id}).ajaxOK(function(data) {
            $("#classifyList2").html(template("f5",data));//作用到表格
        });
    }

    function release() {
        //获得该button对象
        var btn = document.getElementById('btn');
        btn.value = '上传中..';//将按钮value值改为同意
        btn.disabled = true;//将按钮disabled值改为false
        var id="${unId}";
        var title=$("input[name=title]").val();
        var previewImg=$("input[name=previewImg]").val();
        var  birefInfo = $("input[name=birefInfo]").val();
        var fd = new FormData();
        fd.append("unLook",previewImg);
        fd.append("unName",title);
        fd.append("id",id);
        fd.append("birefInfo",birefInfo);
        Project.ajaxUploadVideoFile('/unversity/admin/update',fd,{},true).ajaxOK(function(data) {
            window.close();
        },true);
    }

    function preview(file) {
        var fd = new FormData();
        fd.append("files",file.files[0]);
        Project.ajaxUploadFiles(fd).ajaxOK(function(data) {
            $("#zhaopian").attr("src",data.data[0]);
            $("input[name=previewImg]").val(data.data[0]);
        });
    }

</script>
</body>
</html>