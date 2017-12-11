<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<title>论坛列表</title>
<link rel="stylesheet" href="../../css/mui.min.css"/>
<link rel="stylesheet" href="../../css/app.css"/>
<link rel="stylesheet" href="../../css/myiconfont.css"/>
</head>
<body >
<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 class="mui-title">社区论坛</h1>
</header>
<footer>
	<a href="../index/index.html" class="home">首页</a>
	<a href="../shop/shop_list.jsp" class="shop">商家</a>
	<a href="../exmall/jifen_shop_list.jsp" class="point_mall">积分商城</a>
	<a  class="communityon">社区</a>
	<a href="../person_msg/personCenter.html" class="my">我的</a>
</footer>
<div class="mui-content">
	 <div id="slider" class="mui-slider" >
	 	<div class="mui-slider-group mui-slider-loop" id="sImg">
		</div>
		<div class="mui-slider-indicator" id="indicatorH">
			<!--<div class="mui-indicator mui-active"></div>-->
		</div>
	</div>
	<div class="commumity_fist" id="featuredPost">
		<div class="commPost_top white">
			<strong>精选热帖</strong>
			<a href="community_MoreList.jsp" class="mui-pull-right">查看更多
			<i class="iconfont icon-jiantou-copy"></i></a>
		</div>
	</div>
	<section class="hot_post" >
		<strong>热门论坛</strong>
		<ul id="hot_post_list">
			
		</ul>
		<div href="" id="loadMore">查看更多</div>
	</section>
	<a href="community_releasePost.html" class="release">
		<img src="../../images/release.png">
	</a>
</div>
</body>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script src="../../js/common.js" ></script>
<script >
mui.init({
	swipeBack: true //启用右滑关闭功能
});	
var pageNum =1;
var pageSize=4;
function timeFormat(nS) { 
	var timestamp4=new Date(nS)
	  return timestamp4.toLocaleDateString().replace(/\//g, "-");     
};
postImg();
function imgList(arr){
	var src='';
	$.each(arr, function(i,j) {
		if(j.type==2){
			src=j.url;
			return false;
		}
	});
	return src;
}
function postImg(){//社团轮播图
	$.ajax({
		type:"get",
		url:apiUrl+"/appcms/getcontents",
		async:false,
		data:{
			"userId":storage['getUserId'],
			"sign":storage['getSign'],
			"region":storage['region'],
			"columnCode":"F01M01",
			"isGetImage":1
		},
		dataType:"json",
		success:function(data){
			var html='';
			var htmlA='';
			var len=data.pageInfo.list.length;
			html+='<div class="mui-slider-item mui-slider-item-duplicate">'+
				'<a href="#">'+
					'<img src="'+imgList(data.pageInfo.list[len-1].imageList)+'">'+
				'</a>'+
			'</div>';
			$.each(data.pageInfo.list,function(index,item){
				html+='<div class="mui-slider-item">'+
					'<a href="#">'+
						'<img src="'+imgList(item.imageList)+'" alt="img">'+
					'</a>'+
				'</div>'
				if(index==0){
					htmlA+='<div class="mui-indicator mui-active"></div>';
				}else{
					htmlA+='<div class="mui-indicator"></div>';
				}
			})
			html+='<div class="mui-slider-item mui-slider-item-duplicate">'+
				'<a href="#">'+
					'<img src="'+imgList(data.pageInfo.list[0].imageList)+'">'+
				'</a>'+
			'</div>';
			$("#sImg").html(html);
			var slider= mui("#slider");
			slider.slider({
				interval: 3000
			});
			$('.mui-slider-item img').css("width",$(window).width());
			$('.mui-slider-item img').css("height",$(window).width()*9/16);
			$("#indicatorH").html(htmlA);
		}
	});
}
function postHtml(listItem,listItem1,listItem2){
	$.ajax({
	url:apiUrl+"/community/getarticles",
	type:"get",
	data:{
	  	"region":410100,
		"pageSize":listItem1,
		"pageNum":listItem2,
		"isHot":listItem
	},
	dataType:"json",
	success:function(d){			
		if(d.return_code=="SUCCESS"){
			if(listItem==0){
				var html='';
				$.each(d.pageInfo.list,function(index,item){
					html+='<li>'+					
					'<div class="hP_listH">'+
						'<header class="h_top" id="">'+
				    		'<img src="';
				    			if(item.logoUrl){
				    				html+=item.logoUrl;
				    			}else{
				    				html+='../../images/inite.png';
				    			}
				    	html+='" width="12%"/>'+
				    		'<span class="commItem">';
		    				if(item.nickname){
		    					html+='<strong>'+
		    					item.nickname.replace(/^(.).*(.)$/,"$1***$2")+'</strong>';
		    				}else{
		    					html+='<strong class="blue">平台发布</strong>';
		    				}
				    html+='<i>'+getDateDiff(item.created)+'</i>'+
				    		'</span>'+
				   		'</header>'+
					'</div>'+
					'<div class="hP_listC">'+
						'<a href="community_detail.jsp?id='+ item.id+'" style="width:100%;display:block;">'+
							'<p class="text"><strong>['+item.title+']</strong>';
							if((item.content).length>50){
								html+=(item.content).substr(0,50)+'...';
							}else{
								html+=item.content;
							}
						html+='</p>';
							html+='<div class="pic">';
							$.each(item.imageList, function(item1,item2) {
								html+='<img src="'+ item2.url+'"/>';
								
							})
					html+='</div></a>';
					html+='<p class="f">'+
						'<span>'+
							'<i class="iconfont icon-faxian"></i>'+item.clickAmount+
						'</span>'+
						'<span class="mui-pull-right">'+
							'<i class="iconfont icon-pinglun"></i>'+item.replyAmount+
						'</span>'+
						'<span class="mui-pull-right">'+
							'<i class="iconfont icon-dianzan"></i>'+item.goodAmount+
						'</span>'+
					'</p>'+
				'</div>'+
			'</li>'
		})
				$('#hot_post_list').append(html);
				if(d.pageInfo.size<pageSize){
					$('#loadMore').hide();
					var $p=$("<p style='text-align: center;'>没有更多数据了</p>");
					$('#hot_post_list').after($p);
				}
		}else{
			var html='';
			$.each(d.pageInfo.list,function(i,j){
				html+='<div class="mui-row commumity_item">'+
						'<div class="mui-col-xs-8">'+
							'<a href="community_detail.jsp?id='+ j.id+'" class="mui-row">'+
							'<strong>'+j.title+'</strong></a>'+
							'<div class="commFoot_items">'+
								'<span><i class="iconfont icon-faxian"></i>'+j.clickAmount+'</span>'+
								'<span><i class="iconfont icon-pinglun"></i>'+j.replyAmount+'</span>'+
								'<span><i class="iconfont icon-dianzan"></i>'+j.goodAmount+'</span>'+
							'</div>'+
						'</div>'+
						'<div class="mui-col-xs-4">'+
							'<a href="community_detail.jsp?id='+ j.id+'" style="display:inline-block;">'+
							'<img class="" src="'+j.imageList[0].url+'" width="100%" height="75">'+
							'</a>'+
						'</div>'+
							
					'</div>'
			})
			$('#featuredPost').append(html);
				
			}
		}
	}
})
}
postHtml(1,3,pageNum);
postHtml(0,pageSize,pageNum);
$('#loadMore').click(function(){
	pageNum++;
	postHtml(0,pageSize,pageNum);
})	
if($.getUrlParam('para')=="post"){
	mui.toast('发布成功')
}
</script>
</html>