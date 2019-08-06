<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
    <!-- 引入css -->
    <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <script src="${path}/resources/js/common.js"></script>

    <script src="${path}/resources/js/mui.min.js"></script>

    <script type="text/JavaScript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <!--标准mui.css-->
    <link rel="stylesheet" href="${path}/resources/css/mui.min.css">
    <!--App自定义的css-->
    <%--<link rel="stylesheet" type="text/css" href="css/app.css" />--%>

    <style>
        body {
            margin: 0;
        }
        .clearfix:after {
            content: '';
            display: table;
            clear: both;
        }
        #classContainer {
            min-height: 100vh;
            padding-bottom: 66px;
        }
        .online-count {
            position: absolute;
            left: 18px;
            top: 16px;
            z-index: 6;
            color: #fff;
            font-size: 10px;
        }
        #div_1 {
            width: 0px;
            height: 0px;
            background: red;
            position: fixed;
            left: 50%;
            top:100px;
            z-index: 1003;
        }
        /*移除底部或顶部三角,需要在删除此代码*/
        .mui-popover .mui-popover-arrow:after {
            width: 0px;
        }
    </style>


</head>
<body>

<div style="width:100%;height: 100%">
      <div style="position: relative;height: auto;width: 100%;background:url('http://blm-1253916064.cossh.myqcloud.com/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20180814124602.png') "
           ><div class="online-count" id="onlineNum"></div>
          <img id="imgStr" width="100%"  src="" alt=""> </div>


    <div style="height: 50px;border: solid 4px #7FB7BA; " >
         <div id="act" style="width: 49%;float: left;text-align: center; line-height: 40px;cursor:pointer;border-right: solid 1px #7FB7BA;" onclick="changeColor(this)">
            <font id="id1" style="color: #7FB7BA;font-size: 20px;font-weight: 400">活动详情</font>
         </div>
        <div id="rank" style="width: 49%;float: left;text-align: center; line-height: 40px;cursor:pointer" onclick="changeColor(this)">
            <font id="id2" style="font-size: 20px;font-weight: 400 ">作品排名</font>
        </div>
    </div>

    <div id="classContainer" class="clearfix"  style="width: 100%">
<%--        <div style="width: 100%;background-color: #7FB7BA;height:50%;">
            <div style="margin-left: 10%;width: 80%;text-align:center;height: 25%">
            七夕乞巧节，你的才艺天上的织女都会来品评！<br>
            是时候展现自己了！<br>
            盟友们，<br>
            赶快分享给更多的好友知道吧
            </div>
            <div style="margin-left: 10%;width: 80%;text-align:center;height: 25%;background-color: white;border-radius:10px;">
                <div style="text-align: center;margin-top: 1%;height: 5%">
                     <font style="color:  #7FB7BA;font-size: 16px">活动奖励</font>
                </div>
                <img src="http://blm-1253916064.cossh.myqcloud.com/system_pic/fallow%402x.png" style="width: 50%;margin-left: 10%">
                 <div style="margin-left: 5%;text-align: left">
                    <font style="font-size: 12px">活动期间，集满100朵花排名前10的作品可获得“首页</font><br>
                     <font style="font-size: 12px"> 置顶显示”以及宜阁酸奶机一台。</font>
                 </div>
            </div>

            <div style="margin-left: 10%;width: 80%;height: 10%;background-color: white;border-radius:20px;margin-top: 5%">
                <span style="margin-left: 8%">
                    <font style="font-size: 16px;">活动时间</font>
                </span>
                <span >
                    2018年8月14日至2018年8月21日
                </span>
            </div>
            <div style="margin-left: 10%;width: 80%;text-align:center;height: 7%;margin-top: 4%">
                <font style="font-size: 13px;">一切联系小萌姐:18657-114-114</font>
            </div>

            <div style="margin-left: 10%;width: 80%;text-align:center;height: 7%;margin-top: 1%">
               <span style="width:100px;height:1px;">参赛方式</span>
            </div>


              <div style="background-color: red;height: 50px;" onclick="regist()">
                           <span style="font-size: 24px;margin-left: 40%;color: white;width: 40%">我要报名</span>
               </div>
        </div>--%>


    </div>
</div>

