<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>用户主页面</title>
     <%@include file="../base/header.jsp" %>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户管理 <span class="c-gray en">&gt;</span> 推送列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <!-- 条件查询start -->
    <form id="From">
        <div class="text-c">
            &nbsp
            <span class="select-box inline">
		<select name="status" class="select" onchange="findUser()">
			<option value="">全部类型</option>
			<option value="0">即将推送</option>
			<option value="1">已推送</option>
			<option value="2">暂存</option>
		</select>
		</span>
            <input type="text" name="content" placeholder="内容" style="width:7%">
            <input type="text" name="id" placeholder="ID" style="width:7%">
            &nbsp日期范围：
            <input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="startTime" style="width: 10%; height: 30px" placeholder="开始时间" />
            -
            <input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="endTime" style="width: 10%; height: 30px" placeholder="结束时间" />

            </from>
            <a class="btn btn-success" onclick="findUser()"><i class="Hui-iconfont">&#xe665;</i> 查询</a>
            <a class="btn btn-success" onclick="creatPush()"><i class="Hui-iconfont">&#xe665;</i> 发布推送</a>
        </div>
        <!-- 条件查询end -->
        <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="1">本页共有:<strong id="size"></strong> 条</span> <span class="r">共有数据：<strong id="total"></strong> 条</span> </div>
        <div class="mt-20" >
            <table class="table table-border table-bordered table-bg table-hover" style="white-space: nowrap">
                <thead>
                <tr class="text-c">
                    <%--<th width="25"><input type="checkbox" name="" value=""></th>--%>
                    <th width="80">ID</th>
                    <th width="120">内容</th>
                    <th width="75">类型</th>
                        <th width="120">标题</th>
                        <th width="75">创建时间</th>
                        <th width="75">推送对象</th>
                    <th width="120">操作</th>

                </tr>
                </thead>
                <tbody id="goodList">
                </tbody>
            </table>
            <script type="text/html" id="f1">
                {{each data.list as good}}
                <tr>
                    <td style="text-align:center;vertical-align:middle;">{{good.id}}</td>
                    <td style="text-align:center;vertical-align:middle;">{{good.content}}</td>
                    <td style="text-align:center;vertical-align:middle;">
                        {{if good.status=="0"}}即将推送
                        {{else if good.type=="1"}}已推送
                        {{else if good.type =="2"}}暂存
                        {{else}}{{/if}}
                    </td>
                    <td style="text-align:center;vertical-align:middle;">{{good.title}}</td>
                    <td style="text-align:center;vertical-align:middle;">{{$timestampFormatYMDHM good.gmtDatetime}}</td>
                    <td style="text-align:center;vertical-align:middle;">
                        {{if good.status=="0"}}全部人员
                        {{else}}<a href="${path}/page/push/log/users?aim={{good.aim}}">查看详情</a>{{/if}}
                    </td>

                    <td style="text-align:center;vertical-align:middle;">
                        <img src="${path}/resources/static/h-ui/images/validform/iconpic-error.png" onClick="deleteP('{{good.id}}')" title="删除">
                        <img src="${path}/resources/static/h-ui/images/validform/iconpic-warning.png" onClick="updatePush('{{good.id}}')"  title="修改">
                        <img src="${path}/resources/static/h-ui/images/validform/iconpic-right.png" onClick="push('{{good.id}}')"  title="推送">
                    </td>

                </tr>
                {{/each}}
            </script>

        </div>

        <!-- 分页 -->
        <div class="pagination alternate" align="center">
            <ul id="page"></ul>
        </div>

        <script type="text/html" id="f2">
            <!-- 分页 -->
            {{if data.prePage==0}}
            <li class="disabled"><a>上一页</a></li>
            {{else}}
            <li class="disabled"><a onclick="findUser({{data.prePage}})">上一页</a></li>
            {{/if}}
            {{each data.navigatepageNums as n}}
            <li class="active"> <a onclick="findUser({{n}})">{{n}}</a> </li>
            {{/each}}
            {{if data.nextPage==0}}
            <li class="disabled"><a>下一页</a></li>
            {{else}}
            <li class="disabled"><a onclick="findUser({{data.nextPage}})">下一页</a></li>
            {{/if}}
        </script>

        <script type="text/javascript" src="${path}/resources/lib/jquery/1.9.1/jquery.min.js"></script>
        <script type="text/javascript" src="${path}/resources/lib/layer/2.1/layer.js"></script>
        <script type="text/javascript" src="${path}/resources/lib/My97DatePicker/WdatePicker.js"></script>
        <script type="text/javascript" src="${path}/resources/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="${path}/resources/static/h-ui/js/H-ui.js"></script>
        <script type="text/javascript" src="${path}/resources/static/h-ui.admin/js/H-ui.admin.js"></script>


        <script src="${path}/resources/js/jquery.js"></script>
        <script src="${path}/resources/js/template.js"></script>
        <script src="${path}/resources/js/common.js"></script>
        <script src="${path}/resources/js/promise.min.js"></script>
        <script src="${path}/resources/js/project.js"></script>
        <script src="${path}/resources/js/jquery.common.js"></script>
        <!-- 图片悬浮js -->
        <script type="text/javascript" src="${path}/resources/imgshow/js/async-share.js?ver=3.5.2"></script>
        <script type="text/javascript" src="${path}/resources/imgshow/js/default.include-footer.304291.js"></script>
        <!-- 日期控件 -->
        <script type="text/javascript" src="${path}/resources/datePicker/WdatePicker.js"></script>
        <script type="text/javascript">
            findUser();

            function findUser(pageNum){
                var fromList=$("#From").formSerialize();
                var p=$.extend({pageNum: pageNum},fromList);
                Project.ajax("/push/log/list",p).ajaxOK(function(data) {
                    $("#goodList").html(template("f1",data));//作用到表格
                    $("#page").html(template("f2",data));//作用到分页
                    $("#total").html(data.data.total);//作用到统计total
                    $("#size").html(data.data.size);//作用到统计每页显示size
                });
            }


            function deleteP(id) {//id为用户的id，obj没用到
                Project.ajax("/push/log/del/push", {id: id}).ajaxOK(function (data) {
                    layer.msg('成功!', {icon: 6, time: 1000});
                    findUser();//刷新
                });
            }

            /**
             * 弹出用户信息悬浮框
             * */
            function updatePush(id){
                var url = "${path}/page/push/log/update?id=" + id
                layer_show("修改",url,800,600);
            }
            function  creatPush() {
                window.location.href='${path}/page/push/log/push';
            }
            function  push(id) {
                Project.ajax("/push/log/push/msg", {id: id}).ajaxOK(function (data) {
                    layer.msg('成功!', {icon: 6, time: 1000});
                    findUser();//刷新
                });
            }
            


        </script>

</body>
</html>