<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp"%>
<%
    request.setCharacterEncoding("UTF-8");
    String htmlData = request.getParameter("content1") != null ? request.getParameter
            ("content1") : "";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
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
    <!-- 编辑器-->
    <link rel="stylesheet" href="${path}/kindEditor/themes/default/default.css" />
    <link rel="stylesheet" href="${path}/kindEditor/plugins/code/prettify.css" />
    <script charset="utf-8" src="${path}/kindEditor/js/kindEditor.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/lang/zh_CN.js"></script>
    <script type="text/javascript" src="${path}/resources/lib/jquery/1.9.1/jquery.min.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/code/prettify.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/baidumap/baidumap.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/anchor/anchor.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/autoheight/autoheight.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/clearhtml/clearhtml.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/emoticons/emoticons.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/filemanager/filemanager.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/image/image.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/table/table.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/flash/flash.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/media/media.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/template/template.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/link/link.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/multiimage/multiimage.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/pagebreak/pagebreak.js"></script>
    <script charset="utf-8" src="${path}/kindEditor/plugins/quickformat/quickformat.js" ></script>


    <link type="text/css" rel="stylesheet" href="${path}/resources/uploadimg/control/css/zyUpload.css" />

    <style>
        input[type="radio"], input[type="checkbox"]{width:20px;}
    </style>



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

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 活动管理 <span class="c-gray en">&gt;</span> 活动列表<span class="c-gray en">&gt;</span>活动发布 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>活动标题：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="10字以内" name="name" max-lemgth="'10">
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>活动主图：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <img width="120" height="120" id="zhaopian" src="">
            <input type="file" id="imgUrl" name="filename" onchange="preview(this)"/>
            <input type="hidden" name="previewImg"/>
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
            <input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="startTime" placeholder="开始时间" />
            -
            <input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="endTime" placeholder="结束时间" />
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程费用：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="费用" name="price" max-lemgth="10">
        </div>

    </div>
    <br>


    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>活动详情：</label>
        <div class="formControls col-xs-8 col-sm-9">

          <%--  参赛方式<br>
            <textarea  id="way" cols="180" rows="10" placeholder="多行输入" name="way"></textarea><br>
            主办单位<br>
            <textarea name="sponsor" id="sponsor" cols="180" rows="10" placeholder="多行输入"></textarea><br>
            评判方式<br>
            <textarea name="judge" id="judge" cols="180" rows="10" placeholder="多行输入"></textarea><br>
            奖项设置<br>
            <textarea name="awards" id="awards" cols="180" rows="10" placeholder="多行输入"></textarea><br>
            活动声明<br>--%>
            <form name="statement">
                <textarea name="content1" cols="100" rows="8" id ="ids"
              style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
                <br />
            </form>
        <%--    活动流程<br>
            <textarea name="process" id="process" cols="180" rows="10" placeholder="多行输入"></textarea><br>
            参赛要求<br>
            <textarea name="require" id="require" cols="180" rows="10" placeholder="多行输入"></textarea>--%>
        </div>
    </div>
    <br>

    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
            <input class="btn btn-primary radius" id="btn" type="button" value="&nbsp;&nbsp;发布活动&nbsp;&nbsp;" onclick="release()">
        </div>
    </div>
</div>



<!-- 基本js -->
<script type="text/javascript" src="${path}/resources/lib/jquery/1.9.1/jquery.min.js"></script>

<script type="text/javascript" src="${path}/resources/area/js/jquery.ganged.js"></script>
<script type="text/javascript" src="${path}/resources/area/js/jquery.inputbox.js"></script>


<script type="text/javascript" src="${path}/resources/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="${path}/resources/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${path}/resources/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${path}/resources/datePicker/WdatePicker.js"></script>



<!-- 核心js -->
<script src="${path}/resources/js/jquery.js"></script>
<script src="${path}/resources/js/template.js"></script>
<script src="${path}/resources/js/common.js"></script>
<script src="${path}/resources/js/promise.min.js"></script>
<script src="${path}/resources/js/project.js"></script>
<script src="${path}/resources/js/jquery.common.js"></script>
<script src="${path}/resources/js/jk_tools.js"></script>
<script src="${path}/resources/js/cos-js-sdk-v5.js" type="text/javascript" charset="utf-8"></script>

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
//    findClassify();
//    function findClassify() {
//        Project.ajax("/global/classify/list",null).ajaxOK(function(data) {
//            $("#classifyList").html(template("f4",data));//作用到表格
//        });
//    }

