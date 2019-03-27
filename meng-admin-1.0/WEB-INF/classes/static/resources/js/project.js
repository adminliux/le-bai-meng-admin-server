var urlList = '';


(function (global) {
    //var apiHost = global.apiHost,
    frontColorKey = "frontColor";

    var project = function (apiType, source) {
        global.apiType = apiType;
        if (!cm.stringIsEmpty(apiType)) {
            if (apiType === "API") {
                //apiHost = apiHost + "/api/json";
            }
        }
        global.source = source;
    };

    project.prototype = {
        /**
         * 前段颜色显示
         */
        frontColor: function () {
            var color = localStorage[frontColorKey];

            if (color == null) {
                Project.ajax("/config/front/color", {}, {
                    async: false
                }).ajaxOK(function (data) {
                    localStorage[frontColorKey] = data.data;
                }, false, false);
            }
            $("head").append($('<style>.public-red{background:' + color + ' !important;}</style>'));
        },
        ajaxGet: function (url, data, setting, isLocal) {
            setting = setting || {};
            setting['type'] = "GET";
            return this.ajax(url, data, setting, isLocal);
        },
        /**
         * ajax请求数据
         * @param {Object} url 地址
         * @param {Object} data 参数
         * @param setting jquery参数
         * @param isLocal 是否是项目内AJAX
         */
        ajax: function (url, data, setting, isLocal) {
            data = data || {};

            var realUrl = apiHost + url,
                p = new promise.Promise();

            if (isLocal === true) {
                if (path) {
                    url = path + url;
                }
                realUrl = url;
            }
            if (cm.isWX()) {
                global.source = "WECHAT";
            }
            var d = {
                source: global.source
            };
            var dataType = Object.prototype.toString.call(data);
            if (dataType === "[object String]") {
                data += "&" + cm.parseParam(d);
            } else if (dataType === "[object FormData]") {
                for (var dn in d) {
                    if (d[dn] != null) {
                        data[dn] = d[dn]
                    }
                }
            } else {
                data = $.extend(d, data);
            }
            for (var key in data) {
                var _v = data[key];
                if (_v === "" || _v === null) delete data[key];
            }
            console.log("===================测试===================" + realUrl);
            var opt = {
                data: data,
                type: 'post', // HTTP请求类型
                timeout: 0, // 超时时间设置为10秒；
                success: function (data) {
                    console.log(JSON.stringify(data));

//                    获取商品上传地址
                    var imgUrl = data.data;
                    if (imgUrl !== '[object Object]' && imgUrl != null) {
                        urlList += imgUrl + ",";
                    }
                    p.done(data);

                },
                url: realUrl,
                error: function (xhr) {
                    //异常处理；
                    alert('接口调用失败：\ncode:' + xhr.status);
                }
            };
            if (apiType === "API") {
                opt.dataType = "json";
            }
            if (setting != null) {
                opt = cm.merge(opt, setting);
            }
            console.log(JSON.stringify(opt));
            $.ajax(opt);
            return p;
        },
        /**
         * ajax请求数据
         * @param {Object} url 地址
         * @param {Object} data 参数
         * @param setting jquery参数
         */
        ajaxPage: function (url, data, setting) {
            var fileSetting = {
                processData: false,
                contentType: false,
                dataType: "text"
            };
            if (setting != null) {
                fileSetting = cm.merge(fileSetting, setting)
            }
            return this.ajaxLocal(pathPage + url, data, fileSetting);
        },
        /**
         * ajax请求数据
         * @param {Object} url 地址
         * @param {Object} data 参数
         * @param setting jquery参数
         */
        ajaxLocal: function (url, data, setting) {
            return this.ajax(url, data, setting, true);
        },
        /**
         * 文件上传
         * @param {Object} uri 地址
         * @param {Object} data
         * @param {Object} setting
         */
        ajaxUploadFileUrl: function (uri, data, setting, isL) {
            var fileSetting = {
                processData: false,
                contentType: false,
                dataType: "json"
            };
            if (setting !== null) {
                fileSetting = cm.merge(fileSetting, setting)
            }
            return this.ajax(uri, data, fileSetting, isL);
        },
        /**
         * 上传文件
         */
        ajaxUploadFiles: function (data, setting) {
            return this.ajaxUploadFileUrl('/file/upload/batch', data, setting, true);
        },
        /**
         * 上传文件
         */
        ajaxUploadVideoFile: function (uri, data, setting, isL) {
            return this.ajaxUploadFileUrl(uri, data, setting, isL);
        },
        /**
         * json弹出消息提示框
         * @param data
         */
        ajaxAlert: function (data) {
            alert(data.msg);
        },
        ajaxUserInfo: function (data) {
            return this.ajax("/user/find/user", data);
        },
        /**
         * 用户列表
         * @param data 参数
         * @returns {*}
         */
        ajaxUserList: function (data) {
            return this.ajax("/user/selects/vague", data);
        },
        /**
         * 分页设置
         */
        ajaxPageSet: function (pageSize, data) {
            data = data || {};
            return data.pageSize = pageSize;
        },
        getUser: function () {
            try {
                return JSON.parse(localStorage.user);
            } catch (e) {
                console.log(e);
            }
        },
        getUserAttr: function (attr) {
            var user = this.getUser();
            if (user != null) {
                return user[attr];
            }
        },
        getOpenId: function () {
            return this.getUserAttr("openId");
        }
    };
    global.project = project;
    global.Project = new project("API", "ADMIN");
})(window);

