<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String htmlData = request.getParameter("content2") != null ? request.getParameter
            ("content2") : "";
%>
<%@include file="../public/tag.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
    <%@include file="../base/header.jsp" %>
    <link rel="stylesheet" href="${path}/kindEditor/themes/default/default.css"/>
    <link rel="stylesheet" href="${path}/kindEditor/plugins/code/prettify.css"/>
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
    <script charset="utf-8" src="${path}/kindEditor/plugins/quickformat/quickformat.js"></script>

    <script src="${path}/resources/cKeditor/ckeditor.js"></script>
    <link rel="stylesheet" href="${path}/resources/cKeditor/samples/css/samples.css">
    <link rel="stylesheet" href="${path}/resources/cKeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">

    <link type="text/css" rel="stylesheet" href="${path}/resources/uploadimg/control/css/zyUpload.css"/>

    <!-- UE -->
    <script type="text/javascript" charset="utf-8" src="${path}/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${path}/utf8-jsp/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${path}/utf8-jsp/135editor.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${path}/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
    <style>
        input[type="radio"], input[type="checkbox"] {
            width: 20px;
        }
    </style>

</head>
<body>
<!--对话框  -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" style="width: 800px;" hidden>

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
<div class="page-container" id="classifyList2">
</div>
<div class="row cl">
    <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>活动详情：</label>
    <div class="formControls col-xs-8 col-sm-9">

        活动声明<br> <textarea hidden name="content2" cols="100" rows="8" id="roomDesc"
                           style="width:700px;height:200px;visibility:hidden;display: none"><%=htmlspecialchars(htmlData)%></textarea>
        <div id="content_ck"><%=htmlspecialchars(htmlData)%>
        </div>
        <div id="ue"></div>
        <br/>
    </div>
</div>
<br>

<div class="row cl">
    <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
        <input class="btn btn-primary radius" id="btn" type="button" value="&nbsp;&nbsp;发布活动&nbsp;&nbsp;"
               onclick="release()">
    </div>

</div>
<script type="text/html" id="f5">

    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>活动标题：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="10字以内" name="title" max-lemgth="'10"
                   value="{{data.name}}">
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>活动主图：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <img width="120" height="120" id="zhaopian" src="{{data.imgUrl}}">
            <input type="file" id="imgUrl" onchange="preview(this)"/>
            <input type="hidden" name="previewImg"/>
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>报名选项：</label>
        <div class="formControls col-xs-8 col-sm-9 apply">
            <input type="checkbox" class="input-text" value="0" data-apple="0" name="apply"/>是否团体赛
            <input type="checkbox" class="input-text" value="0" data-apple="1" name="apply"/>是否分赛区
            <input type="checkbox" class="input-text" value="0" data-apple="2" name="apply"/>是否线下比赛
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>活动时间</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="startTime"
                   placeholder="开始时间" value="{{$timestampFormatYMDHM data.startDate}}"/>
            -
            <input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="endTime"
                   placeholder="结束时间" value="{{$timestampFormatYMDHM data.endDate}}"/>
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>活动费用</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" name="money" value="{{data.signPrice}}"/>元
        </div>
    </div>
    <br>


</script>