/*findUser();
function findUser(pageNum) {
    var fromList=$("#From").formSerialize();
    var p=$.extend({pageNum: pageNum},{status: status},fromList);

    Project.ajax("/activity/query/activity/list",p).ajaxOK(function(data) {
        $("#goodList").html(template("f1",data));//作用到表格
        //$("#page").html(template("f2",data));//作用到分页
        //$("#total").html(data.data.total);//作用到统计total
        //$("#size").html(data.data.size);//作用到统计每页显示size
        //  biggerr();//初始页
        // 面调用图片悬浮放大方法
    });
}*/
var editor;
KindEditor.ready(function(K) {
        editor = K.create('textarea[name="content1"]', {
        cssPath : '${path}/kindEditor/plugins/code/prettify.css',
        uploadJson : '${path}/kindEditor/jsp/upload_json.jsp',
        fileManagerJson : '${path}/kindEditor/jsp/file_manager_json.jsp',
        allowFileManager : true,
        afterCreate : function() {
            var self = this;
            K.ctrl(document, 13, function() {
                self.sync();
                document.forms['example'].submit();
            });
            K.ctrl(self.edit.doc, 13, function() {
                self.sync();
                document.forms['example'].submit();
            });
            K('input[name=selectedHtml]').click(function(e) {
                alert(editor.html());
            });

        }
    });
    prettyPrint();
});
    function release() {
        var str = "";
        $(".apply input").each(function () {
            if ($(this).is(':checked')) {
                $(this).val(1);
            }
            str += $(this).val();
        })

        var name = $("input[name=name]").val();
        var previewImg = $("input[name=previewImg]").val();
        var startDate = $("input[name=startTime]").val();
        var endDate = $("input[name=endTime]").val();
        var statement = editor.html();
  /*    var way = $("textarea[name=way]").val();
        var money = $("input[name=money]").val();
        var require = $("textarea[name=require]").val();
        var process = $("textarea[name=process]").val();


       var judge = $("textarea[name=judge]").val();
       var awards = $("textarea[name=awards]").val();
       var sponsor = $("textarea[name=sponsor]").val();

        if (process.length > 500) {
            alert("活动流程内容长度太长，请缩短");
            return;
        }
        if (require.length > 200) {
            alert("活动要求内容长度太长，请缩短");
            return;
        }*/



        var fd = new FormData();
        fd.append("name", name);
        fd.append("imgUrl", previewImg);
        fd.append("str",str);

        fd.append("startDate", startDate);
        fd.append("endDate", endDate);
//        fd.append("way", way);
//        fd.append("money", money);
//        fd.append("require", require);
//        fd.append("process", process);
        fd.append("statement", statement);
    /*    fd.append("judge", judge);
        fd.append("awards", awards);
        fd.append("sponsor", sponsor);*/



        Project.ajaxUploadVideoFile('/activity/create/activity', fd, {}, true).ajaxOK(function(data) {
            //  history.go();
            //   top.location = "/page/collage/list";
        }, true);

        /*$.ajax({
            type: "post",
            url : "https://api.ibailemeng.com/api/json/activity/create/activity",
           // url: "http://192.168.0.108:8090/meng-api-1.0/api/json/activity/create/activity",
            cache: true,
            dataType: "json",
            contentType: 'application/json;charset=utf-8',
            data: JSON.stringify({
                "name": title,
                "imgUrl": previewImg,
                "way": way,
                "signPrice": money,
                "str": str,
                "awards": awards,
                "judge": judge,
                "require": require,
                "process": process,
                "statement": statement,
                "sponsor": sponsor
            }),
            success: function (data) {
                if (data.code == "SUCCESS") {
                    alert("成功");
                } else {
                    alert("失败");
                }
            }
        });*/


    }

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


    function preview(file) {
        var fd = new FormData();
        fd.append("files",file.files[0]);
        Project.ajaxUploadVideoFile('/video/upload/tenxun', fd).ajaxOK(function (data) {
            var src = data['data'];
            $("#zhaopian").attr("src",src);
           $("input[name=previewImg]").val(src);
        }, true);

    }




</script>
</body>
</html>
<%!
    private String htmlspecialchars(String str) {
        str = str.replaceAll("&", "&amp;");
        str = str.replaceAll("<", "&lt;");
        str = str.replaceAll(">", "&gt;");
        str = str.replaceAll("\"", "&quot;");
        return str;
    }
%>