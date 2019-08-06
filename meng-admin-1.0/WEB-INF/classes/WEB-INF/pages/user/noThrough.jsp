<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>修改密码</title>
    <!-- 引入css -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/lib/Hui-iconfont/1.0.7/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/lib/icheck/icheck.css" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/css/style.css" />

</head>
<body>
<article class="page-container">
    <div class="row cl">
        <div class="page-container" id="classifyList2">

        </div>
        <script type="text/html" id="f5">
            <br>
        <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">昵称：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="请输入昵称" name="nickname" value="{{data.nickname}}">
        </div>
      </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>头像：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <img width="120" height="120" id="headPortrait" src="{{data.headPortrait}}">
                <input type="file" id="imgUrl" onchange="preview(this)"/>
                <input type="hidden" name="headPortrait" value="{{data.headPortrait}}"/>
            </div>
        </div>
        <br>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>账户余额：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="账户余额" name="balance" value = "{{data.balance}}">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>年龄：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="年龄" name="age" value ="{{data.age}}">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>婚姻状况：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select name="MaritalStatus" class="select">
                    <option value="MARRIED">已婚</option>
                    <option value="SINGLE">未婚</option>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>手机号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="手机号" name="phoneNumber"  onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')" value="{{data.phoneNumber}}"/>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>角色：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select name="userType" class="select">
                    <option value="TEACHER">老师</option>
                    <option value="USER">普通用户</option>
                </select>
            </div>
        </div>

    </div><br>
        </script>
    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
            <input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick="noThrough()">
        </div>
    </div>
</article>
<!-- 引入js -->
<script src="${path}/resources/js/jquery.js"></script>
<script src="${path}/resources/js/template.js"></script>
<script src="${path}/resources/js/common.js"></script>
<script src="${path}/resources/js/promise.min.js"></script>
<script src="${path}/resources/js/project.js"></script>
<script src="${path}/resources/js/jquery.common.js"></script>
<!-- 引入工具js -->
<script src="${path}/resources/js/jk_tools.js"></script>
<script type="text/javascript">
    findUser()
    function findUser() {
        var id="${id}";
        Project.ajax("/user/find/user/info",{id:id}).ajaxOK(function(data) {
            $("#classifyList2").html(template("f5",data));//作用到表格
            findClassify(data.data.classifyId);
        });
    }

    function noThrough(){
        var id='${id}';
        var nickname = $("input[name=nickname]").val();
        var headPortrait = $("input[name=headPortrait]").val();
        var userType = $("input[name=userType]").val();
        var MaritalStatus = $("input[name=MaritalStatus]").val();
        var balance = $("input[name=balance]").val();
        var phoneNumber = $("input[name=phoneNumber]").val();
        var userType = $("input[name=userType]").val();
        if(cm.stringIsEmpty(id)){
            alert("参数缺失，请重新进入该页面");
            return false;
        }
        if(isNaN(balance)||balance<= 0){
             alert("账户余额不能为异常数字")
            return false;
        }
        if(balance.toString().length>9){
             alert("账户余额有点多");
             return false ;
        }

        Project.ajax("/user/update/user",{id:id,nickname:nickname,headPortrait:headPortrait,MaritalStatus:MaritalStatus,balance:balance,phoneNumber:phoneNumber,userType:userType}).ajaxOK(function(data) {
        },true);
    }

    function preview(file) {
        var fd = new FormData();
        fd.append("files",file.files[0]);
        Project.ajaxUploadFiles(fd).ajaxOK(function(data) {
            $("#headPortrait").attr("src",data.data[0]);
            $("input[name=headPortrait]").val(data.data[0]);
        });
    }
</script>
</body>
</html>