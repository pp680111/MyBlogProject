<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: qq578
  Date: 2017/5/14
  Time: 16:07
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
<div class="container-fluid">
    <%@include file="admin-nav.jsp"%>

    <div class="row mainBody">
        <div class="col-md-6 col-md-offset-3">
            <div class="item">
                <h4>编辑文章</h4>
                <div class="editItem">
                    <span>标题</span>
                    <input type="text" class="form-control" id="title" required value="<s:property value='#article.title'/>"/>
                </div>
                <div class="editItem">
                    <span>文章摘要</span>
                    <textarea id="summary" class="form-control" rows="3" style="resize: none" placeholder="不输入文章摘要的话系统将自动从正文部分抽取开头作为文章摘要"><s:property value='#article.summary'/></textarea>
                </div>
                <span>正文部分</span>
                <script id="container" name="content" type="text/plain" class="editItem">
                    <s:property value="#article.content" escape="false"/>
                </script>
                <div class="alert alert-success" id="successMessage">提交成功</div>
                <div class="alert alert-danger" id="errorMessage">提交失败</div>
                <button class="btn btn-default" type="button" id="submitBtn">提交</button>
            </div>
        </div>
    </div>
</div>

<script src="<%=request.getContextPath()%>/js/jquery-3.1.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/navBarJS.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ueditor/ueditor.all.js"></script>
<script>
    var ue = UE.getEditor('container',{
        initialFrameHeight:600,
        minFrameWidth:200
    });
    ue.ready(function () {
        ue.setContent();
    })

    $("#successMessage").hide();
    $("#errorMessage").hide();

    $("#submitBtn").click(function(){
        $("#successMessage").hide();
        $("#errorMessage").hide();
        var formData = new FormData();
        var content = ue.getContent();
        formData.append("title",$("#title").val());
        formData.append("summary",$("#summary").val());
        formData.append("content",content);
        formData.append("articleId",<s:property value="#article.id"/>);
        $.ajax({
            url:'/admin/submitModifiedArticle',
            data:formData,
            type:"post",
            dataType:'json',
            processData:false,
            contentType:false,
            success:function (data) {
                console.log(data.result);
                if(data.result == "success")
                {
                    $("#successMessage").show(1000);
                }
                else{
                    $("#errorMessage").show(1000);
                }
            },
            error:function () {
                $("#errorMessage").show(1000);
            }
        })
    })
</script>
</body>
</html>
