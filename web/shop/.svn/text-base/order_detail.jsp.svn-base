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
	<div class="tabfoot" style="display: none;">
		<button type="button" class="mui-btn mui-btn-outlined">取消订单</button>
		<button type="button" class="mui-btn mui-btn-danger mui-btn-outlined red" id="paybtn">付款</button>
	</div>
	<div class="mui-content">
		<div class="orderDetail_first">
				<span class="orderStatus2" style="display: none;">
					<i>下单成功！</i><br>
					快去保养您的爱车吧
				</span>
				<span class="orderStatus0" style="display: none;">
					<i>等待买家付款</i><br>
					不赶紧使用会自动关闭哦！
				</span>
				<span class="orderStatus3" style="display: none;">
					<i>订单已完成</i><br>
					快去对该次服务进行评价吧
				</span>
				<span class="orderStatus4" style="display: none;">
					<i>订单已完成</i><br>
					快去查看新的服务吧
				</span>
				
		</div>
		<div class="kinerItem" id="service_item">
			
		</div>
		<div class="orderDetail_second">
			<p id="consumCodeWarp">
				<strong>消费码：</strong>
				<span class="orange" id="createconsume" ><img src="../../images/loading.gif" width="18"/> </span>
			</p>
			<section>
				<p>订单编号：<i id="orderNum"></i></p>
				<p>订单状态：<span class="red" id="orderStatus"></span></p>
				<p>订单时间：<i id="orderTime"></i></p>
			</section>
		</div>
		<article class="orderDetail_third red">温馨提醒：订单已生效，请在1小时内完成消费，以免订单失效，耽误您的时间。
		</article>
	</div>
	
</body>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script src="../../js/common.js"></script>
<script src="../../js/order_detail.js" ></script>
</html>