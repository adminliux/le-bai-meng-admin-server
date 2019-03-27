
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>意见反馈</title>
    <%@include file="../base/header.jsp"%>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 课程管理 <span class="c-gray en">&gt;</span> 拼团列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <form id="From">
        <div class="text-c">
            &nbsp日期范围：
            <input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="startTime" style="width: 10%; height: 30px" placeholder="开始时间" />
            &nbsp至：
            <input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="endTime" style="width: 10%; height: 30px" placeholder="开始时间" />

            <%--&nbsp课程名称:
            <input type="text" name="roomTitle" placeholder="课程名称" style="width:7%">--%>
            <a class="btn btn-success" onclick="findUser()" id = "aa"><i class="Hui-iconfont">&#xe665;</i>搜索</a>
          <%--  <a class="btn btn-success" href="${path}/page/collage/add">发布拼团</a>--%>
        </div>
    </form>

    <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="1">本页共有:<strong id="size"></strong> 条</span> <span class="r">共有数据：<strong id="total"></strong> 条</span> </div>
    <div class="mt-20" >
        <table class="table table-border table-bordered table-bg table-hover" style="white-space: nowrap">
            <thead>
            <tr class="text-c">
                <th width="200">ID</th>
                <th width="200">手机号</th>
                <th width="120">用户</th>
                <th width="120">内容</th>
                <th width="120">创建时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody   id="goodList">
            </tbody>
        </table>
        <script type="text/html" id="f1">
            {{each data.list as good}}
            <tr>
                <td style="text-align:center;vertical-align:middle;">{{good.id}}</td>
                <td style="text-align:center;vertical-align:middle;">{{good.way}}</td>
                <td style="text-align:center;vertical-align:middle;">{{if good.nickName==NULL}}{{else}}{{good.nickName}}{{/if}}</td>
               <td style="text-align:center;vertical-align:middle;">{{good.content}}</td>
                <td style="text-align:center;vertical-align:middle;">{{$timestampFormatYMDHM good.gmtDatetime}}</td>

                <td style="text-align:center;vertical-align:middle;">
                    <a  onclick="member_stop(this,'{{good.id}}')">删除</a>
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
        {{else}}<li class="disabled"><a onclick="findUser({{data.prePage}})">上一页</a></li>
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
    <%@include file ="../base/footer.jsp" %>


    <script>
        findUser();
        function findUser(pageNum) {
            var fromList=$("#From").formSerialize();
            var p=$.extend({pageNum: pageNum},{status: status},fromList);

            Project.ajax("/feedback/list",null,null,true).ajaxOK(function(data) {
                console.log(data.data)
                $("#goodList").html(template("f1",data));//作用到表格
                $("#page").html(template("f2",data));//作用到分页
                $("#total").html(data.data.total);//作用到统计total
                $("#size").html(data.data.size);//作用到统计每页显示size
                //  biggerr();//初始页
                // 面调用图片悬浮放大方法
            });
        }

        function member_stop(obj,id){//id为用户的id，obj没用到
            var fd = new FormData();
            fd.append("id",id);
            layer.confirm('确认要把该意见放入回收站吗？',function(index){
                Project.ajaxUploadVideoFile('/feedback/del', fd, {}, true).ajaxOK(function (data) {
                    //  history.go();
                    //  top.location = "/page/collage/list";
                    layer.msg(data.msg,{icon: 6,time:3000});
                    findUser();//刷新
                }, true);
            });
        }




    </script>

</div>
</body>