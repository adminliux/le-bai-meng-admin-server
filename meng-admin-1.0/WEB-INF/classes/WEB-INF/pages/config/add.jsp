<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>配置项</title>
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


    <link type="text/css" rel="stylesheet" href="${path}/resources/uploadimg/control/css/zyUpload.css" />




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
                        data-dismiss="modal"  onclick="submitData()">
                    <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>关闭
                </button>
            </div>

        </div>
    </div>
</div>

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理 <span class="c-gray en">&gt;</span> 添加代理子账号 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <br>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>配置项：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select style="width: 100%;height: 3.5%" name="configType" onchange="selectConfig(this)">
                    <option value="">未选</option>
                    <option value="DEGREE_LIST">学历列表</option>
                    <option value="TOP_HELP_TYPE">头部帮助菜单指定</option>
                    <option value="USER_DEF_LOGO">用户默认头像</option>
                    <option value="INCOME_LIST">收入列表</option>
                    <option value="DEF_CARD_TYPE_ID">默认卡类型</option>
                    <option value="DEF_REGION">默认地区</option>
                    <option value="NEWS_DRAW">新闻首页自定义</option>
                    <option value="INVITE_MEMBERS">会员介绍图文详情</option>
                    <option value="INVITE_LOGISTICS_CAR">物流用车图文详情</option>
                    <option value="INVITE_OFFICE_CAR">公务用车图文详情</option>
                    <option value="BRANCH_MAP_STATUS">需要展示的网点地图状态</option>
                    <option value="BRANCH_STATUS_COLOR">网点地图展示颜色</option>
                    <option value="CAT_PLAYER_LS">车辆播放器列表</option>
                    <option value="CAT_DRIVING_LS">车辆驱动方式列表</option>
                    <option value="CAT_WEEK_WORK_DAY">租车一周中工作日</option>
                    <option value="CAT_ORDERED_U_LEVEL_TIME">不同用户等级预约租车最多时长</option>
                    <option value="U_CAPITAL_FLOW_REVEAL_TYPE">用户账户资金流水记录展示类型</option>
                    <option value="RECHARGE_PAY_TYPE">充值支付方式</option>
                    <option value="PAY_TYPE_LOGO">支付方式LOGO配置</option>
                    <option value="HOT_CAR">热门车辆</option>
                    <option value="HOT_ACTIVITY">热门活动</option>
                    <option value="PC_CAR_FIND_TIME">PC端车辆查找展示租车时间类型</option>
                    <option value="PC_CAR_FIND_CROWD_CAR">PC端车辆查找展示租车用车类型</option>
                    <option value="CAR_MODELS">车辆车型列表</option>
                    <option value="PC_CAR_FIND_TIME_DEF">PC端车辆查找展示租车时间类型默认选中类型</option>
                    <option value="PC_CAR_FIND_CROWD_CAR_DEF">PC端车辆查找展示租车用车类型默认选中类型</option>
                    <option value="CAR_TIME_OVERLAY">不同租车时间类型可叠数率</option>
                    <option value="CAR_FIND_SHOW_ATTRS">PC端车辆查找展示属性</option>
                    <option value="CAR_FIND_SHOW_INFO">PC端车辆查找展示车辆信息</option>
                    <option value="USER_LEVER_INTRO">会员等级介绍</option>
                    <option value="RENT_CAR_NOTICE">租车须知</option>
                    <option value="LIMIT_DRIVE_WARN">限行提醒</option>
                    <option value="CAR_ORDER_NOTICE">租车订单说明</option>
                    <option value="RENT_CAR_*jsp_INFO_SHOW">租车详情页需要展示车辆信息字段</option>
                    <option value="USER_LEVER_DISCOUNT">会员等级折扣</option>
                    <option value="MONEY_TO_INTEGRAL_RATIO">金额兑换积分比例</option>
                    <option value="RENT_CAR_AREA_LIMIT">租车区域限制规则</option>
                    <option value="ORDER_VALID_MINUTE">订单有效分钟</option>
                    <option value="USER_LEVEL_ORDER">用户等级安装等级排序</option>
                </select>
            </div>
        </div>
        <br>
        <div class="row cl" style="display:none" id="div01">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>银行卡类型：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select style="width: 100%;height: 3.5%" name="bankType" id="bank">
                <script type="text/html" id="f1">
                    <option value="">未选</option>
                    {{each data as one}}
                    <option value="{{one.id}}">{{one.name}}</option>
                    {{/each}}
                </script>
                </select>
            </div>
        </div>
        <div class="row cl" style="display:none" id="div02">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>头部帮助菜单指定：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <select style="width: 100%;height: 3.5%" name="helpType" id="help">
                <script type="text/html" id="f2">
                    <option value="">未选</option>
                    {{each data as one}}
                    <option value="{{one.id}}">{{one.title}}</option>
                    {{/each}}
                </script>
            </select>
        </div>
        </div>

        <div class="row cl" style="display:none" id="div03">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>学历：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="请输入学历多个以逗号隔开" name="learn" onkeyup="JavaScript:this.value=this.value.replace(/，/ig,',');">
            </div>
        </div>

        <div class="row cl" style="display:none" id="div04">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>会员介绍图文详情：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea class="span11" name="context" style="width: 100%; height: 500px;" id="members"></textarea>
            </div>
        </div>
        <div class="row cl" style="display:none" id="div05">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>物流用车图文详情：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea class="span11" name="context" style="width: 100%; height: 500px;" id="logistics"></textarea>
            </div>
        </div>
        <div class="row cl" style="display:none" id="div06">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>公务用车图文详情：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea class="span11" name="context" style="width: 100%; height: 500px;" id="official"></textarea>
            </div>
        </div>
        <div class="row cl" style="display:none" id="div07">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>需要展示的网点地图状态：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <label><input name="Fruit" type="checkbox" value="OPERATE" />：营业</label>
                <label><input name="Fruit" type="checkbox" value="DISABLE" />：停用</label>
                <label><input name="Fruit" type="checkbox" value="DEFAULT" />：预设</label>
            </div>
        </div>
        <div class="row cl" style="display:none" id="div08">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>收入列表：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="请输入收入多个以英文逗号隔开" name="income" onkeyup="value=value.replace(/[^\d|,]/g,'')">
            </div>
        </div>
        <div class="row cl" style="display:none" id="div09">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>租车一周中工作日：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="请输入租车工作日(开始结束以逗号隔开例如1,5)" name="working" onkeyup="value=value.replace(/[^\d|,]/g,'')">
            </div>
        </div>
        <div class="row cl" style="display:none" id="div10">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>不同用户等级预约租车最多时长：</label>
            <div class="formControls col-xs-8 col-sm-9">
                普通会员：<input type="text" class="input-text" placeholder="请输入普通会员时长" name="putong" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                金卡会员：<input type="text" class="input-text" placeholder="请输入金卡会员时长" name="jinka" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                白金会员：<input type="text" class="input-text" placeholder="请输入白金会员时长" name="baijin" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                钻石会员：<input type="text" class="input-text" placeholder="请输入钻石会员时长" name="zuanshi" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
            </div>
        </div>
        <div class="row cl" style="display:none" id="div11">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>用户账户资金流水记录展示类型：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <label><input name="moneys" type="checkbox" value="RECHARGE" />：充值</label>
                <label><input name="moneys" type="checkbox" value="WITHDRAW" />：提现</label>
                <label><input name="moneys" type="checkbox" value="CONSUME" />：消费</label>
            </div>
        </div>
        <div class="row cl" style="display:none" id="div12">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>默认地区：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select style="width: 100%;height: 3.5%" name="province" id="province">
                    <script type="text/html" id="f3">
                        <option value="">未选</option>
                        {{each data as one}}
                        <option value="{{one.globalCode}}">{{one.name}}</option>
                        {{/each}}
                    </script>
                </select>
            </div>
        </div>
        <div class="row cl" style="display:none" id="div13">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>支付方式LOGO配置：</label>
            <div class="formControls col-xs-8 col-sm-9">
                支付宝：<button type="button" class="btn btn-success" onclick="showC('1')">添加图片</button>
                微信：<button type="button" class="btn btn-success" onclick="showC('2')">添加图片</button>
                余额：<button type="button" class="btn btn-success" onclick="showC('3')">添加图片</button>
                银联：<button type="button" class="btn btn-success" onclick="showC('4')">添加图片</button>
            </div>
        </div>
        <div class="row cl" style="display:none" id="div14">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>充值支付方式：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <label><input name="payWay" type="checkbox" value="ALI_PAY" />：支付宝</label>
                <label><input name="payWay" type="checkbox" value="WE_CHAT" />：微信</label>
                <label><input name="payWay" type="checkbox" value="UNION_PAY" />：银联</label>
            </div>
        </div>
        <div class="row cl" style="display:none" id="div15">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>热门车辆：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <table class="table table-border table-bordered table-bg table-hover" style="white-space: nowrap">
                    <thead>
                    <tr class="text-c">
                        <th width="25"><input type="checkbox" id="SelectAll" onclick="trigger();"></th>
                        <th>车辆</th>
                    </tr>
                    </thead>
                    <tbody id="car">
                    </tbody>
                </table>
                <script type="text/html" id="f4">
                    {{each data as one}}
                    <tr>
                        <td style="text-align:center;vertical-align:middle;"><input type="checkbox" name="key" value="{{one.id}}"></td>
                        <td style="text-align:center;vertical-align:middle;">{{one.name}}</td>
                    </tr>
                    {{/each}}
                </script>
            </div>
        </div>
        <div class="row cl" style="display:none" id="div16">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>热门活动：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <table class="table table-border table-bordered table-bg table-hover" style="white-space: nowrap">
                    <thead>
                    <tr class="text-c">
                        <th width="25"><input type="checkbox" id="SelectAll2" onclick="trigger2();"></th>
                        <th>活动标题</th>
                    </tr>
                    </thead>
                    <tbody id="activity">
                    </tbody>
                </table>
                <script type="text/html" id="f5">
                    {{each data as one}}
                    <tr>
                        <td style="text-align:center;vertical-align:middle;"><input type="checkbox" name="key2" value="{{one.id}}"></td>
                        <td style="text-align:center;vertical-align:middle;">{{one.title}}</td>
                    </tr>
                    {{/each}}
                </script>
            </div>
        </div>
        <div class="row cl" style="display:none" id="div17">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>PC端车辆查找展示租车时间类型：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <label><input name="pcType" type="checkbox" value="TIME" />：按时</label><br><br>
                <label><input name="pcType" type="checkbox" value="DAY" />：按日</label><br><br>
                <label><input name="pcType" type="checkbox" value="MOUTH" />：按月</label><br><br>
                <label><input name="pcType" type="checkbox" value="SEASON" />：按季</label><br><br>
                <label><input name="pcType" type="checkbox" value="YEAR" />：按年</label><br>
            </div>
        </div>
        <div class="row cl" style="display:none" id="div18">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>PC端车辆查找展示租车用车类型：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <label><input name="crowdCar" type="checkbox" value="PERSONAL" />：个人用车</label><br><br>
                <label><input name="crowdCar" type="checkbox" value="GOVERNMENT" />：政府用车</label><br><br>
                <label><input name="crowdCar" type="checkbox" value="ENTERPRISE" />：企业用车</label><br><br>
                <label><input name="crowdCar" type="checkbox" value="LOGISTICS" />：物流用车</label><br><br>
            </div>
        </div>
        <div class="row cl" style="display:none" id="div19">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>车辆车型列表：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="请输入车辆车型多个以逗号隔开" name="models" onkeyup="JavaScript:this.value=this.value.replace(/，/ig,',');">
        </div>

        <div class="row cl" style="display:none" id="div20">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>PC端车辆查找展示租车时间类型默认选中类型：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <select name="timeDefault" >
                <option value="">未选</option>
                <option value="TIME">时</option>
                <option value="DAY">日</option>
                <option value="MOUTH">月</option>
                <option value="SEASON">季</option>
                <option value="YEAE">年</option>
            </select>
        </div>
    </div>
        <br>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick="addConfig()">
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