<div id="div_1"></div>
<div id="popover" class="mui-popover" style="top: 20%;height: 280px;position: fixed;z-index: 1003;left: 5%;background-color: #fff;text-align: center;">
    <div class="mui-popover-arrow"></div>
    <div style="margin: 10px 20px;width:100px;float: left;font-weight: bold"> 报名信息</div>
    <br>
    <br>
    <input type="text" style="margin: 10px 20px;width: 250px" placeholder="请输入姓名" id="name"> <br>
    <input type="text" style="margin: 10px 20px;width: 250px"  placeholder="请输入身份证号(投保用)"  id="cid"> <br>
    <input type="button" value="确定" onclick="baom()">
</div>

<%@include file="../base/footer.jsp"%>
<script type="text/javascript">
    var id = cm.getParam("id"),  //课程id
        phone = cm.getParam("phone"), //手机号
        state = cm.getParam("state"),
        code = cm.getParam("code"),
        isEnding = false, //活动是否结束，true为结束
        signPrice = 0,//报名费
        isJoin =  false,  //是否已报名
        APPID = 'wx22dd9b6e8b6c0b79',
        forH5UserId = '',
        APPSECRET = '2256FF3184300FAC861A91970CB7F58C',
        RESPONSE_TYPE = 'code',
        SCOPE = 'snsapi_userinfo',
        // REDIRECT_URL = 'http://192.168.0.108:8091/page/activity/editor';
       REDIRECT_URL = 'http://h5.ibailemeng.xyz/fx/activityDetial.html';
    var u = navigator.userAgent;
    init()
    //判断是啥类型Android IOS，h5
    function judgeDeviceType(){
        if (u.toLowerCase().match(/MicroMessenger/i) == "micromessenger") {
            return "h5";
         }else  if(u.indexOf('iPhone') > -1 || u.indexOf('iPad') > -1 || !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/)) {
           return  "IOS";
         }else if (u.indexOf('Android') > -1) {
            return "Android";
         }else  if(u.indexOf('AppleWebKit') > -1){
            return "WebKit";
        }
    }

    //页面初始化
    function init(){
        mui.init();
        var type = judgeDeviceType()
        if("h5" == type)
            actH5()
        else
            initPage()
    }

    function actH5(){
        if(id!=null){
            var para = id
            alert("https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + APPID + "&redirect_uri=" + encodeURI(REDIRECT_URL) + "&response_type=" + RESPONSE_TYPE + "&scope=" + SCOPE + "&state=" + para + "#wechat_redirect");
            window.location.href = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + APPID + "&redirect_uri=" + encodeURI(REDIRECT_URL) + "&response_type=" + RESPONSE_TYPE + "&scope=" + SCOPE + "&state=" + para + "#wechat_redirect";
        }else{
            alert("state :" + state+"code :" +code );
            id = state;
            initPage()
        }
    }

    function  initPage(){
        var type = judgeDeviceType()
        var url =  "https://api.ibailemeng.xyz/api/json/activity/query/activitybyid"
        var para =  {"id": id,"phone": phone}
        if("h5" == type) {
            url =   "https://api.ibailemeng.xyz/api/json/activity/query/activity/bycode"
            para =  {"id": id,"code": code}
        }

        document.getElementById("id1").style.color="#7FB7BA"
        document.getElementById("id2").style.color="#2B2B2B"
        document.getElementById("classContainer").style.backgroundColor= ""
        $.ajax({
            type: "get",
            //   url: "https://api.ibailemeng.xyz/api/json/activity/query/activitybyid",
            url:url,
            cache: true,
            dataType: "json",
            data: para,
            success: function (data) {
                if(data.data == null) {
                    alert("活动不存在");
                    return ;
                }
                var timestamp = Date.parse(new Date());
                if(timestamp >= data.data.endDate){
                    isEnding = true;
                }
                alert(JSON.stringify(data.data));
                if("h5" ==  type) forH5UserId = data.data.forH5UserId
                isJoin = data.data.join
                signPrice = data.data.signPrice
                $('#classContainer').append(actDetail(data.data.statement,isEnding));
                document.getElementById("imgStr").src = data.data.imgUrl
                var sum = data.data.activityManSum +100
                document.getElementById("onlineNum").innerText = "在线人数:"+sum
            }
        });
    }
   //报名
    function regist() {
        var type = judgeDeviceType()
           if(isEnding)    return ;
           if (isJoin)    uploadJob()
               else    mui("#popover").popover('toggle', document.getElementById("div_1"));
            if(type=="IOS")  registIOS(isJoin);
           else if (type=="Android")  test.registAnd(isJoin);
    }

    function   uploadJob() {

        layer.open({
            type: 1,
            area: ['350px','300px'],
            fix: false, //不固定
            maxmin: true,
            shade:0.4,
            btn: ['确定', '取消'], //按钮组
            yes:function(index,layer){
                var actTitle = document.getElementById("actTitle").value;
                var actType =   document.getElementById("actType").value;
                var actVideo =   document.getElementById("actVideo").value;
                var actImg =   document.getElementById("actImg").value;
                $.ajax({
                    type: "post",
                      url: "https://api.ibailemeng.xyz/api/json/web/regist/activity/pay",
                    //  url:"http://192.168.0.108:8090/meng-api-1.0/api/json/web/regist/activity/pay",
                    cache: true,
                    dataType: "json",
                    data: {"forH5UserId":forH5UserId,"acivityId": id,"cid":cid,"name": name},
                    success: function (data) {
                        window.location.href =  REDIRECT_URL +"?id="+id
                    }
                });

            },btn2: function(index, layer){
                document.getElementById("name").value = ""
                document.getElementById("cid").value = ""
            },
            title: '上传作品选项',

            content: '<div style="margin: 10px 20px;width100px;float: left">标题:</div>'+'<input type="text" style="margin: 10px 20px;width: 250px" id="actTitle"> <br>'+
            '<div style="margin: 10px 20px; width100px;float: left" >类别:</div>'+'<input type="text" style="margin: 10px 20px;width: 250px" id="actType"> <br>'+
            '<div style="margin: 10px 20px; width100px;float: left" >视频:</div>'+'<input type="file" style="margin: 10px 20px;width: 250px" id="actVideo"> <br>' +
            '<div style="margin: 10px 20px; width100px;float: left" >首图:</div>'+'<input type="file" style="margin: 10px 20px;width: 250px" id="actImg"> <br>' ,
            success: function(layer, index){
            }
        });
    }

    function showDliaog(){
        alert(1);
        layer.open({
            type: 1,
            area: ['350px','300px'],
            fix: false, //不固定
            maxmin: true,
            shade:0.4,
            btn: ['确定', '取消'], //按钮组
            yes:function(index,layer){
                var name = document.getElementById("name").value;
                var cid =   document.getElementById("cid").value;
                $.ajax({
                    type: "post",
                      url: "https://api.ibailemeng.xyz/api/json/web/regist/activity/pay",
                   // url:"http://192.168.0.108:8090/meng-api-1.0/api/json/web/regist/activity/pay",
                    cache: true,
                    dataType: "json",
                    data: {"code":code,"acivityId": id,"cid":cid,"name": name},
                    success: function (data) {
                        window.location.href =  REDIRECT_URL +"?id="+id
                    }
                });

                var data = {"code":code,"acivityId": id,"cid":cid,"name": name};
                alert(JSON.stringify(data));
                Project.ajaxUploadVideoFile('/web/regist/activity/pay', data).ajaxOK(function (data) {
                    window.location.href =  REDIRECT_URL +"?id="+id
                }, true);

            },btn2: function(index, layer){
                document.getElementById("name").value = ""
                document.getElementById("cid").value = ""
            },
            title: '报名选项',
            content: '<div style="margin: 10px 20px;width100px;float: left">姓&nbsp&nbsp&nbsp&nbsp名 :</div>'+'<input type="text" style="margin: 10px 20px;width: 250px" id="name"> <br>'+
            '<div style="margin: 10px 20px; width100px;float: left" >身份证 :</div>'+'<input type="text" style="margin: 10px 20px;width: 250px" id="cid"> <br>',
            success: function(layer, index){
            }
        });
    }

    function getPlayVideos(vid) {
        var type = judgeDeviceType()
        if("IOS" ==type){
            getVideos(vid);
        }else if ("Android" ==type){
            test.getVideos(vid);
        }else if ("h5" ==type ) {
            window.location.href = "http://h5.ibailemeng.xyz/html/videoPlay.html?id=" + vid;
        }
    }

    function changeColor(obj){
        $('#classContainer').html("");
        if(obj.id =="act" ){
          document.getElementById("id1").style.color="#7FB7BA";
          document.getElementById("id2").style.color="#2B2B2B";
          document.getElementById("classContainer").style.backgroundColor= "";
            $.ajax({
                type: "get",
                url :"https://api.ibailemeng.xyz/api/json/activity/query/activitybyid",
              //  url: "http://192.168.0.108:8090/meng-api-1.0/api/json/activity/query/activitybyid",
                cache: true,
                dataType: "json",
                data: {"id": id},
                success: function (data) {
                    $('#classContainer').append(actDetail(data.data.statement,isEnding));
                }
            });
        }else{
            document.getElementById("id2").style.color="#7FB7BA";
            document.getElementById("id1").style.color="#2B2B2B";
            document.getElementById("classContainer").style.backgroundColor="#c7f0ff";
            $.ajax({
                type: "get",
              //  url: "http://192.168.0.108:8090/meng-api-1.0/api/json/video/get/video",
                url :"https://api.ibailemeng.xyz/api/json/video/get/video",
                cache: true,
                dataType: "json",
                data: {"activityId": id},
                success: function (data) {
                    var list=data.data;
                    var tmp = ''
                    for(var index = 0; index < list.length; ++index){
                        tmp += htmlTemplate(list[index])
                    }
                    if(!isEnding)
                        tmp += addDiv()

                    $('#classContainer').append(tmp)
                }
            });
        }
    }

   function addDiv() {
        var msg = "我要报名";
        if(isJoin)  msg = "上传作品"
        alert(msg)
       return '<div style="background-color: red;height: 50px;z-index: 9999; position: fixed ! important;bottom: 0px;left: 0;\n' +
           '    width: 100%;" onclick="regist()">\n' +
           '<span style="font-size: 24px;margin-left: 40%;color: white;width: 40%;line-height:2">'+msg+'</span>\n'+
           '            </div>';
   }


    function actDetail(str,isEnding){
        var  dvis  =  "";
        var msg = "我要报名";
        if(isJoin)  msg = "上传作品"
        if(!isEnding){
            return str +
            '   <div style="background-color: red;height: 50px;z-index: 9999; position: fixed ! important;bottom: 0px;\n' +
            '    width: 100%;" onclick="regist()">\n' +
            '<span style="font-size: 24px;margin-left: 40%;color: white;width: 40%;line-height:2">'+msg+'</span>\n'+
            '            </div>';
        }

        return str ;
    }

    function htmlTemplate(data) {
        return '<div style="margin-top: 8px;width: 49%;float: left">\n' +
            '            <div style="margin-left: 6%;clear: both;margin-top: 7px;">\n' +
            '                <img style="height: 120px;width: 92%;" data-name="previewImg" src="'+data.previewImg+'"  onclick="getPlayVideos('+data.id+')" >\n' +
            '            </div>\n' +
            '            <div style="margin-left:6%;width: 92%;font-size: 16px;color: rgb(51,51,51);white-space:nowrap;height:40px; overflow:hidden;text-overflow:ellipsis;line-height: 40px;background-color: white">\n' +
            '                <span style="margin-left: 2%">' + data.title + '</span>\n' +
            '                <span data-name="roomTitle">富春江瑜伽研修一班</span>\n' +
            '            </div>\n' +
            '\n' +
            '            <div style="margin-left: 6%;max-width: 94%;font-size: 12px;color: rgb(153, 153, 153);font-weight: 100;background-color: white;margin-top: 4px;">\n' +
            '                <div style="float: left;margin-left:2%;">\n' +
            '                    <img style="height: 20px;width: 20px;" src="http://blm-1253916064.cossh.myqcloud.com/shouye-bofang%402x.png">\n' +
            '                </div>\n' +
            '                <div style="float: left;margin-left:3px;height: 20px;width:24%">\n' +
            '                    <span name="times" style="margin-left: 10px;text-align: center; line-height:20px;">' + data.giveStr + '</span>\n' +
            '                </div>\n' +
            '                <div style="float: left;margin-left: 12px;">\n' +
            '                    <img style="height: 22px;" src="http://blm-1253916064.cossh.myqcloud.com/rose.icon%20%E6%8B%B7%E8%B4%9D%204%403x.png" >\n' +
            '                </div>\n' +
            '                <div style="float: left;margin-left: 1%;height:20px;width: 24%">\n' +
            '                    <span name="flowers" style="margin-left: 5px;text-align: center; line-height:20px;width: auto">' + data.praiseStr + '</span>\n' +
            '                </div>\n' +
            '            </div>\n' +
            '        </div>' ;
    }

</script>

</body>
</html>
