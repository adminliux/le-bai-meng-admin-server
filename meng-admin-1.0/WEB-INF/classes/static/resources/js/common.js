String.prototype = {
    /**
     * Trim the head and tail spaces
     */
    trim: function () {
        return this.replace(/(^\s*)|(\s*$)/g, "");
    },
    isEmpty: function () {
        var string = this;
        if (typeof(string) == "undefined" || string == "" || string == null) {
            return true;
        }
        string += "";
        if (string.trim() == "") {
            return true;
        }
        return false;
    }
};
String.prototype.isNumber = function () {
    if (isNaN(this) == true) {
        return false;
    }
    return true;
};
String.prototype.isEmpty = function () {
    return cm.stringIsEmpty(this);
};
/** 日期格式化 */
Date.prototype.format = function (format) {
    var o = {
        "M+": this.getMonth() + 1, // month
        "d+": this.getDate(), // day
        "h+": this.getHours(), // hour
        "m+": this.getMinutes(), // minute
        "s+": this.getSeconds(), // second
        "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
        "S": this.getMilliseconds()
        // millisecond
    };
    if (/(y+)/.test(format))
        format = format.replace(RegExp.$1, (this.getFullYear() + "")
            .substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(format))
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] :
                ("00" + o[k]).substr(("" + o[k]).length));
    return format;
};

