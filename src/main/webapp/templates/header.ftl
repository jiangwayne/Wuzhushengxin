<header>
    <div class="container">
        <div class="row">
            <div class="col-md-12 clearfix">
                <div id="logo-container">
                    <div class="tb">
                        <div class="tb-cell">
                            <div class="logo-text">
                                <i>W&nbsp;Z&nbsp;S&nbsp;X</i>
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
                            <li <#if  page=="math"||page=="mathAnalysis" >class="current-menu-item"</#if>>
                                <a href="/math">数学</a>
                                <ul class="sub-menu">
                                    <li><a href="/mathAnalysis">数学分析</a></li>
                                    <li ><a href="">高等代数</a></li>
                                    <li><a href="">离散数学</a></li>
                                </ul>
                            </li>
                            <li <#if  page=="algorithm" >class="current-menu-item"</#if>>
                                <a href="">算法</a>
                                <ul class="sub-menu">
                                    <li><a href="">算法导论</a></li>
                                    <li><a href="">趣味算法题</a></li>
                                </ul>
                            </li>
                            <li <#if  page=="program" >class="current-menu-item"</#if>>
                                <a href="">编程</a>
                                    <ul class="sub-menu">
                                        <li><a href="">java</a></li>
                                        <li><a href="">go</a></li>
                                    </ul>
                                </li>
                            <li <#if  page=="tool" >class="current-menu-item"</#if>>
                                <a href="">工具</a>
                            </li>
                            <li <#if  page=="essay" >class="current-menu-item"</#if>>
                                <a href="">随笔</a>
                            </li>
                            <li <#if  page=="conte" >class="current-menu-item"</#if>>
                                <a href="">小故事</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</header>
