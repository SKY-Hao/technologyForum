<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${GROUP_ALIAS}</title>

    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>


    <link rel="shortcut icon" href="${basePath}/logo.ico">

    <#--<link href="${basePath}/res/common/css/zui.min.css" rel="stylesheet">
    <link href="${basePath}/res/front/css/app.css" rel="stylesheet">-->
    <link href="${basePath}/res/new/css/groupCss/group/style.css" rel="stylesheet">
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
                <h3>主题</h3>
            </div>
            <div class="theamContent">

                <#list model.data as group>
                        <div class="theamTerm">

                            <a href="${basePath}/group/detail/${group.id}" class="theamTitle">${group.name}</a>
                            <p>
                                <span>${group.topicCount}</span>帖子<br />
                                <span>${group.fansCount}</span>关注者
                            </p>
                        </div>
                </#list>
            </div>
        </div>
        <div class="span4">

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
<script type="text/javascript">
    $(function () {
        $(".pagination").jeesns_page("jeesnsPageForm");
    });
</script>
</body>
</html>