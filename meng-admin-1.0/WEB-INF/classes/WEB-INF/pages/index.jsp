<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<!-- 引入tag.jsp -->
<%@include file="../pages/public/tag.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/lib/Hui-iconfont/1.0.7/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/lib/icheck/icheck.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/css/style.css"/>
    <style>
        .top_div {
            height: 50px;
        }

        .time_style {
            margin-left: 85px;
            height: 50px;
            line-height: 50px;
        }

        .tips {
            background-color: white;
            height: 46px;
        }

        .tips_li {
            background-color: white;
            height: 40px;
            margin-top: 0px;
        }

    </style>
</head>
<body>
<!-- 顶栏 -->
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top ">
        <div class="container-fluid cl top_div">

            <%--     <a class="logo navbar-logo f-l mr-10 hidden-xs"
                                                href="${path}/page/page/interface/to/index">后台管理</a> <a
                     class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml">H-ui</a> <span
                     class="logo navbar-slogan f-l mr-10 hidden-xs"></span> <a aria-hidden="false"
                                                                               class="nav-toggle Hui-iconfont visible-xs"
                                                                               href="javascript:;">&#xe667;</a>--%>
            <div style="height: 50px;width: 70px;float: left;margin-top: 5px">
                <img src="${path}/resources/image/logo.png" style="height:40px;width: auto;">
            </div>
            <div class="time_style" style="float: left"></div>
            <%--<nav class="nav navbar-nav">
                <ul class="cl">
                    <li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_A"><i
                            class="Hui-iconfont">&#xe600;</i> 新增 <i class="Hui-iconfont">&#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" onclick="article_add('添加资讯','article-add.html')"><i
                                    class="Hui-iconfont">&#xe616;</i> 资讯</a></li>
                            <li><a href="javascript:;" onclick="picture_add('添加资讯','picture-add.html')"><i
                                    class="Hui-iconfont">&#xe613;</i> 图片</a></li>
                            <li><a href="javascript:;" onclick="product_add('添加资讯','product-add.html')"><i
                                    class="Hui-iconfont">&#xe620;</i> 产品</a></li>
                            <li><a href="javascript:;" onclick="member_add('添加用户','member-add.html','','510')"><i
                                    class="Hui-iconfont">&#xe60d;</i> 用户</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>--%>
            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                    <li>欢迎您</li>
                    <li class="dropDown dropDown_hover"><a href="#" class="dropDown_A">${name} <i class="Hui-iconfont">&#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="${path}/page/page/interface/to/index">个人信息</a></li>
                            <li><a onclick="logout()">退出</a></li>
                        </ul>
                    </li>

                    <li class="dropDown dropDown_hover"><i class="Hui-iconfont">&#xe616;</i><span
                            class="badge badge-danger" name="commentNumber">0</span>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="${path}/page/video/comment">视频评论</a></li>
                            <li><a href="${path}/page/live/course/comment">直播评论</a></li>
                        </ul>
                    </li>

                    <li id="Hui-skin" class="dropDown right dropDown_hover"><a href="javascript:;" class="dropDown_A"
                                                                               title="换肤"><i class="Hui-iconfont"
                                                                                             style="font-size:18px">&#xe62a;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
                            <li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
                            <li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
                            <li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
                            <li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
                            <li><a href="javascript:;" data-val="orange" title="绿色">橙色</a></li>
                        </ul>
                    </li>

                    <li id="Hui-msg1"><a data-title="切换角色" href=""><i class="Hui-iconfont"
                    >切换角色</i></a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<!-- 菜单模块 -->
