<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编辑文章 - ${SITE_NAME} - RedoopForum后台管理系统 </title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <link rel="shortcut icon" href="${basePath}/logo.ico">
    <link href="${basePath}/res/common/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath}/res/common/css/font-awesome.min.css" rel="stylesheet">
    <link href="${basePath}/res/manage/css/AdminLTE.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/webuploader/webuploader.css" rel="stylesheet">
    <link href="${basePath}/res/manage/css/skins/_all-skins.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/layer/skin/layer.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="${basePath}/res/common/js/html5shiv.js"></script>
    <script src="${basePath}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/jquery.form.js"></script>
    <script src="${basePath}/res/common/js/bootstrap.min.js"></script>
    <script src="${basePath}/res/manage/js/app.js"></script>
    <script src="${basePath}/res/plugins/webuploader/webuploader.min.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src="${basePath}/res/common/js/jeesns.js"></script>

    <link href="${basePath}/res/plugins/makedown/css/editormd.min.css" rel="stylesheet">
    <script src="${basePath}/res/plugins/makedown/js/editormd.min.js"></script>
</head>
<body class="hold-transition">
<div class="wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <form class="form-horizontal jeesns_form" role="form" action="${managePath}/cms/article/update" method="post" onsubmit="ckUpdate();">
                    <input type="hidden" class="form-control" name="id" value="${article.id}">
                    <div class="form-group">
                        <label for="lastname" class="col-sm-1 control-label">栏目</label>
                        <div class="col-sm-3">
                            <select class="form-control" name="cateId" data-type="selected" alt="栏目">
                                <option value="">=请选择栏目=</option>
                            <#list cateList as mainMenu>
                                <option value="${mainMenu.id}" <#if article.articleCate.id==mainMenu.id>selected</#if>>${mainMenu.name}</option>
                            </#list>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-1 control-label">标题</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="title" name="title" placeholder="标题" data-type="require" value="${article.title}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-1 control-label">描述</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="3" name="description">${article.description}</textarea>
                        </div>
                    </div>
                    <div class="form-group clearfix" style="margin-left:  38px;margin-bottom: 20px;">
                        <label class="col-sm-1 control-label" style="float: left; width:50px; ">内容</label>
                        <div class="col-sm-10" id="editormd-content" style="float:left;">
                            <textarea class="editormd-markdown-textarea" name="content">${article.content}</textarea>
                            <textarea class="editormd-html-textarea" name="htmlcontent">${article.htmlcontent}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-1 control-label">来源</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="source" name="source" value="${article.source}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-1 control-label">作者</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="writer" name="writer" value="${article.writer}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-1 control-label">浏览数</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="viewCount" name="viewCount" placeholder="浏览数" value="${article.viewCount}" data-type="integer">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-10">
                            <button type="submit" class="btn btn-info jeesns-submit">保存</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
</div>
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