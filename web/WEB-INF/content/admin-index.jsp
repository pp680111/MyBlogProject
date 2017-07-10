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
    <%@include file="admin-nav.jsp"%>

    <div class="row mainBody">
        <div class="col-md-8 col-md-offset-2">
            <div class="itemLeft">
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

                <%--</div>--%>

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
                <div class="item">
                    <a href="/admin/new-article" class="btn btn-default">发布新文章</a>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="confirmMsgDialog" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-default" id="confirm">确认</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->

<script src="<%=request.getContextPath()%>/js/jquery-3.1.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/ScrollHandlerAdmin.js"></script>
<script src="<%=request.getContextPath()%>/js/navBarJS.js"></script>

<script>
    function deleteArticle(id){
        $(".modal-title").text("确认删除此文章？");
        $("#confirm").click(function(){
            var formData = new FormData();
            formData.append("articleId",id);
            $.ajax({
                url:"/admin/deleteArticle",
                data:formData,
                type:'post',
                dataType:'json',
                processData:false,
                contentType:false,
                success:function(data){
                    if(data.result == "success")
                    {
                        location.reload(true);
                    }
                },
                error:function(){
                    alert("删除失败");
                }
            })
        });
        $("#confirmMsgDialog").modal('show');
    }

    function setArticleTop(id){
        var formData = new FormData();
        formData.append("articleId",id);
        $.ajax({
            url:"/admin/setArticleTop",
            data:formData,
            type:'post',
            dataType:'json',
            contentType:false,
            processData:false,
            success:function(data){
                $(".modal-title").text("设置成功");
                $("#confirm").hide();
                $("#confirmMsgDialog").modal('show');
            },
            error:function () {
                alert("设置失败");
            }
        })
    }
</script>
</body>
</html>
