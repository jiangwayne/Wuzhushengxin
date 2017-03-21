<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>

    <meta charset="utf-8">
    <meta name="description" content="个人博客,学习笔记,知识分享">
    <meta name="keywords" content="数学，算法，编程">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/common.css" type="text/css">
    <link rel="stylesheet" href="../css/header.css" type="text/css">
    <script src="../js/jquery-3.1.1.min.js"></script>
</head>
<body>
<div id="page-container">
    <#assign page="home">
    <#include "header.ftl">
    <section id="section-featured" class="clearfix">
        <div style="text-align: center;line-height: 50px; height:50px; background-color: #ffb8fc" class="container">本站建设中...</div>
    </section>
    <section id="page">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-sm-8 column">
                    <header id="header-section">
                        <h3>算法</h3>
                        <div></div>
                        <span>category</span>
                    </header>
                    <article class="post">
                        <header>
                            <h3><a href="">算法是什么</a></h3>
                            <span>2017-03-12 / 阅读(10)</span>
                        </header>
                        <div class="editor-styles">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget turpis pulvinar, tempor odio sed, adipiscing dolor. Donec nisi velit, malesuada id dolor non, elementum auctor arcu. Cras consectetur sapien et purus posuere.</p>
                        </div>
                        <footer>
                            <div>
                                <a href="">阅读全文...</a>
                            </div>
                            <hr>
                        </footer>
                    </article>
                    <nav id="post-nav">
                        <a href="http://view.jqueryfuns.com/%E9%A2%84%E8%A7%88-/2015/1/14/706c9c78623f129a044220c0ad3c2013/category_lifestyle.html#">Older Posts 禄</a>
                    </nav>
                </div>
                <div class="col-lg-4 col-sm-4 column space">
                    <#include "sidebar.ftl">
                </div>
            </div>
        </div>
    </section>
    <#include "footer.ftl">
</div>
</body></html>