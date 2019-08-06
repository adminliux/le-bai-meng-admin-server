<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>广告发布</title>
    <!-- 引入css -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/lib/Hui-iconfont/1.0.7/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/lib/icheck/icheck.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/area/jquery.inputbox.css"/>
    <link type="text/css" href="${path}/kindEditor/themes/default/default.css"/>
    <link type="text/css" href="${path}/kindEditor/plugins/code/prettify.css"/>
    <link type="text/css" rel="stylesheet" href="${path}/kindEditor/themes/default/default.css "/>
    <link type="text/css" rel="stylesheet" href="${path}/resources/uploadimg/control/css/zyUpload.css"/>
    <style>
        #resultBox {
            width: 100%;
            height: 50px;
            border: 1px solid #888;
            padding: 5px;
            overflow: auto;
            margin-bottom: 20px;
        }

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

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 背景图管理 <span
        class="c-gray en">&gt;</span> 添加背景图 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                               href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>标题：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="名称" name="title">
        </div>
    </div>
    <br>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>用户手机号：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="用户手机号" name="phone"
                   onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
                   onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')">
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>类别：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <select name="classifyId" class="select" id="classifyList">

            </select>
            <script type="text/html" id="f4">
                {{each data as good}}
                <option value="{{good.id}}">{{good.name}}</option>
                {{/each}}
            </script>
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>预览图：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <img width="120" height="120" id="zhaopian" src="">
            <input type="file" id="imgUrl"/>
            <input type="hidden" name="previewImg"/>
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>视频：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="file" id="video"/>
            <input type="hidden" name="videoTxid"/>
            <input type="hidden" name="address"/>
        </div>
    </div>
    <br>


    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>播放量：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="播放量" name="praiseSum"
                   onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
                   onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')">
        </div>
    </div>
    <br>

    <div class="row" id="resultBox"></div>
    <br>
    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
            <input class="btn btn-primary radius" id="btn" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;"
                   onclick="release()">
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

<script type="text/javascript" src="${path}/kindEditor/js/kindEditor.js"></script>
<script type="text/javascript" src="${path}/kindEditor/lang/zh_CN.js"></script>
<script type="text/javascript"
        src="${path}/kindEditor/plugins/code/prettify.js"></script>


<!-- 上传图片 -->
<script type="text/javascript" src="${path}/resources/uploadimg/control/js/zyUpload.js"></script>
<script type="text/javascript" src="${path}/resources/uploadimg/core/zyFile.js"></script>
<script type="text/javascript" src="${path}/resources/uploadimg/demo.js"></script>
<script type="text/javascript" src="${path}/resources/uploadimg/control/js/bootstrap.min.js"></script>
<!-- 上传视频 -->
<script src="${path}/resources/js/tenxunyun/ugcUploader.js"></script>