<script type="text/javascript">

    /*
    * 查询
    * */
    function selectConfig(obj){
        var configOpt = obj.value;
        Project.ajax("/api/config/selectConfig",{configOpt:configOpt}).ajaxOK(function(data){
            $("#bank").html(template("f1",data));
            $("#help").html(template("f2",data));
            $("#province").html(template("f3",data));
            $("#car").html(template("f4",data));
            $("#activity").html(template("f5",data));
            if(configOpt=='DEF_CARD_TYPE_ID'){//默认卡类型
                $("#div01").show();
                $("#div02").hide();
                $("#div03").hide();
                $("#div04").hide();
                $("#div05").hide();
                $("#div06").hide();
                $("#div07").hide();
                $("#div08").hide();
                $("#div09").hide();
                $("#div10").hide();
                $("#div11").hide();
                $("#div12").hide();
                $("#div13").hide();
                $("#div14").hide();
                $("#div15").hide();
                $("#div16").hide();
                $("#div17").hide();
                $("#div18").hide();
                $("#div19").hide();
                $("#div20").hide();
            }else if(configOpt=='TOP_HELP_TYPE'){//头部帮助菜单指定
                $("#div02").show();
                $("#div01").hide();
                $("#div03").hide();
                $("#div04").hide();
                $("#div05").hide();
                $("#div06").hide();
                $("#div07").hide();
                $("#div08").hide();
                $("#div09").hide();
                $("#div10").hide();
                $("#div11").hide();
                $("#div12").hide();
                $("#div13").hide();
                $("#div14").hide();
                $("#div15").hide();
                $("#div16").hide();
                $("#div17").hide();
                $("#div18").hide();
                $("#div19").hide();
                $("#div20").hide();
            }else if(configOpt=='DEGREE_LIST'){//学历列表
                $("#div03").show();
                $("#div01").hide();
                $("#div02").hide();
                $("#div04").hide();
                $("#div05").hide();
                $("#div06").hide();
                $("#div07").hide();
                $("#div08").hide();
                $("#div09").hide();
                $("#div10").hide();
                $("#div11").hide();
                $("#div12").hide();
                $("#div13").hide();
                $("#div14").hide();
                $("#div15").hide();
                $("#div16").hide();
                $("#div17").hide();
                $("#div18").hide();
                $("#div19").hide();
                $("#div20").hide();
            }else if(configOpt=='INVITE_MEMBERS'){//会员介绍图文详情
                $("#div04").show();
                $("#div01").hide();
                $("#div02").hide();
                $("#div03").hide();
                $("#div05").hide();
                $("#div06").hide();
                $("#div07").hide();
                $("#div08").hide();
                $("#div09").hide();
                $("#div10").hide();
                $("#div11").hide();
                $("#div12").hide();
                $("#div13").hide();
                $("#div14").hide();
                $("#div15").hide();
                $("#div16").hide();
                $("#div17").hide();
                $("#div18").hide();
                $("#div19").hide();
                $("#div20").hide();
            }else if(configOpt=='INVITE_LOGISTICS_CAR'){//物流用车图文详情
                $("#div05").show();
                $("#div01").hide();
                $("#div02").hide();
                $("#div03").hide();
                $("#div04").hide();
                $("#div06").hide();
                $("#div07").hide();
                $("#div08").hide();
                $("#div09").hide();
                $("#div10").hide();
                $("#div11").hide();
                $("#div12").hide();
                $("#div13").hide();
                $("#div14").hide();
                $("#div15").hide();
                $("#div16").hide();
                $("#div17").hide();
                $("#div18").hide();
                $("#div19").hide();
                $("#div20").hide();
            }else if(configOpt=='INVITE_OFFICE_CAR'){//公务用车图文详情
                $("#div06").show();
                $("#div01").hide();
                $("#div02").hide();
                $("#div03").hide();
                $("#div04").hide();
                $("#div05").hide();
                $("#div07").hide();
                $("#div08").hide();
                $("#div09").hide();
                $("#div10").hide();
                $("#div11").hide();
                $("#div12").hide();
                $("#div13").hide();
                $("#div14").hide();
                $("#div15").hide();
                $("#div16").hide();
                $("#div17").hide();
                $("#div18").hide();
                $("#div19").hide();
                $("#div20").hide();
            }else if(configOpt=='BRANCH_MAP_STATUS'){//需要展示的网点地图状态
                $("#div07").show();
                $("#div01").hide();
                $("#div02").hide();
                $("#div03").hide();
                $("#div04").hide();
                $("#div05").hide();
                $("#div06").hide();
                $("#div08").hide();
                $("#div09").hide();
                $("#div10").hide();
                $("#div11").hide();
                $("#div12").hide();
                $("#div13").hide();
                $("#div14").hide();
                $("#div15").hide();
                $("#div16").hide();
                $("#div17").hide();
                $("#div18").hide();
                $("#div19").hide();
                $("#div20").hide();
            }else if(configOpt=='INCOME_LIST'){//收入列表
                $("#div08").show();
                $("#div01").hide();
                $("#div02").hide();
                $("#div03").hide();
                $("#div04").hide();
                $("#div05").hide();
                $("#div06").hide();
                $("#div07").hide();
                $("#div09").hide();
                $("#div10").hide();
                $("#div11").hide();
                $("#div12").hide();
                $("#div13").hide();
                $("#div14").hide();
                $("#div15").hide();
                $("#div16").hide();
                $("#div17").hide();
                $("#div18").hide();
                $("#div19").hide();
                $("#div20").hide();
            }else if(configOpt=='CAT_WEEK_WORK_DAY'){//网点地图展示颜色
                $("#div09").show();
                $("#div01").hide();
                $("#div02").hide();
                $("#div03").hide();
                $("#div04").hide();
                $("#div05").hide();
                $("#div06").hide();
                $("#div07").hide();
                $("#div08").hide();
                $("#div10").hide();
                $("#div11").hide();
                $("#div12").hide();
                $("#div13").hide();
                $("#div14").hide();
                $("#div15").hide();
                $("#div16").hide();
                $("#div17").hide();
                $("#div18").hide();
                $("#div19").hide();
                $("#div20").hide();
            }else if(configOpt=='CAT_ORDERED_U_LEVEL_TIME'){//不同用户等级预约租车最多时长
                $("#div10").show();
                $("#div01").hide();
                $("#div02").hide();
                $("#div03").hide();
                $("#div04").hide();
                $("#div05").hide();
                $("#div06").hide();
                $("#div07").hide();
                $("#div08").hide();
                $("#div09").hide();
                $("#div11").hide();
                $("#div12").hide();
                $("#div13").hide();
                $("#div14").hide();
                $("#div15").hide();
                $("#div16").hide();
                $("#div17").hide();
                $("#div18").hide();
                $("#div19").hide();
                $("#div20").hide();
            }else if(configOpt=='U_CAPITAL_FLOW_REVEAL_TYPE'){//用户账户资金流水记录展示类型
                $("#div11").show();
                $("#div01").hide();
                $("#div02").hide();
                $("#div03").hide();
                $("#div04").hide();
                $("#div05").hide();
                $("#div06").hide();
                $("#div07").hide();
                $("#div08").hide();
                $("#div09").hide();
                $("#div10").hide();
                $("#div12").hide();
                $("#div13").hide();
                $("#div14").hide();
                $("#div15").hide();
                $("#div16").hide();
                $("#div17").hide();
                $("#div18").hide();
                $("#div19").hide();
                $("#div20").hide();
            }else if(configOpt=='DEF_REGION'){//默认地区
                $("#div12").show();
                $("#div01").hide();
                $("#div02").hide();
                $("#div03").hide();
                $("#div04").hide();
                $("#div05").hide();
                $("#div06").hide();
                $("#div07").hide();
                $("#div08").hide();
                $("#div09").hide();
                $("#div10").hide();
                $("#div11").hide();
                $("#div13").hide();
                $("#div14").hide();
                $("#div15").hide();
                $("#div16").hide();
                $("#div17").hide();
                $("#div18").hide();
                $("#div19").hide();
                $("#div20").hide();
            }else if(configOpt=='PAY_TYPE_LOGO'){//支付方式LOGO配置
                $("#div13").show();
                $("#div01").hide();
                $("#div02").hide();
                $("#div03").hide();
                $("#div04").hide();
                $("#div05").hide();
                $("#div06").hide();
                $("#div07").hide();
                $("#div08").hide();
                $("#div09").hide();
                $("#div10").hide();
                $("#div11").hide();
                $("#div12").hide();
                $("#div14").hide();
                $("#div15").hide();
                $("#div16").hide();
                $("#div17").hide();
                $("#div18").hide();
                $("#div19").hide();
                $("#div20").hide();
            }else if(configOpt=='RECHARGE_PAY_TYPE'){//充值支付方式
                $("#div14").show();
                $("#div01").hide();
                $("#div02").hide();
                $("#div03").hide();
                $("#div04").hide();
                $("#div05").hide();
                $("#div06").hide();
                $("#div07").hide();
                $("#div08").hide();
                $("#div09").hide();
                $("#div10").hide();
                $("#div11").hide();
                $("#div12").hide();
                $("#div13").hide();
                $("#div15").hide();
                $("#div16").hide();
                $("#div17").hide();
                $("#div18").hide();
                $("#div19").hide();
                $("#div20").hide();
            }else if(configOpt=='HOT_CAR'){//热门车辆
                $("#div15").show();
                $("#div01").hide();
                $("#div02").hide();
                $("#div03").hide();
                $("#div04").hide();
                $("#div05").hide();
                $("#div06").hide();
                $("#div07").hide();
                $("#div08").hide();
                $("#div09").hide();
                $("#div10").hide();
                $("#div11").hide();
                $("#div12").hide();
                $("#div13").hide();
                $("#div14").hide();
                $("#div16").hide();
                $("#div17").hide();
                $("#div18").hide();
                $("#div19").hide();
                $("#div20").hide();
            }else if(configOpt=='HOT_ACTIVITY'){//热门活动
                $("#div16").show();
                $("#div01").hide();
                $("#div02").hide();
                $("#div03").hide();
                $("#div04").hide();
                $("#div05").hide();
                $("#div06").hide();
                $("#div07").hide();
                $("#div08").hide();
                $("#div09").hide();
                $("#div10").hide();
                $("#div11").hide();
                $("#div12").hide();
                $("#div13").hide();
                $("#div14").hide();
                $("#div15").hide();
                $("#div17").hide();
                $("#div18").hide();
                $("#div19").hide();
                $("#div20").hide();
            }else if(configOpt=='PC_CAR_FIND_TIME'){//PC端车辆查找展示租车时间类型
                $("#div17").show();
                $("#div01").hide();
                $("#div02").hide();
                $("#div03").hide();
                $("#div04").hide();
                $("#div05").hide();
                $("#div06").hide();
                $("#div07").hide();
                $("#div08").hide();
                $("#div09").hide();
                $("#div10").hide();
                $("#div11").hide();
                $("#div12").hide();
                $("#div13").hide();
                $("#div14").hide();
                $("#div15").hide();
                $("#div16").hide();
                $("#div18").hide();
                $("#div19").hide();
                $("#div20").hide();
            }else if(configOpt=='PC_CAR_FIND_CROWD_CAR'){//PC端车辆查找展示租车用车类型
                $("#div18").show();
                $("#div01").hide();
                $("#div02").hide();
                $("#div03").hide();
                $("#div04").hide();
                $("#div05").hide();
                $("#div06").hide();
                $("#div07").hide();
                $("#div08").hide();
                $("#div09").hide();
                $("#div10").hide();
                $("#div11").hide();
                $("#div12").hide();
                $("#div13").hide();
                $("#div14").hide();
                $("#div15").hide();
                $("#div16").hide();
                $("#div17").hide();
                $("#div19").hide();
                $("#div20").hide();
            }else if(configOpt=='CAR_MODELS'){//车辆车型
                $("#div19").show();
                $("#div01").hide();
                $("#div02").hide();
                $("#div03").hide();
                $("#div04").hide();
                $("#div05").hide();
                $("#div06").hide();
                $("#div07").hide();
                $("#div08").hide();
                $("#div09").hide();
                $("#div10").hide();
                $("#div11").hide();
                $("#div12").hide();
                $("#div13").hide();
                $("#div14").hide();
                $("#div15").hide();
                $("#div16").hide();
                $("#div17").hide();
                $("#div18").hide();
                $("#div20").hide();
            }else if(configOpt=='PC_CAR_FIND_TIME_DEF'){//PC端车辆查找展示租车时间类型默认选中类型
                $("#div20").show();
                $("#div01").hide();
                $("#div02").hide();
                $("#div03").hide();
                $("#div04").hide();
                $("#div05").hide();
                $("#div06").hide();
                $("#div07").hide();
                $("#div08").hide();
                $("#div09").hide();
                $("#div10").hide();
                $("#div11").hide();
                $("#div12").hide();
                $("#div13").hide();
                $("#div14").hide();
                $("#div15").hide();
                $("#div16").hide();
                $("#div17").hide();
                $("#div18").hide();
                $("#div19").hide();
            }
        });
    }
    /*
    * 配置
    * **/
    function addConfig(){
        var configType = $("select[name=configType]").val()//配置类型
        var bankType = $("select[name=bankType]").val()//默认卡类型
        var helpType = $("select[name=helpType]").val()//头部帮助菜单指定
        var split = $("input[name=learn]").val().split(",");//获取学历
        var x=[];
        for(var i=0; i<split.length; i++){
            x.push(split[i]);
        }
        var stringify = JSON.stringify(x);//最终学历格式数据["小学","初中"]
        var members = $("textarea[id=members]").val();//会员介绍图文详情
        var logistics = $("textarea[id=logistics]").val();//物流用车图文详情
        var official = $("textarea[id=official]").val();//公务用车图文详情
        //需要展示的网点地图状态
        var s='';
        var obj=document.getElementsByName('Fruit');
        for(var i=0; i<obj.length; i++){
            if(obj[i].checked){
                s+=obj[i].value+","; //如果选中，将value添加到变量s中
            }
        }
        var split2 = s.split(",");
        var b=[];
        for(var i=0; i<split2.length-1; i++){
            b.push(split2[i]);
        }
        var stringify2 = JSON.stringify(b);//网点地图状态格式数据["OPERATE","DISABLE"]
        var split3 = $("input[name=income]").val().split(",");//收入列表
        var income=[];
        for(var i=0; i<split3.length-1; i++){
            income.push(split3[i]);
        }
        var stringify3 = JSON.stringify(income);//收入列表格式数据["1000","3000"]
        var working = $("input[name=working]").val();//租车一周工作日
        var times='';//不同用户等级预约租车最多时长
        var putong = $("input[name=putong]").val();
        var jinka = $("input[name=jinka]").val();
        var baijin = $("input[name=baijin]").val();
        var zuanshi = $("input[name=zuanshi]").val();
        times=putong+','+jinka+','+baijin+','+zuanshi;
        var mone='';//用户账户资金流水记录展示类型
        var elementsByName = document.getElementsByName('moneys');
        for(var i=0; i<elementsByName.length; i++){
            if(elementsByName[i].checked){
                mone+=elementsByName[i].value+","; //如果选中，将value添加到变量s中
            }
        }
        var province = $("select[name=province]").val()//默认地区
        var pay='';//支付方式LOGO配置
        //取出sessionStorage key对应的value
        var id1=sessionStorage.getItem("1");
        var id2=sessionStorage.getItem("2");
        var id3=sessionStorage.getItem("3");
        var id4=sessionStorage.getItem("4");
        pay=id1+","+id2+","+id3+","+id4;
        var payWay='';//充值支付方式
        var elementsByName2 = document.getElementsByName('payWay');
        for(var i=0; i<elementsByName2.length; i++){
            if(elementsByName2[i].checked){
                payWay+=elementsByName2[i].value+","; //如果选中，将value添加到变量s中
            }
        }
        var split4 = payWay.split(",");
        var payWays=[];
        for(var i=0; i<split4.length-1; i++){
            payWays.push(split4[i]);
        }
        var stringify4 = JSON.stringify(payWays);//充值支付方式格式数据["ALI_PAY","WE_CHAT"]
        var ids = '';//热门车辆
        var obj = document.getElementsByName("key");
        for(var i=0;i<obj.length;i++){
            if(obj[i].checked) //取到对象数组后，我们来循环检测它是不是被选中
                ids+=obj[i].value+',';   //如果选中，将value添加到变量s中
        }
        var activity = '';//热门活动
        var elementsByName3 = document.getElementsByName("key2");
        for(var i=0;i<elementsByName3.length;i++){
            if(elementsByName3[i].checked) //取到对象数组后，我们来循环检测它是不是被选中
                activity+=elementsByName3[i].value+',';   //如果选中，将value添加到变量s中
        }

        var pcType='';//PC端车辆查找展示租车时间类型
        var elementsByName4 = document.getElementsByName('pcType');
        for(var i=0; i<elementsByName4.length; i++){
            if(elementsByName4[i].checked){
                pcType+=elementsByName4[i].value+","; //如果选中，将value添加到变量s中
            }
        }
        var split5 = pcType.split(",");
        var pcTime=[];
        for(var i=0; i<split5.length-1; i++){
            pcTime.push(split5[i]);
        }
        var stringify5 = JSON.stringify(pcTime);//PC端车辆查找展示租车时间类型格式数据["DAY","TIME"]

        var crowdCar='';//PC端车辆查找展示租车用车类型
        var elementsByName5 = document.getElementsByName('crowdCar');
        for(var i=0; i<elementsByName5.length; i++){
            if(elementsByName5[i].checked){
                crowdCar+=elementsByName5[i].value+","; //如果选中，将value添加到变量s中
            }
        }
        var split6 = crowdCar.split(",");
        var crowd=[];
        for(var i=0; i<split6.length-1; i++){
            crowd.push(split6[i]);
        }
        var stringify6 = JSON.stringify(crowd);//PC端车辆查找展示租车用车类型格式数据["PERSONAL","GOVERNMENT"]
        var split7 = $("input[name=models]").val().split(",");//车辆车型
        var models=[];
        for(var i=0; i<split7.length; i++){
            models.push(split7[i]);
        }
        var stringify7 = JSON.stringify(models);//车辆车型格式数据["卡车","面包车"]
        Project.ajax("/api/config/addConfig",{
                configOpt:configType,bankId:bankType,helpId:helpType,stringify:stringify,members:members,
                logistics:logistics,official:official,stringify2:stringify2,stringify3:stringify3,working:working,
                times:times,mone:mone,province:province,pay:pay,stringify4:stringify4,ids:ids,activity:activity,
                stringify5:stringify5,stringify6:stringify6,stringify7:stringify7
            }
        ).ajaxOK(function(data){
            sessionStorage.removeItem("1");
            sessionStorage.removeItem("2");
            sessionStorage.removeItem("3");
            sessionStorage.removeItem("4");
            sessionStorage.removeItem("id_dez");
        },true);
    }




    //富文本
    KindEditor.ready(function(K) {
        var content = $("textarea[name=context]");
        var editor1 = K.create(content, {

            cssPath : '${path}/kindEditor/plugins/code/prettify.css',

            uploadJson : '${path}/kindEditor/jsp/upload_json.jsp',

            fileManagerJson : '${path}/kindEditor/jsp/file_manager_json.jsp',
            themesPath : '${path}/kindEditor/themes/',
            langPath : '${path}/kindEditor/lang/',
            pluginsPath : '${path}/kindEditor/plugins/',

            allowFileManager : true,
            allowImageUpload : true,
            autoHeightMode : true,

            afterCreate : function() { //kindeditor创建后，将编辑器的内容设置到原来的textarea控件里
                this.sync();
            },
            afterChange : function() { //编辑器内容发生变化后，将编辑器的内容设置到原来的textarea控件里
                this.sync();
            },
            afterBlur : function() { //编辑器聚焦后，将编辑器的内容设置到原来的textarea控件里
                this.sync();
            }
        });
        prettyPrint();
    });

    /* 上传图片 */
    function showC(id) {
        $("#myModalLabel").text("添加图片(单张)");
        $('#myModal').modal();
        //将上传图片标识存入SessionStorage
        sessionStorage.setItem("id_dez",id);
    }
    function submitData() {
        //取出存入sessionStorage里边的标识
        var id_dez=sessionStorage.getItem("id_dez");
        //判断取出的标示是否有等于指定的值然后将图片链接以键值对存入sessionStorage里边
        if(null!=id_dez&&id_dez==1){
            sessionStorage.setItem(id_dez,urlList);
            urlList='';
        }else if(null!=id_dez&&id_dez==2){
            sessionStorage.setItem(id_dez,urlList);
            urlList='';
        }else if(null!=id_dez&&id_dez==3){
            sessionStorage.setItem(id_dez,urlList);
            urlList='';
        }else if(null!=id_dez&&id_dez==4){
            sessionStorage.setItem(id_dez,urlList);
            urlList='';
        }
    }


    //checkbox单选多选框
    function trigger() {

        if ($("#SelectAll").get(0).checked) {
            $("#car").find(":checkbox").prop("checked", true);
        } else {
            $("#car").find(":checkbox").prop("checked", false);
        }
    }
    function trigger2() {

        if ($("#SelectAll2").get(0).checked) {
            $("#activity").find(":checkbox").prop("checked", true);
        } else {
            $("#activity").find(":checkbox").prop("checked", false);
        }
    }
</script>
</body>
</html>