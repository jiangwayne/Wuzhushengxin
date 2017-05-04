<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>

    <meta charset="utf-8">
    <meta name="description" content="个人博客,学习笔记,知识分享">
    <meta name="keywords" content="${article.keywords}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="/static/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/static/css/common.css" type="text/css">
    <link rel="stylesheet" href="/static/css/header.css" type="text/css">
    <script src="/static/js/jquery-3.1.1.min.js"></script>
    <#--<script src="/static/js/comment.js"></script>-->
    <#if "${page}"=="math">
        <script type="text/javascript" async src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
        </script>
    </#if>
    <#if "${page}"=="program">
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.11.0/styles/default.min.css">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.11.0/highlight.min.js"></script>
        <script>hljs.initHighlightingOnLoad();</script>
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
                            <span>${article.gmtCreate[0..9]} / 阅读(${article.views}) / 评论(${article.comments})</span>
                        </header>
                        <#include "${article.url}.ftl">
                        <script type="text/javascript" src="http://localhost:8080/article/view.htm?id=${article.id}"></script>
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
                        <#if article.previous =="">
                        <#else>
                            <div class="push-left">
                                <a href="/article?id=${article.id - 1}">« 上一篇:${article.previous}</a>
                            </div>
                        </#if>
                        <#if article.next =="">
                        <#else>
                            <div class="push-right">
                                <a href="/article?id=${article.id + 1}">下一篇:${article.next} »</a>
                            </div>
                        </#if>
                    </nav>
                    <#include "comments.ftl">
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