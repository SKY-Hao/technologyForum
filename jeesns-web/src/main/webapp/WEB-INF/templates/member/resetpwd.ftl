<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>重置密码 - ${SITE_NAME}</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <link rel="shortcut icon" href="${basePath}/logo.ico">


    <link href="${basePath}/res/common/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath}/res/common/css/font-awesome.min.css" rel="stylesheet">
    <link href="${basePath}/res/common/css/jeesns.css" rel="stylesheet">
    <link href="${basePath}/res/common/css/jeesns-skin.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/emoji/css/emoji.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="${basePath}/res/common/js/html5shiv.min.js"></script>
    <script src="${basePath}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/bootstrap.min.js"></script>
    <script src="${basePath}/res/plugins/metisMenu/metisMenu.js"></script>
    <script src="${basePath}/res/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src="${basePath}/res/common/js/jquery.form.js"></script>
    <script src="${basePath}/res/common/js/manage.js"></script>
    <script src="${basePath}/res/common/js/jeesns.js"></script>

</head>

<body class="gray-bg">
<#include "/member/common/newCommon/header.ftl"/>

<div class="animated fadeInDown">
    <div class="row login-panel">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <div class="ibox-content">
                <h2 class="font-bold">重置密码</h2>
                <form class="m-t jeesns_form" action="${basePath}/member/resetpwd" method="post">
                    <input name="email" class="form-control" type="hidden" value="${email}">
                    <input name="token" class="form-control" type="hidden" value="${token}">
                    <div class="form-group">
                        新密码
                        <input id="newPassword" name="password" class="form-control" type="password" data-type="require" alt="新密码">
                    </div>
                    <div class="form-group">
                        确认新密码
                        <input id="renewPassword" name="repassword" class="form-control" type="password" data-type="require" data-rule="equal[newPassword]" alt="两次密码必须一致">
                    </div>
                    <button type="submit" class="btn btn-primary m-b">重置密码</button>
                </form>
                <p></p>

            </div>
        </div>
    </div>
</div>
<#include "/member/common/newCommon/footer.ftl"/>

</body>
</html>