<aside class="Hui-aside">
    <input runat="server" id="divScrollValue" type="hidden" value=""/>
    <div class="menu_dropdown bk_2" style="margin-top: 40px">
        <%--<dl id="menu-admin">--%>
        <%--<dt><i class="Hui-iconfont">&#xe62d;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>--%>
        <%--<dd>--%>
        <%--<ul>--%>
        <%--<li><a data-href="${path}/page/branch/list" data-title="后台用户" href="javascript:void(0)">后台用户</a></li>--%>
        <%--</ul>--%>
        <%--</dd>--%>
        <%--</dl>--%>
        <%-- <dl id="menu-admin">
             <dt><i class="Hui-iconfont">&#xe613;</i> 背景图管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
             <dd>
                 <ul>
                     <li><a data-href="${path}/page/back/img/list" data-title="背景图列表" href="javascript:void(0)">背景图列表</a>
                     </li>
                     <li><a data-href="${path}/page/back/img/add" data-title="添加背景图" href="javascript:void(0)">添加背景图</a>
                     </li>
                 </ul>
             </dd>
         </dl>
         <dl id="menu-admin">
             <dt><i class="Hui-iconfont">&#xe62d;</i> 背景图类别管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
             </dt>
             <dd>
                 <ul>
                     <li><a data-href="${path}/page/back/img/class/list" data-title="类别列表"
                            href="javascript:void(0)">类别列表</a></li>
                     <li><a data-href="${path}/page/back/img/class/add" data-title="添加类别"
                            href="javascript:void(0)">添加类别</a></li>
                 </ul>
             </dd>
         </dl>--%>
        <dl id="menu-comments">
            <dt class="tips"><i class="Hui-iconfont">M</i> 用户资金<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}UserCapital"
                            data-title="用户账户" href="javascript:void(0);">用户账户</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}UserCapitalStream"
                            data-title="资金流水" href="javascript:void(0);">资金流水</a>
                    </li>
                </ul>

            </dd>
        </dl>
        <dl id="menu-comments">
            <dt class="tips"><i class="Hui-iconfont">S</i> 签到管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}UserSignIn"
                            data-title="签到列表" href="javascript:void(0);">签到列表</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}UserCapitalStream"
                            data-title="奖励金币" href="javascript:void(0);">奖励金币</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}UserSignInContinuity"
                            data-title="连续签到" href="javascript:void(0);">连续签到</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}UserSignInRemindTime"
                            data-title="连续签到" href="javascript:void(0);">提醒时间</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}UserSignInRemindSwitch"
                            data-title="连续签到" href="javascript:void(0);">提醒开关</a>
                    </li>
                </ul>

            </dd>
        </dl>
        <dl id="menu-comments">
            <dt class="tips"><i class="Hui-iconfont">A</i> 相册<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}Album"
                            data-title="相册列表" href="javascript:void(0);">列表</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}AlbumPhoto"
                            data-title="相册照片列表" href="javascript:void(0);">照片列表</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}AlbumClassify"
                            data-title="分相册类" href="javascript:void(0);">分类</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="$相册{path}/base/list?type=${baseEntityPackage}AlbumComment"
                            data-title="评论" href="javascript:void(0);">评论</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}AlbumStatisticalPraise"
                            data-title="相册点赞" href="javascript:void(0);">点赞</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}AlbumStatisticalClick"
                            data-title="相册点击量" href="javascript:void(0);">点击量</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}AlbumCommentPraise"
                            data-title="相册评论点赞" href="javascript:void(0);">评论点赞</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}AlbumClassify"
                            data-title="相册分类" href="javascript:void(0);">分类</a>
                    </li>
                </ul>

            </dd>
        </dl>

        <dl id="menu-comments">
            <dt class="tips"><i class="Hui-iconfont">CM</i> 评论管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackageSer}VideoComment"
                            data-title="视频评论" href="javascript:void(0);">视频评论</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackageSer}LiveCourseComment"
                            data-title="课程评论" href="javascript:void(0);">课程评论</a>
                    </li>
                </ul>

            </dd>
        </dl>

        <dl id="menu-comments">
            <dt class="tips"><i class="Hui-iconfont">M</i> 上线统计<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}UserStartApp"
                            data-title="上线统计列表" href="javascript:void(0);">列表</a>
                    </li>
                </ul>

            </dd>
        </dl>
        <dl id="menu-comments">
            <dt class="tips"><i class="Hui-iconfont">P</i> 推送<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}UserPush"
                            data-title="设备绑定列表" href="javascript:void(0);">设备绑定列表</a>
                    </li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-comments">
            <dt class="tips"><i class="Hui-iconfont">PO</i> 用户位置<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}UserPosition"
                            data-title="用户位置列表" href="javascript:void(0);">列表</a>
                    </li>
                </ul>
            </dd>
        </dl>

        <dl id="menu-comments">
            <dt class="tips"><i class="Hui-iconfont">GV</i> 生成视频<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}PictureAlbumTemplate"
                            data-title="模版列表" href="javascript:void(0);">模版列表</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}Music"
                            data-title="音乐模版列表" href="javascript:void(0);">音乐模版列表</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}MusicKeyword"
                            data-title="音乐关键字" href="javascript:void(0);">音乐关键字</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}PictureAlbumTemplateKeyword"
                            data-title="模版关键字" href="javascript:void(0);">模版关键字</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}MusicAuthor"
                            data-title="音乐作家" href="javascript:void(0);">音乐作家</a>
                    </li>
                </ul>
            </dd>
        </dl>

        <dl id="menu-comments">
            <dt class="tips"><i class="Hui-iconfont">G</i> 获取记录<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}UserStartApp"
                            data-title="获取列表" href="javascript:void(0);">UserGiftSteal</a>
                    </li>
                </ul>

            </dd>
        </dl>

        <dl id="menu-comments">
            <dt class="tips"><i class="Hui-iconfont">M</i> 留言板<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}UserLeavingMessage"
                            data-title="留言板列表" href="javascript:void(0);">列表</a>
                    </li>
                </ul>

            </dd>
        </dl>

        <dl id="menu-comments">
            <dt class="tips"><i class="Hui-iconfont">F</i> 朋友圈<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}CircleOfFriends"
                            data-title="朋友圈列表" href="javascript:void(0);">列表</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}CircleOfFriendsPhoto"
                            data-title="朋友圈照片列表" href="javascript:void(0);">照片列表</a>
                    </li>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}CircleOfFriendsComment"
                            data-title="朋友圈评论" href="javascript:void(0);">评论</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}CircleOfFriendsStatisticalPraise"
                            data-title="朋友圈点赞" href="javascript:void(0);">点赞</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}CircleOfFriendsStatisticalClick"
                            data-title="朋友圈点击量" href="javascript:void(0);">点击量</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=${baseEntityPackage}CircleOfFriendsCommentPraise"
                            data-title="朋友圈评论点赞" href="javascript:void(0);">评论点赞</a>
                    </li>
                </ul>

            </dd>
        </dl>

        <dl id="menu-comments">
            <dt class="tips"><i class="Hui-iconfont">T</i> 邀请管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=com.rpframework.module.common.bottom.entity.UserInvitation"
                            data-title="邀请列表" href="javascript:void(0);">邀请列表</a>
                    </li>
                    <li class="tips_li"><a
                            data-href="${path}/base/list?type=com.rpframework.module.common.bottom.entity.UserInvitationMoneyCumulative"
                            data-title="金币累计列表" href="javascript:void(0);">金币累计列表</a>
                    </li>
                </ul>

            </dd>
        </dl>
        <dl id="menu-comments">
            <dt class="tips"><i class="Hui-iconfont">V</i> 视频查询<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li class="tips_li"><a data-href="${path}/page/video/list" data-title="视频列表" href="javascript:;">视频列表</a>
                    </li>
                    <li class="tips_li"><a id="co" data-title="视频转码" href="javascript:;">视频转码</a>
                    </li>
                </ul>

            </dd>
        </dl>
        <dl id="menu-comments">
            <dt class="tips"><i class="Hui-iconfont">S</i> 系统配置<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li class="tips_li"><a data-href="${path}/page/config/curriculum" data-title="课程配置项"
                                           href="javascript:;">课程配置</a>
                    </li>
                </ul>

            </dd>
        </dl>


        <dl id="menu-admin">
            <dt class="tips"><i class="Hui-iconfont">&#xe62d;</i> 词库管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li class="tips_li"><a data-href="${path}/page/sensitive/words/list" data-title="词库列表"
                                           href="javascript:void(0)">词库列表</a>
                    </li>
                    <li class="tips_li"><a data-href="${path}/page/sensitive/words/add" data-title="添加词库"
                                           href="javascript:void(0)">添加词库</a></li>
                </ul>
            </dd>
        </dl>

        <dl id="menu-article">
            <dt class="tips"><i class="Hui-iconfont">&#xe616;</i> 广播管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li class="tips_li"><a data-href="${path}/page/notice/list" data-title="广播列表"
                                           href="javascript:void(0)">广播列表</a>
                    </li>
                    <li class="tips_li"><a data-href="${path}/page/notice/hide/list" data-title="待审核广播列表"
                                           href="javascript:void(0)">待审核广播列表</a>
                    </li>
                    <li class="tips_li"><a data-href="${path}/page/notice/add" data-title="添加广播"
                                           href="javascript:void(0)">添加广播</a></li>
                    <li class="tips_li"><a data-href="${path}/page/notice/comment" data-title="评论审核"
                                           href="javascript:void(0)">评论审核</a>
                    </li>
                    <li class="tips_li"><a data-href="${path}/page/notice/admin/list" data-title="后台广播标签"
                                           href="javascript:void(0)">后台广播标签</a>
                    </li>
                    <li><a data-href="${path}/page/notice/user/list" data-title="用户广播标签" href="javascript:void(0)">用户广播标签</a>
                    </li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-picture">
            <dt class="tips"><i class="Hui-iconfont">&#xe613;</i> 课程管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>

                    <li class="tips_li"><a data-href="${path}/page/unversity/list/course" data-title="课程列表"
                                           href="javascript:void(0)">课程列表</a></li>
                    <li class="tips_li"><a data-href="${path}/page/live/course/join/list" data-title="学员列表"
                                           href="javascript:void(0)">学员列表</a>
                    </li>

                    <li class="tips_li"><a data-href="${path}/page/live/course/regist/course" data-title="课程报名"
                                           href="javascript:void(0)">课程报名</a></li>
                    <li class="tips_li"><a data-href="${path}/page/live/course/comment" data-title="评论审核"
                                           href="javascript:void(0)">评论审核</a></li>
                    <li class="tips_li"><a data-href="${path}/page/collage/list" data-title="拼团管理"
                                           href="javascript:void(0)">拼团管理</a></li>
                    <li class="tips_li"><a data-href="${path}/page/web/regist/list" data-title="H5管理"
                                           href="javascript:void(0)">H5管理</a></li>
                    <li><a data-href="${path}/page/live/course/live/list" data-title="直播管理"
                           href="javascript:void(0)">直播管理</a></li>
                    <%--    <li><a data-href="${path}/page/live/course/base/stati" data-title="获取流量和带宽日统计结果"
                               href="javascript:void(0)">获取流量和带宽日统计结果</a></li>
                        <li><a data-href="${path}/page/live/course/bandwidth/stati" data-title="获取带宽实时统计结果"
                               href="javascript:void(0)">获取带宽实时统计结果</a></li>
                        <li><a data-href="${path}/page/live/course/play/user/stati" data-title="获取在线人数统计结果"
                               href="javascript:void(0)">获取在线人数统计结果</a></li>
                        <li><a data-href="${path}/page/live/course/play/user/day/stati" data-title="获取按天人数统计结果"
                               href="javascript:void(0)">获取按天人数统计结果</a></li>
                        <li><a data-href="${path}/page/live/course/play/user/month/stati" data-title="获取按月人数统计结果"
                               href="javascript:void(0)">获取按月人数统计结果</a></li>--%>
                </ul>
            </dd>
        </dl>

        <%--<dl id="menu-product">--%>
        <%--<dt><i class="Hui-iconfont">&#xe620;</i> 分类管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>--%>
        <%--<dd>--%>
        <%--<ul>--%>
        <%--<li><a data-href="${path}/page/forward/to/list/branch/car/brand" data-title="分类列表" href="javascript:void(0)">分类列表</a></li>--%>
        <%--<li><a data-href="${path}/page/forward/to/list/branch/car/info" data-title="添加分类" href="javascript:void(0)">添加分类</a></li>--%>
        <%--</ul>--%>
        <%--</dd>--%>
        <%--</dl>--%>
        <dl id="menu-product ">
            <dt class="tips"><i class="Hui-iconfont">&#xe613;</i> 轮播图管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li class="tips_li"><a data-href="${path}/page/recommend/list" data-title="轮播列表"
                                           href="javascript:void(0)">轮播列表</a>
                    </li>
                    <li class="tips_li"><a data-href="${path}/page/recommend/add" data-title="添加轮播图"
                                           href="javascript:void(0)">添加轮播图</a>
                    </li>

                </ul>
            </dd>
        </dl>
        <dl id="menu-product ">
            <dt class="tips"><i class="Hui-iconfont">&#xe620;</i> 广告管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li class="tips_li"><a data-href="${path}/page/advertisement/list" data-title="广告列表"
                                           href="javascript:void(0)">广告列表</a></li>
                    <li class="tips_li"><a data-href="${path}/page/advertisement/add" data-title="添加广告"
                                           href="javascript:void(0)">添加广告</a></li>

                </ul>
            </dd>
        </dl>
        <dl id="menu-activity">
            <dt class="tips"><i class="Hui-iconfont">&#xe620;</i> 活动管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li class="tips_li"><a data-href="${path}/page/activity/list" data-title="活动列表"
                                           href="javascript:void(0)">活动列表</a>
                    </li>
                    <li class="tips_li"><a data-href="${path}/page/activity/mytest" data-title="活动测试"
                                           href="javascript:void(0)">活动测试</a>
                    </li>
                    <li class="tips_li"><a data-href="${path}/page/activity/upload/video" data-title="上传视频"
                                           href="javascript:void(0)">上传视频</a>
                    </li>
                </ul>
            </dd>
        </dl>

        <dl id="menu-unversity">
            <dt class="tips"><i class="Hui-iconfont">&#xe620;</i> 大学管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li class="tips_li"><a data-href="${path}/page/unversity/list" data-title="大学列表"
                                           href="javascript:void(0)">大学列表</a>
                    </li>
                    <li class="tips_li"><a data-href="${path}/page/unversity/add/un" data-title="添加大学"
                                           href="javascript:void(0)">添加大学</a>
                    </li>
                    <li class="tips_li"><a data-href="${path}/page/unversity/blind/course" data-title="大学绑定课程"
                                           href="javascript:void(0)">大学绑定课程</a>
                    </li>
                </ul>
            </dd>
        </dl>


        <dl id="menu-comments">
            <dt class="tips"><i class="Hui-iconfont">&#xe622;</i> 视频管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li class="tips_li"><a data-href="${path}/page/video/classify/list" data-title="视频分类列表"
                                           href="javascript:;">视频分类列表</a></li>
                    <li class="tips_li"><a data-href="${path}/page/video/list" data-title="视频列表" href="javascript:;">视频列表</a>
                    </li>
                    <li class="tips_li"><a data-href="${path}/page/video/audit/list" data-title="待审核列表"
                                           href="javascript:;">待审核列表</a>
                    </li>
                    <li class="tips_li"><a data-href="${path}/page/video/notpass/list" data-title="未通过列表"
                                           href="javascript:;">未通过列表</a>
                    </li>
                    <li class="tips_li"><a data-href="${path}/page/video/add" data-title="添加视频"
                                           href="javascript:;">添加视频</a></li>
                    <li><a data-href="${path}/page/video/classify/add" data-title="添加视频分类"
                           href="javascript:;">添加视频分类</a></li>
                    <li class="tips_li"><a data-href="${path}/page/video/user/list" data-title="用户活动视频标签"
                                           href="javascript:void(0)">用户活动视频标签</a>
                    </li>
                    <li class="tips_li"><a data-href="${path}/page/video/comment" data-title="评论审核"
                                           href="javascript:void(0)">评论审核</a>
                    </li>

                    <li class="tips_li"><a data-href="${path}/page/video/recyclebin" data-title="回收站"
                                           href="javascript:void(0)">回收站</a>
                    </li>

            </dd>
        </dl>
        <dl id="menu-comment">
            <dt><i class="Hui-iconfont">&#xe62e;</i> 评论管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="${path}/page/comment/list" data-title="评论列表" href="javascript:;">评论列表</a></li>

                </ul>
            </dd>
        </dl>

        <dl id="menu-piazza">
            <dt><i class="Hui-iconfont">&#xe60d;</i> 广场管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="${path}/page/piazza/list" data-title="广场列表" href="javascript:;">广场列表</a>
                    </li>
                    <li><a data-href="${path}/page/piazza/add" data-title="添加广场" href="javascript:;">添加广场</a>
                    </li>

                </ul>
            </dd>
        </dl>
        <dl id="menu-member">
            <dt><i class="Hui-iconfont">&#xe60d;</i> 用户管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="${path}/page/user/to/user/list" data-title="会员列表" href="javascript:;">会员列表</a>
                    </li>
                    <li><a data-href="${path}/page/user/add" data-title="添加会员" href="javascript:;">添加会员</a></li>
                    <li><a data-href="${path}/page/user/star" data-title="明星列表" href="javascript:;">明星列表</a></li>
                    <li><a data-href="${path}/page/feedback/list" data-title="明星列表" href="javascript:;">意见列表</a></li>
                    <li><a data-href="${path}/page/push/log/list" data-title="推送列表" href="javascript:;">推送列表</a></li>
                    <li><a data-href="${path}/page/user/write/letter" data-title="写信群发" href="javascript:;">写信群发</a>
                    <li><a data-href="${path}/page/user/push" data-title="推送管理" href="javascript:;">推送管理</a>
                    </li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-tongji">
            <dt><i class="Hui-iconfont">&#xe61a;</i> 群管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="${path}/page/user/chat/room/list" data-title="用户群列表" href="javascript:;">用户群列表</a>
                    </li>
                </ul>
            </dd>
        </dl>

        <dl id="menu-system">
            <dt><i class="Hui-iconfont">&#xe62e;</i> 系统消息<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="${path}/page/msg/list" data-title="消息列表" href="javascript:;">消息列表</a></li>
                    <li><a data-href="${path}/page/msg/send" data-title="发布消息" href="javascript:;">发布消息</a></li>
                </ul>
            </dd>
        </dl>

        <%--<dl id="menu-system">--%>
        <%--<dt><i class="Hui-iconfont">&#xe616;</i> 配置管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>--%>
        <%--<dd>--%>
        <%--<ul>--%>
        <%--<li><a data-href="${path}/page/msg/list" data-title="视频标签" href="javascript:;">视频标签</a></li>--%>
        <%--</ul>--%>
        <%--</dd>--%>
        <%--</dl>--%>
    </div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
