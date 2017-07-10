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
                <h4>上传图片</h4>
                <input type="file" class="file" id="uploadPic" name="uploadPic" multiple>
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
                    <h4 id="myDialogTitle"></h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="myDialogConfirmBtn">确认</button>
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
<script>
    $("#uploadPic").fileinput({
        language: 'zh',
        allowedFileTypes:["image"],
        allowedFileExtensions: ['jpg', 'png', 'gif'],
        uploadUrl:'/admin/uploadPicture',
        //开启异步上传
        uploadAsync:true
    });
</script>
</body>
</html>