Array.prototype.unique = function () {
    this.sort();
    var re = [this[0]];
    for (var i = 1; i < this.length; i++) {
        if (this[i] !== re[re.length - 1]) {
            re.push(this[i]);
        }
    }
    return re;
};
Array.prototype.removalNull = function () {
    return cm.arrayRemovalNull(this);
};
//---------------------------common----
(function (global) {
    var common = function () {
    };
    common.prototype = {
        /**
         *   写cookies
         * @param name 名字
         * @param value 值
         */
        setCookie: function (name, value) {
            var Days = 30;
            var exp = new Date();
            exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
            document.cookie = name + "=" + encodeURIComponent(value) + ";expires=" +
                exp.toGMTString() + "v;path=/";
        },
        /**
         * 获取JSON参数
         * @param name 参数名
         * @returns {null}
         */
        getParamJson: function (name) {
            var json = this.getParam(name);
            if (!this.stringIsEmpty(json)) {
                try {
                    return JSON.parse(json);
                } catch (e) {
                    console.log(e);
                }
            }
            return null;
        },
        /**
         * 是否微信浏览器
         * @returns {boolean} 是=teue
         */
        isWX: function () {
            var ua = window.navigator.userAgent.toLowerCase();
            if (ua.match(/MicroMessenger/i) == 'micromessenger') {
                return true;
            } else {
                return false;
            }
        },
        /**
         * 获取文件base64编码
         * @param file 文件
         * @param success 成功回调
         */
        getBase64: function (file, success) {
            var reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = function (e) {
                if (success != null) {
                    success(this.result);
                }
            }
        },
        /**
         *JSON转URK参数
         * @param param 字符串
         * @returns {string}
         */
        parseParam: function (param) {
            var paramStr = "";
            for (var name in param) {
                var v = param[name];
                if (v != null) {
                    paramStr += "&" + name + "=" + v;
                }
            }
            return paramStr.substr(1);
        },
        /**
         * 时间戳转date
         * @param ns 时间戳
         * @returns {Date}
         */
        timestampParseDate: function (ns) {
            return new Date(parseInt(ns));
        },
        /**
         *  时间格式化 yyyy-MM-dd
         * @param date 时间
         * @returns {*}
         */
        dateFormatYMD: function (date) {
            return date.format("yyyy-MM-dd");
        },
        /**
         * 时间格式化 格式 yyyy-MM-dd hh:mm:ss
         * @param date 时间
         * @returns {*}
         */
        dateFormatYMDHMS: function (date) {
            return date.format("yyyy-MM-dd hh:mm:ss");
        },
        /**
         * 时间格式化 格式 yyyy/MM/dd hh:mm:ss
         * @param date 时间
         * @returns {*}
         */
        dateFormatYMDHMSV2: function (date) {
            return date.format("yyyy/MM/dd hh:mm:ss");
        },
        timestampFormatYMD: function (ns) {
            return cm.dateFormatYMD(cm.timestampParseDate(ns));
        },
        /**
         * 时间格式化 格式 yyyy-MM-dd hh:mm
         * @param date 时间
         * @returns {*}
         */
        dateFormatYMDHM: function (date) {
            return date.format("yyyy-MM-dd hh:mm");
        },
        /**
         * 时间格式化 格式 hh:mm:ss
         * @param date 时间
         * @returns {*}
         */
        dateFormatHMS: function (date) {
            return date.format("hh:mm:ss");
        },
        /**
         *时间戳格式化
         * @param ns 时间戳
         * @returns {*}
         */
        timestampFormatYMDHMS: function (ns) {
            return cm.dateFormatYMDHMS(cm.timestampParseDate(ns));
        },
        /**
         *时间戳格式化
         * @param ns 时间戳
         * @returns {*}
         */
        timestampFormatYMDHMSV2: function (ns) {
            return cm.dateFormatYMDHMSV2(cm.timestampParseDate(ns));
        },
        /**
         *时间戳格式化
         * @param ns 时间戳
         * @returns {*}
         */
        timestampFormatYMDHM: function (ns) {
            return cm.dateFormatYMDHM(cm.timestampParseDate(ns));
        },
        /**
         *时间戳格式化
         * @param ns 时间戳
         * @returns {*}
         */
        timestampFormatHMS: function (ns) {
            return cm.dateFormatHMS(cm.timestampParseDate(ns));
        },
        /**
         * 时间戳格式化
         * @param ns 时间戳
         * @param format 格式
         */
        timestampFormat: function (ns, format) {
            return cm.timestampParseDate(ns).format(format);
        },

        /**
         * 设置/添加 url参数
         * @param {Object} name 参数名
         * @param {Object} value 值
         * @param {Object} url 地址
         * @param {Object} isJump 是否跳转页面
         */
        setUrlPara: function (name, value, url, isJump) {
            url = url || window.location.href;
            var currentUrl = url.split('#')[0];
            if (/\?/g.test(currentUrl)) {
                if (/name=[-\w]{4,25}/g.test(currentUrl)) {
                    currentUrl = currentUrl.replace(/name=[-\w]{4,25}/g, name + "=" + value);
                } else {
                    var q = currentUrl.split("?")[1],
                        keyValues = q.split("&"),
                        has = false;

                    for (var i = 0; i < keyValues.length; i++) {
                        var keyValue = keyValues[i];
                        keyValue = keyValue.split("=");
                        if (name == keyValue[0]) {
                            keyValues[i] = name + "=" + value;
                            has = true;
                            break;
                        }
                    }
                    if (has == false) {
                        keyValues[keyValues.length] = name + "=" + value;
                    }
                    q = "";
                    for (var i = 0; i < keyValues.length; i++) {
                        var keyValue = keyValues[i];
                        keyValue = keyValue.split("=");
                        q += "&" + keyValue[0] + "=" + keyValue[1];
                    }
                    q = q.substr(1);
                    currentUrl = currentUrl.split("?")[0] + "?" + q;
                }
            } else {
                currentUrl += "?" + name + "=" + value;
            }
            if (url.split('#')[1]) {
                currentUrl = currentUrl + '#' + urls.split('#')[1];

            }
            if (isJump) {
                window.location.href = currentUrl;
            } else {
                return currentUrl;
            }
        },
        /**
         * 生随机数
         * @param {Object} n 位数
         */
        random: function (n) {
            n = n || 4;
            for (var i = 0; i < n; i++) {
                t += Math.floor(Math.random() * 10);
            }
            return t;
        },
        toString: function () {
            return "";
        },
        parseJson: function (string) {
            //			return JSON.parse($.base64.decode(string));
            return JSON.parse(utf8to16(base64decode(string)));
        },
        /**
         * 合并两个json对象属性为一个对象
         * @param jsonbject1
         * @param jsonbject2
         * @returns resultJsonObject
         */
        merge: function (jsonbject1, jsonbject2) {
            if (jsonbject1 == null) {
                jsonbject1 = {};
            }
            for (var attr in jsonbject2) {
                jsonbject1[attr] = jsonbject2[attr];
            }
            return jsonbject1;
        },
        /**
         * 获取URL参数
         * @param {Object} paramName
         */
        getParam: function (paramName) {
            return this.getParameHref(paramName);
        },
        getParameHref: function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
            var r = window.location.search.substr(1).match(reg);
            if (r != null)
                return decodeURIComponent(decodeURIComponent(decodeURIComponent(r[2])));
            return null;
        },
        getParameUrl: function (search, name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
            var r = search.substr(1).match(reg);
            if (r != null)
                return decodeURIComponent(decodeURIComponent(decodeURIComponent(r[2])));
            return null;
        },
        /**
         * 截取一段字符串的开头的数字
         * @param {Object} string 字符串
         */
        subStrStartNumber: function (string) {
            var numberStr = "",
                isFu = false;
            if (string[0] == "-") {
                string = string.substr(1);
                isFu = true;
            }
            for (var i = 0; i < string.length; i++) {
                var charStr = string[i];
                if (charStr.isNumber()) {
                    numberStr += charStr;
                } else {
                    break;
                }
            }
            if (isFu) {
                numberStr = "-" + numberStr;
            }
            return numberStr;
        },
        logFormat: function (data) {
            console.log(JSON.stringify(data));
        },
        /**
         * 数组是否为空
         * @param {Object} array 数组
         */
        arrayEmpty: function (array) {
            if (array == null || array.length == 0) {
                return true;
            }
            return false;
        },
        /**
         * 数组去除空值
         * eg:
         * [1,2,null,3] = [1,2,3]
         * @param {Object} array 数组
         */
        arrayRemovalNull: function (array) {
            var newList = [],
                index = 0;
            for (var i = 0; i < array.length; i++) {
                var a = array[i];
                if (!this.arrayEmpty(a)) {
                    newList[index] = a;
                    index++;
                }
            }
            return newList;
        },
        isApp: function () {
            try {
                plus.android;
                return true;
            } catch (e) {
                return false;
            }
            /*if (plus) {
             return true;
             } else {
             return false;
             }*/
        },
        back: function (parame) {
            if (this.isApp() == false) {
                history.go(-1);
            } else {
                this.appGetParame(parame);
                // 解锁并关闭
                var _back = window.back;
                plus.screen.unlockOrientation();
                _back();
            }
        },
        href: function (html, type) {
            if (this.isApp() == false) {
                location.href = html;
            } else {
                var hrefs = html.split("?");
                this.appSetParame(hrefs[1]);

                var ws = null,
                    wp = null,
                    wo = null;

                // H5 plus事件处理
                function plusReady() {
                    ws = plus.webview.currentWebview();
                    wo = ws.opener();
                    wp = plus.webview.create(hrefs[0], hrefs[0], {
                        scrollIndicator: 'none',
                        scalable: false,
                        popGesture: 'none'
                    }, {
                        preate: true
                    });
                }

                if (window.plus) {
                    plusReady();
                } else {
                    document.addEventListener('plusready', plusReady, false);
                }

                // 动画窗口
                function animateWindow(type) {
                    wp.show(type);
                }

                // 关闭窗口
                var _back = window.back;

                function preateBack() {
                    if (!ws.preate) {
                        wp && wp.close();
                    }
                    _back();
                }

                window.back = preateBack;
                setTimeout(animateWindow(type), 2000);

                /*
                 var wpOne;
                 wpes.each(function(i, one) {
                 if (one.html == html) {
                 wpOne = one.wp;
                 return false;
                 }
                 })
                 animateWindow(type, wpOne);*/
            }
        },
        hrefForward: function (html) {
            this.href(html, "fade-in");
        },
        hrefBack: function (html) {
            this.href(html, "slide-in-left");
        },
        hrefUserInfo: function () {
            clickedBack("wode_ziliao.html");
            //			this.hrefBack("wode_ziliao.html");
        },
        hrefSetting: function () {
            clickedBack("shezhi.html");
        },
        appSetParame: function (parame) {
            localStorage[location.pathname] = parame;
        },
        appGetParame: function (name) {
            var parame = localStorage[location.pathname];
            if (!this.isEmpty(parame)) {
                if (!this.isEmpty(name)) {
                    parame = getParameUrl(name);
                }
            }
            return parame;
        },
        jsonParseParame: function (json) {
            var parameStr = "";
            for (var one in json) {
                var value = json[one];
                /*if (this.isUrlEncodedValue(value) == true) {
                 value = encodeURI(value);
                 }*/
                parameStr += "&" + one + "=" + encodeURI(encodeURI(value));
            }
            return encodeURI("?" + parameStr.substr(1));
        },
        isUrlEncodedValue: function (value) {
            /*	if (value.indexOf("&") != -1 || value.indexOf("=") != -1) {
             return true;
             } else {
             return false;
             }*/
            return true;
        },
        stringIsEmpty: function (string) {
            if (typeof(string) == "undefined" || string == "" || string == null) {
                return true;
            }
            string += "";
            if (string.trim() == "") {
                return true;
            }
            return false;
        },
        fRun: function (fn) {
            if (fn != null) {
                var ps = [];
                for (var i = 1; i < arguments.length; i++) {
                    ps[i - 1] = arguments[i];
                }
                fn(ps);
            }
        }
    };
    global.common = common;
    global.cm = new common();

    //----
    Date.prototype.dateFormatYMD = cm.dateFormatYMD;
    Date.prototype.dateFormatYMDHMS = cm.dateFormatYMDHMS;
})(window);

Loader = (function () {

    var loadScript = function (url) {
        var script = document.createElement('script');
        script.setAttribute('src', url + '?' + 'time=' + Date.parse(new Date())); // 不用缓存
        document.body.appendChild(script);
    };

    var loadMultiScript = function (urlArray) {
        for (var idx = 0; idx < urlArray.length; idx++) {
            loadScript(urlArray[idx]);
        }
    };

    return {
        load: loadMultiScript,
    };

})();

if (template) {
    template.helper("$timestampFormatYMD", cm.timestampFormatYMD);
    template.helper("$timestampFormatYMDHMS", cm.timestampFormatYMDHMS);
    template.helper("$timestampFormatYMDHM", cm.timestampFormatYMDHM);
    template.helper("$timestampFormatHMS", cm.timestampFormatHMS);
    template.helper("$jsonToString", function (json) {
        return JSON.stringify(json);
    });
    template.helper("ASCII2Native", function (str) {
        str = str.replace(/\\/g, "%");
        return unescape(str);
    });
}
