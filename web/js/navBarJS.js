/**
 * Created by qq578 on 2017/5/27.
 */
$(function(){
    $(document).off('click.bs.dropdown.data-api');
})

$("nav .dropdown").hover(function(){
    $(this).addClass("open");
},function () {
    $(this).removeClass("open");
})