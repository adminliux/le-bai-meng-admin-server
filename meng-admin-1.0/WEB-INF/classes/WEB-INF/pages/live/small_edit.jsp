<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>课程小节更改</title>
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
        input[type="radio"], input[type="checkbox"] {
            width: 20px;
        }
    </style>

    <%@include file="../base/header.jsp" %>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 课程管理 <span
        class="c-gray en">&gt;</span> 更改直播小节 <a class="btn btn-success radius r"
                                                style="line-height:1.6em;margin-top:3px"
                                                href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<form id="_d">
    <label>
        <input name="id" hidden>
    </label>
    <div class="page-container">
        <br>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>直播名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="请输入" name="title" maxlength="10">
            </div>
        </div>
        <br>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>价格：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="number" class="input-text" placeholder="请输入" name="price" maxlength="10">
            </div>
        </div>
        <br>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>直播类型：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <label>
                    <select style="width: 100%;height: 3.5%" name="type">
                        <option value="">请选择</option>
                        <option value="1">普通课程</option>
                        <option value="2">轮播课程</option>
                    </select>
                </label>
            </div>
        </div>
        <br>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>直播状态：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <label>
                    <select style="width: 100%;height: 3.5%" name="status">
                        <option value="">请选择</option>
                        <option value="1">直播中</option>
                        <option value="2">下线</option>
                        <option value="3">结束</option>
                    </select>
                </label>
            </div>
        </div>
        <br>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>直播开始结束时间</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" data-datetime class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                       name="beginTime"
                       placeholder="直播开始时间"/>
                -
                <input type="text" data-datetime class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                       name="endTime"
                       placeholder="直播结束时间"/>
            </div>
        </div>
        <br>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>大课程ID：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <label>
                    <input type="text" class="input-text" name="courseId" maxlength="10">
                </label>
            </div>
        </div>
        <br>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>预览图：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <img width="120" height="120" data-src="previewImg" src="">
                <input type="file" id="imgUrl"/>
                <input type="hidden" name="previewImg"/>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>录播视频：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <video data-src="address" controls></video>
                <input type="file" id="video"/>
                <input type="hidden" name="address"/>
            </div>
        </div>
        <br>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="submit"
                       value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </div>
    </div>
</form>
<%@include file="../base/footer.jsp" %>
<!-- 上传图片 -->
<script type="text/javascript" src="${path}/resources/uploadimg/control/js/zyUpload.js"></script>
<script type="text/javascript" src="${path}/resources/uploadimg/core/zyFile.js"></script>
<script type="text/javascript" src="${path}/resources/uploadimg/demo.js"></script>
<script type="text/javascript" src="${path}/resources/uploadimg/control/js/bootstrap.min.js"></script>
<!-- 上传视频 -->
<script src="${path}/resources/js/tenxunyun/ugcUploader.js"></script>
<script>
    var $from = $("#_d");
    var mysign = "";
    var index = 0;
    var cosBox = [];
    var scale = 0.3;

    function info(id) {
        Project.ajax("/course/detial/info", {id: id}).ajaxOK(function (data) {
            $from.formAssign(data.data);
        });
    }

    $from.html5Validate(function () {
        try {
            var param = $from.formSerialize();
            Project.ajax("/course/detial/update", param).ajaxOK(function () {
            }, true);
        } catch (e) {
            alert(e.message);
        }
    });


    var id = cm.getParam("id"), bigId = cm.getParam("bigId");
    if (id) info(id);

    if (bigId) {
        $("input[name=courseId]").val(bigId);
    }

    var getSignature = function (callback) {
        $.ajax({
            url: apiHost + '/video/get/sign',  //获取客户端上传签名的 URL
            type: 'POST',
            dataType: 'json',
            success: function (result) {//result 是派发签名服务器的回包
                //假设回包为 { "code": 0, "signature": "xxxx"  }
                //将签名传入 callback，SDK 则能获取这个上传签名，用于后续的上传视频步骤。
                callback(result.data);
            }
        });
    };

    function getMysign() {
        Project.ajax("/video/get/sign", null).ajaxOK(function (data) {
            mysign = data.msg
        })
    }

    $("#imgUrl").change(function () {
        preview(this.files[0]);
    });

    function preview(file) {
        var fd = new FormData();
        fd.append("files", file);
        Project.ajaxUploadVideoFile('/video/upload/tenxun', fd).ajaxOK(function (data) {
            var src = data['data'];
            $("*[data-src=previewImg]").attr("src", src);
            $("input[name=previewImg]").val(src);
        });

    }

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

        $(document.body).append(html);
        return index++;
    };

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
        var num = addUploaderMsgBox('hasVideo');
        var videoFile = this.files[0];
        $('#result').append(videoFile.name + '\n');
        var imgUrlFile = $("#imgUrl")[0].files[0];


        var fi = $("#imgUrl").val();
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
                $("*[data-src=address]").attr("src", result.videoUrl)
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
</script>
</body>
</html>