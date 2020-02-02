<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改帖子 - ${SITE_NAME}</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <link rel="shortcut icon" href="${basePath}/logo.ico">



    <link href="${basePath}/res/new/css/groupCss/group/markDownStrle.css" rel="stylesheet">
    <link href="${basePath}/res/new/css/pageCss/page.css" rel="stylesheet">
    <link href="${basePath}/res/new/css/groupCss/group/topic.css" rel="stylesheet">


    <!--[if lt IE 9]>
    <script src="${basePath}/res/common/js/html5shiv.js"></script>
    <script src="${basePath}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/jquery.form.js"></script>
    <script src="${basePath}/res/common/js/zui.min.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src="${basePath}/res/front/js/jeesns.js"></script>

    <link href="${basePath}/res/plugins/makedown/css/editormd.min.css" rel="stylesheet">
    <script src="${basePath}/res/plugins/makedown/js/editormd.min.js"></script>


</head>
<body class="gray-bg">
<#include "/${frontTemplate}/common/newCommon/header.ftl"/>
<div class="container">
    <div class="main-content">
        <div class="row clearfix" style="margin-left: 0; margin-top:20px;">
            <div class="col-md-12 article-detail">
                <form class="form-horizontal jeesns_form" role="form" action="${basePath}/group/topicUpdate" method="post" onsubmit="ckUpdate();">

                    <input type="hidden" class="form-control" name="id" value="${groupTopic.id}">
                    <div class="form-group" style="margin-bottom: 20px;">
                        <label for="lastname" class="col-sm-1 control-label">群组</label>
                        <div class="col-sm-3" style="margin-top: -22px;margin-left: 50px;">
                            <select class="form-control" name="groupId" data-type="selected" alt="主题" style="width:200px;">
                                <option value="">>>>请选择主题<<<</option>
                            <#list groupList as mainMenu>
                                <option value="${mainMenu.id}" <#if groupTopic.group.id==mainMenu.id>selected</#if>>${mainMenu.name}</option>
                            </#list>
                            </select>
                        </div>
                    </div>
                    <div class="form-group clearfix" style="margin-bottom: 20px;">
                        <label class="col-sm-1 control-label" style="float:left; width:50px;">标题</label>
                        <div class="col-sm-8" style="float:left; width:600px;">
                            <input type="text" class="form-control" id="title" name="title" placeholder="标题" value="${groupTopic.title}" style="width:700px;" data-type="require">
                        </div>
                    </div>

                    <div class="form-group clearfix" style="margin-bottom: 20px;">
                        <label for="firstname" class="col-sm-1 control-label" style="width: 50px; float:left;">类型</label>
                        <div class="col-sm-8" style="float: left;">

                            <label style="margin-right: 30px;">
                                <input type="radio" value="0" name="groupstatus"
                                          <#if groupTopic.groupstatus==0>checked</#if>> <i></i>
                                问题
                            </label>
                            <label style="margin-right: 30px;">
                                <input type="radio" value="1" name="groupstatus"
                                          <#if groupTopic.groupstatus==1>checked</#if>> <i></i>
                                文档/文章
                            </label>
                            <span style="color: red;font-weight: bolder;font-family: serif;">*请选择一个帖子类型</span>
                        </div>
                    </div>

                    <div class="form-group clearfix" style="margin-bottom: 20px;">
                        <label class="col-sm-1 control-label" style="float: left;width: 50px;">描述</label>
                        <div class="col-sm-8" style="float:left; width: 700px;">
                            <textarea class="form-control" rows="3" name="description" alt="描述" style="width:700px;">${groupTopic.description}</textarea>
                        </div>
                    </div>

                    <div class="form-group clearfix" style="margin-bottom: 20px;">
                        <label class="col-sm-1 control-label" style="float: left; width:50px;">内容</label>
                        <div class="col-sm-10" id="editormd-content" style="float:left;">
                            <textarea class="editormd-markdown-textarea" name="content">${groupTopic.content}</textarea>
                            <textarea class="editormd-html-textarea" name="htmlcontent">${groupTopic.htmlcontent}</textarea>
                        </div>
                    </div>

                    <div class="form-group clearfix" style="margin-left: 900px;">
                        <div class="col-sm-offset-1 col-sm-10">
                            <button type="submit" class="btn btn-info jeesns-submit" style="color: #fff;background-color: #ca1828;">保存</button>
                            <a href="${basePath}/group/detail/${groupTopic.group.id}" class="btn btn-info jeesns-submit" style="color: #fff; background-color: #ca1828;">取消</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<#include "/${frontTemplate}/common/newCommon/footer.ftl"/>
</body>
</html>
<script>

    $(function(){
        editormd({
            id:"editormd-content",
            width:"80%",
            height: 300,
            syncScrolling : "single",
            path: "${basePath}/res/plugins/makedown/lib/",
            imageUpload : true,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "${basePath}/upload/uploadfile",
            emoji:true,
            previewTheme : "dark",
            saveHTMLToTextarea : true
        });
    });

</script>
