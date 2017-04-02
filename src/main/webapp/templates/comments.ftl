<div id="comments">
    <#if commentList?size&gt;0>
        <h4>${commentList?size} 评论</h4>
        <ul id="list-comments">
            <#list commentList as comment>
                <li class="comment byuser even thread-even depth-1">
                    <div class="comment-body">
                        <div class="comment-author vcard">
                            <cite class="fn">${comment.name}</cite>
                        </div>
                        <p>${comment.content}</p>
                        <div class="comment-meta commentmetadata">
                            <a href="#">${comment.gmtCreate}</a>
                        </div>
                </li>
            </#list>
        </ul>
    <#else>
    <h4>暂无评论</h4>
    </#if>
    <div id="commentform">
        <h4>发表评论</h4>
        <form method="post" action="/article/comment">
            <input type="hidden" name="articleId" value="${article.id}">
            <input type="text" name="nickname" placeholder="呢称">
            <textarea name="content" placeholder="说点什么..."></textarea>
            <button type="submit">提交</button>
        </form>
    </div>
</div>