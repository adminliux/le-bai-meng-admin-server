<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>用户主页面</title>
    <!-- 引入css -->
    <%@include file ="../base/header.jsp" %>
    <style>
        .activity_box{padding:20px}
        .activity_box p{padding:10px 0}
        input[type="radio"], input[type="checkbox"]{width:20px;}
    </style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 活动管理 <span class="c-gray en">&gt;</span> 活动列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <!-- 条件查询start -->
    <form id="From">
        <div class="text-c">
		<span class="select-box inline">
		<select id="activityState" name="activityState" class="select" onchange="status()">
            <option value="">全部</option>
			<option value="1">即将开始</option>
			<option value="2">活动中</option>
			<option value="3">活动结束</option>
		</select>
		</span>
            &nbsp
            <span class="select-box inline">
		<select id="setTime" name="setTime" class="select" onchange="findUser()">
			<option value="1">开始时间</option>
			<option value="2">结束时间</option>
		</select>
		</span>
            &nbsp
            <input type="text" name="activityId" placeholder="活动Id" style="width:7%">
            &nbsp

            </from>
            <a class="btn btn-success" onclick="solo_activity()" id = "aa"><i class="Hui-iconfont">&#xe665;</i> 搜索</a>
            <a class="btn btn-success" href="${path}/page/activity/add">发布活动</a>
        </div>
        <!-- 条件查询end -->
        <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="1">本页共有:<strong id="size"></strong> 条</span> <span class="r">共有数据：<strong id="total"></strong> 条</span> </div>
        <div class="mt-20" >
            <table class="table table-border table-bordered table-bg table-hover" style="white-space: nowrap" id="activity_list" class="text-c">

                <tr >
                    <%--<th width="25"><input type="checkbox" name="" value=""></th>--%>
                    <th width="200">活动ID</th>
                    <th width="120">活动标题</th>
                    <th width="120">活动主图</th>
                    <th width="120">开始时间</th>
                    <th width="120">结束时间</th>
                    <th width="120">报名选项</th>
                    <th width="120">活动详情</th>
                    <th width="120">作品数</th>
                    <th width="120">报名人数</th>
                    <th width="120">活动状态</th>
                    <th width="120">操作</th>
                </tr>


            </table>
            <%--<script type="text/html" id="f1">--%>
                <%--{{each data.list as good}}--%>
                <%--<tr>--%>
                    <%--<td style="text-align:center;vertical-align:middle;">{{good.activityId}}</td>--%>
                    <%--<td style="text-align:center;vertical-align:middle;">{{good.activityTitle}}</td>--%>
                    <%--<td style="text-align:center;vertical-align:middle;"></td>--%>
                    <%--<td style="text-align:center;vertical-align:middle;"></td>--%>
                    <%--<td style="text-align:center;vertical-align:middle;"></td>--%>
                    <%--<td style="text-align:center;vertical-align:middle;">--%>
                        <%--<u style="cursor:pointer" class="text-primary" onclick="layer_show('详情','${path}/page/video/pinlun?id={{good.id}}','800','600')"><font color="#4169e1">查看选项</font></u>--%>
                    <%--</td>--%>
                    <%--<td style="text-align:center;vertical-align:middle;">--%>
                        <%--<u style="cursor:pointer" class="text-primary" onclick="layer_show('详情','${path}/page/video/pinlun?id={{good.id}}','800','600')"><font color="#4169e1">查看详情</font></u>--%>
                    <%--</td>--%>
                    <%--<td style="text-align:center;vertical-align:middle;"></td>--%>
                    <%--<td style="text-align:center;vertical-align:middle;">--%>
                        <%--<u style="cursor:pointer" class="text-primary bmrs"  onclick=window.open('applicantList.jsp')><font color="#4169e1">12345</font></u>--%>
                    <%--</td>--%>
                    <%--<td style="text-align:center;vertical-align:middle;"></td>--%>

                    <%--<!-- 用户审核 -->--%>
                    <%--<td style="text-align:center;vertical-align:middle;">--%>
                        <%--<img src="${path}/resources/static/h-ui/images/validform/iconpic-error.png"--%>
                             <%--onClick="member_stop(this,'{{good.id}}')" title="加入待审核">--%>
                        <%--<a href="${path}/page/video/update/byid?id={{good.id}}"><font color="#5a98de">修改</font></a>--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <%--{{/each}}--%>
            <%--</script>--%>

        </div>

        <!-- 分页 -->
        <div class="pagination alternate" align="center">
            <ul id="page"></ul>
        </div>



        <%--<script type="text/html" id="f2">--%>
            <%--<!-- 分页 -->--%>
            <%--{{if data.prePage==0}}--%>
            <%--<li class="disabled"><a>上一页</a></li>--%>
            <%--{{else}}--%>
            <%--<li class="disabled"><a onclick="findUser({{data.prePage}})">上一页</a></li>--%>
            <%--{{/if}}--%>
            <%--{{each data.navigatepageNums as n}}--%>
            <%--<li class="active"> <a onclick="findUser({{n}})">{{n}}</a> </li>--%>
            <%--{{/each}}--%>
            <%--{{if data.nextPage==0}}--%>
            <%--<li class="disabled"><a>下一页</a></li>--%>
            <%--{{else}}--%>
            <%--<li class="disabled"><a onclick="findUser({{data.nextPage}})">下一页</a></li>--%>
            <%--{{/if}}--%>
        <%--</script>--%>

        <%@include file ="../base/footer.jsp" %>


        <script>
