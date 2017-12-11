<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link href="../../css/mui.min.css" rel="stylesheet" />
<link rel="stylesheet" href="../../css/app.css" />
<title>商品描述</title>	
</head>
<body>
	<header class="mui-bar mui-bar-nav">
	    <a href="jifen_shop_list.jsp"  class="mui-icon mui-icon-left-nav mui-pull-left"></a>
	    <h1 class="mui-title">商品描述</h1>
	</header>
	<div class="mui-content jf_productDetail" id="jf_productDetail">
		<div id="slider" class="mui-slider" >
			<div class="mui-slider-group mui-slider-loop" id="sImg">
			</div>
			<div class="mui-slider-indicator" id="indicatorH">
			</div>
		</div>
		<div class="prowrap">
			<div class="loading">
				<img src="../../images/shop_detail/reload.gif" />
			</div>
		</div>
	</div>
</body>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script src="../../js/common.js"></script>
<script type="text/javascript">
mui.init({swipeBack: true});	
var proNum=$('#countNum input').val();
var goodsInfo=$('#product_img img').src;
function ImgSrcArr(arr){
	var Asrc=[];
	$.each(arr, function(i,j) {
		if(j.type==3){
			Asrc.push(j.url)
		}
	});
	return Asrc;
}
$.ajax({
	type:"get",
	url:apiUrl+"/mall/getgoodsdetails",
	data:{
		"userId":storage['getUserId'],
		"sign":storage['getSign'],
		"id":$.getUrlParam("id"),
		"region":storage['region'],
		"appclient":($.getUrlParam('appclient')?$.getUrlParam('appclient'):'')
	},
	dataType:"json",
	success:function(data){
		var html='';
		var sHtml='';
		var len=data.goodsInfo.imageList.length-1;
		var html='';
		var htmlA='';
		var slider= mui("#slider");
		if(len>0){
			sHtml+='<div class="mui-slider-item mui-slider-item-duplicate">'+
					'<a href="#">'+
						'<img src="'+ImgSrcArr(data.goodsInfo.imageList)[len]+'">'+
					'</a>'+
				'</div>';
			$.each(ImgSrcArr(data.goodsInfo.imageList), function(index,item) {
				sHtml+='<div class="mui-slider-item">'+
						'<a href="#">'+
							'<img src="'+item+'">'+
						'</a>'+
					'</div>';
				if(index==0){
					htmlA+='<div class="mui-indicator mui-active"></div>';
				}else{
					htmlA+='<div class="mui-indicator"></div>';
				}
			});
			sHtml+='<div class="mui-slider-item mui-slider-item-duplicate">'+
						'<a href="#">'+
							'<img src="'+ImgSrcArr(data.goodsInfo.imageList)[0]+'">'+
						'</a>'+
					'</div>';
		}else{
			sHtml='<div class="mui-slider-item mui-slider-item-duplicate">'+
					'<a href="#">'+
						'<img src="../../images/girl2.png">'+
					'</a>'+
				'</div>';
		}
		$('#sImg').html(sHtml)
		$('.mui-slider-item img').css("width",$(window).width());
		$('.mui-slider-item img').css("height",$(window).width()*9/16);
		$("#indicatorH").html(htmlA);
		slider.slider({
			interval: 3000
		});
		html+='<div class="Jf_product_item1">'+
		    	'<strong>'+data.goodsInfo.title+'</strong>'+
		    	'<p><span>'+data.goodsInfo.exchangePrice+'</span>'+
		    		'<span>运费：¥'+isdot(data.goodsInfo.postage)+'</span>'+
		    		'<span class="mui-pull-right">库存：'+data.goodsInfo.amount+'</span>'+
		    	'</p>'+
			'</div>'+
			'<ul class="mui-table-view mui-table-view-chevron1  " style="margin-top:5px;">'+
				'<li class="mui-table-view-cell" style="padding-bottom: 5px;">'+
					'<span class="buy_num"><i>购买数量</i></span>'+
					'<div class="mui-pull-right" id="countNum">'+
						'<span  class="minusBtn" >-</span>'+
						'<input type="text" value="1" />'+
						'<span  class="addBtn">+</span>'+
					'</div>'+
				'</li>'+
				'<li class="mui-table-view-cell">'+
					'<span class="buy_way">'+
						'<i>支付方式</i>'+
					'</span>'+
					'<span class="mui-pull-right buy_wayNext">积分兑换</span>'+
				'</li>'+
		'</ul>'+
		'<div class="productDetail_con">'+
			'<header><strong>商品描述</strong></header>'+
			'<section id="productDetail_con" style="height: auto;">';
				if(data.goodsInfo.description){
					html+='<p class="head">'+data.goodsInfo.description+'</p>'+
					data.goodsInfo.showDetail;
				}
		html+='</section>'+
		'</div>'+
		'<a  class="jf_exchangBtn" id="jf_exchangBtn">'+
		'</a>';
		$('.prowrap').html(html)
		count()
		if(storage['score']){
			if(storage['score']<data.goodsInfo.exchangePrice){
				$('#jf_exchangBtn').html("<strong>您的积分不足</strong>").css({
					"background":"#777",
				})
			}else{
				$('#jf_exchangBtn').html("<strong>立即对换</strong>").css({
					"background":"#00a0e9",
				})
				$('#jf_exchangBtn').click(function(){
					$(this).attr("href","jfConfirm_order.jsp?num="+
					$('#countNum >input').val()+"&id="+$.getUrlParam("id"))
				})
			}
		}else{
			$('#jf_exchangBtn').html("<strong>请登录</strong>").css({
					"background":"#777",
			})
			$('#jf_exchangBtn').click(function(){
					$(this).attr("href","../login-sign/login.jsp")
			})
		}
		
	}
});
function count(){
	var t=$('#countNum >input').val();
	$('#countNum .addBtn').click(function(){
		t++;
    	$('#countNum >input').val(t);
	});
	$('#countNum .minusBtn').click(function(){
		if(t>0){
			t--;
		}
		$('#countNum >input').val(t)
		
	})
}
</script>
</html>