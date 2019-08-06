<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>用户主页面</title>
    <!-- 引入css -->
    <%@include file="../base/header.jsp"%>
</head>
<body>
<div class="page-container">
    <!-- 条件查询start -->

    <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="1">本页共有:<strong id="size"></strong> 条</span> <span class="r">共有数据：<strong id="total"></strong> 条</span> </div>
    <div class="mt-20" >
        <table class="table table-border table-bordered table-bg table-hover" style="white-space: nowrap">
            <thead>
            <tr class="text-c">
                <th width="80">用户ID</th>
                <th width="75">昵称</th>
                <th width="120">账户ID</th>
                <th width="120">等级</th>
                <th width="120">收花数</th>
                <th width="120">头像</th>
                <th width="120">手机号码</th>
                <th width="120">出生年月</th>
                <th width="120">账户余额</th>
                <th width="120">个性签名</th>
                <th width="120">婚姻状况</th>
                <th width="75">性别</th>
                <th width="75">角色</th>
                <th width="75">年龄</th>
                <th width="75">注册时间</th>
            </tr>
            </thead>
            <tbody id="goodList">
            </tbody>
        </table>
        <script type="text/html" id="f1">
            {{each data.list as good}}
            <tr>
                <td style="text-align:center;vertical-align:middle;" name ="ids">{{good.id}}</td>
                <td style="text-align:center;vertical-align:middle;"><font color="#4169e1">{{good.nickname}}</font></td>
                <td style="text-align:center;vertical-align:middle;">{{good.accountId}}</td>
                <td style="text-align:center;vertical-align:middle;">{{if good.info!=null}}{{good.info.grade}}{{/if}}</td>
                <td style="text-align:center;vertical-align:middle;">{{if good.info!=null}}{{good.info.getGiftSum}}{{/if}}</td>
                <td>{{if good.headPortrait==NULL}}无{{else if good.headPortrait!=NULL}}<a class="sit-preview" href="{{good.headPortrait}}" onMouseOver="biggerr()"><img src="{{good.headPortrait}}" data-preview-url="{{good.headPortrait}}" style="cursor:pointer;width:60px;height:60px;"/></a>{{/if}}</td>
                <td style="text-align:center;vertical-align:middle;">{{good.phoneNumber}}</td>
                <td style="text-align:center;vertical-align:middle;">{{if good.birthday==NULL}}{{else}}{{$timestampFormatYMD good.birthday}}{{/if}}</td>
                <td style="text-align:center;vertical-align:middle;">{{good.balance}}</td>
                <td style="text-align:center;vertical-align:middle;">{{good.signature}}</td>
                <td style="text-align:center;vertical-align:middle;">{{if good.maritalStatus =="MARRIED"}}已婚{{ else if good.maritalStatus =="SINGLE"}}单身{{/if}}</td>
                <td style="text-align:center;vertical-align:middle;">{{if good.gender=="MALE"}}男{{else}}女{{/if}}</td>
                <td style="text-align:center;vertical-align:middle;">{{if good.type=="TEACHER"}}老师{{else}}用户{{/if}}</td>
                <td style="text-align:center;vertical-align:middle;">{{good.age}}</td>


                <td style="text-align:center;vertical-align:middle;">{{$timestampFormatYMDHM good.gmtDatetime}}</td>


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
    <%@include file="../base/footer.jsp"%>
    <script type="text/javascript">
        findUser();
        function findUser(pageNum){
            var aim ='${aim}';
//            alert(aim);
//            var p = $.extend({aim :aim});

            Project.ajax("/push/log/get/user",{aim :aim}).ajaxOK(function(data) {
                $("#goodList").html(template("f1",data));//作用到表格
                $("#page").html(template("f2",data));//作用到分页
                $("#total").html(data.data.total);//作用到统计total
                $("#size").html(data.data.size);//作用到统计每页显示size
                biggerr();//初始页
                // 面调用图片悬浮放大方法
            });
        }




        /*
        * 用户-停用(拉黑)
        * obj：无效
        * id：用户id
        * **/
        function member_stop(obj,id){//id为用户的id，obj没用到
            layer.confirm('确认要删除该用户吗？',function(index){
                layer.msg('已删除!',{icon: 5,time:1000});
                Project.ajax("/user/delete",{id:id}).ajaxOK(function(data) {
                    findUser();//刷新
                });
            });
        }

        /*
         * 用户-启用
         * obj：无效
         * id：用户id
         * **/
        function member_start(obj,id){//id为用户的id，obj没用到
            layer.confirm('确认要启用该用户吗？',function(index){
                layer.msg('已启用!',{icon: 6,time:1000});
                var state ='0';//启用用户
                Project.ajax("/api/user/updateState",{id:id,state:state}).ajaxOK(function(data) {
                    findUser();//刷新
                });
            });
        }

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


        function allSelect()
        {
            var v_item = document.getElementsByName("aa");
            var items = document.getElementsByName("bb");
            for (var i = 0; i < items.length; ++i)
            {
                if (v_item[0].checked)
                {
                    items[i].checked = true;
                }
                else
                {
                    items[i].checked = false;
                }
            }
        }
    </script>

</body>
</html>
