<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改头像</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <link rel="shortcut icon" href="${basePath}/logo.ico">
    <link href="${basePath}/res/new/css/groupCss/group/style.css" rel="stylesheet">

    <link href="${basePath}/res/common/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath}/res/common/css/font-awesome.min.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/webuploader/webuploader.css" rel="stylesheet">
    <link href="${basePath}/res/common/css/zui.min.css" rel="stylesheet">
    <link href="${basePath}/res/new/css/photoCSS/NewPhoto.css" rel="stylesheet">
    <link rel="stylesheet" href="${basePath}/res/common/css/jeesns.css">
    <link rel="stylesheet" href="${basePath}/res/common/css/jeesns-skin.css">
    <!--[if lt IE 9]>
    <script src="${basePath}/res/common/js/html5shiv.min.js"></script>
    <script src="${basePath}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/bootstrap.min.js"></script>
    <script src="${basePath}/res/plugins/metisMenu/metisMenu.js"></script>
    <script src="${basePath}/res/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src="${basePath}/res/common/js/manage.js"></script>
    <script src="${basePath}/res/plugins/fullAvatarEditor/scripts/fullswfobject.js"></script>
    <script src="${basePath}/res/plugins/fullAvatarEditor/scripts/fullAvatar.js"></script>
    <script src="${basePath}/res/common/js/zui.min.js"></script>
    <script src="${basePath}/res/plugins/webuploader/webuploader.min.js"></script>
    <script type="text/javascript">
        var basePath = "${basePath}";
        var uploadServer = "${basePath}/uploadImage";
    </script>
    <script src="${basePath}/res/plugins/webuploader/upload.js"></script>
</head>

<body class="gray-bg">
<#include "/member/common/newCommon/header.ftl"/>
<div class="block clearfix">
    <div class="container clearfix">

        <div class="wrapper wrapper-content">
            <#include "/member/common/editLeft.ftl"/>
            <div class="col-sm-9">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>修改头像</h5>
                    </div>
                    <div class="ibox-content">
                        <div style="width:632px;text-align:center">
                            <form class="form-horizontal jeesns_form" role="form" action="${basePath}/member/updatePhoto" method="post" >
                                <input type="hidden" name="id" value="${loginUser.id}">
                                <div class="form-group">

                                    <div class="col-sm-10">
                                        <div id="uploader" class="wu-example" style="margin-right: -105px;margin-left: -0px;">
                                            <!--用来存放文件信息-->
                                            <input type="hidden" id="thumbnail" name="avatar">
                                            <div id="preview" class="uploader-list"></div>
                                            <div id="imagesList" class="uploader-list"></div>
                                            <div class="btns">
                                                <div id="picker">选择文件</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-offset-1 col-sm-10">
                                        <button type="submit" class="btn btn-info jeesns-submit">保存</button>
                                        <a href="#" class="btn btn-default jeesns-submit">取消</a>
                                    </div>
                                </div>
                            </form>




                        </div>

                    </div>
                </div>
            </div>
        </div>
        </div>
        </div>
        </div>
        </div>

</div>
</div>
<#include "/member/common/newCommon/footer.ftl"/>
</body>
</html>