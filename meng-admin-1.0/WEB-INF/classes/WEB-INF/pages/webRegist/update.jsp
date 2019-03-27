<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
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

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 课程管理 <span class="c-gray en">&gt;</span> H5列表<span class="c-gray en">&gt;</span>拼团发布 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container" id="classifyList2">

</div>
<script type="text/html" id="f5">

    <input type="hidden" class="input-text" placeholder="10字以内" name="id" value="{{data.id}}" maxlength="10">

    <br/>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>手机号：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="请输入手机号" name="phone" value="{{data.phone}}" maxlength="20">
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>类型：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="10字以内" name="type" value="{{data.type}}" readonly="true" maxlength="10">
        </div>
    </div>

    <br>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程ID：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="10字以内" name="relaId" value="{{data.relaId}}" maxlength="10">
        </div>
    </div>
    <br>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>拼团ID：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="10字以内" name="collageId" value="{{data.collageId}}" maxlength="10">
        </div>
    </div>
    <br>
    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
            <input class="btn btn-primary radius" id="btn" type="button" value="&nbsp;&nbsp;修改H5&nbsp;&nbsp;" onclick="release()">
        </div>
    </div>
    </div>
</script>
<%@include file="../base/footer.jsp"%>

<script type="text/javascript">
    //验证是否为整数
    var mathTest =/^[0-9]*$/;
    //手机号码
    var phoneReg = /^1(3|4|5|7|8)\d{9}$/
    findCollage();
    function findClassify(id) {
        Project.ajax("/global/classify/list",null,null,true).ajaxOK(function(data) {
            $("#classifyList").html(template("f4",data));//作用到表格
            $("#classifyList option[value='"+id+"']").attr("selected",true);
        });
    }

    function findCollage() {
        var id="${id}";
        Project.ajax("/web/regist/query/byid",{id:id},null,true).ajaxOK(function(data) {
            $("#classifyList2").html(template("f5",data));//作用到表格
            findClassify(data.data.classifyId);
        });
    }

    function release() {
        var id =  $("input[name=id]").val();
        var phone = $("input[name=phone]").val();
        var relaId = $("input[name=relaId]").val();
        var collageId = $("input[name=collageId]").val();
        var type = $("input[name=type]").val();

        if (relaId.length == 0) {
            alert("课程Id为必填！");
            return;
        }
        if (collageId.length == 0) {
            alert("拼团Id为必填");
            return;
        }
        if(!mathTest.test(relaId)){
            alert("课程Id只能输入正整数！");
            return;
        } if(!mathTest.test(collageId)){
            alert("拼团Id只能输入正整数！");
            return;
        }
       if(!phoneReg.test(phone)){
            alert("电话号码格式不正确！");
            return;
        }


        var fd = new FormData();
        fd.append("id",id);
        fd.append("phone", phone);
        fd.append("relaId", relaId);
        fd.append("collageId", collageId);
        fd.append("type", type);

        /*fd.append("roomTitle",roomTitle)*/

        Project.ajaxUploadVideoFile('/web/regist/update/regist', fd, {}, true).ajaxOK(function (data) {

        }, true);

    }






</script>
</body>
</html>