<%@include file="../base/footer.jsp" %>
<script type="text/javascript">
    var editor, ckEditor;
    var ue = UE.getEditor('ue');
    KindEditor.ready(function (K) {
        editor = K.create('textarea[name="content2"]', {
            cssPath: '${path}/kindEditor/plugins/code/prettify.css',
            uploadJson: '${path}/kindEditor/jsp/upload_json.jsp',
            fileManagerJson: '${path}/kindEditor/jsp/file_manager_json.jsp',
            allowFileManager: true,
            afterCreate: function () {
                var self = this;
                K.ctrl(document, 13, function () {
                    self.sync();
                    document.forms['example'].submit();
                });
                K.ctrl(self.edit.doc, 13, function () {
                    self.sync();
                    document.forms['example'].submit();
                });
            }
        });
        $("textarea[name=content2]").prev().hide();
        var initSample = (function () {
            var wysiwygareaAvailable = isWysiwygareaAvailable(),
                isBBCodeBuiltIn = !!CKEDITOR.plugins.get('bbcode');

            return function () {
                if (wysiwygareaAvailable) {
                    ckEditor = CKEDITOR.replace(document.getElementById("content_ck"));
                }
            };

            function isWysiwygareaAvailable() {
                if (CKEDITOR.revision === ('%RE' + 'V%')) {
                    return true;
                }
                return !!CKEDITOR.plugins.get('wysiwygarea');
            }
        })();
        initSample();
        prettyPrint();
        findActivity();
    });


    function findActivity() {
        var id = "${id}";
        Project.ajax("/activity/query/activitybyid", {id: id}, null, true).ajaxOK(function (data) {
            $("#classifyList2").html(template("f5", data));//作用到表格
            var str = data.data.str;

            for (var i = 0; i < str.length; i++) {
                checkIsSelect(str[i], i);
            }
            
            editor.html(data.data.statement);
            setTimeout(function () {
                $("#cke_content_ck").hide();
                ckEditor.setData(data.data.statement);
                ue.setContent(data.data.statement);
            }, 2000);

            $("input[name=apply]").change(function () {
                $(this).val($(this).is(':checked') ? 1 : 0);
            });

//            $("textarea[name=require]").val(data.data.require);
//            $("textarea[name=process]").val(data.data.process);
//            $("textarea[name=statement]").val(data.data.statement);
//            $("textarea[name=judge]").val(data.data.judge);
//            $("textarea[name=awards]").val(data.data.awards);
//            $("textarea[name=sponsor]").val(data.data.sponsor);
//            $("textarea[name=way]").val(data.data.way);

        });
    }

    function checkIsSelect(a, t) {
        if (parseInt(a) === 3) {
            var el = $("input[data-apple="+t+"]");
            el.attr('checked',true);
            el.val(1);
        }
    }

    function release() {
        var str = "";
        $("input[name=apply]").each(function () {
            str += $(this).val();
        });
        var id = "${id}";

        var title = $("input[name=title]").val();
        var previewImg = $("input[name=previewImg]").val();
        var startdate = $("input[name=startTime]").val();
        var enddate = $("input[name=endTime]").val();
        var way = $("textarea[name=way]").val();
        var money = $("input[name=money]").val();
        var statement = editor.html();
        statement = ckEditor.getData();
        statement = ue.getContent();
        /*var require=$("textarea[name=require]").val();
        var process=$("textarea[name=process]").val();
        var statement=$("textarea[name=statement]").val();
        var judge=$("textarea[name=judge]").val();
        var awards=$("textarea[name=awards]").val();
        var sponsor=$("textarea[name=sponsor]").val();*/

        /*     if(process.length>500){
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
             }*/


        var fd = new FormData();
        fd.append("name", title);
        fd.append("imgUrl", previewImg);
        fd.append("startDate", startdate);
        fd.append("endDate", enddate);
        fd.append("way", way);
        fd.append("signPrice", money);
        fd.append("str", str);
        fd.append("statement", statement);
        /*  fd.append("awards",awards);
          fd.append( "judge",judge);
          fd.append("require",require);
          fd.append("process",process);
          fd.append("statement",statement);
          fd.append("sponsor",sponsor);*/
        fd.append("id", id);


        Project.ajaxUploadVideoFile('/activity/update/activity', fd, {}, true).ajaxOK(function (data) {
            history.go();
            // top.location = "/page/activity/list";
        }, true);
    }

    function preview(file) {
        var fd = new FormData();
        fd.append("files", file.files[0]);
        Project.ajaxUploadVideoFile('/video/upload/tenxun', fd, null, true).ajaxOK(function (data) {
            var src = data['data'];
            $("#zhaopian").attr("src", src);
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
