<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>广告发布</title>
    <%@include file="../base/header.jsp"%>
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

<div class="page-container">
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">标题：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="标题" name="title">
        </div>
    </div>
    <br>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>内容：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="内容" name="content">
        </div>
    </div>
    <br>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">推送对象：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" name="aim" class="input-text" >
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">推送人：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" name="userId" class="input-text" >
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>有效时长：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="有效时长" name="periodValidity" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')">
        </div>
    </div>
    <br>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">透传内容：</label>
        <div class="formControls col-xs-8 col-sm-9">
           <input type="text" class="input-text" placeholder="id" name="aimUrl">
        </div>
    </div>
    <br>

    <br>
    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
            <input class="btn btn-primary radius" id="btn" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick="release()">
        </div>
    </div>
</div>

<%@include file="../base/footer.jsp"%>

<script type="text/javascript">
    initLoad();
    function  initLoad() {
        var aimUrl =  '${aimUrl}';
        var aim = '${aim}';
        if(!cm.stringIsEmpty(aimUrl)){
            $("input[name=aimUrl]").val(aimUrl);
        }
        if(!cm.stringIsEmpty(aim)){
            $("input[name=aim]").val(aim);
        }
    }

    function release() {
        //获得该button对象
        var btn = document.getElementById('btn');
        //  btn.value = '上传中..';//将按钮value值改为同意
        //  btn.disabled = true;//将按钮disabled值改为false
        var aim=$("input[name=aim]").val();
        var title=$("input[name=title]").val();
        var content=$("input[name=content]").val();
        var periodValidity=$("input[name=periodValidity]").val();
        var aimUrl=$("input[name=aimUrl]").val();
        var userId = $("input[name=userId]").val();
        var fd = new FormData();
        fd.append("aimUrl",aimUrl);
        fd.append("periodValidity",periodValidity);
        fd.append("title",title);
        fd.append("content",content);
        fd.append("aim",aim);
        fd.append("userId",userId);

        Project.ajaxUploadVideoFile('/push/log/add/or/update/log',fd,{},true).ajaxOK(function(data) {
            btn.value = '提交';//将按钮value值改为同意
            btn.disabled = false;//将按钮disabled值改为false
            window.location.href='${path}/page/push/log/list';
        },true);
    }




</script>
</body>
</html>
