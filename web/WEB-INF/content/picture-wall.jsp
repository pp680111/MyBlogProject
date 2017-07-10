<%--
  Created by IntelliJ IDEA.
  User: qq578
  Date: 2017/5/14
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/myStyle.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/loadingAnimeStyle.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/fancybox/jquery.fancybox.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <s:if test="#isAdmin == true">
        <%@include file="admin-nav.jsp"%>
    </s:if>
    <s:else>
        <%@include file="visitor-nav.jsp"%>
    </s:else>

    <div class="content" id="content">
        <div class="pictureFlowContainer" id="pictureFlowContainer">
            <%--<div class="grid_col">--%>
                <%--<p>--%>
                    <%--<a class="fancybox" data-fancybox-group="gallery" href="/img/1.jpg" pictureId="1">--%>
                        <%--<img class="imgStyle" src="/img/1.jpg"/>--%>
                    <%--</a>--%>
                <%--</p>--%>
                <%--<p>--%>
                    <%--<a class="fancybox" data-fancybox-group="gallery" href="/img/2.jpg" pictureId="2">--%>
                        <%--<img class="imgStyle" src="/img/2.jpg"/>--%>
                    <%--</a>--%>
                <%--</p>--%>
            <%--</div>--%>
            <%--<div class="grid_col"><p>--%>
                <%--<a class="fancybox" data-fancybox-group="gallery" href="/img/3.jpg" pictureId="3">--%>
                    <%--<img class="imgStyle" src="/img/3.jpg"/>--%>
                <%--</a>--%>
            <%--</p><p>--%>
                <%--<a class="fancybox" data-fancybox-group="gallery" href="/img/4.jpg">--%>
                    <%--<img class="imgStyle" src="/img/4.jpg"/>--%>
                <%--</a>--%>
            <%--</p></div>--%>
            <%--<div class="grid_col"><p>--%>
                <%--<a class="fancybox" data-fancybox-group="gallery" href="/img/5.jpg">--%>
                    <%--<img class="imgStyle" src="/img/5.jpg"/>--%>
                <%--</a>--%>
            <%--</p><p>--%>
                <%--<a class="fancybox" data-fancybox-group="gallery" href="/img/6.jpg">--%>
                    <%--<img class="imgStyle" src="/img/6.jpg"/>--%>
                <%--</a>--%>
            <%--</p></div>--%>
            <%--<div class="grid_col"><p>--%>
                <%--<a class="fancybox" data-fancybox-group="gallery" href="/img/7.jpg">--%>
                    <%--<img class="imgStyle" src="/img/7.jpg"/>--%>
                <%--</a>--%>
            <%--</p><p>--%>
                <%--<a class="fancybox" data-fancybox-group="gallery" href="/img/8.jpg">--%>
                    <%--<img class="imgStyle" src="/img/8.jpg"/>--%>
                <%--</a>--%>
            <%--</p></div>--%>
            <%--<div class="grid_col"><p>--%>
                <%--<a class="fancybox" data-fancybox-group="gallery" href="/img/9.jpg">--%>
                    <%--<img class="imgStyle" src="/img/9.jpg"/>--%>
                <%--</a>--%>
            <%--</p><p>--%>
                <%--<a class="fancybox" data-fancybox-group="gallery" href="/img/10.jpg">--%>
                    <%--<img class="imgStyle" src="/img/10.jpg"/>--%>
                <%--</a>--%>
            <%--</p></div>--%>
        </div>
    </div>

    <%--<div class="row mainBody">--%>
        <%--<div class="spinner" id="loadingAnime">--%>
            <%--<div class="rect1"></div>--%>
            <%--<div class="rect2"></div>--%>
            <%--<div class="rect3"></div>--%>
            <%--<div class="rect4"></div>--%>
            <%--<div class="rect5"></div>--%>
        <%--</div>--%>

    <%--</div>--%>
</div>

<script src="<%=request.getContextPath()%>/js/jquery-3.1.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/navBarJS.js"></script>
<script src="<%=request.getContextPath()%>/fancybox/jquery.fancybox.js"></script>
<script src="<%=request.getContextPath()%>/fancybox/helpers/jquery.fancybox-buttons.js"></script>
<s:if test="#isAdmin == true">
    <script src="<%=request.getContextPath()%>/js/pictureWallScrollHandlerAdmin.js"></script>
</s:if>
<s:else>
    <script src="<%=request.getContextPath()%>/js/pictureWallScrollHandler.js"></script>
</s:else>
</body>
</html>
