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
        <div class="col-md-8 col-md-offset-2">
            <div class="row">
                <div class="col-md-3">
                    <div class="item playlist">
                        <h4>播放列表</h4>
                        <hr>
                        <ul class="nav nav-pills nav-stacked">
                            <s:iterator value="#playlists" id="playlist" status="st">
                                <s:if test="#st.index == 0">
                                    <li class="active"><a data-toggle="tab" onclick="switchPlaylist('<s:property value="#playlist.url" escape="false"/>')"><s:property value="#playlist.name"/></a></li>
                                </s:if>
                                <s:else>
                                    <li><a data-toggle="tab" onclick="switchPlaylist('<s:property value="#playlist.url" escape="false"/>')"><s:property value="#playlist.name"/></a></li>
                                </s:else>
                            </s:iterator>

                            <%--<li class="active"><a data-toggle="tab" onclick="switchPlaylist('//music.163.com/outchain/player?type=0&id=83410515&auto=0&height=430')">音游曲</a></li>--%>
                            <%--<li><a data-toggle="tab" onclick="switchPlaylist('//music.163.com/outchain/player?type=0&id=698692385&auto=0&height=430')">発热巫女~ず和FELT</a></li>--%>
                            <%--<li><a data-toggle="tab" onclick="switchPlaylist('//music.163.com/outchain/player?type=0&id=599354540&auto=0&height=430')">crystallized</a></li>--%>
                            <%--<li><a data-toggle="tab" onclick="switchPlaylist('//music.163.com/outchain/player?type=0&id=693961318&auto=0&height=430')">轻口味系电音</a></li>--%>
                            <%--<li><a data-toggle="tab" onclick="switchPlaylist('//music.163.com/outchain/player?type=0&id=717969049&auto=0&height=430')">国语独立乐队和音乐人</a></li>--%>
                            <%--<li><a data-toggle="tab" onclick="switchPlaylist('//music.163.com/outchain/player?type=0&id=151104008&auto=1&height=430')">苏打绿-夏 / 狂热</a></li>--%>
                            <%--<li><a data-toggle="tab" onclick="switchPlaylist('//music.163.com/outchain/player?type=0&id=67731018&auto=0&height=430')">日系硬核</a></li>--%>
                        </ul>
                    </div>
                </div>

                <div class="col-md-9">
                    <iframe id="player" frameborder="no" border="0" marginwidth="0" marginheight="0" width=100% height=700 src='<s:property value="#playlists[0].url" escape="false"/>'></iframe>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="<%=request.getContextPath()%>/js/jquery-3.1.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/navBarJS.js"></script>
<script>
    function switchPlaylist(url)
    {
        $("#player").attr("src",url);
    }
</script>
</body>
</html>
