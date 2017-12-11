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
</head>
<body>
	<header class="mui-bar mui-bar-nav">
	    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
	    <h1 class="mui-title">订单详情</h1>
	</header>
	<div class="tabfoot">
		<button type="button" class="mui-btn mui-btn-outlined">取消订单</button>
		<button type="button" class="mui-btn mui-btn-danger mui-btn-outlined">付款</button>
	</div>
	<div class="mui-content jforderSuccess_wrap" >
	    <div class="jforderSuccess_first wait_pay">
			<span>等待买家付款</span>
			<span>20分钟后自动关闭</span>
		</div>
		<div id="getorderDetail">
			
		</div>
		<div class="tip">
			温馨提示：订单提交后请务必在30分钟内付款，付款成功后请在24小时内进行完成消费，否则订单将自动失效，
			以免耽搁您的宝贵时间
		</div>		  		    
	</div>
</body>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script src="../../js/common.js"></script>		
<script type="text/javascript">
	mui.init()
	$.ajax({
		type:"get",
		url:apiUrl+"/mall/getorderdetails",
		data:{
			"userId":storage['getUserId'],
			"sign":storage['getSign'],
			"orderId":$.getUrlParam("orderId")
			
		},
		dataType:"json",
		success:function(data){
			var html='';
			var postage=data.mallOrderInfo.orderList[0].postage;
			postage=(postage+'').indexOf('.')!=-1?(postage+''):(postage+'.00')
				html+='<section class="order_content">'+
				    	'<div class="head_item">'+
				    		'<strong class="shop_icon">自营</strong>'+
				    	//	<!--<span>121221</span>-->
				    	'</div>'+
				    	'<div class="mui-row product_content">'+
				    	   ' <div class="mui-col-xs-3">'+
				    	    	'<img src="'+data.mallOrderInfo.orderList[0].imageUrl+'" width="100%"/>'+
				    	    '</div>'+
				    	    '<div class="mui-col-xs-9 product_item">'+
				    	    	'<strong>'+data.mallOrderInfo.orderList[0].goods_title+'</strong>'+
				    	    	'<span>'+data.mallOrderInfo.orderList[0].price +'</span>'+
				    	    	'<span>运费：¥'+postage+'</span>'+
				    	    	'<span id="pro_num">X'+data.mallOrderInfo.orderList[0].amount+'</span>'+
				    	    '</div>'+
				    	'</div>'+
				    	'<div class="">'+
				    		'<p>运费：¥<span>'+
				    			parseInt(data.mallOrderInfo.orderList[0].postage*data.mallOrderInfo.orderList[0].amount)+
				    			'</span></p>'+
				    		'<p>需付积分:<span>'+
				    		parseInt(data.mallOrderInfo.orderList[0].price*data.mallOrderInfo.orderList[0].amount)+
				    		'</span></p>'+
				    	'</div>'+
				    '</section>'+
				    '<article>'+
			    		'<span class="mui-icon mui-icon-chat" style="font-size:1.25rem;color:#444"></span>'+
			    		'<strong style="display: inline-block;margin-left: 7px;">买家留言</strong>'+
			    		'<p>'+
			    			data.mallOrderInfo.remark+
			    		'</p>'+
				    '</article>'+
				    '<section class="order_msg">'+
						'<p>订单编号：'+data.mallOrderInfo.orderList[0].order_id+'</p>';
						$.each(configList("mallOrderStatus"), function(i,j) {
							if(data.mallOrderInfo.status==j.value){
								html+='<p>订单状态：<span class="red">'+j.title+'</span></p>';
							}
						});
//						if(data.mallOrderInfo.status==-1){
//							html+='<p>订单状态：<span class="red">已取消</span></p>';
//						}else if(data.mallOrderInfo.status==0){
//							html+='<p>订单状态：<span class="red">待支付</span></p>';
//						}else if(data.mallOrderInfo.status==1){
//							html+='<p>订单状态：<span class="red">已完成</span></p>';
//						}else if(data.mallOrderInfo.status==2){
//							html+='<p>订单状态：<span class="red">已支付</span></p>';
//						}else{
//							html+='<p>订单状态：<span class="red">已发货</span></p>';
//						}
//							
						if(data.mallOrderInfo.postMethod==1){
							html+='<p>自提地址：'+data.mallOrderInfo.selfAddress+'</p>';
						}else{
							html+='<p>收件人：<span class="red">待支付</span></p>'+
							'<p>配送至：'+data.mallOrderInfo.memberAddress+'</p>';
						}
						html+='<p>支付方式：全积分</p>'+
						'<p>订单时间：'+timeFormat(data.mallOrderInfo.created)+'</p>'+
					'</section>'
					$('#getorderDetail').append(html)
		}
	});
</script>
</html>