/**
 * Created by qq578 on 2017/5/14.
 */
var maxSize = $("#maxIndex").val();
var winH = $(window).height();
var currentIndex = 0;
var isGettingData = false;
var loadingAnime = $("#loadingAnime");
$(function(){
    loadingAnime.hide();
    function getData(){
        $.ajax({
            url:'/admin/getArticles',
            type:'post',
            data:{'currentIndex':currentIndex},
            dataType:'json',
            beforeSend:function(){
                //显示加载动画
                isGettingData = true;
                loadingAnime.show();
            },
            success:function(data){
                currentIndex = Number(currentIndex) + Number(data.size);
                //将json数据转化为html
                processArticleData(data.articleList);
            },
            error:function(error){
                //提示加载错误
                console.log("error");
            },
            complete:function(){
                //结束加载动画
                isGettingData = false;
                loadingAnime.hide();
            }
        })
    }

    getData();

    function processArticleData(json){
        $.each(json,function(n,article){
            var item = $("<div class='item'></div>");
            item.append($("<div class='articleTitle'><p><a href='/admin/article-detail?articleId=" + article.id + "'>" + article.title + "</a></p></div>"));
            item.append($("<div class='dropdown'>" +
                "<span class='glyphicon glyphicon-chevron-down dropdown-toggle btn' data-toggle='dropdown'></span>" +
                "<ul class='dropdown-menu' style='top: 25px'>" +
                "<li><a href='/admin/modify-article?articleId=" + article.id + "'>编辑此文章</a></li>" +
                "<li><a onclick='deleteArticle(" + article.id + ")'>删除</a></li>" +
                "<li><a onclick='setArticleTop(" + article.id + ")'>置顶</a></li></ul></div>"))
            item.append($("<div class='articleSummary'>" + article.summary + "</div>"));
            item.append($("<div class='articleInfoBar'>" +
                "<span class='glyphicon glyphicon-time'>" + article.time + "</span>" +
                "<span class='glyphicon glyphicon-eye-open'>阅读(" + article.read_num + ")</span></div>"));
            loadingAnime.before(item);
        })
    }

    //绑定鼠标滚动事件
    $(window).scroll(function(){
        var pageH = $(document.body).height();
        var scrollH = $(window).scrollTop();
        console.log("pageH:" + pageH + "  winH:" + winH + "  scrollH:" + scrollH);
        //之所以是-40是因为我把body的margin-bottom设了50，而且pageH是只算body范围内的，maigin-bottom的50没有算进去.......
        if(pageH - winH - scrollH <= -40 && !isGettingData)
        {
            getData();
        }

        if(currentIndex >= maxSize)
            $(window).unbind();
    });

    //加载置顶文章
    $.ajax({
        url:"/admin/getArticleTop",
        dataType:'json',
        success:function (data) {
            $("#topTitle").html("<a href='/admin/article-detail?articleId=" + data.id + "'>" + data.title + "</a>");
            $("#topSummary").html(data.summary);
            $("#topTime").text(data.time);
            $("#topReadNum").text("阅读(" + data.read_num + ")");
        },
        error:function () {
            alert("error");
        }
    })
	
	//点击下三角按钮弹出菜单,鼠标移开的话菜单收回
    $(".itemLeft").on("click",".item > .dropdown",function () {
        $(this).addClass("open");
    })
    $(".itemLeft").on("mouseleave",".item > .dropdown",function(){
        $(this).removeClass("open");
        console.log("out");
    })
})




