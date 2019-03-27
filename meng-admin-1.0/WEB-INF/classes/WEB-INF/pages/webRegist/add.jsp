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

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 课程管理 <span class="c-gray en">&gt;</span> H5列表<span class="c-gray en">&gt;</span>H5发布 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <br>

    <input type="hidden" class="input-text" placeholder="10字以内" name="id" value="{{data.id}}" maxlength="10">

    <br/>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>手机号：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="请输入手机号" name="phone"  maxlength="20">
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>类型：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="10字以内" name="type" value="COURSE" readonly="true" maxlength="10">
        </div>
    </div>

    <br>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程ID：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="10字以内" name="relaId"  maxlength="10">
        </div>
    </div>
    <br>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>拼团ID：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="10字以内" name="collageId" maxlength="10">
        </div>
    </div>
    <br>
    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
            <input class="btn btn-primary radius" id="btn" type="button" value="&nbsp;&nbsp;创建H5&nbsp;&nbsp;" onclick="release()">
        </div>
    </div>
</div>


<%@include file="../base/footer.jsp"%>

<script type="text/javascript">
    findUser();
    function findUser(pageNum) {
        var fromList=$("#From").formSerialize();
        var p=$.extend({pageNum: pageNum},{status: status},fromList);

        Project.ajax("/web/regist/query/regist/list",p,null,true).ajaxOK(function(data) {
            $("#goodList").html(template("f1",data));//作用到表格
            //$("#page").html(template("f2",data));//作用到分页
            //$("#total").html(data.data.total);//作用到统计total
            //$("#size").html(data.data.size);//作用到统计每页显示size
            //  biggerr();//初始页
            // 面调用图片悬浮放大方法
        });
    }
    var mathTest =/^[0-9]*$/;
    //手机号码
    var phoneReg = /^1(3|4|5|7|8)\d{9}$/
    function release() {

        var phone = $("input[name=phone]").val();
        var type = $("input[name=type]").val();
        var relaId = $("input[name=relaId]").val();
        var collageId = $("input[name=collageId]").val();


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
        fd.append("phone", phone);
        fd.append("relaId", relaId);
        fd.append("collageId", collageId);
        fd.append("type", type);



        Project.ajaxUploadVideoFile('/web/regist/create/regist', fd, {}, true).ajaxOK(function (data) {
            //  history.go();
            //   top.location = "/page/collage/list";
        }, true);
    }






</script>
</body>
</html>