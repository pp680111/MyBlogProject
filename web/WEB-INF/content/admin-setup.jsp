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
    <link href="<%=request.getContextPath()%>/bootstrap-fileinput/css/fileinput.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <%@include file="admin-nav.jsp"%>

    <input type="hidden" id="playlistPageSize" value="<s:property value="#playlistPageSize"/>">
    <input type="hidden" id="playlistMaxSize" value="<s:property value="#playlistMaxSize"/>">

    <div class="row mainBody">
        <div class="col-md-6 col-md-offset-3">
            <div class="item">
                <h1>设置</h1>
                <hr>
                <%--<h4>首页个人公告内容设置</h4>--%>
                <%--<input type="text" class="form-control" id="announcement">--%>
                <%--<hr>--%>
                <h4>音乐页播放列表设置</h4>
                <table id="playlistTable" class="table">
                    <thead>
                        <th>播放列表</th>
                        <th>url</th>
                        <th>操作</th>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <div class="pageTools">
                    <div class="pageButton" id="fast-backward">
                        <span class="glyphicon glyphicon-chevron-left"></span><span class="glyphicon glyphicon-chevron-left"></span>
                    </div>
                    <div class="pageButton" id="backward">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </div>
                    <div class="pageButton" id="forward">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </div>
                    <div class="pageButton" id="fast-forward">
                        <span class="glyphicon glyphicon-chevron-right"></span><span class="glyphicon glyphicon-chevron-right"></span>
                    </div>
                </div>
                <button class="btn-default btn" id="addPlaylist">添加歌单</button>
                <hr>
                <h4>背景图片设置</h4>
                <input type="file" class="file" id="uploadBGPic" name="uploadBGPic">
                <hr>
            </div>
        </div>
    </div>

    <!-- modal -->
    <div class="modal fade" id="myDialog" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4>确认删除此歌单？</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="myDialogConfirmBtn">确认</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="editPlaylistDialog" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4>编辑歌单</h4>
                </div>
                <div class="modal-body">
                    <form id="editPlaylistForm">
                        <div class="form-group">
                            <label>歌单名</label>
                            <input class="form-control" name="name">
                        </div>
                        <div class="form-group">
                            <label>url</label>
                            <input class="form-control" name="url">
                        </div>
                        <input type="hidden" name="id">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="editPlaylistDialogConfirmBtn" data-dismiss="modal">确认</button>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="<%=request.getContextPath()%>/js/jquery-3.1.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/navBarJS.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap-fileinput/js/locales/zh.js"></script>
<script src="<%=request.getContextPath()%>/js/setupPageJS.js"></script>
</body>
</html>
