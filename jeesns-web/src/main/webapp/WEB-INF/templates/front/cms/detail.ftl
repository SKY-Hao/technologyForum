<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${article.title} - ${article.articleCate.name} - ${SITE_NAME}</title>
    <#--<meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>-->
    <link rel="shortcut icon" href="${basePath}/logo.ico">

    <link href="${basePath}/res/plugins/makedown/js/bootstrap.min.js" rel="stylesheet">
    <link href="${basePath}/res/plugins/makedown/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath}/res/new/css/articleCss/markDownStrle.css" rel="stylesheet">
    <link href="${basePath}/res/new/css/articleCss/topic.css" rel="stylesheet">
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
        var articleId = ${article.id};
    </script>
    <script src="${basePath}/res/front/js/cms.js"></script>

</head>
<body class="gray-bg">
<#include "/${frontTemplate}/common/newCommon/cmsHeaderMarkDown.ftl"/>
<div class="container">
    <div class="main-content">
        <div class="row">

            <div class="span8" style="width: 85%;margin-left: 8%;">
                <div class="theamLine">
                    <h3><a href="/">所有</a></h3>
                    <h3><a href="${basePath}/group/problem" style="margin: 0 10px;">问题</a></h3>
                    <h3><a href="${basePath}/group/article">文章</a></h3>
                    <h3 style="border-bottom: 2px solid #ca1828;"><a href="${basePath}/article/list">文档</a></h3>
                </div>
                <div class="TermCon">
                    <div class="author clearfix">
                        <div class="detailInfo">
                            <h4> ${article.title}</h4>
                            <p style="width:150px;"><b>Author:</b>${article.member.name}</p>
                            <p style="width:150px;"><b>Time:</b>${article.createTime?string('yyyy-MM-dd HH:mm')}</p>
                            <div class="counts">
                                <a class="discu" title="评论">${article.topicComment}</a>
                            <#--选择喜欢不喜欢-->
                            <#if article.isFavor == 0>
                                <a class="btn btn-danger btn-article-favor btn-article-unfavor topic-favor" href="javascript:void(0)" article-id="${article.id}" title="喜欢" id="like">
                                    <i class="icon-heart-empty"></i>${article.favor}
                                </a>
                            <#else>
                                <a class="btn btn-danger btn-article-favor topic-favor" href="javascript:void(0)" article-id="${article.id}" title="喜欢" id="like">
                                    <i class="icon-heart"></i>${article.favor}
                                </a>
                            </#if>
                                <a class="views" title="阅读" style="padding-top: 3px">${article.viewCount}</a>
                            </div>

                            <#if loginUser?? && (loginUser.id == article.memberId || loginUser.isAdmin >= 2)>
                                <div style="width: 190px;float: right;margin-top: -47px; height: 20px;">
                                    <a href="${basePath}/article/edit/${article.id}" class="btn" style="margin-top: 13px;height: 20px;background-color: #ca1828;line-height: 8px;color: #fff">Edit</a>
                                    <a href="${basePath}/article/delete/${article.id}" class="btn" confirm="确定要删除帖子吗？" target="_jeesnsLink" style="margin-top: 13px;height: 20px;background-color: #ca1828;line-height: 8px;color: #fff">Delete</a>
                                </div>
                            </#if>
                        </div>
                    </div>
                    <div class="detailContent">
                        ${article.htmlcontent}
                    </div>

                    <div class="detailDiscu">
                        <p class="theamTag">文档栏目：<a href="${basePath}/article/list?cid=${article.articleCate.id}">${article.articleCate.name}</a></p>
                        <a href="#jump" class="addBtn">评论</a>

                        <section class="comments-list" id="commentList">

                        </section>
                        <button class="btn btn-primary btn-block m" id="moreComment" style="display: none"><i
                                class="fa fa-arrow-down"></i> 加载更多
                        </button>

                        <div class="publishCon clearfix" id="jump">
                            <h4>评论</h4>
                            <form class="form-horizontal jeesns_form"
                                  action="${basePath}/article/comment/${article.id}" method="post">

                                <textarea name="content" rows="2"  class="discuContent" placeholder="撰写评论..."></textarea>

                                <input type="submit" value="发布" class="pull-right btn btn-primary mg-t-10 jeesns-submit" style="float:right;">
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <#--右侧-->
        <#--  <div class="col-md-4">
              <div class="panel">
                  <div class="panel-heading">
                      文章栏目
                  </div>
                  <div class="panel-body">
                          <a href="${basePath}/article/list" class="btn btn-primary">全部</a>
                          <#list articleCateList as articleCate>
                              <a href="${basePath}/article/list?cid=${articleCate.id}"
                                 class="btn btn-primary">${articleCate.name}</a>
                          </#list>
                  </div>
              </div>

              <div class="panel">
                  <div class="panel-heading">
                      最新文章
                  </div>
                  <div class="panel-body article-hot-list">
                      <ul>
                          <@cms_article_list cid=0 sort='id' num=10; article>
                              <#list articleList as article>
                                  <li><i class="icon-hand-right main-text-color"></i> <a
                                          href="${basePath}/article/detail/${article.id}">${article.title}</a></li>
                              </#list>
                          </@cms_article_list>
                      </ul>
                  </div>
              </div>
              <div class="panel">
                  <div class="panel-heading">
                      热门文章
                  </div>
                  <div class="panel-body article-hot-list">
                      <ul>
                          <@cms_article_list cid=0 sort='view_count' num=10 day=30; article>
                              <#list articleList as article>
                                  <li><i class="icon-hand-right main-text-color"></i>
                                      <a href="${basePath}/article/detail/${article.id}">${article.title}</a></li>
                              </#list>
                          </@cms_article_list>
                      </ul>
                  </div>
              </div>
          </div>-->
        </div>
    </div>

</div>
<#include "/${frontTemplate}/common/newCommon/footer.ftl"/>
<script>
    $(document).ready(function () {
        var pageNo = 1;
        cms.commentList(articleId, pageNo);
        $("#moreComment").click(function () {
            pageNo++;
            cms.commentList(articleId, pageNo);
        });
        $(".topic-favor").click(function () {
            cms.favor($(this), "${basePath}")
        });
    });
</script>
</body>
</html>