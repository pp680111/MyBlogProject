/**
 * Created by qq578 on 2017/5/26.
 */
var playlistPageSize;
var playlistMaxSize;
var playlistCurrentIndex = 0;

$("#uploadBGPic").fileinput({
    language: 'zh',allowedFileTypes:["image"],
    allowedFileExtensions: ['jpg', 'png', 'gif'],
    uploadUrl:'/admin/uploadBackgroundPic',
    //禁止显示拖拽区
    dropZoneEnabled: false,
    //一次只能选择的文件数量
    maxFileCount: 1,
    //当达到文件数量上限之后选择的文件是否自动替换掉原来已经选择的文件，不自动替换的话会提示错误
    autoReplace: true,
    //开启异步上传
    uploadAsync:true,
});
$("#uploadBGPic").on("change",function(){
    if (window.FileReader) {
        var reader = new FileReader();
    } else {
        alert("你的垃圾ie不支持图片预览功能，请舍弃你的垃圾ie浏览器");
    }

    reader.onload = function (e) {
        $("body").css("background","url(" + e.target.result + ")");
    }

    reader.readAsDataURL($("#uploadBGPic").get(0).files[0]);
})

$("#uploadBGPic").on("fileuploaded",function (event,data) {
    var result = data.response.result;
    if(result == "success"){
        location.reload(true);
    }
    else alert("error");
})

$("#fast-backward").click(function(){
    playlistCurrentIndex = 0;
    loadPlaylistData();
})

$("#backward").click(function(){
    playlistCurrentIndex -= Number(playlistPageSize);
    loadPlaylistData();
})

$("#forward").click(function(){
    playlistCurrentIndex += Number(playlistPageSize);
    loadPlaylistData();
})

$("#fast-forward").click(function(){
    playlistCurrentIndex = parseInt(playlistMaxSize / playlistPageSize) * playlistPageSize;
    loadPlaylistData();
})

$("#addPlaylist").click(function () {
    $("#editPlaylistDialog").modal("show");
    $("#editPlaylistDialogConfirmBtn").click(function () {
        addPlaylist();
    });
})

function addPlaylist(){
    var formData = new FormData(document.getElementById("editPlaylistForm"));
    $.ajax({
        url:'/admin/addPlaylist',
        data:formData,
        dataType:'json',
        type:'post',
        contentType:false,
        processData:false,
        success:function(data){
            location.reload();
        },
        error:function () {
            alert("error");
        }
    })
}

function modifyPlaylist(id){
    var name = $("#pl" + id + " > td:nth-child(1)").text();
    var url = $("#pl" + id + " > td:nth-child(2)").text();
    $("#editPlaylistForm > div:nth-child(1) > input").val(name);
    $("#editPlaylistForm > div:nth-child(2) > input").val(url);
    $("#editPlaylistForm > input").val(id);
    $("#editPlaylistDialogConfirmBtn").click(function () {
        submitModifiedPlaylist();
    });
    $("#editPlaylistDialog").modal("show");
}

function submitModifiedPlaylist(){
    var formData = new FormData(document.getElementById("editPlaylistForm"));
    $.ajax({
        url:'/admin/modifyPlaylist',
        data:formData,
        dataType:'json',
        type:'post',
        contentType:false,
        processData:false,
        success:function(data){
            location.reload();
        },
        error:function () {
            alert("error");
        }
    })
}

function deletePlaylist(id){
    $("#myDialog").modal('show');
    $("#myDialogConfirmBtn").click(function(){
        confirmDeletePlaylist(id);
    });
}

function confirmDeletePlaylist(id){
    var formData = new FormData();
    formData.append("id",id);

    $.ajax({
        url:'/admin/deletePlaylist',
        data:formData,
        dataType:'json',
        type:'post',
        contentType:false,
        processData:false,
        success:function(data){
            location.reload();
        },
        error:function () {
            alert("error");
        }
    })
}

function loadPlaylistData(){
    var formData = new FormData();
    formData.append("index",playlistCurrentIndex);

    $.ajax({
        url:'/admin/getPlaylist',
        type:'post',
        dataType:'json',
        data:formData,
        contentType:false,
        processData:false,
        success:function(data){
            processPlaylistData(data.playlists);
        },
        error:function(){
            alert("error");
        }
    })
}

function processPlaylistData(data){
    $(data).each(function(i){
        var item = $("<tr id='pl" + this.id + "'></tr>");
        item.append($("<td>" + this.name + "</td>"));
        item.append($("<td>" + this.url + "</td>"));
        item.append($("<td><a onclick='deletePlaylist(" + this.id + ")'><span>删除</span></a>&emsp;<a onclick='modifyPlaylist(" + this.id + ")'><span>修改</span></a></td>"));
        $("#playlistTable > tbody").append(item);
    })

    if(parseInt(playlistMaxSize) <= parseInt(playlistPageSize))
    {
        $("#fast-backward").hide();
        $("#backward").hide();
        $("#forward").hide();
        $("#fast-forward").hide();
    }
    else if(parseInt(playlistCurrentIndex) == 0)
    {
        $("#fast-backward").hide();
        $("#backward").hide();
    }
    else if(parseInt(playlistCurrentIndex) > 0 && parseInt(playlistCurrentIndex) < parseInt(playlistMaxSize)){
        $("#fast-backward").show();
        $("#backward").show();
        $("#forward").show();
        $("#fast-forward").show();
    }
    else{
        $("#forward").hide();
        $("#fast-forward").hide();
    }
}

$(function(){
    playlistPageSize = $("#playlistPageSize").val();
    playlistMaxSize = $("#playlistMaxSize").val();

    loadPlaylistData();
})
