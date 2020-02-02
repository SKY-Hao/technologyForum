<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>出现错误 - ${SITE_NAME}</title>

    <link rel="shortcut icon" href="${basePath}/logo.ico">

    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <style type="text/css">
        body{ background:#f4f5f7;}
        .error{ margin:100px auto; width:345px; padding-left:145px; height:227px; padding-top:75px; background:url(http://www.redoop.com/front/website/img/errorBG.png) no-repeat;}
        .error h4{color:#cd2027; font-size:22px;}
        .error p{ margin-top:15px; text-align:left; font-size:14px; line-height:2em;}
        .error p i{ font-style:normal; font-weight:bold; color:#cd2027; font-size:18px; margin-left:5px; margin-right:5px;}
        a{ color:#cd2027; text-decoration:underline; margin-right:20px; }
    </style>
    <script>
        $(function() {
            var h = $(window).height();
            $('body').height(h);
            $('.error').height(h);
            centerWindow(".error");
        });

        //2.将盒子方法放入这个方，方便法统一调用
        function centerWindow(a) {
            center(a);
            //自适应窗口
            $(window).bind('scroll resize',
                    function() {
                        center(a);
                    });
        }

        //1.居中方法，传入需要剧中的标签
        function center(a) {
            var wWidth = $(window).width();
            var wHeight = $(window).height();
            var boxWidth = $(a).width();
            var boxHeight = $(a).height();
            var scrollTop = $(window).scrollTop();
            var scrollLeft = $(window).scrollLeft();
            var top = scrollTop + (wHeight - boxHeight) / 2;
            var left = scrollLeft + (wWidth - boxWidth) / 2;
            $(a).css({
                "top": top,
                "left": left
            });
        }
    </script>
</head>

<body>
<DIV class="error">


    <h4>抱歉，您访问的页面找不到</h4>
    <p>自动<a  id="href" href="javascript:history.go(-1);">返回上一页</a> 等待<i id="wait">19</i>秒<br /><a href="${basePath}/">返回首页</a></p>
    <script type="text/javascript">
        $(function() {
            var wait = document.getElementById('wait');
            var href = document.getElementById('href').href;
            var interval = setInterval(function() {
                var time = --wait.innerHTML;
                if (time <= 0) {
                    location.href = href;
                    clearInterval(interval);
                }
                ;
            }, 1000);
        })();
    </script>

</DIV>
</body>
</html>
