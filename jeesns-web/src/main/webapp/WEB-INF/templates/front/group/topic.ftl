<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${groupTopic.title} - ${groupTopic.group.name} - ${SITE_NAME}</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <link rel="shortcut icon" href="${basePath}/logo.ico">


   <link href="${basePath}/res/plugins/makedown/css/editormd.min.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/makedown/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath}/res/new/css/groupCss/group/topic.css" rel="stylesheet">
    <link href="${basePath}/res/new/css/pageCss/page.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="${basePath}/res/common/js/html5shiv.min.js"></script>
    <script src="${basePath}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/zui.min.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src="${basePath}/res/common/js/jquery.form.js"></script>
    <script src="${basePath}/res/front/js/jeesns.js"></script>
    <script>
        var base = "${basePath}";
        var groupTopicId = ${groupTopic.id};
    </script>
    <script src="${basePath}/res/front/js/group.js"></script>
    <script src="${basePath}/res/plugins/makedown/js/bootstrap.min.js"></script>
    <script src="${basePath}/res/plugins/makedown/js/editormd.min.js"></script>



</head>
<body class="gray-bg">
<#include "/${frontTemplate}/common/newCommon/headerMarkDown.ftl"/>



<div class="block clearfix">
    <div class="container clearfix">
        <div class="span8">
            <div class="theamLine">
                <h3><a href="/">所有</a></h3>
                <h3><a href="${basePath}/group/problem" style="margin: 0 10px;">问题</a></h3>
                <h3><a href="${basePath}/group/article">文章</a></h3>
                <h3><a href="${basePath}/article/list">文档</a></h3>
            </div>
            <div class="TermCon">
                <div class="author clearfix">
                    <div class="detailInfo">
                        <h4> ${groupTopic.title}</h4>
                        <p style="width:150px;"><b>Author:</b>${groupTopic.member.name}</p>
                        <p style="width:150px;"><b>Time:</b>${groupTopic.createTime?string('yyyy-MM-dd HH:mm')}</p>
                        <div class="counts">
                            <a class="discu" title="评论">${groupTopic.topicComment}</a>
                        <#--选择喜欢不喜欢-->
                            <#if groupTopic.isFavor == 0>
                                <a class="btn btn-danger btn-article-favor btn-article-unfavor topic-favor" href="javascript:void(0)" topic-id="${groupTopic.id}" title="喜欢" id="like">
                                    <i class="icon-heart-empty"></i>${groupTopic.favor}
                                </a>
                            <#else>
                                <a class="btn btn-danger btn-article-favor topic-favor" href="javascript:void(0)" topic-id="${groupTopic.id}" title="喜欢" id="like">
                                    <i class="icon-heart"></i>${groupTopic.favor}
                                </a>
                            </#if>
                            <a class="views" title="阅读">${groupTopic.viewCount}</a>
                        </div>


                        <#if loginUser?? && (loginUser.id == groupTopic.memberId || loginUser.isAdmin >= 2)>
                            <div style="width: 190px;float: right;margin-top: -40px; height: 20px;">
                                    <a href="${basePath}/group/topicEdit/${groupTopic.id}" class="btn" style="margin-top: 13px;height: 20px;background-color: #ca1828;line-height: 8px;color: #fff">Edit</a>
                                <a href="${basePath}/group/delete/${groupTopic.id}" class="btn" confirm="确定要删除帖子吗？" target="_jeesnsLink" style="margin-top: 13px;height: 20px;background-color: #ca1828;line-height: 8px;color: #fff">Delete</a>
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="detailContent">
                     ${groupTopic.htmlcontent}
                </div>

                <div class="detailDiscu">
                    <p class="theamTag">所属主题：<a href="${basePath}/group/detail/${groupTopic.group.id}">${groupTopic.group.name}</a></p>
                    <a href="#jump" class="addBtn">评论</a>

                    <section class="comments-list" id="commentList">

                    </section>
                    <button class="btn btn-primary btn-block m" id="moreComment" style="display: none"><i
                            class="fa fa-arrow-down"></i> 加载更多
                    </button>

                    <div class="publishCon clearfix" id="jump">
                        <h4>评论</h4>
                        <form class="form-horizontal jeesns_form"
                              action="${basePath}/group/comment/${groupTopic.id}" method="post">

                            <textarea name="content" rows="2"  class="discuContent" placeholder="撰写评论..."></textarea>

                            <input type="submit" value="发布" class="pull-right btn btn-primary mg-t-10 jeesns-submit" style="float:right;">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="span4" style="margin-top:45px;">


            <div class="widget">
                <h3>热门文章</h3>
            <#list byGroupStatus as groupTopic>
                <div class="question-block">
                    <a href="${basePath}/group/topic/${groupTopic.id}">${groupTopic.title}</a>
                    <div>
                        <span class="answer">点击：</span>
                        <span>${groupTopic.viewCount}</span>
                    </div>
                </div>
            </#list>
            </div>
            <div class="fengeLine"></div>
            <div class="widget">
                <h3>热门问题</h3>
            <#list byGroupStatusList as groupTopic>
                <div class="question-block">
                    <a href="${basePath}/group/topic/${groupTopic.id}">${groupTopic.title}</a>
                    <div>
                        <span class="answer">点击：</span>
                        <span>${groupTopic.viewCount}</span>
                    </div>
                </div>
            </#list>
            </div>


            <div class="fengeLine"></div>
            <div class="widget">
                <h3>热门主题</h3>
            <@group_list status=1 sort='topicCount' num=5 day=30; group>
                <#list groupList as group>
                    <div class="tags">
                        <a href="${basePath}/group/detail/${group.id}">${group.name}</a>
                    </div>
                </#list>
            </@group_list>
            </div>
        </div>
    </div>
</div>




<#include "/${frontTemplate}/common/newCommon/footer.ftl"/>
<script>
    $(document).ready(function () {
        var pageNo = 1;
        group.commentList(groupTopicId, pageNo);
        $("#moreComment").click(function () {
            pageNo++;
            group.commentList(articleId, pageNo);
        });
        $(".topic-favor").click(function () {
            group.favor($(this), "${basePath}")
        });
    });
</script>
</body>
</html>