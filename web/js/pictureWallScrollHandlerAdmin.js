/**
 * Created by qq578 on 2017/5/26.
 */
/*
 大体思路就是根据content的宽度计算出要显示几列，然后建立对应数量的数组。
 图片的话建立一个数组，将创建好的img对象都放在里面，每当使用ajax想服务器拿数据的时候就将房这个数组里面添加img对象。
 每当img数组数量增加或者列数发生变化的时候就重新将img对象往里面填充
 填充的规则是哪一个grid_col的高度最低就往哪个数组里面填充
 */

/*
 目前这个东西有个缺点就是会出现img对象已经填充到grid_col里面了，但是尚未加载完成无法计算出高度的情况，
 这样就导致了计算当前高度最低的grid_col的时候出现错误，目前改进的思路如下：
 1、先把所有的加载进来放到一个数组里面
 2、对数组里面的所有img对象添加onload监听函数，只要加载完成就加入到height最低的列里面去。
 这样应该就能避免img未加载完成导致height计算出错

 */
var content = $("#content");
var container = $("#pictureFlowContainer");
var currentIndex = 0;
var maxSize = $("#maxSize").val();
var winH = $(window).height();
var isGettingData = false;
var loadingAnime = $("#loadingAnime");
var colNums;
var tmpImgObjArray;
//下面两个变量用来记录此次获取的图片的数量和当前加载完的图片的数量，当两者相等的时候说明所有图片加载处理完毕，可以进行下一次加载
var currentSize;
var currentProcessedImgObjNums;
$(function(){
    init();

    $(window).resize(function(){
        var newColNums = parseInt(content.width() / 320);
        //console.log("content width:" + content.width() / 300 + " newColNums" + newColNums);
        if(newColNums != colNums)
            init();
    })


})

function init(){
    container.empty();
    currentIndex = 0;
    colNums = parseInt(content.width() / 320);
    for(var i=0;i < colNums;i++){
        container.append($("<div class='grid_col' id='grid" + i + "'></div>"));
    }

    getData();
}

function getData(){
    $.ajax({
        url:'/admin/getPictures',
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
            currentSize = Number(data.size);
            currentProcessedImgObjNums = 0;
            tmpImgObjArray = new Array();
            processPictureData(data.pictureList);
        },
        error:function(error){
            //提示加载错误
            console.log("error");
        },
        complete:function(){
            //结束加载动画
            loadingAnime.hide();
            //isGettingData = false;
        }
    })
}

function processPictureData(data){
    $.each(data,function(i,picture){
        tmpImgObjArray[i] = new Image();
        tmpImgObjArray[i].src = "/img/pictureWall/" + picture.filename;
        tmpImgObjArray[i].setAttribute("class","imgStyle");
        tmpImgObjArray[i].onload = function () {
            var lowestGridCol = getLowestGridCol();
            var fancyboxLink = $("<a class='fancybox' data-fancybox-group='gallery' pictureId='" + picture.id + "'></a>");
            $(fancyboxLink).attr("href",$(tmpImgObjArray[i]).attr("src")).append($(tmpImgObjArray[i]));
            $(lowestGridCol).append($("<p></p>").append($(fancyboxLink)));
            currentProcessedImgObjNums++;
            $(this).fancybox();
            if(currentProcessedImgObjNums == currentSize)
            {
                isGettingData = false;
                $('.fancybox').fancybox();
                console.log("bind fancyBox");
            }
        }

    })
}
//取得高度最小的列，往里面添加图片
function getLowestGridCol(){
    var colArray = new Array();
    var tmpObj;
    $(".grid_col").each(function(k){colArray.push(this);});
    for(var i=0;i < colNums - 1;i++){
        for(var j=0;j < colNums - 1 - i;j++){
            if($(colArray[j]).height() > $(colArray[j + 1]).height())
            {
                tmpObj = colArray[j + 1];
                colArray[j + 1] = colArray[j];
                colArray[j] = tmpObj;
            }
        }
    }
    return colArray[0];
}

//绑定鼠标滚动事件
$(window).scroll(function(){
    var pageH = $(document.body).height();
    var scrollH = $(window).scrollTop();
    //console.log("pageH:" + pageH + "  winH:" + winH + "  scrollH:" + scrollH + "isGettingData:" + isGettingData);
    //之所以是-40是因为我把body的margin-bottom设了50，而且pageH是只算body范围内的，maigin-bottom的50没有算进去.......
    if(pageH - winH - scrollH <= -40 && !isGettingData)
    {
        getData();
    }

    if(currentIndex >= maxSize)
        $(window).unbind();
});

//这里绑定了鼠标经过图片上面弹出删除按钮的事件
$("#pictureFlowContainer").on("mouseenter",".grid_col > p",function(){
    $(this).append($("<span class='flowMenu' id='flowMenu'>删除</span>"));
})

$("#pictureFlowContainer").on("mouseleave",".grid_col > p",function(){
    $("#flowMenu").remove();
});

$("#pictureFlowContainer").on("click",".grid_col > p > span",function(){
    var pictureId = $(this).prev().attr("pictureId");
    var parent = $(this).parent();
    $.ajax({
        url:'/admin/deletePicture',
        type:'post',
        data:{'pictureId':pictureId},
        dataType:'json',
        success:function(data){
            if(data.result == "success")
                $(parent).hide(500);
            else alert("error");
        },
        error:function(error){
            //提示加载错误
            console.log("error");
        },
        complete:function(){
        }
    })
})
