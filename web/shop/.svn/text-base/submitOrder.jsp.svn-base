<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="../../css/mui.min.css">
<link rel="stylesheet" href="../../css/app.css">
<link rel="stylesheet" href="../../css/myiconfont.css">
<title>商家详情</title>
</head>
<body>
	<header id="header" class="mui-bar mui-bar-transparent">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">订单详情</h1>
	</header>
	<div class="bottom_item">
		<section>
			<span>合计：<strong id="priceTotal" class="red">0:00</strong></span>
			<span>已选<i id="seviceNum" class="red">0</i>项服务</span>
		</section>
		<a id="submitOrder">提交订单</a>
	</div>
	<div class="mui-content" style="padding-top: 45px; padding-bottom: 50px;">
		<div class="head_con">
		   	<span class="bookPerson">预约人：</span>
		    <span class="bookPhone"></span>
		</div>
		<section class="white orderDetailItems">
			<h4 class=""><img src="../../images/confirm_order/mall_icon.png" /><span class="mallname">车信通自营商店</span></h4>
			<ul class="orderDetailList" id="orderDetailList">
			</ul>
		</section>
	</div>
	<div id="toast" class="toast" style="left: 0;margin: 0 10px;">
		您选择的服务项目需要到店下单，请您到达商家后再提交订单，感谢您的配合。
	</div>
</body>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script src="../../js/common.js"></script>
<script type="text/javascript">
	mui.init();
	var serviceArray='';
	$('.mallname').text(storage['mallName'])
	$('.bookPerson').text('预约人：'+storage['nickName']);
	$('.bookPhone').text(storage['getPhone']);
	//console.log(storage['mallName'])
	$.ajax({
		type:"get",
		url:apiUrl+"/merchant/getmerchantservices",
		data:{
			"merchantId":$.getUrlParam("merchantId")	
		},
		dataType:"json",
		success:function(data){
			
			var serviceId=$.getUrlParam("serviceId").split(',');
			var serviceNum=$.getUrlParam("serviceNum").split(',')
			var html='';
			$.each(data.merchantServiceList, function(index,item) {
				$.each(serviceId, function(i,j) {
					if(item.id==j){
						var pItem=0;
						$.each(item.priceList, function(q,p) {
							if(storage['level']==p.member_level){
								pItem=p.price;
							}
						});
						html+='<li>'+
						'<strong>'+item.service+'</strong>'+
						'<img src="../../images/VIP_experience/v'+storage['level']+'.png" width="15" class="elem2"/>'+
						'<span >¥'+pItem+'</span>'+
						'<span class="elem1">¥'+item.price+'</span>'+
						'<span class="mui-pull-right">X'+serviceNum[i]+'</span>'+
						'<p>'+item.abstraction+'</p>'+
						'<div class="">'+
							'<span class="iconfont icon-shanchu"></span>'+
							'<span class="mui-pull-right ">小计：<i class="itemTotal">¥'+parseInt(pItem*serviceNum[i])+'</i></span>'+
						'</div>'+
					'</li>'
					}
				});
				
			});
			$('#orderDetailList').html(html)
		}
	});
	$('#priceTotal').text($.getUrlParam("priceTotal"))
	$('#seviceNum').text($.getUrlParam("TotalNum"))
	var AserviceId=$.getUrlParam("serviceId").split(',');
	var AserviceNum=$.getUrlParam("serviceNum").split(',');
	var serviceItem='';
	console.log($.getUrlParam("serviceId").split(','))
	console.log($.getUrlParam("serviceNum").split(','))
	for(var i=0;i<AserviceId.length;i++){
		serviceItem+=AserviceId[i]+','+AserviceNum[i]+';';
	}
	console.log(serviceItem)
	$('#submitOrder').click(function(){
		$.ajax({
			type:"post",
			url:apiUrl+"/orders/createorder",
			data:{
				"userId":storage['getUserId'],
				"sign":storage['getSign'],
				"x":(storage["cityLat"]?storage["cityLat"]:0),
				"y":(storage["cityLng"]?storage["cityLng"]:0),
				"merchantId":$.getUrlParam("merchantId"),
				"amount":$.getUrlParam("priceTotal"),
				"serviceArray":serviceItem
			},
			dataType:"json",
			success:function(data){
				if(data.return_code=="SUCCESS"){
					if($.getUrlParam("priceTotal")==0){
						window.location.assign('order_detail.jsp?orderId='+data.orderId)
					}else{
						window.location.assign('order_payWay.jsp?orderId='+data.orderId+'&priceTotal='+$.getUrlParam("priceTotal"))
			
					}
				}else{
					$('#toast').fadeIn()
					setTimeout(function(){
						$('#toast').fadeOut()
					},5000)
				}
				//alert(data.orderId)
			}
		});
	})
</script>
</html>