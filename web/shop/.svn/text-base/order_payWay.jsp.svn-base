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
<link rel="stylesheet" href="../../css/myiconfont.css" />
<title>选择支付方式</title>
</head>
	<body>
		<div class="payHead">
			<a  id="backPay"><span class="mui-icon mui-icon-back "></span></a>
			<span>选择支付方式</span>
		</div>
		
		<div class="mui-content" style="padding: 50px 0;">
			<div class="mui-row mymuirow">
			    <div class="mui-col-xs-6 mycol1">
			    	<strong>需要支付的金额</strong>
			    </div>
			    <div class="mui-col-xs-6 mycol2">
			    	<strong class="red" id="total"></strong>
			    </div>
			</div>
			<form class="mui-input-group myinputgroup">
				
					<div class="mui-input-row mui-radio mymuiradio">
						<label><span class="mui-icon mui-icon-weixin green"></span>&nbsp;&nbsp;微信</label>
						<input name="radio1" type="radio">
					</div>
					<div class="mui-input-row mui-radio mymuiradio">
						<label><span class="iconfont icon-tubiaozhizuomoban blue"></span>&nbsp;&nbsp;支付宝</label>
						<input name="radio1" type="radio" checked>
					</div>
					
			</form>
			<button type="button" class="OrderPayWay" id="OrderPayWayBtn">立即支付</button>
		</div>
		
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script src="../../js/common.js"></script>
<script type="text/javascript">
	
	mui.init();
	$('#total').text('¥'+$.getUrlParam('priceTotal'))
	$('#backPay').click(function(){
		$(this).attr('href','order_detail.jsp?orderId='+$.getUrlParam('orderId'))
	})
	
</script>
	</body>

</html>