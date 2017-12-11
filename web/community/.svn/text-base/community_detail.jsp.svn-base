<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
	
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<link rel="stylesheet" href="../../css/mui.min.css">
<link rel="stylesheet" href="../../css/app.css">
<link rel="stylesheet" href="../../css/myiconfont.css" />
<title>论坛详情</title>
</head>
<body>
	<header class="mui-bar mui-bar-nav show hide">
	    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
	    <h1 class="mui-title">论坛详情</h1>
	</header>
	<div class="mui-content comm_wrap">
		<div id="commItem1">
			<div class="loading">
				<img src="../../images/shop_detail/reload.gif" />
			</div>
		</div>
	  	<section class="comm_reviewList" id="comm_reviewList">
	  	</section>	 
	</div>
</body>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script src="../../js/common.js" ></script>
<script>
mui.init();
var type='';
commItem1()
commCon()
function commItem1(){
var Url1=apiUrl+'/community/getarticledetails?articleId='+$.getUrlParam("id");
if($.getUrlParam('appclient')){
	Url1=Url1+'&appclient='+$.getUrlParam('appclient');
}
$.ajax({//论坛详情
	type:"get",
	url:Url1,
	dataType:"json",
	success:function(data){
		if(data.return_code=="SUCCESS"){
			var comm_html='';
			var html='';
			$('.comm_wrap').addClass("white");
			html+='<header class="h_top" id="h_top">';
			if(data.articleInfo.logoUrl){
				html+='<img src="'+data.articleInfo.logoUrl+'" width="12%" style="vertical-align: middle;"/>';
			}else{
				html+='<img src="../../images/inite.png" width="12%" style="vertical-align: middle;"/>';
			}
    		html+='<span style="position: relative;">';
    				if(data.articleInfo.nickname){
    					html+='<strong>'+
    						(data.articleInfo.nickname).replace(/^(.).*(.)$/,"$1***$2")+'</strong>';
    				}else{
    					html+='<strong>平台发布</strong>';
    				}
    			html+='<i>'+getDateDiff(data.articleInfo.created)+'</i>'+
    				'</span></header>'+
		    		'<section class="commTextDetail" >'+
			    	'<div id="commTextDetail">'+
			    		'<h4>'+ data.articleInfo.title+'</h4>'+
				    	'<p>'+data.articleInfo.content+'</p>'+
				    	'<div class="comm_img">';
				    	$.each(data.articleInfo.imageList,function(index,item){
				    		html+='<img src="'+item.url+'"/>';
				    	})
				  	html+='</div>'+
			    	'</div>'+
			    	'<div class="commFoot_items commFoot_items_MarginTop">'+
			    		'<span id="">'+
			    			'<i class="iconfont icon-faxian"></i>浏览'+
			    			'<i id="clickAmount">'+data.articleInfo.clickAmount+'</i>'+
			    		'</span>'+
			    		'<span id="goodClick" class="mui-pull-right ">'+
			    			'<i class="iconfont icon-dianzan"></i>赞'+
			    			'<i id="goodAmount">'+data.articleInfo.goodAmount+'</i>'+
			    		'</span>'+
						'<span class="mui-pull-right" >'+
							'<i class="iconfont icon-pinglun"></i>评论'+
							'<i id="review">'+data.articleInfo.replyAmount+'</i>'+
						'</span>'+
			    	'</div>'+
			    	'<input type="text" name="" placeholder="评论" id="comment" readonly="readonly"/>'+
			    	'<div class="comm_f" id="comm_f">'+
				    	'<input type="text" name="" id="comment_text" autofocus="autofocus"/>'+
				    	'<button type="button" class="mui-pull-right" id="comment_submit">发送</button>'+
				   '</div>'+
			    '</section>'+
			    '<h4 class="reply_sum">'+
			    	'<strong id="reviewTotal">'+data.articleInfo.replyAmount+'</strong>人评论'+
			    '</h4>';
    		$('#commItem1').html(html)
    		$('#comment').click(function(){
				$('#comm_f').show();
			});
			$(window).scroll(function(){
				$('#comm_f').hide();
			})
			$('#comment_submit').click(function(){
				if(storage['getUserId']){
					if($('#comment_text').val()==''){
						mui.toast("评论内容不能为空")
					}else{
						fun_type(2);
					}
				}else{
					$('.toast').show();
					setTimeout(function(){
						$('.toast').hide();
					},1500)
				}
				$('#comm_f').hide();
			});	
			$('#goodClick').click(function(){
				if(storage['getUserId']){
					fun_type(1);
				}else{
					$('.toast').show();
					setTimeout(function(){
						$('.toast').hide();
					},1500)
				}
				
			})
		}else{
			mui.toast(data.return_msg)
		}
	}
});	
}
function commCon(){
var Url=apiUrl+'/community/getreplies?userId='+(storage['getUserId']?storage['getUserId']:'')+
	'&sign='+(storage['getSign']?storage['getSign']:'')+
	'&articleId='+$.getUrlParam('id')+
	'&type=2'+'&pageSize=100'+'&pageNum=1';
if($.getUrlParam('appclient')){
	Url=Url+'&appclient='+$.getUrlParam('appclient');
}
$.ajax({
	type:"get",
	url:Url,
	dataType:"json",
	success:function(data){
		if(data.return_code=="SUCCESS"){
			var reviewText_html='';
			$.each(data.pageInfo.list,function(i,j) {
				reviewText_html+='<div>'+
	    		'<header> ';
	    			if(j.logoUrl){
	    				reviewText_html+='<img src="'+j.logoUrl+'"/>';
	    			}else{
	    				reviewText_html+='<img src="../../images/inite.png"/>';
	    			}
				reviewText_html+=
			    	'<span>'+
			    		'<strong>'+j.nickname.replace(/^(.).*(.)$/,"$1***$2")+
			    			'<img src="../../images/VIP_experience/v'+j.level+'.png"/>'+
			    		'</strong>'+
			    		'<i>'+getDateDiff(j.created)+'</i>'+
			    	'</span>'+
			   '</header>'+
				'<p>'+ j.content+ '</p>'+
			'</div>';
			})
			$('#comm_reviewList').html(reviewText_html)	
			
		}else{
			mui.toast(data.return_msg)
		}
	}
});
}
function fun_type(type){
	$.ajax({
		type:"post",
		url:apiUrl+"/community/createreply",
		data:{
			"userId":storage['getUserId'],
			"sign":storage['getSign'],
			"content":$('#comment_text').val(),
			"articleId":$.getUrlParam("id"),
			"type":type
		},
		dataType:"json",
		success:function(data){
			if(type==1){
				if(data.return_code=="SUCCESS"){
					var s=parseInt($('#goodAmount').text());
					if(($('#goodClick').is('.active'))){
						s--;						
						$('#goodClick').removeClass('active');
						$('#goodClick i:first').css('color','#444');
						$('#goodAmount').text(s);
					}else{
						s++;
						$('#goodClick').addClass('active');
						$('#goodClick i').css('color','#00a0e9');
						$('#goodAmount').text(s);
					}
				}else{
					$('#goodClick').addClass('active');
					$('#goodClick i').css('color','#00a0e9');
					$('#goodAmount').text(s);
					mui.toast(data.return_msg)
				}
			}else{
				if(data.return_code=="SUCCESS"){
					location.reload();
				}
			}
		}
	})
}



</script>
</html>