if (promise) {
    /**
     * AJAX数据返回处理
     * @param code  code码
     * @param callback 回调
     * @param isAlert 是否弹出消息
     * @param alert 弹出消息
     * @param notFn code不等回调
     */
    promise.Promise.prototype.ajax = function (code, callback, isAlert, alert, notFn) {
        this.ajaxV2(code, callback, function (data) {
            if (isAlert == true) {
                Project.ajaxAlert(data);
            }
            if (notFn != null) notFn();
        }, alert);
    };

    /**
     * AJAX数据返回处理
     * @param code  code码
     * @param callback 回调
     * @param notFn code不等回调
     * @param alert 弹出消息
     */
    promise.Promise.prototype.ajaxV2 = function (code, callback, notFn, alert) {
        this.then(function (data) {
            if (data.code == null) {
                if (callback) callback(data);
                return this;
            }
            if (data.code == "OVERTIME") {
                top.location = "../to/login";
            }
            if (data.code == code) {
                if (callback) callback(data);
                if (alert == true) {
                    Project.ajaxAlert(data);
                }
            } else {
                if (notFn) notFn(data);
            }
        });
    };

    /**
     * 数据成功返回处理
     * @param callback 成功回调
     * @param isAlert 是否弹出消息
     * @param errorAlert 是否弹出错误消息
     * @param notSuccess 不成功回调
     */
    promise.Promise.prototype.ajaxOK = function (callback, isAlert, errorAlert, notSuccess) {
        if (errorAlert == null) {
            errorAlert = true;
        }
        this.ajax("SUCCESS", callback, errorAlert, isAlert, notSuccess);
    };
    /**
     * 数据失败返回处理
     * @param callback 回调
     * @param isAlert 是否弹出消息
     */
    promise.Promise.prototype.ajaxFail = function (callback, isAlert) {
        this.ajax("FAIL", callback, isAlert);
    };
    /**
     * 数据为空返回处理
     * @param callback 回调
     * @param isAlert 是否弹出消息
     */
    promise.Promise.prototype.ajaxEmpty = function (callback, isAlert) {
        this.ajax("EMPTY", callback, isAlert);
    };
    /**
     * 参数不合法返回处理
     * @param callback 回调
     * @param isAlert 是否弹出消息
     */
    promise.Promise.prototype.ajaxParam = function (callback, isAlert) {
        this.ajax("PARAMETER_INVALID", callback, isAlert);
    };
}
if (window.enumDisplay) {
    window.Enum = new window.enumDisplay("/enum/data");
    if (template) {
        template.helper("$enumValue", Enum.value);
    }
}
if (template) {
    template.helper("$page", function (page, number) {
        page = page || {};
        page.pageNum = number;
        return JSON.stringify(page);
    });
}

//附件上传
//初始化fileinput控件
function initFileInput(fileuri, yulanimg) {
    $(":input[type='file']").attachsvr({
        script: "/api/json/file/upload/batch",
        uploadkey: "files",
        filetype: [".jpg", ".png", ".jpeg", ".bmp"],

        onComplete: function (json) {
            var data = JSON.parse(json.data);
            if (data.success == true) {
                //$("#"+divUploadWrap).css("background-image","");
                //$("#"+fileuri).text('');
                //i表示在data中的索引位置，n表示包含的信息的对象
                //$("#"+yulanimg).html('');
                var filespanval = $("#" + fileuri).text();
                $.each(data.data, function (i, n) {
                    $("#" + yulanimg).append('<img id="fileimgid" style="width: 250px;height: 250px;padding-left: 5px;padding-bottom: 5px;padding-top: 10px;" src="' + n + '">');
                    if (filespanval != undefined && filespanval != null && filespanval != '') {
                        $("#" + fileuri).text(filespanval + "|||" + n);
                    } else {
                        $("#" + fileuri).text(n);
                    }
                });
            } else {
                alert("上传失败");
            }

        },
        onProgress: function (xhr) {
            //console.log(xhr);
            //console.log("progress,在这里可以添加loading 效果",parseInt(xhr.loaded/xhr.total*100)+"%")
            $('#continuefile').text(parseInt(xhr.loaded / xhr.total * 100) + "%");
        },
        onCheck: function (file) {
            console.log(file);
            return true;
        },
        onError: function (e) {
            console.log("error", e)
        },
        ctxdata: {
            "参数1": "参数1的值",
            "参数2": "参数2",
        }

    });
}

//时间格式化
Date.prototype.pattern = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours(), //小时
        "H+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    var week = {
        "0": "/u65e5",
        "1": "/u4e00",
        "2": "/u4e8c",
        "3": "/u4e09",
        "4": "/u56db",
        "5": "/u4e94",
        "6": "/u516d"
    };
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    if (/(E+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "/u661f/u671f" : "/u5468") : "") + week[this.getDay() + ""]);
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        }
    }
    return fmt;
}