<script type="text/javascript">
    var mysign = "";
    var index = 0;
    var cosBox = [];
    findClassify();

    function findClassify() {
        Project.ajax("/global/classify/list").ajaxOK(function (data) {
            $("#classifyList").html(template("f4", data));//作用到表格
            getMysign();
        });
    }

    function getMysign(callback) {
        Project.ajax("/video/get/sign", null).ajaxOK(function (data) {
            mysign = data.data;
            if (callback) callback(mysign);
        })
    }

    var getSignature = getMysign;
    var scale = 0.3;

    function videoCaptureImage(videoElement) {
        var canvas = document.createElement("canvas");
        canvas.width = videoElement.videoWidth * scale;
        canvas.height = videoElement.videoHeight * scale;
        canvas.getContext('2d').drawImage(videoElement, 0, 0, canvas.width, canvas.height);

        return dataURLtoFile(canvas.toDataURL("image/png"));
    }

    function dataURLtoFile(dataurl, filename) {//将base64转换为文件
        filename = filename || "file.png";
        var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
            bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
        while (n--) {
            u8arr[n] = bstr.charCodeAt(n);
        }
        return new File([u8arr], filename, {type: mime});
    }

    $('#video').on('change', function (e) {
        var videoFile = this.files[0]
        var num = addUploaderMsgBox('hasVideo');
        var videoFile = this.files[0];
        $('#result').append(videoFile.name + '\n');
        var imgUrlFile = $("#imgUrl")[0].files[0];


        var fi = $("#imgUrl").val()
        /*if(imgUrlFile == null){
            alert("请选择预览图")
            return
        }*/
        var resultMsg = qcVideo.ugcUploader.start({
            videoFile: videoFile,
            coverFile: imgUrlFile,
            getSignature: getSignature,
            allowAudio: 1,
            isTranscode: 1,
            success: function (result) {
                if (result.type == 'video') {
                    $('[name=videoresult' + num + ']').text('上传成功');
                    $('[name=cancel' + num + ']').remove();
                    cosBox[num] = null;

                } else if (result.type == 'cover') {
                    $('[name=coverresult' + num + ']').text('上传成功');
                }
            },
            error: function (result) {
                alert("上传失败");
            },
            progress: function (result) {
                if (result.type == 'video') {
                    $('[name=videoname' + num + ']').text(result.name);
                    $('[name=videosha' + num + ']').text(Math.floor(result.shacurr * 100) + '%');
                    $('[name=videocurr' + num + ']').text(Math.floor(result.curr * 100) + '%');
                    $('[name=cancel' + num + ']').attr('taskId', result.taskId);
                    cosBox[num] = result.cos;
                } else if (result.type == 'cover') {
                    $('[name=covername' + num + ']').text(result.name);
                    $('[name=coversha' + num + ']').text(Math.floor(result.shacurr * 100) + '%');
                    $('[name=covercurr' + num + ']').text(Math.floor(result.curr * 100) + '%');
                }
            },
            finish: function (result) {
                $('[name=videofileId' + num + ']').text(result.fileId);
                $('[name=videourl' + num + ']').text(result.videoUrl);
                console.log(result)
                $("input[name=videoTxid]").val(result.fileId)
                $("input[name=address]").val(result.videoUrl)
                $("#zhaopian").attr("src", result.coverUrl);
                $("input[name=previewImg]").val(result.coverUrl);

                if (confirm("是否使用视频首图?")) {
                    /*var binaryData = [];
                    binaryData.push(imgUrlFile);
                    var url = window.URL.createObjectURL(new Blob(binaryData, {type: "application/mp4"}));*/
                    $(document.body).append("<video hidden id='_v' src='" + result.videoUrl + "' crossOrigin='anonymous'></video>");
                    var $_v = $("#_v")[0];
                    $_v.addEventListener("canplay", function (ev) {
                        setTimeout(function () {
                            preview(videoCaptureImage($_v));
                        }, 3000);
                    });
                    return;
                }

                if (result.message) {
                    $('[name=videofileId' + num + ']').text(result.message);
                }
            }
        });

    });

    $('#resultBox').on('click', '[act=cancel-upload]', function () {
        var cancelresult = qcVideo.ugcUploader.cancel({
            cos: cosBox[$(this).attr('cosnum')],
            taskId: $(this).attr('taskId')
        });
        console.log(cancelresult);
    });


    var addUploaderMsgBox = function (type) {
        var html = '<div class="uploaderMsgBox" name="box' + index + '">';
        if (!type || type == 'hasVideo') {
            html += '视频名称：<span name="videoname' + index + '"></span>；' +
                '计算sha进度：<span name="videosha' + index + '">0%</span>；' +
                '上传进度：<span name="videocurr' + index + '">0%</span>；' +
                'fileId：<span name="videofileId' + index + '">   </span>；' +
                '上传结果：<span name="videoresult' + index + '">   </span>；<br>' +
                '地址：<span name="videourl' + index + '">   </span>；' +
                '<a href="javascript:void(0);" name="cancel' + index + '" cosnum=' + index + ' act="cancel-upload">取消上传</a><br>';
        }

        if (!type || type == 'hasCover') {
            html += '封面名称：<span name="covername' + index + '"></span>；' +
                '计算sha进度：<span name="coversha' + index + '">0%</span>；' +
                '上传进度：<span name="covercurr' + index + '">0%</span>；' +
                '上传结果：<span name="coverresult' + index + '">   </span>；<br>' +
                '地址：<span name="coverurl' + index + '">   </span>；<br>' +
                '</div>'
        }
        html += '</div>';

        $('#resultBox').append(html);
        return index++;
    };


    function upload() {
        var file = $("#video")[0].files[0];
        var resultMsg = qcVideo.ugcUploader.start({
            videoFile: file,
            getSignature: mysign,
            allowAudio: 1,
            isTranscode: 1,
            success: function (result) {
                alert("上传成功");
            },
            error: function (result) {

                alert("上传失败" + result.msg);
                console.log(result)

            },
            progress: function (result) {
                alert("上传进度：" + result.curr);
            },
            finish: function (result) {
                alert("上传完成");
            }
        })
    }

    function release() {
        //获得该button对象
        var btn = document.getElementById('btn');
        //  btn.value = '上传中..';//将按钮value值改为同意
        //  btn.disabled = true;//将按钮disabled值改为false
        //var file = $("#video")[0].files[0];
        var classifyId = $("select[name=classifyId]").val();
        var title = $("input[name=title]").val();
        var previewImg = $("input[name=previewImg]").val();
        var praiseSum = $("input[name=praiseSum]").val();
        var phone = $("input[name=phone]").val();
        var videoTxid = $("input[name=videoTxid]").val()
        var address = $("input[name=address]").val()
        var fd = new FormData();
        //fd.append("files", file);
        fd.append("classifyId", classifyId);
        fd.append("previewImg", previewImg);
        fd.append("title", title);
        fd.append("praiseSum", praiseSum);
        fd.append("phone", phone);
        fd.append("videoTxid", videoTxid)
        fd.append("address", address)

        Project.ajaxUploadVideoFile('/video/admin/insertv2', fd, {}, true).ajaxOK(function (data) {
//            btn.value = '提交';//将按钮value值改为同意
//            btn.disabled = false;//将按钮disabled值改为false

        }, true);
    }

    $("#imgUrl").change(function () {
        preview(this.files[0]);
    });

    function preview(file) {
        var fd = new FormData();
        fd.append("files", file);
        Project.ajaxUploadVideoFile('/video/upload/tenxun', fd).ajaxOK(function (data) {
            var src = data['data'];
            $("#zhaopian").attr("src", src);
            $("input[name=previewImg]").val(src);
        });

    }

</script>
</body>
</html>