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

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 课程管理 <span class="c-gray en">&gt;</span> 拼团列表<span class="c-gray en">&gt;</span>拼团发布 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>拼团名称：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="10字以内" name="title" maxlength="10">
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>拼团类型：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" value="CURRICULUM" name="type" readonly="true" maxlength="10">
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程Id：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="10字以内" name="goodId" maxlength="10">
        </div>
    </div>
    <br>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>创建人ID：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="10字以内" name="createId" maxlength="10">
        </div>
    </div>
    <br>


    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
            <input class="btn btn-primary radius" id="btn" type="button" value="&nbsp;&nbsp;发布拼团&nbsp;&nbsp;" onclick="release()">
        </div>
    </div>
</div>
<%@include file="../base/footer.jsp"%>

<script type="text/javascript">
    findUser();
    function findUser(pageNum) {
        var fromList=$("#From").formSerialize();
        var p=$.extend({pageNum: pageNum},{status: status},fromList);

        Project.ajax("/collage/query/collage/list",p,null,true).ajaxOK(function(data) {
            $("#goodList").html(template("f1",data));//作用到表格
            //$("#page").html(template("f2",data));//作用到分页
            //$("#total").html(data.data.total);//作用到统计total
            //$("#size").html(data.data.size);//作用到统计每页显示size
            //  biggerr();//初始页
            // 面调用图片悬浮放大方法
        });
    }
    var mathTest =/^[0-9]*$/;
    function release() {

        var title = $("input[name=title]").val();
        var type = $("input[name=type]").val();
        var createId = $("input[name=createId]").val();
        var roomTitle = $("select[name=roomTitle]").val();
        var goodId = $("input[name=goodId]").val();


        if (title.length == 0) {
            alert("拼团名称为必填！");
            return;
        }
        if (goodId.length == 0) {
            alert("课程Id为必填！");
            return;
        }
        if (createId.length == 0) {
            alert("创建人Id为必填");
            return;
        }
        if(!mathTest.test(createId)){
            alert("创建人Id只能输入数字！");
            return;
        }
        if(!mathTest.test(goodId)){
            alert("课程Id只能输入数字！");
            return;
        }

        var fd = new FormData();
        fd.append("title", title);
        fd.append("type", type);
        fd.append("goodId", goodId);
        fd.append("createId", createId);



        Project.ajaxUploadVideoFile('/collage/create/collage', fd, {}, true).ajaxOK(function (data) {
          //  history.go();
          //   top.location = "/page/collage/list";
        }, true);
    }






</script>
</body>
</html>