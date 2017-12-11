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
	<header id="header" class="mui-bar mui-bar-transparent show hide">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">商家详情</h1>
		<a class="mui-pull-right collBtn"><span class="iconfont icon-shoucang"></span><i>收藏</i></a>
	</header>
	<div class="bottom_item show hide">
		<section>
			<span>合计：<strong id="priceTotal" class="red">0:00</strong></span>
			<span>已选<i id="seviceNum" class="red">0</i>项服务</span>
		</section>
		<a  id="itemList">我选好了</a>
	</div>
	<div class="mui-content" style="padding-top: 45px; padding-bottom: 50px;">
		<div id="con">
			
		</div>
		
		
		<section class="sevice_items" id="seviceList">
		</section>
		<section class="appraise_wrap" id="commentListwrap">
		</section>
	</div>
	<div id="M" class="M">
		<div class="modal">
			<strong>温馨提示</strong>
			<p>当前服务是单选服务，不能与其他服务同时下单，是否继续?</p>
			<button type="button" id="cancel">取消</button>
			<button type="button" id="confirm" class="yes">继续</button>
		</div>
		<div class="mask"></div>
	</div>
	<div id="M2" class="M">
		<div  class="modal">
			<strong>温馨提示</strong>
			<p>您选的服务项目中含有单选项目，单选项目不能与其他项目同时下单，是否继续?</p>
			<button type="button" id="close">否</button>
			<button type="button" id="comeon" class="yes">是</button>
		</div>
		<div class="mask"></div>
	</div>
	<div id="M3" class="M">
		<div  class="modal">
			<strong>温馨提示</strong>
			<p>您当前选的服务有到店消费服务，请确定是否在店内消费？</p>
			<button type="button" id="quit">否</button>
			<button type="button" id="reach" class="yes">是</button>
		</div>
		<div class="mask"></div>
	</div>
	<div id="M4" class="M">
		<div  class="modal">
			<strong>温馨提示</strong>
			<p>您还不是认证会员，赶紧去个人中心认证吧！</p>
			<button type="button" id="unidenty">暂不认证</button>
			<button type="button" id="identy" class="yes">立即认证</button>
		</div>
		<div class="mask"></div>
	</div>
	<div id="M5" class="M">
		<div  class="modal">
			<strong>温馨提示</strong>
			<p>该商家<span id="txt"></span>，暂时无法提供服务，感谢您的支持！</p>
			<button type="button" id="stop">我知道了</button>
		</div>
		<div class="mask"></div>
	</div>
	<div class="telcon">
		<div class="tel">
			<p class="orange"><img src="../../images/loading.gif"/></p>
			<span class="confirmbtn">确定</span>
		</div>
	</div>
</body>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script src="../../js/common.js" ></script>
<script src="../../js/shop.detail.js" ></script>
<script>
	mui.init({
		swipeBack: true //启用右滑关闭功能
	});
	var slider= mui("#slider");
	slider.slider({
		interval: 3000
	});	
	
</script>
</html>