//menu
$(document).ready(function(){
	//首页轮播图
	$.indexpic();
	$('.hot_search a').hover(function() {
		var fid = $(this).attr('id');
		$('#gf'+fid).show().siblings('ul').hide();
		$(this).addClass('hot').siblings().removeClass('hot');
	});
});


jQuery.extend({
	indexpic:function () {
		//首页轮播图
		var showtimes = 0;//切换index
		var fadeSpeed = 5000;//切换时间
		var img_b = $(".mt");//图片区域
		var thumb_b = $(".hd li");//缩略图
		var pic_num = $(".mt").length;//个数
		var showImg = function(){
			//大屏背景切换
			$('.indexpic').css('backgroundColor',$(".mt").eq(showtimes).css('backgroundColor'));
			//图片淡出
			img_b.hide();
			// img_b.stop(true, true).fadeOut(500);
			//图片淡入
			img_b.eq(showtimes).stop(true, true).fadeIn(1200);
			// $(".mt").eq(showtimes).stop(true,true).fadeIn(800).siblings("div").fadeOut(600);
			//缩略图样式
			thumb_b.eq(showtimes).addClass('on').siblings('li').removeClass('on');
			showtimes += 1;
			if (showtimes === pic_num) { showtimes = 0; }
		}
		//首次加截
		showImg();
		//增加自动切换
		loop = setInterval(showImg, fadeSpeed);
		//鼠标停在大图上不切换
		$(".bd").hover(function () {
			clearInterval(loop);
		}, function () {
			loop = setInterval(showImg, fadeSpeed);
		});
		//缩略图切换
		thumb_b.mouseover(function () {
			clearInterval(loop);
			showtimes_bak = $(this).index() + 1;
			if (showtimes_bak === pic_num) { showtimes_bak = 0; }
			//i 相同缩略图才切换
			if (showtimes_bak != showtimes) {
				showtimes = $(this).index();
				showImg();
			}

		}).mouseout(function () {
			loop = setInterval(showImg, fadeSpeed);
		});
	}

});

//首页各栏目选项卡
function showIndexTab (fid,_this) {
	$('#gf'+fid).show().siblings('ul').hide();
	$(_this).addClass('hot').siblings().removeClass('hot');
}