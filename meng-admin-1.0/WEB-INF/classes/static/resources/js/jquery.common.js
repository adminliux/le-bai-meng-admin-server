(function ($) {
    $.fn.extend({
        /**
         * 获取A 属性href
         * @returns {*}
         */
        href: function () {
            return this.attr("href");
        },
        /**
         * AJAX跨域开启
         * @constructor AJAX
         * @param stop 是否关闭
         */
        CORSCookie: function (stop) {
            var isC = true;
            if (stop) {
                isC = false;
            }
            var d = {
                xhrFields: {
                    withCredentials: isC
                }
            };

            //备份jquery的ajax方法
            var _ajax = $.ajax;

            //重写jquery的ajax方法
            $.ajax = function (opt) {
                //备份opt中error和success方法
                var fn = {
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    },
                    success: function (data, textStatus) {
                    }
                };
                if (opt.error) {
                    fn.error = opt.error;
                }
                if (opt.success) {
                    fn.success = opt.success;
                }

                //扩展增强处理
                var _opt = $.extend(opt, {
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        //错误方法增强处理

                        fn.error(XMLHttpRequest, textStatus, errorThrown);
                    },
                    success: function (data, textStatus) {
                        //成功回调方法增强处理

                        fn.success(data, textStatus);
                    }
                }, d);
                _ajax(_opt);
            };
        },
        /**
         * AJAX跨域开启
         * @constructor AJAX
         * @param dataType 数据类型
         */
        ajaxJsonP: function (dataType) {
            if (!dataType) dataType = "jsonP";

            var d = {
                dataType: dataType
            };

            //备份jquery的ajax方法
            var _ajax = $.ajax;

            //重写jquery的ajax方法
            $.ajax = function (opt) {
                //备份opt中error和success方法
                var fn = {
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    },
                    success: function (data, textStatus) {
                    }
                };
                if (opt.error) {
                    fn.error = opt.error;
                }
                if (opt.success) {
                    fn.success = opt.success;
                }

                //扩展增强处理
                var _opt = $.extend(opt, {
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        //错误方法增强处理

                        fn.error(XMLHttpRequest, textStatus, errorThrown);
                    },
                    success: function (data, textStatus) {
                        //成功回调方法增强处理

                        fn.success(data, textStatus);
                    }
                }, d);
                _ajax(_opt);
            };
        },
        /**
         * 表单序列化，没有值参数值为NULL
         */
        formSerialize: function () {
            var o = {};
            var a = this.serializeArray();
            $.each(a,
                function () {
                    if (o[this.name] !== undefined) {
                        o[this.name] = o[this.name] + "," + this.value;
                    } else {
                        o[this.name] = this.value || null;
                    }
                });
            return o;
        },
        /**
         * 表单赋值
         * @param {Object} data 数据
         */
        formAssign: function (data) {
            for (var attr in data) {
                var _d = data[attr];
                if (typeof(data[attr]) == 'function') {
                    continue;
                }

                $("*[data-src='" + attr + "']").attr("src", _d);

                var $input = this.find(":input[name='" + attr + "']");
                if ($input.attr("data-datetime") !== undefined) {
                    if (_d) data[attr] = cm.timestampFormatYMDHMS(_d);
                }
                var type = $input.attr("type");
                if (type == "checkbox" || type == "radio") {
                    var avalues = data[attr].split(",");
                    for (var v = 0; v < avalues.length; v++) {
                        $input.each(function (i, n) {
                            var value = $(n).val();
                            if (value == avalues[v]) {
                                $(n).attr("checked", "checked");
                            }
                        });
                    }
                } else {
                    $input.val(data[attr]);
                }
            }
        },
        assignment: function (data) {
            for (var attr in data) {
                if (typeof(data[attr]) == 'function') {
                    continue;
                }
                var $names = this.find("*[data-name='" + attr + "']");
                $names.each(function (i, name) {
                    var $name = $(name),
                        tagName = $name.attr("tagName");
                    if (tagName != "input" || tagName != "select") {
                        $name.text(data[attr]);
                    }
                });
            }

        },
        scrollAjax: function (top, last) {
            var $e = this || window;
            $($e).scroll(function () {
                var scrollTop = $($e).scrollTop();
                if (scrollTop == 0) {
                    null ? top : top()
                }
                if (getScrollTop() + getClientHeight() >= getScrollHeight()) {
                    null ? last : last()
                }
            });

            //获取滚动条当前的位置
            function getScrollTop() {
                var scrollTop = 0;
                if (document.documentElement && document.documentElement.scrollTop) {
                    scrollTop = document.documentElement.scrollTop;
                } else if (document.body) {
                    scrollTop = document.body.scrollTop;
                }
                return scrollTop;
            }

            //获取当前可是范围的高度
            function getClientHeight() {
                var clientHeight = 0;
                if (document.body.clientHeight && document.documentElement.clientHeight) {
                    clientHeight = Math.min(document.body.clientHeight, document.documentElement.clientHeight);
                } else {
                    clientHeight = Math.max(document.body.clientHeight, document.documentElement.clientHeight);
                }
                return clientHeight;
            }

            //获取文档完整的高度
            function getScrollHeight() {
                return Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
            }
        },

        /**
         * 表单验证提交
         */
        validateSubmit: function (success, fail) {
            this.html5Validate(success(this.formSerialize()), fial);
        },
        /**
         * 表单跳转指定链接
         */
        formAction: function (p) {
            if (p != null) {
                for (var i in p) {
                    this.append($("<input type='hidden' name='" + i + "' value='" + p[i] + "' />"));
                }
            }
            location.href = this.attr("action") + "?" + this.serialize();
        }
    })
})(jQuery);