//            $(GetDataByActivityStatus());
//
//            function getDataByActivityStatus() {
//                $("#activityState").change(function() {
//                    var queryParam = $(this).val();
//                    $.ajax("http://www.easy-mock.com/mock/59eb650dfc9932195cba51f0/test/test", {
//                    type: "GET",
//                    error: function(error) {
//                        alert("错误~");
//                    },
//                    success: function(data) {
//                        console.log(data);
//                    }
//                })
//            })
//            }
//
//
//            var data = "";
//            $('.activityState').change(function(){
//                var opt = $('.activityState').val();
//
//                $.ajax(""+opt,{
//                    type:'',
//                    error:function(err){
//                        alert();
//                    },
//                    success:function (data) {
//                        data = data;
//                    }
//                })
//            })
        </script>


        <script type="text/javascript">

            $.ajax({
                type : "get",
               url : "https://api.ibailemeng.xyz/api/json/activity/query/activity/list",
                //   url:"http://localhost:8090/meng-api-1.0/api/json/activity/query/activity/list",
                cache: true,
                dataType:"json",
//                contentType: 'application/json;charset=utf-8',
                data:{"rageNow":1,"pageSize":50},
                success : function(data) {
                    var tables=$("#activity_list");
                    var list=data.data;
                    $("#total").text(list.length);
                    $("#size").html(list.size);
                    $("#activity_list  tr:not(:first)").empty();
                    for(var index = 0; index < list.length; ++index){

                        Date.prototype.toLocaleString = function() {
                            return this.getFullYear() + "-" + (this.getMonth() + 1) + "-" + this.getDate();
                        };

                        var args = new Array();
                        args[0] = list[index].id;
                        args[1] = list[index].name;
                        args[2] = "<img src='"+ list[index].imgUrl+"' style='width: 90px;height: 60px'>";
                        args[3] = new Date(list[index].startDate).toLocaleString();
                        args[4] = new Date(list[index].endDate).toLocaleString();
                        args[5] = "<a onclick='enroll(this.title)' title='"+list[index].str+"'>查看选项</a>";
                        var awards = list[index].awards;
                        var way = list[index].way;
                        args[6] = "<a onclick='activity_detail(this.title,this.id,this.name,this.rel,this.type)' " +
                            "title='"+list[index].process+","+awards+","+way+"' id='"+list[index].judge+"' name='"+list[index].require+"' rel='"+list[index].sponsor+"' " +
                            "type='"+list[index].statement +" '>查看详情</a>";
                        args[7] = "<a href='${path}/page/activity/applicant/list?id="+list[index].id+"'>"+list[index].vedioSum+"</a>";
                        args[8] = "<a href='${path}/page/activity/applicant/list?id="+list[index].id+"'>"+list[index].activityManSum+"</a>";
                        if(list[index].status==1){
                            args[9] = '即将开始';
                        }else if(list[index].status==2){
                            args[9] = '正在进行';
                        }else if(list[index].status==3){
                            args[9] = '已结束';
                        }else if(list[index].status==0){
                            args[9] = '撤销活动';
                        }

                        args[10] = "<img src='${path}/resources/static/h-ui/images/validform/iconpic-error.png' id='"+list[index].id+"' title='删除' onclick='Delete(this.id)' />" +
                            "<button type='button' class='btn btn-success' onclick='update("+list[index].id+")'>修改</button>";

                        var row = tables[0].insertRow();
                        insertRowToTable(row,args);
                    }

                }
            });
            /**
             * 弹出用户信息悬浮框
             * */
            function member_show(title,url,id,w,h){
                layer_show(title,url,w,h);
            }


            //图片悬浮事件处理
            function biggerr() {
                jQuery(".sit-preview").smartImageTooltip({
                    previewTemplate : "simple",
                    imageWidth : "350px"
                });
            }

