<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编辑帖子 - ${SITE_NAME} - RedoopForum后台管理系统 </title>
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
                <form class="form-horizontal jeesns_form" role="form" action="${managePath}/group/topic/update" method="post" onsubmit="ckUpdate();">
                    <input type="hidden" class="form-control" name="id" value="${topic.id}">
                    <div class="form-group">
                        <label for="lastname" class="col-sm-1 control-label">主题</label>
                        <div class="col-sm-3">
                            <select class="form-control" name="groupId" data-type="selected" alt="主题">
                                <option value="">=请选择主题=</option>
                            <#list groupList as mainMenu>
                                <option value="${mainMenu.id}" <#if topic.group.id==mainMenu.id>selected</#if>>${mainMenu.name}</option>
                            </#list>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-1 control-label">标题</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="title" name="title" placeholder="标题" data-type="require" value="${topic.title}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-1 control-label" style="width: 100px;">帖子类型</label>
                        <div class="col-sm-8">
                            <label><input type="radio" value="0" name="groupstatus"
                                          <#if topic.groupstatus==0>checked</#if>> <i></i>
                                问题帖子</label>
                            <label><input type="radio" value="1" name="groupstatus"
                                          <#if topic.groupstatus==1>checked</#if>> <i></i>
                                文章帖子</label>
                            <span style="color: red;font-weight: bolder;font-family: serif;">*请选择一个帖子类型</span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-1 control-label">描述</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="3" name="description">${topic.description}</textarea>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="firstname" class="col-sm-1 control-label">内容</label>
                        <div class="col-sm-10" id="editormd-content">
                            <textarea class="editormd-markdown-textarea" cols="80" name="content" rows="3">${topic.content}</textarea>
                            <textarea class="editormd-html-textarea" cols="80" name="htmlcontent" rows="3">${topic.htmlcontent}</textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-1 control-label">来源</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="source" name="source" value="${topic.source}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-1 control-label">作者</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="writer" name="writer" value="${topic.writer}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-1 control-label">浏览数</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="viewCount" name="viewCount" placeholder="浏览数" value="${topic.viewCount}" data-type="integer">
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