<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: qq578
  Date: 2017/5/12
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/myStyle.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/loadingAnimeStyle.css" rel="stylesheet">
</head>
<body>
    <input type="hidden" value="<s:property value='#maxSize'/>" id="maxIndex">
    <div class="container-fluid">
        <%@include file="visitor-nav.jsp" %>

        <div class="row mainBody">
            <div class="col-md-8 col-md-offset-2">
                <div class="itemLeft" id="articleListArea">
                    <div class="item">
                        <h3>置顶文章</h3><hr>
                        <div class="articleTitle"><p id="topTitle"></p></div>
                        <div class="articleSummary" id="topSummary"></div>
                        <div class="articleInfoBar">
                            <span class="glyphicon glyphicon-time" id="topTime"></span>
                            <span class="glyphicon glyphicon-eye-open" id="topReadNum"></span>
                        </div>
                    </div>
                    <%--<div class="item">--%>
                        <%--<p>置顶</p><hr>--%>
                        <%--<div class="articleTitle"><p>苟利国家生死已</p></div>--%>
                        <%--<div class="articleSummary">岂因祸福避趋之</div>--%>
                        <%--<div class="articleInfoBar">--%>
                            <%--<span class="glyphicon glyphicon-time">2017-05-13</span>--%>
                            <%--<span class="glyphicon glyphicon-eye-open">阅读(100)</span>--%>
                            <%--<span class="glyphicon glyphicon-comment">评论(10)</span>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                    <!-- 这里将将文章列表的内容全部输出 -->
                    <!--<div class="item">
                        <div class="articleTitle"><p>文章item模板</p></div>
                        <div class="articleSummary">你们啊，不要想搞个大新闻，然后把我批判一番</div>
                        <div class="articleInfoBar">
                            <span class="glyphicon glyphicon-time">2017-05-13</span>
                            <span class="glyphicon glyphicon-eye-open">阅读(100)</span>
                            <span class="glyphicon glyphicon-comment">评论(10)</span>
                        </div>
                    </div>-->
                    <%--<s:iterator value="#request['articleList']" id="article">--%>
                        <%--<div class="item">--%>
                            <%--<div class="articleTitle"><p><s:property value="#article.title"/> </p></div>--%>
                            <%--<div class="articleSummary"><s:property value="#article.summary"/></div>--%>
                            <%--<div class="articleInfoBar">--%>
                                <%--<span class="glyphicon glyphicon-time"><s:property value="#article.update_time"/></span>--%>
                                <%--<span class="glyphicon glyphicon-eye-open">阅读(<s:property value="#article.read_num"/>)</span>--%>
                                <%--<span class="glyphicon glyphicon-comment">评论(<s:property value="#article.replys.size"/>)</span>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</s:iterator>--%>
                        <div class="spinner" id="loadingAnime">
                            <div class="rect1"></div>
                            <div class="rect2"></div>
                            <div class="rect3"></div>
                            <div class="rect4"></div>
                            <div class="rect5"></div>
                        </div>
                </div>

                <div class="itemRight">
                    <div class="item">
                        <h4>ZST</h4>
                        <p>一个喜欢音乐，喜欢游戏的菜鸡程序员</p>
                    </div>
                    <div class="item" id="recommendArticleList">
                        <h4>推荐文章</h4>
                        <hr>
                    </div>
                </div>



            </div>
        </div>
    </div>

    <script src="<%=request.getContextPath()%>/js/jquery-3.1.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/navBarJS.js"></script>
    <script src="<%=request.getContextPath()%>/js/ScrollHandler.js"></script>

</body>
</html>
