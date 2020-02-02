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
    <script src="${basePath}/res/plugins/jquerytags/js/jquery.tags.js"></script>

    <script type="text/javascript">
        var basePath = "${basePath}";
    </script>
</head>
<body class="gray-bg">

<div class="container">
    <div class="main-content">
        <div class="row">
            <div class="col-md-12 article-detail">
                <form class="form-horizontal jeesns_form" role="form" enctype="multipart/form-data" action="${managePath}/group/editGroupSave" method="post" style="margin-top: 20px;">

                    <input type="hidden" id="id" name="id" value="${group.id}">
                    <div class="form-group">
                        <label class="col-sm-1 control-label">名称</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="name" name="name" placeholder="名称" data-type="require"
                                   value="${group.name}">
                        </div>
                        <span style="color:#red;">*</span>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-1 control-label">缩略图</label>
                        <div class="col-sm-8">
                            <img src="${basePath}${group.logo}" height="80px"/>
                           <#-- <input type="file" class="form-control" style="height: 38px;" name="logo" id="logo"  >-->
                        </div>
                        <span style="color:#red;">*</span>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">介绍</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="3" name="introduce" alt="介绍">${group.introduce}</textarea>
                        </div>
                        <span style="color:#red;">*</span>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">标签</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="inputtags">每个标签用空格结束
                            <input type="hidden" class="form-control" id="tags" name="tags" value="${group.tags}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-10">
                            <button type="submit" class="btn btn-info jeesns-submit">修改${GROUP_ALIAS}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        var managerNames = "${managerNames}";
        var managerNamesArr = managerNames.split(",");
        for(var i=managerNamesArr.length-1;i>=0;i--){
            $('#inputmanagers').tags(managerNamesArr[i]);
        }
        setInterval(function () {
            $('#managers').val($('#inputmanagers').val());
        }, 500);
        var tags = "${group.tags}";
        var tagsarr = tags.split(",");
        for(var i=tagsarr.length-1;i>=0;i--){
            $('#inputtags').tags(tagsarr[i]);
        }
        setInterval(function () {
            $('#tags').val($('#inputtags').val());

        }, 500);
    });
</script>
</body>
</html>