<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>红象云腾社区</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="shortcut icon" href="${basePath}/logo.ico">

    <link href="${basePath}/res/new/css/groupCss/group/style.css" rel="stylesheet">
    <link href="${basePath}/res/new/css/pageCss/page.css" rel="stylesheet">
    <#--<link href="${basePath}/res/common/css/zui.min.css" rel="stylesheet">
    <link href="${basePath}/res/front/css/app.css" rel="stylesheet">-->
    <!--[if lt IE 9]>
    <script src="${basePath}/res/common/js/html5shiv.min.js"></script>
    <script src="${basePath}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/zui.min.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src="${basePath}/res/common/js/jquery.form.js"></script>
    <script src="${basePath}/res/common/js/jeesns.js"></script>
    <script src="${basePath}/res/common/js/extendPagination.js"></script>
</head>
<body class="gray-bg">
<#include "/${frontTemplate}/common/newCommon/header.ftl"/>



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

                <div class="termNum">
                    <a href="${basePath}/group/" class="publishBtn">发布</a>
                </div>
            <#list model.data as groupTopic>
                <div class="listItem">

                    <h4>
                        <span>
                            <#if groupTopic.groupstatus == 0>
                                问题
                            </#if>
                            <#if groupTopic.groupstatus == 1>
                                文章
                            </#if>
                        </span>
                        <a href="${basePath}/group/topic/${groupTopic.id}">${groupTopic.title}</a>
                    </h4>
                    <div class="articleInfo">

                        <span class="tags">
                            <a href="${basePath}/group/">${groupTopic.group.name}</a>
                        </span>
                        <p>

                        </p>
                        <#--<p>1小时前</p>-->
                        <p><a href="${basePath}/user/${groupTopic.member.id}">Author:${groupTopic.member.name}</a></p>
                    </div>
                    <div class="counts">
                        <a class="discu on" title="评论">${groupTopic.topicComment}</a>
                        <a class="like" title="喜欢">${groupTopic.favor}</a>
                        <a class="views " title="阅读">${groupTopic.viewCount}</a>
                    </div>
                 </div>

            </#list>


                    <ul class="pager pagination pagination-sm no-margin pull-right"
                        url="${basePath}/"
                        currentPage="${model.page.pageNo}"
                        pageCount="${model.page.totalPage}" style="margin-top: 0px;float: right;">
                    </ul>

            </div>
        </div>

        <#--热门的帖子文章-->
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

</body>
<script type="text/javascript">
    $(function () {
        $(".pagination").jeesns_page("jeesnsPageForm");
    });
    function autorunA()//帖子点查看更多的时候跳转隐藏的那个GroupId去查询,仅限一个群组的时候
    {
        var dtx=document.getElementById('divTest');
        dtx.click();
    }

    $(document).ready(function(){
        $(".theamLine h3 a").each(function(){
            $this = $(this);
            if($this[0].href==String(window.location)){
                $this.css({"border-bottom":"2px solid #ca1828"});
            }
        });

    });
</script>
</html>
