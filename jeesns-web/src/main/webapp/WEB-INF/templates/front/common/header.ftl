<nav class="navbar navbar-inverse">
    <div class="container" style="position:relative;">
        <div class="navbar-header m-navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">RedoopForum</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand jeesns-logo" href="${basePath}/"><img src="${basePath}/res/common/images/RedoopLogo.png" height="51px"/></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse" style="float:right; text-align:right;margin-right:-38px; margin-top:15px;">
            <ul class="nav navbar-nav">
                <li><a href="${basePath}/">首页</a></li>
                <#--<li><a href="${basePath}/article/list">文章</a></li>-->

                <#--<li><a href="${basePath}/weibo/list">${WEIBO_ALIAS}</a></li>-->
                <li><a href="${basePath}/group/topicList/">帖子</a></li>
                <li><a href="${basePath}/group/">${GROUP_ALIAS}</a></li>

                <#--<li><a href="${basePath}/action/list">动态</a></li>-->
            </ul>
            <ul class="nav navbar-top-links navbar-right" style="position: absolute; top:-18px; right:10px;">
                <div class="nav navbar-nav navbar-nav-right">
                <#if loginUser == null>
                    <li><a href="${basePath}/member/login">登录</a></li>
                    <li><a href="${basePath}/member/register">注册</a></li>
                <#else>
                    <div class="btn-group nav-username m-t-10">
                        <img src="${basePath}${loginUser.avatar}" class="img-circle" width="25px" height="25px" style="margin-top: 1px;margin-right:5px;"/>
                        <a class="header-action-link" href="javascript:void(0)" style="color: #ddd">
                        ${loginUser.name}
                            <#if unReadMessageNum+systemUnReadMessageNum &gt; 0><i class="icon-comments"></i></#if>
                        </a>
                        <ul class="dropdown-menu" style="right:-50px; text-align:center;">
                            <li><a href="${basePath}/member/">个人中心</a></li>
                            <li><a href="${basePath}/member/systemMessage">系统信息 ${(systemUnReadMessageNum > 0)?string("("+systemUnReadMessageNum+")","")}</a></li>
                            <li><a href="${basePath}/member/message">私信 ${(unReadMessageNum > 0)?string("("+unReadMessageNum+")","")}</a></li>
                            <li><a href="${basePath}/member/editInfo">设置</a></li>
                            <#if loginUser?? && loginUser.isAdmin &gt; 0>
                                <li><a href="${managePath}/" target="_blank">管理</a></li>
                            </#if>
                            <li class="divider"></li>
                            <li><a href="${basePath}/member/logout">退出</a></li>
                        </ul>
                        <script>
                            $(function () {
                                $(".nav-username").hover(function(){
                                    $(this).addClass("open");
                                },function(){
                                    $(this).removeClass("open");
                                });
                            })
                        </script>
                    </div>
                </#if>
                </div>
            </ul>
        </div>
    </div>
</nav>