<header id="header" style="z-index: 100;background-color:#FAFAFA">
    <div class="container">
        <div class="row">
            <div class="col-md-12 clearfix">
                <div id="logo-container">
                    <div class="tb">
                        <div class="tb-cell">
                            <div class="logo-text">
                                <a href="/home"><i>W&nbsp;Z&nbsp;S&nbsp;X</i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="menu-container">
                    <nav>
                        <ul class="clearfix">
                            <li <#if  page=="home" >class="current-menu-item"</#if>>
                                <a href="/home">首页</a>
                            </li>
                            <li <#if  page=="about" >class="current-menu-item"</#if>>
                                <a href="/about">关于</a>
                            </li>
                            <li <#if  page=="math" >class="current-menu-item"</#if>>
                                <a href="/math">数学</a>
                                <ul class="sub-menu">
                                    <li><a href="/math/mathAnalysis">数学分析</a></li>
                                    <li ><a href="">高等代数</a></li>
                                    <li><a href="">离散数学</a></li>
                                </ul>
                            </li>
                            <li <#if  page=="algorithm" >class="current-menu-item"</#if>>
                                <a href="">算法</a>
                                <ul class="sub-menu">
                                    <li><a href="/algorithm/dataStructure">数据结构</a></li>
                                    <li><a href="">算法导论</a></li>
                                    <li><a href="">趣味算法题</a></li>
                                </ul>
                            </li>
                            <li <#if  page=="program" >class="current-menu-item"</#if>>
                                <a href="/program">编程</a>
                                    <ul class="sub-menu">
                                        <li><a href="/program/java">java</a></li>
                                        <li><a href="/program/hadoop">hadoop</a></li>
                                    </ul>
                                </li>
                            <li <#if  page=="tool" >class="current-menu-item"</#if>>
                                <a href="">工具</a>
                            </li>
                            <li <#if  page=="essay" >class="current-menu-item"</#if>>
                                <a href="">随笔</a>
                            </li>
                            <li <#if  page=="conte" >class="current-menu-item"</#if>>
                                <a href="/conte">小故事</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</header>
<script type="text/javascript">
    window.onscroll = function () {
        var t = document.documentElement.scrollTop || document.body.scrollTop;
        if(t>130){
            var left = (document.body.clientWidth - $("#header").width()) / 2;
            $("#header").css("position", "fixed");
            $("#header").css("width", "100%");
            $("#header").css("top", 0);
            $("#header").css("left", left);
        } else {
            $("#header").css("position", "relative");
            $("#header").css("top", 0);
            $("#header").css("left", 0);
        }
    }
</script>
<#--<section id="section-featured" class="clearfix">-->
    <#--<div style="text-align: center;line-height: 50px; height:50px; background-color: #ffb8fc" class="container">本站建设中...</div>-->
<#--</section>-->
