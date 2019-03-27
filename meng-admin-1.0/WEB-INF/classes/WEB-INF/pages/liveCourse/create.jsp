<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/10
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- 引入tag.jsp -->
<%
    request.setCharacterEncoding("UTF-8");
    String htmlData = request.getParameter("content1") != null ? request.getParameter
            ("content1") : "";
%>
<%@include file="../public/tag.jsp"%>
<html>
<head>
    <title>创建课程</title>
    <%@include file="../base/header.jsp"%>
    <style>
        .couse{
            margin-top: 30px;
            margin-left: 20px;
        }
        .btn-price{
            width: 60px;
            height:30px;
            text-align: center;
            float: left;
            border:1px solid #96c2f1;
            margin-left: 2px;
            line-height: 30px;
            cursor:pointer;
            border-radius:10px;
        }
        .a{
            margin-left: 10px;
        }
        .btn-cou{
            background-color: green;
            width: 80px;
            height: 30px;
        }
        #tip{
            margin-left: 40px;
            margin-top: 10px;
        }
        .editor{
            margin-left: 300px ;
        }
    </style>
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
</head>
<body>
<div class="page-container">
    <br>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程名称：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="名称" name="title">
        </div>
    </div>
    <br>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>所属大学：</label>
        <input type="hidden" name="unId">
        <select class="formControls col-xs-8 col-sm-9" style="height: 30px" id="unList" onchange="choose(this.value,1)">
        </select>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>导师id：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="导师id" name="userId">
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程分类：</label>
        <input type="hidden" name="classifyId">
        <select class="formControls col-xs-8 col-sm-9" style="height: 30px" id="courseType" onchange="choose(this.value,2)">
        </select>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程费用：</label>
        <div class="btn-price" onclick="getPrice(0)" id="courseFree">
            免费
        </div>
        <div class="btn-price" onclick="getPrice(1)" id="courseBuy">
            付费
        </div>
        <div id="byp">
          <input type="text" name ="price" class= "a"  placeholder="请设置个人报名费用" >
          <input type="text" name ="spellPrice"   placeholder="请设置拼团报名费用" >
        </div>

    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>报名时间：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="startTime" placeholder="开始时间" />
            -
            <input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="endTime" placeholder="结束时间" />
        </div>
    </div>
    <br>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>设置课表：</label>
        <div >
            <button  class="btn-cou" onclick="addTips()">添加小节</button>
        </div>
        <br>
        <div id="tip">
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程封面：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <img width="120" height="120" id="zhaopian" src="">
            <input type="file" id="imgUrl" name="filename" onchange="preview(this)" />
            <input type="hidden" name="previewImg"/>
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程详情：</label>
        <div class="editor">
            <form name="statement">
                    <textarea name="content1" cols="100" rows="8" id ="ids"
                              style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
                <br />
            </form>
        </div>
    </div>
    <br>

    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
            <input class="btn btn-primary radius"  style="width: 100px" id="btn" type="button" value="&nbsp;&nbsp;完成&nbsp;&nbsp;" onclick="release()">
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



<!-- 核心js -->
<script src="${path}/resources/js/jquery.js"></script>
<script src="${path}/resources/js/template.js"></script>
<script src="${path}/resources/js/common.js"></script>
<script src="${path}/resources/js/promise.min.js"></script>
<script src="${path}/resources/js/project.js"></script>
<script src="${path}/resources/js/jquery.common.js"></script>
<script src="${path}/resources/js/jk_tools.js"></script>

<script type="text/javascript" src="${path}/kindEditor/js/kindEditor.js"></script>
<script type="text/javascript" src="${path}/kindEditor/lang/zh_CN.js"></script>
<script type="text/javascript"
        src="${path}/kindEditor/plugins/code/prettify.js"></script>


<!-- 上传图片 -->
<script type="text/javascript" src="${path}/resources/uploadimg/control/js/zyUpload.js"></script>
<script type="text/javascript" src="${path}/resources/uploadimg/core/zyFile.js"></script>
<script type="text/javascript" src="${path}/resources/uploadimg/demo.js"></script>
<script type="text/javascript" src="${path}/resources/uploadimg/control/js/bootstrap.min.js"></script>
</body>

