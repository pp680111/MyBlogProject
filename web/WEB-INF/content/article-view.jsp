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
    <style>
        span{word-break:normal; width:auto; display:block; white-space:pre-wrap;word-wrap : break-word ;}
        p{word-break:normal; width:auto; display:block; white-space:pre-wrap;word-wrap : break-word ;overflow: hidden ;}
    </style>
</head>
<body>
<div class="container-fluid">
    <s:if test="#isAdmin == true">
        <%@include file="admin-nav.jsp"%>
    </s:if>
    <s:else>
        <%@include file="visitor-nav.jsp"%>
    </s:else>
    <div class="row mainBody">
        <div class="col-md-6 col-md-offset-3">
            <div class="item">
                <div class="articleViewTitle">
                    <h2 id="articleTitle"><s:property value="#article.title"/> </h2>
                    <div id="articleInfo">
                        <span class='glyphicon glyphicon-time'><s:property value="#article.time"/></span>
                        <span class='glyphicon glyphicon-eye-open'>阅读(<s:property value="#article.read_num"/>)</span>
                        <span class='glyphicon glyphicon-eye-open'>回复(<s:property value="#article.reply_num"/>)</span>
                    </div>
                </div>
                <hr>
                <div>
                    <s:property value="#article.content" escape="false"/>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="<%=request.getContextPath()%>/js/jquery-3.1.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/navBarJS.js"></script>
</body>
</html>
