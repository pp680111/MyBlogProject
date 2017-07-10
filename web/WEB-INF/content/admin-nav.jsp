<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default navbar-fixed-top" id="myNav">
    <div class="container">
        <div class="navbar-header">
            <a href="/admin/admin-index" class="navbar-brand">ZST's Life Blog</a>
        </div>

        <ul class="nav navbar-nav navbarTab">
            <li><a href="/admin/admin-index"><span class="glyphicon glyphicon-list"></span>&nbsp;文字</a></li>
            <li><a href="/admin/music"><span class="glyphicon glyphicon-music"></span>&nbsp;音乐</a></li>
            <li class="dropdown">
                <a href="/admin/picture-wall" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-picture"></span>&nbsp;图片</a>
                <ul class="dropdown-menu">
                    <li><a href="/admin/upload-picture">上传图片</a></li>
                </ul>
            </li>
            <li><a href="/admin/admin-setup"><span class="glyphicon glyphicon-cog"></span>&nbsp;设置</a></li>
        </ul>
    </div>
</nav>