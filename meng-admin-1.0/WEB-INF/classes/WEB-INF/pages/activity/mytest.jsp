<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String htmlData = request.getParameter("content1") != null ? request.getParameter
            ("content1") : "";
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8" />
    <title>KindEditor JSP</title>
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
    <script>
        KindEditor.ready(function(K) {
            var editor = K.create('textarea[name="content1"]', {
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
            var editor1 = K.create('textarea[name="content2"]', {
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
                        alert(editor1.html());
                    });

                }
            });
            prettyPrint();
        });
        function getInnerText() {
           var a =$('textarea[name="content1"]').val();
             alert(a);
        }
    </script>
</head>
<body>
<%=htmlData%>
<form name="example" method="post" action="demo.jsp">
    <textarea name="content1" cols="100" rows="8" id ="ids"
              style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars
            (htmlData)%></textarea>
    <br />
    <textarea name="content2" cols="100" rows="8" id ="ids"
              style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars
            (htmlData)%></textarea>
    <br />

    <input type="button" name="button" value="提交内容"  onclick="getInnerText()"/>
    <input type="button" name="selectedHtml" value="取得选中HTML" />
</form>
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