<script type="text/javascript">
    var  times  = 1
    init();
    function init() {
        getPrice(0)
        queryUnversity();
        queryClassify();
    }
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

    function queryUnversity() {
        Project.ajax("/unversity/query/all",null,null,true).ajaxOK(function (data) {
            var list = data.data;
            document.getElementById('unList').add(new Option("", ""))
            for(var  i = 0;i<list.length; i++){
                  var text = list[i].unName;
                  var  value = list[i].id;
                  document.getElementById('unList').add(new Option(text, value));
            }
        });
    }

    function queryClassify() {
        Project.ajax("/global/classify/list",null,null,true).ajaxOK(function(data) {
            var list = data.data;
            document.getElementById('courseType').add(new Option("", ""))
            for(var  i = 0;i<list.length; i++){
                var text = list[i].name;
                var  value = list[i].id;
                document.getElementById('courseType').add(new Option(text, value));
            }
        });
    }

    function choose(obj,type) {
        if( type == 1)
            $("input[name=unId]").val(obj)
        if(type == 2)
            $("input[name=classifyId]").val(obj)
        var a =  obj;
    }

    function getPrice(type) {
        if(0 == type) {
            $("#courseFree").css("background-color","green");
            $("#courseBuy").css({ "backgroundColor": "white" });
            $("input[name=price]").val("");
            $("input[name=spellPrice]").val("");
            $("#byp").hide();
        }
        if(1 == type) {
            $("#courseBuy").css({ "background-color": "green" });
            $("#courseFree").css({ "backgroundColor": "white" });
            $("#byp").show();
        }　
    }
    function  addTips() {
        $("#tip").prepend("<div id='tip'"+times+"><div style='float: left' class=\"form-label col-xs-4 col-sm-2\">第"+times+"小节</div>" +
            "<input type=\"text\" name =\"tipTitle\"   placeholder=\"请输入小标题名称\" >\n" +
            " <input type=\"text\" class=\"Wdate\" onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})\" name=\"tipStartTime\" placeholder=\"开始时间\" /> " +
            " <input type=\"text\" class=\"Wdate\" onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})\" name=\"tipEndTime\" placeholder=\"结束时间\" /> " +
                "<a style='font-color:green'  name=\"rmlink\" href=\"#\">删除</a>" +
            " </div>");

        // 为新元素节点添加事件侦听器
        bindListener();
        times ++
    }
    function delTip() {
        $("#tip").remove()
    }

    // 用来绑定事件(使用unbind避免重复绑定)
    function bindListener(){
        $("a[name=rmlink]").unbind().click(function(){
            $(this).parent().remove();
            times--
        })
    }
    function release() {
     /*   var  tipTitle  =  document.getElementsByName("tipTitle");
        var  tipStartTime =  document.getElementsByName("tipStartTime");
        var tipEndTime = document.getElementsByName("tipStartTime");*/
        var tipTitle=$('[name=tipTitle]');
        var tipStartTime=$('[name=tipStartTime]');
        var tipEndTime=$('[name=tipEndTime]');

        var arr = saveDetial(tipTitle,tipStartTime,tipEndTime)

       var price =  $("input[name=price]").val();
       var  spellPrice =  $("input[name=spellPrice]").val();
       var  title =  $("input[name=title]").val();
       var  unId = $("input[name=unId]").val();
       var userId =  $("input[name=userId]").val();
       var previewImg = $("input[name=previewImg]").val();
       var beginTime =  $("input[name=startTime]").val();
       var overTime =  $("input[name=endTime]").val();

       var roomDesc = editor.html();
       var  classifyId =  $("input[name=classifyId]").val();

        if(chkIsNull(title)){
            alert("标题不能为空");
            return
        }
        if(chkIsNull(title)){
            alert("标题不能为空");
            return
        }
        if(chkIsNull(userId)){
            alert("导师不能为空");
            return
        }

       if(chkIsNull(beginTime)){
            alert("开始时间不能为空");
            return
       }

        if(chkIsNull(previewImg)){
            alert("首图不能为空");
            return
        }
        if(chkIsNull(unId)){
            alert("大学不能为空");
            return
        }
        if(chkIsNull(classifyId)){
            alert("类别不能为空");
            return
        }

        if(chkIsNull(tipTitle)||chkIsNull(tipStartTime)){
            alert("不能没有小节内容")
            return
        }
        var b = previewImg.substr(previewImg.lastIndexOf(".") + 1);
        if(b.toLowerCase() != "jpg"&&b.toLowerCase() != "png") {
            alert("首图格式只能是png或者jpg");
            return
        }

        if(!chkIsNull(spellPrice)&& !validateIsNum(spellPrice)) {
            alert("拼团价非法");
            $("input[name=spellPrice]").val("")
            return
        }

        if(!chkIsNull(price)&& !validateIsNum(price)) {
            alert("课程价非法");
            $("input[name=price]").val("")
            return
        }

        var courseDital = JSON.stringify(arr);
        var fd  = {"roomTitle":title,"previewImg":previewImg,"classifyId":classifyId,
            "userId":userId,"price":price,"roomDesc":roomDesc,"beginTime":beginTime,"overTime":overTime,
                "roomTitle":title,"price":price,"spellPrice":spellPrice,"unId":unId ,"courseDetial":courseDital  }
        Project.ajax("/live/create/course",fd,null,true).ajaxOK(function (data) {
            alert("创建成功");
        });


    }

    function  saveDetial(tipTitle,tipStartTime,tipEndTime) {
        var arr =  new Array();
        var obj ;
        for(var i = 0 ; i < times; i++){
            if(tipTitle[i] != null&& tipTitle[i].value != 'undefined' &&  tipStartTime[i].value != 'undefined' ){
                obj = new Object();
                obj.title =   tipTitle[i].value;
                obj.startStr =  tipStartTime[i].value;
              if(tipEndTime[i].value != 'undefined'){
                  obj.endStr =  tipEndTime[i].value;
              }
                arr[i] = obj;
            }
        }
        return arr;
    }


    function preview(file) {
        var fd = new FormData();
        fd.append("files",file.files[0]);
        Project.ajaxUploadVideoFile('/video/upload/tenxun', fd, null, true).ajaxOK(function (data) {
            var src = data['data'];
            $("#zhaopian").attr("src",src);
            $("input[name=previewImg]").val(src);
        }, true);

    }
    function chkIsNull(obj) {
        return obj == null || "" == obj;
    }

    function  validateIsNum(obj){
        var re = /^[0-9]+.?[0-9]*$/;
        return re.test(obj)
    }





    
    
    
    
</script>
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
