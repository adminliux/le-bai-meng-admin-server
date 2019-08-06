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


<div class="page-container">
    <br>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>推送类型：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <select style="width: 100%;height: 3.5%" name="aim" >
                <option value="ACTIVITY">活动</option>
                <option value="COURSE">课程</option>
            </select>
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">推送对象id：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="推送对象id" name="id">
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">推送对象：</label>
        <div class="formControls col-xs-8 col-sm-9">
             <select style="width: 100%;height: 3.5%" name= "user" class="select" onchange="chgUsr()">
                <option value="0">全部</option>
                <option value="1">部分人员</option>
            </select>
        </div>
    </div>
    <br>

    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
            <input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick="release()">
        </div>
    </div>

</div>

<%@include file="../base/footer.jsp"%>
<script>
 function release() {
         var aim= $("select[name=aim]").val();
         var id = $("input[name=id]").val();
         var  aimUrl ="";
         if(id!=""||id != null){
             aimUrl = aim +":"+id;
         }

         if(id ==""||id== null){
             alert("活动ID或者课程ID不存在");
             return ;
         }
         window.location.href='${path}/page/push/log/add?aimUrl='+aimUrl +'&aim=0';
 }
 function chgUsr() {
     var id = $("input[name=id]").val();
     var user= $("select[name=user]").val();
     var aim= $("select[name=aim]").val();
     var  aimUrl ="";
     if(id ==""||id== null){
         alert("活动ID或者课程ID不存在");
         return ;
     }
     if(id!=""||id != null){

         aimUrl = aim +":"+id;
     }
     if(user==1){
         window.location.href='${path}/page/push/log/choose?aimUrl='+aimUrl;
     }
 }


</script>