</div>
<section class="Hui-article-box">
    <div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
        <div class="Hui-tabNav-wp">
            <ul id="min_title_list" class="acrossTab cl">
                <li class="active"><span title="我的桌面" data-href="welcome.html">我的桌面</span><em></em></li>
            </ul>
        </div>
        <div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S"
                                                  href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a
                id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a>
        </div>
    </div>
    <div id="iframe_box" class="Hui-article">
        <div class="show_iframe">
            <div style="display:none" class="loading"></div>
            <iframe scrolling="yes" frameborder="0" src="home"></iframe>
        </div>
    </div>
</section>

<div class="contextMenu" id="myMenu1">
    <ul>
        <li id="open">Open</li>
        <li id="email">email</li>
        <li id="save">save</li>
        <li id="delete">delete</li>
    </ul>
</div>

<div id="bg_music" hidden></div>

<script type="text/javascript" src="${path}/resources/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${path}/resources/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="${path}/resources/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript" src="${path}/resources/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="${path}/resources/static/h-ui.admin/js/H-ui.admin.js"></script>

<script src="${path}/resources/js/template.js"></script>
<script src="${path}/resources/js/common.js"></script>
<script src="${path}/resources/js/promise.min.js"></script>
<script src="${path}/resources/js/project.js"></script>
<script src="${path}/resources/js/jquery.common.js"></script>

