<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
    <!-- 引入css -->
    <%@include file="../base/header.jsp"%>
</head>
<body>
<div class="page-container">
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>评论对象：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <select name="type" class="select" >
                <option value="">全部</option>
                <option value="VIDEO">视频评论</option>
                <option value="COURSE">课程评论</option>
                <option value="PIAZZA">广场评论</option>
            </select>
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>评论内容</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" name="comment"/>
        </div>
    </div>
    <br>

  <%--  <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>报名选项：</label>
        <div class="formControls col-xs-8 col-sm-9 apply">
            <input type="checkbox" class="input-text" value="0" name="apply"/>参赛者姓名
            <input type="checkbox" class="input-text" value="0" name="apply"/>参赛者性别
            <input type="checkbox" class="input-text" value="0" name="apply"/>参赛者出生年月<br>
            <input type="checkbox" class="input-text" value="0" name="apply"/>参赛者联系方式
            <input type="checkbox" class="input-text" value="0" name="apply"/>参赛者身份证号
            <input type="checkbox" class="input-text" value="0" name="apply"/>参赛者所在地
        </div>
    </div>
    <br>--%>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>报名选项：</label>
        <div class="formControls col-xs-8 col-sm-9 apply">
            <input type="checkbox" class="input-text" value="0" name="apply"/>是否团体赛
            <input type="checkbox" class="input-text" value="0" name="apply"/>是否分赛区
            <input type="checkbox" class="input-text" value="0" name="apply"/>是否线下比赛
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>活动时间</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" name="startTime" placeholder="开始时间" />
            -
            <input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" name="endTime" placeholder="结束时间" />
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>活动费用</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" name="money"/>元
        </div>
    </div>
    <br>


    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>活动详情：</label>
        <div class="formControls col-xs-8 col-sm-9">

            参赛方式<br>
            <textarea  id="way" cols="180" rows="10" placeholder="多行输入" name="way"></textarea><br>
            主办单位<br>
            <textarea name="sponsor" id="sponsor" cols="180" rows="10" placeholder="多行输入"></textarea><br>
            评判方式<br>
            <textarea name="judge" id="judge" cols="180" rows="10" placeholder="多行输入"></textarea><br>
            奖项设置<br>
            <textarea name="awards" id="awards" cols="180" rows="10" placeholder="多行输入"></textarea><br>
            活动声明<br>
            <textarea name="statement" id="statement" cols="180" rows="10" placeholder="多行输入"></textarea><br>
            活动流程<br>
            <textarea name="process" id="process" cols="180" rows="10" placeholder="多行输入"></textarea><br>
            参赛要求<br>
            <textarea name="require" id="require" cols="180" rows="10" placeholder="多行输入"></textarea>
        </div>
    </div>
    <br>

    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
            <input class="btn btn-primary radius" id="btn" type="button" value="&nbsp;&nbsp;发布活动&nbsp;&nbsp;" onclick="release()">
        </div>
    </div>
</div>

<%@include file="../base/footer.jsp"%>

<script type="text/javascript">


    function release() {
        var str="";
        $(".apply input").each(function(){
            if($(this).is(':checked')){
               $(this).val(1);
            }
            str += $(this).val();
        })

        var title=$("input[name=title]").val();
        var previewImg=$("input[name=previewImg]").val();
        var startdate=$("input[name=startTime]").val();
        var enddate=$("input[name=endTime]").val();
        var way=$("textarea[name=way]").val();
        var money=$("input[name=money]").val();
        var require=$("textarea[name=require]").val();
        var process=$("textarea[name=process]").val();

        var statement=$("textarea[name=statement]").val();
        var judge=$("textarea[name=judge]").val();
        var awards=$("textarea[name=awards]").val();
        var sponsor=$("textarea[name=sponsor]").val();

        if(process.length>500){
            alert("活动流程内容长度太长，请缩短");
            return ;
        }
        if(require.length>200){
            alert("活动要求内容长度太长，请缩短");
            return ;
        }
        if(sponsor.length>200){
            alert("活动主办单位内容长度太长，请缩短");
            return ;
        }
        if(statement.length>2000){
            alert("活动声明内容长度太长，请缩短");
            return ;
        }

        $.ajax({
            type : "post",
            url : "https://api.ibailemeng.com/api/json/activity/create/activity",
           // url:"http://localhost:8090/meng-api-1.0/api/json/activity/create/activity",
            cache: true,
            dataType:"json",
            contentType: 'application/json;charset=utf-8',
            data:JSON.stringify({"name":title,"imgUrl":previewImg,"startDate":startdate,"endDate":enddate,"way":way,"signPrice":money,"str":str,"awards":awards,"judge":judge,"require":require,"process":process,"statement":statement,"sponsor":sponsor}),
            success : function(data) {
                if(data.code=="SUCCESS"){
                    alert("成功");
                }else{
                    alert("失败");
                }
            }
        });

        //获得该button对象
//        var btn = document.getElementById('btn');
//        btn.value = '上传中..';//将按钮value值改为同意
//        btn.disabled = true;//将按钮disabled值改为false


//        var fd = new FormData();
//        fd.append("previewImg",previewImg);
//        fd.append("name",title);
//        fd.append("startDate",startdate);
//        fd.append("endDate",enddate);
//        fd.append("process",process);
//        fd.append("signPrice",money);
//        Project.ajaxUploadVideoFile('/activity/create/activity ',fd,{},true).ajaxOK(function(data) {
//            btn.value = '提交';//将按钮value值改为同意
//            btn.disabled = false;//将按钮disabled值改为false
//        },true);
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