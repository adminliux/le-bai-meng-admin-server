<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>用户主页面</title>
    <%@include file="../base/header.jsp" %>
</head>
<body>
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

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>
    首页 <span class="c-gray en">&gt;</span>
    课程管理<span class="c-gray en">&gt;</span>
    评论审核
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
        <i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
    <br>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>用户id：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="用户id" name="userId">
        </div>
    </div>
    <br>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程id：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="课程id" name="courseId">
        </div>
    </div>
    <br>

</div>

<br>
<div class="row cl">
    <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
        <input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick="release()">
    </div>
</div>
</body>
<%@include file="../base/footer.jsp" %>
<script type="text/javascript" >
    function release(){
        var userId=$("input[name=userId]").val();
        var phoneNumer=$("input[name=phoneNumer]").val();
        var courseId = $("input[name=courseId]").val();
        if(cm.stringIsEmpty(userId)){
            alert("请输入用户id");
            return false;
        }
        if(cm.stringIsEmpty(courseId)){
            alert("请输入课程id");
            return false;
        }

        Project.ajax("/live/course/enroll/regist/course",{userId:userId,courseId:courseId}).ajaxOK(function(data) {

        },true);


    }
</script>