//            function bmrs(){
//                var bmrs = $('.bmrs').val();
//                window.loaction.href = "";
//            }
            function insertRowToTable(row,args){
                for (var index = 0; index < args.length; ++index) {
                    var cell = row.insertCell();
                    cell.innerHTML=args[index];
                }
            }


            function activity_detail(title,id,name,rel,type){
                var str = title.split(',');
                layer.open({
                    type: 1,
                    area: ['600px','400px'],
                    fix: false, //不固定
                    maxmin: true,
                    shade:0.4,
                    title: '活动详情',
                    content: "<div class='activity_box'>" +
                    "<div><h3>活动流程</h3><p>"+str[0]+"</p></div>" +
                    "<div><h3>评判方式</h3><p>"+id+"</p></div>" +
                    "<div><h3>参赛要求</h3><p>"+name+"</p></div>" +
                    "<div><h3>主办单位</h3><p>"+rel+"</p></div>" +
                    "<div><h3>活动声明</h3><p>"+type+"</p></div>" +
                    "<div><h3>参赛方式</h3><p>"+str[1]+"</p></div>" +
                    "<div><h3>奖项设置</h3><p>"+str[2]+"</p></div>" +
                    "</div>"
                });
            }

            function enroll(title){
                var arr = new Array();
                arr[0]= title.substr(0,1);
                arr[1] = title.substr(1,1);
                arr[2] = title.substr(2,1);
//                arr[3] = title.substr(3,1);
//                arr[4] = title.substr(4,1);
//                arr[5] = title.substr(5,1);

                var html = "<div>  " +
                    "<div class='formControls col-xs-8 col-sm-9 apply'> " +
                    "<input type='checkbox' class='input-text'  "+getStr(arr[0])+" name='apply'/>是否团体赛" +
                    "<input type='checkbox' class='input-text' "+getStr(arr[1])+" name='apply'/>是否分赛区" +
                    "<input type='checkbox' class='input-text' "+getStr(arr[2])+" name='apply'/>是否线下比赛<br> " +
//                    "<input type='checkbox' class='input-text' "+getStr(arr[3])+" name='apply'/>参赛者联系方式 " +
//                    "<input type='checkbox' class='input-text' "+getStr(arr[4])+" name='apply'/>参赛者身份证号" +
//                    "<input type='checkbox' class='input-text' "+getStr(arr[5])+" name='apply'/>参赛者所在地" +
                    "</div></div>";

                layer.open({
                    type: 1,
                    area: ['550px','200px'],
                    fix: false, //不固定
                    maxmin: true,
                    shade:0.4,
                  title: '报名选项',
                    content: html,
                    success: function(layero, index){

                    }
                });
                
            }
            function  getStr(i) {
                if(i==3){
                    return "checked=checked"
                }
                return "";
            }


            function  solo_activity() {
//                   $.ajax({type:"get" ,url :"http://localhost:8090/meng-api-1.0/api/json/web/regist/get/open/id/after/pay?code=100",success : function(data) {
//                       alert(JSON.stringify(data));
//                   }});

                    var id=$('input[name=activityId]').val();
                var status=$('select[name=activityState]').val();
                var setTime=$('select[name=setTime]').val();
                $.ajax({
                    type : "get",
                     url : "https://api.ibailemeng.xyz/api/json/activity/query/activity/list",
                  // url:"http://localhost:8090/meng-api-1.0/api/json/activity/query/activity/list",
                    cache: true,
                    dataType:"json",
//                contentType: 'application/json;charset=utf-8',
                    data:{"rageNow":1,"pageSize":50,"id":id,"status":status},
                    success : function(data) {
                        var tables=$("#activity_list");
                        var list=data.data;
                        $("#total").text(list.length);
                        $("#size").html(list.size);
                        $("#activity_list  tr:not(:first)").empty();
                        for(var index = 0; index < list.length; ++index){

                            Date.prototype.toLocaleString = function() {
                                return this.getFullYear() + "-" + (this.getMonth() + 1) + "-" + this.getDate();
                            };

                            var args = new Array();
                            args[0] = list[index].id;
                            args[1] = list[index].name;
                            args[2] = "<img src='"+ list[index].imgUrl+"' style='width: 90px;height: 60px'>";
                            args[3] = new Date(list[index].startDate).toLocaleString();
                            args[4] = new Date(list[index].endDate).toLocaleString();
                            args[5] = "<a onclick='enroll(this.title)' title='"+list[index].str+"'>查看选项</a>";
                            var awards = list[index].awards;
                            var way = list[index].way;
                            args[6] = "<a onclick='activity_detail(this.title,this.id,this.name,this.rel,this.type)' " +
                                "title='"+list[index].process+","+awards+","+way+"' id='"+list[index].judge+"' name='"+list[index].require+"' rel='"+list[index].sponsor+"' " +
                                "type='"+list[index].statement +" '>查看详情</a>";
                            args[7] = "<a href='${path}/page/activity/applicant/list?id="+list[index].id+"'>"+list[index].vedioSum+"</a>";
                            args[8] = "<a href='${path}/page/activity/applicant/list?id="+list[index].id+"'>"+list[index].activityManSum+"</a>";
                            if(list[index].status==1){
                                args[9] = '即将开始';
                            }else if(list[index].status==2){
                                args[9] = '正在进行';
                            }else if(list[index].status==3){
                                args[9] = '已结束';
                            }else if(list[index].status==0){
                                args[9] = '撤销活动';
                            }

                            args[10] = "<img src='${path}/resources/static/h-ui/images/validform/iconpic-error.png' id='"+list[index].id+"' title='删除' onclick='Delete(this.id)' />" +
                                "<button type='button' class='btn btn-success' onclick='update("+list[index].id+")'>修改</button>";

                            var row = tables[0].insertRow();
                            insertRowToTable(row,args);
                        }

                    }
                });
            }
            function Delete(id){
                layer.confirm('确认要把该活动删除吗？',function(index) {
                    $.ajax({
                        type: "post",
                        url: 'https://api.ibailemeng.xyz/api/json/activity/del/activity ',
                      //  url:'http://localhost:8090/meng-api-1.0/api/json/activity/del/activity',
                        dataType: "json",
                        data: {"id": id},
                        success: function (data) {
                            if (data.code == 'SUCCESS') {
                                alert("删除成功");
                                history.go(0);
                            }
                        }
                    });
                });
            }
            function update(id){
                layer_show('详情','${path}/page/activity/update/activity?id='+id,'800','600');
            }



        </script>

</body>
</html>