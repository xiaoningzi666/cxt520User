<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<link rel="stylesheet" href="../../css/mui.min.css">
<link rel="stylesheet" href="../../css/myiconfont.css" />
<link href="../../css/app.css" rel="stylesheet"/>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
	    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
	    <h1 class="mui-title">选择支付方式</h1>
	</header>
	<div class="mui-content" >
		<div class="mui-row mymuirow">
		    <div class="mui-col-xs-6 mycol1">
		    	<strong><i id="dur"></i>个月VIP</strong>
		    </div>
		    <div class="mui-col-xs-6 mycol2">
		    	<span class="red"></span>
		    </div>
		</div>
		<form class="mui-input-group myinputgroup">
			<div class="mui-input-row mui-radio mymuiradio">
				<label><span class="mui-icon mui-icon-weixin green"></span>&nbsp;&nbsp;微信</label>
				<input name="radio1" type="radio">
			</div>
			<div class="mui-input-row mui-radio mymuiradio">
				<label><img src="../../images/VIP_experience/zhifubao.png" width="20"/>&nbsp;&nbsp;支付宝</label>
				<input name="radio1" type="radio" checked>
			</div>
		</form>
		<p class="confirmBtn">立即支付</p>
	</div>
</body>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script type="text/javascript">
	mui.init();
	var storage = window.localStorage; 
	$('#dur').text(storage['step']);
	$('.mycol2 span').text('¥'+storage['totalAmount'])	
</script>
</html>