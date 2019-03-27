<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>修改评论</title>
    <%@include file="../base/header.jsp"%>
</head>
<body>
    <div class="page-container" id="classifyList2">
    </div>
    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
            <input class="btn btn-primary radius" id="btn" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick="release()">
        </div>
    </div>
    <script type="text/html" id="f5">
        <br>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>内容：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="内容" name="centent" value="{{data.content}}">
            </div>
        </div>

        <br>
    </script>
    <%@include file="../base/footer.jsp"%>
</body>
<script >
    findVideo();
    function findVideo(){
        var id="${id}";
        var type = "${type}"
        Project.ajax("/comment/select/byid",{id:id,type:type},null,true).ajaxOK(function(data) {
            $("#classifyList2").html(template("f5",data));//作用到表格
        });
    }

    function release() {
        var btn = document.getElementById('btn');
        btn.value = '提交中..';//将按钮value值改为同意
        btn.disabled = true;//将按钮disabled值改为false
        var id="${id}";
        var type = "${type}";
        var centent=$("input[name=centent]").val();
        var fd = new FormData();
        fd.append("myStr",centent);
        fd.append("type",type);
        fd.append("id",id);
        Project.ajaxUploadVideoFile('/comment/insert/orupdate',fd,{},true).ajaxOK(function(data) {
            btn.value = '提交';//将按钮value值改为同意
            btn.disabled = false;//将按钮disabled值改为false
            window.close();
        },true);
    }
</script>


<html>