<script type="text/javascript">
    var c = 0;
    $(function () {
        $(".Hui-tabNav-wp").contextMenu('myMenu1', {
            bindings: {
                'open': function (t) {
                    alert('Trigger was ' + t.id + '\nAction was Open');
                },
                'email': function (t) {
                    alert('Trigger was ' + t.id + '\nAction was Email');
                },
                'save': function (t) {
                    alert('Trigger was ' + t.id + '\nAction was Save');
                },
                'delete': function (t) {
                    alert('Trigger was ' + t.id + '\nAction was Delete')
                }
            }
        });
        initTime()
        getMsgCount();

    });

    function initTime() {
        var myDate = new Date();
        var year = myDate.getFullYear();    //获取完整的年份(4位,1970-????)
        var month = myDate.getMonth() + 1;       //获取当前月份(0-11,0代表1月)
        var date = myDate.getDate();        //获取当前日(1-31)
        console.log(year + "-" + month + "-" + date)
        var str = "星期" + "日一二三四五六".charAt(new Date().getDay());
        console.log(str)
        $(".time_style").text(year + "-" + month + "-" + date + " " + str)


    }

    /*资讯-添加*/
    function article_add(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*图片-添加*/
    function picture_add(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*产品-添加*/
    function product_add(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*用户-添加*/
    function member_add(title, url, w, h) {
        layer_show(title, url, w, h);
    }

    //退出时清空session
    function logout() {
        window.location.href = "${path}/page/page/interface/to/login?name='logout'";
    }

    //获取msg
    //没两秒自动获取一次未读消息

    function getMsgCount() {

        Project.ajax("/record/find", null, null).ajaxOK(function (data) {
            $("span[name=commentNumber]").html(data.data.commentNumber);
            $("span[name=videoNumber]").html(data.data.videoNumber);
            if (data.data.comment) {
                getMp3("1.mp3");
            }
            if (data.data.video) {
                getMp3("2.mp3");
            }
            setTimeout("getMsgCount()", 20000);
        });
    }


    function getMp3(a) {
        var audioElementHovertree = document.createElement('audio');
        audioElementHovertree.setAttribute('src', '${path}/resources/mp3/' + a);
        audioElementHovertree.setAttribute('autoplay', 'autoplay'); //打开自动播放
        audioElementHovertree.addEventListener("load", function () {
            audioElementHovertree.play();
        }, true);
        audioElementHovertree.play();
    }

    Project.ajax("/global/config/video/trans/coding/address").ajaxOK(function (data) {
        data = data.data;
        $("#co").attr("data-href", data);
    });

</script>
</body>
</html>