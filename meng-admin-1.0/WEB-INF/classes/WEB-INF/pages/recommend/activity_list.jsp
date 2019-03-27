<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>用户主页面</title>
    <%@include file="../base/header.jsp"%>
</head>
<body>
<div class="page-container">
<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="1">本页共有:<strong id="size"></strong> 条</span> <span class="r">共有数据：<strong id="total"></strong> 条</span> </div>
<div class="mt-20" >
    <table class="table table-border table-bordered table-bg table-hover" style="white-space: nowrap" id="activity_list" class="text-c">
        <thead>
        <tr >
            <%--<th width="25"><input type="checkbox" name="" value=""></th>--%>
                <th width="80">操作</th>
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
        </tr>
        </thead>
        <tbody id="goodList">
        </tbody>
    </table>
    <script type="text/html" id="f1">
        <tr>
            <td style="text-align:center;vertical-align:middle;"><a href="${path}/page/activity/update/byid?id={{data.id}}"><font color="#5a98de">修改</font></a></td>
            <td style="text-align:center;vertical-align:middle;">{{data.id}}</td>
            <td style="text-align:center;vertical-align:middle;">
                {{data.name}}
            </td>
            <td>{{if data.previewImg==NULL}}无{{else if data.previewImg!=NULL}}<a class="sit-preview" href="{{data.img_url}}" onMouseOver="biggerr()"><img src="{{data.img_url}}" data-preview-url="{{data.img_url}}" style="cursor:pointer;width:60px;height:60px;"/></a>{{/if}}</td>
            <td style="text-align:center;vertical-align:middle;">{{$timestampFormatYMDHM data.startDate}}</td>
            <td style="text-align:center;vertical-align:middle;">{{$timestampFormatYMDHM data.endDate}}</td>
            <td style="text-align:center;vertical-align:middle;">详细</td>
            <td style="text-align:center;vertical-align:middle;">活动详情</td>
            <td style="text-align:center;vertical-align:middle;">{{data.activityManSum}}</td>
            <td style="text-align:center;vertical-align:middle;">{{data.vedioSum}}</td>
            <td style="text-align:center;vertical-align:middle;">
                {{if data.status=="1"}}
                <span class="label badge-warning radius">即将开始</span>
                {{else if data.status=='2'}}
                <span class="label badge-primary radius">正在进行</span>
                {{else if data.status=='3'}}
                <span class="label badge-success radius">已结束</span>
                {{else if data.status=='3'}}
                <span class="label badge-success radius">撤销活动</span>
                {{/if}}

            </td>
        </tr>
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
</div>
</div>
</body>
<%@include file="../base/footer.jsp"%>
<script  type="text/javascript">
    findUser();
    function findUser(){
        var status="AUDITED";
        var id='${id}';

        Project.ajax("/activity/query/activitybyid",{id:id,status: status},null,true).ajaxOK(function(data) {
            $("#goodList").html(template("f1",data));//作用到表格
            $("#page").html(template("f2",data));//作用到分页
            $("#total").html(data.data.total);//作用到统计total
            $("#size").html(data.data.size);//作用到统计每页显示size
            biggerr();//初始页
            // 面调用图片悬浮放大方法
        });
    }


   /* $.ajax({
        type : "get",
        url : "https://api.ibailemeng.com/api/json/activity/query/activity/list",
       //  url : "http://localhost:8090/meng-api-1.0/api/json/activity/query/activity/list",
        cache: true,
        dataType:"json",
//                contentType: 'application/json;charset=utf-8',
        data:{"rageNow":1,"pageSize":50},
        success : function(data) {

            var tables=$("#activity_list");
            var list=data.data;
            $("#total").text(list.length);
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
                args[6] = "<a onclick='activity_detail(this.title,this.id,this.name,this.rel,this.type)' title='"+list[index].process+"' id='"+list[index].judge+"' name='"+list[index].require+"' rel='"+list[index].sponsor+"' type='"+list[index].statement+"'>查看详情</a>";
                args[7] = list[index].vedioSum;
                args[8] = "<a href='${path}/page/activity/applicant/list?"+list[index].id+"'>"+list[index].activityManSum+"</a>";
                if(list[index].status==1){
                    args[9] = '即将开始';
                }else if(list[index].status==2){
                    args[9] = '正在进行';
                }else if(list[index].status==2){
                    args[9] = '已结束';
                }else if(list[index].status==2){
                    args[9] = '撤销活动';
                }

                var row = tables[0].insertRow();
                insertRowToTable(row,args);
            }
        }
    });*/
    function insertRowToTable(row,args){
        for (var index = 0; index < args.length; ++index) {
            var cell = row.insertCell();
            cell.innerHTML=args[index];
        }
    }
    //图片悬浮事件处理
    function biggerr() {
        jQuery(".sit-preview").smartImageTooltip({
            previewTemplate : "simple",
            imageWidth : "350px"
        });
    }

</script>



