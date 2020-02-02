<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><#if articleCate??>${articleCate.name}<#else>文章列表</#if></title>
    <link rel="shortcut icon" href="${basePath}/logo.ico">

    <link href="${basePath}/res/new/css/articleCss/style.css" rel="stylesheet">
    <link href="${basePath}/res/common/css/zui.min.css" rel="stylesheet">

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
    <div class="container clearfix" style="background-color: #f7f7f7;">
        <div style="margin-right: 1%;float: right;    margin-top: 49px;">
            <a href="${basePath}/article/list" class="btn btn-primary" style=" width: 80px; margin-top: 6px; margin-right: -3px;">全部文档</a>
        </div>

        <div class="span8">
            <div class="theamLine" style="width: 112%">
                <h3>文档栏目</h3>
                <span class="pull-right" style="width: 400px">
                     <a class="btn btn-primary m-t-n4" href="${basePath}/article/add" style="float: right;margin-left: 10px;">发布文档</a>
                    <form action="${basePath}/article/list" method="get">
                        <div class="input-group">
                            <input type="text" class="form-control" name="key">
                            <span class="input-group-btn">
                                <button class="btn btn-danger" type="submit"><i class="icon-search"></i></button>
                            </span>
                        </div>
                    </form>
                </span>
            </div>
            <div class="theamContent" style="width: 116%">
                <#list articleCateList as articleCate>
                    <div class="theamTerm" id="theamTerms">
                        <a href="${basePath}/article/list?cid=${articleCate.id}" class="theamTitle">${articleCate.name}</a>
                    </div>
                </#list>
            </div>
        </div>

    </div>
</div>


<div class="container">
    <div class="main-content">
        <div class="row">
            <div class="col-md-8" style="width: 100%">
                <div class="items" style="width: 100%">
                <#--文章列表    左侧-->
                    <#list model.data as article>
                        <div class="item article-list shadow">
                            <div class="item-content">
                                <#if article.thumbnail??>
                                    <div class="media pull-left">
                                    <#--左侧图像-->
                                        <a href="${basePath}/article/detail/${article.id}">
                                            <img src="${basePath}${article.thumbnail}" alt="${article.title}" height="80px" width="120px">
                                        </a>
                                    </div>
                                </#if>
                                <div class="text">
                                    <a href="${basePath}/article/list?cid=${article.articleCate.id}">
                                        <div class="pull-right label label-success">
                                        ${article.articleCate.name} <#--文档的栏目名称-->
                                        </div>
                                    </a>
                                    <h3>
                                        <a href="${basePath}/article/detail/${article.id}">
                                        ${article.title}<#--文档标题-->
                                        </a>
                                    </h3>
                                    <p>
                                        <span class="text-muted">
                                            <i class="icon-comments"></i>
                                        ${article.viewCount} &nbsp;<#--查看次数-->
                                            <i class="icon-time"></i>
                                        ${article.createTime?string('yyyy-MM-dd HH:mm')}<#--创建时间-->
                                           <span style="    margin-left: 10px;">
                                               Author:${article.member.name}
                                           </span>
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </#list>
                <#--分页-->
                    <ul class="pager pagination pagination-sm no-margin pull-right"
                        url="${basePath}/article/list?<#if articleCate??>cid=${articleCate.id}&</#if>key="
                        currentPage="${model.page.pageNo}"
                        pageCount="${model.page.totalPage}">
                    </ul>
                </div>
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
<script type="text/javascript">

    $(document).ready(function(){

        $(".theamTerm a").each(function(){
            $this = $(this);
            if($this[0].href==String(window.location)){
                $this.css({"background-color":"#cd2027"});
                $this.css({"color":"#fff"});
            }
        });

    });

</script>
</body>
</html>