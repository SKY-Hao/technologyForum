<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>申请${GROUP_ALIAS} - ${SITE_NAME}</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>

    <link rel="shortcut icon" href="${basePath}/logo.ico">

    <link href="${basePath}/res/common/css/zui.min.css" rel="stylesheet">
    <link href="${basePath}/res/front/css/app.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/webuploader/webuploader.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/layer/skin/layer.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="${basePath}/res/common/js/html5shiv.js"></script>
    <script src="${basePath}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/jquery.form.js"></script>
    <script src="${basePath}/res/common/js/zui.min.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src="${basePath}/res/front/js/jeesns.js"></script>
    <script src="${basePath}/res/plugins/webuploader/webuploader.min.js"></script>
    <script src="${basePath}/res/plugins/jquerytags/js/jquery.tags.js"></script>
    <script type="text/javascript">
        var basePath = "${basePath}";
        var uploadServer = "${basePath}/uploadImage";
    </script>
    <script src="${basePath}/res/plugins/webuploader/upload.js"></script>
</head>
<body class="gray-bg">

<div class="container">
    <div class="main-content">
        <div class="row">
            <div class="col-md-12 article-detail">
                <form class="form-horizontal jeesns_form" role="form" action="${managePath}/group/save" method="post">
                    <div class="form-group">
                        <label class="col-sm-1 control-label">名称</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="name" name="name" placeholder="名称" data-type="require">
                        </div>
                        <span style="color:#red;">*</span>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-1 control-label">缩略图</label>
                        <div class="col-sm-8">
                            <input type="file" class="form-control" style="height: 38px;" id="logo" name="logo">
                        </div>
                        <span style="color:#red;">*</span>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">介绍</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="3" name="introduce" alt="介绍"></textarea>
                        </div>
                        <span style="color:#red;">*</span>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">标签</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="inputtags">每个标签用空格结束
                            <input type="hidden" class="form-control" id="tags" name="tags"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-10">
                            <button type="submit" class="btn btn-info jeesns-submit">申请${GROUP_ALIAS}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        $('#inputmanagers').tags();
        setInterval(function () {
            $('#managers').val($('#inputmanagers').val());
        }, 500);
        $('#inputtags').tags();
        setInterval(function () {
            $('#tags').val($('#inputtags').val());

        }, 500);
    });
</script>
</body>
</html>