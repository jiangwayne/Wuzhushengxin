<div class="article-body">
    <p>线性表(List)是最基本、最简单、也是最常用的一种数据结构</p>
    <h5>一.线性表的定义</h5>
    <p>一个线性表是n个具有相同特性的数据元素的有限序列。n定义为线性表的长度，n=0时称为空表。在非空表中每个数据元素都有一个确定的位置。
        相邻元素之间存在着序偶关系线性表必存在唯一的一个“第一元素”,称为表头,必存在唯一的一个 “最后元素” 称为表尾。除了表尾,每个元素
        都有唯一的后继,除了表头,每个元素都有唯一的前驱。
    </p>
    <h5>二.基本操作</h5>
    <p>
        1.List makeList():创建一个空线性表<br/>
        2.Node find(int index):查找并返回元素,index为该元素在List中的位置
        3.int indexOf(Node node):返回一个元素的位置
        4.void insert(Node node, int index):在指定位置插入一个元素
        5.void delete(int index):删除指定位置的元素
        6.int length():返回List的长度
    </p>
    <h5>三.数组实现</h5>
    <ul id="myTab" class="nav nav-tabs">
        <li class="active">
            <a href="#java" data-toggle="tab">java</a>
        </li>
        <li><a href="#c++" data-toggle="tab">c++</a></li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade in active" id="java">
            <pre>
                <code class="java">

                </code>
            </pre>
        </div>
        <div class="tab-pane fade" id="c++">

        </div>
    </div>
    <h5>四.链表实现</h5>
    <ul id="myTab2" class="nav nav-tabs">
        <li class="active">
            <a href="#java2" data-toggle="tab">java</a>
        </li>
        <li><a href="#c++2" data-toggle="tab">c++</a></li>
    </ul>
    <div id="myTabContent2" class="tab-content">
        <div class="tab-pane fade in active" id="java2">
            <p>菜鸟教程是一个提供最新的web技术站点，本站免费提供了建站相关的技术文档，帮助广大web技术爱好者快速入门并建立自己的网站。菜鸟先飞早入行——学的不仅是技术，更是梦想。</p>
        </div>
        <div class="tab-pane fade" id="c++2">
            <p>iOS 是一个由苹果公司开发和发布的手机操作系统。最初是于 2007 年首次发布 iPhone、iPod Touch 和 Apple
                TV。iOS 派生自 OS X，它们共享 Darwin 基础。OS X 操作系统是用在苹果电脑上，iOS 是苹果的移动版本。</p>
        </div>
    </div>
</div>