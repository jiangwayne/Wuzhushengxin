<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>

    <meta charset="utf-8">
    <meta name="description" content="个人博客,学习笔记,知识分享">
    <meta name="keywords" content="数学，算法，编程">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="/static/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/static/css/common.css" type="text/css">
    <link rel="stylesheet" href="/static/css/header.css" type="text/css">
    <script src="/static/js/jquery-3.1.1.min.js"></script>
    <#if "${page}"=="math">
        <script type="text/javascript" async
                src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
        </script>
        <#--<script src="http://cdn.bootcss.com/mathjax/2.7.0/MathJax.js"></script>-->
    </#if>
</head>
<body>
<div id="page-container">
    <#assign page="${page}">
    <#--<#assign articleId="${articleId}">-->
    <#include "header.ftl">
    <section id="page">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-sm-8 column">
                    <article class="post clearfix">
                        <header>
                            <h3>${article.title}</h3>
                            <span>${article.gmtCreate} / <a href="#">评论(${article.comments})</a></span>
                        </header>
                        <#include "${article.url}.ftl">
                        <#--<#include "articles/mathematics/mathematicalAnalysis/math11001.ftl">-->
                        <footer>
                            <div>
                                <#--<a href="#" class="social-1"><i class="fa fa-facebook"></i></a>-->
                                <#--<a href="#" class="social-1"><i class="fa fa-twitter"></i></a>-->
                                <#--<a href="#" class="social-1"><i class="fa fa-google-plus"></i></a>-->
                                <#--<a href="#" class="social-1"><i class="fa fa-pinterest"></i></a>-->
                                <#--<a href="#" class="social-1"><i class="fa fa-tumblr"></i></a>-->
                            </div>
                        </footer>
                    </article>
                    <nav id="post-nav-2" class="clearfix">
                        <div class="push-left">
                            <a href="#">« Previous</a>
                            <h6>Hike in mountain</h6>
                        </div>
                        <div class="push-right">
                            <a href="#">Next »</a>
                            <h6>Sunset in summer.</h6>
                        </div>
                    </nav>
                    <#--<#include "comments.ftl">-->
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