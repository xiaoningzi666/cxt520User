<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=yes">
<link rel="stylesheet" href="../../css/mui.min.css">
<link rel="stylesheet" href="../../css/app.css">
<link rel="stylesheet" href="../../css/myiconfont.css" />
<title>商家列表</title>
</head>
<body>
<header class="mui-bar mui-bar-nav">
	<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
	<h1 class="mui-title">商家列表</h1>
</header>
<div class="mui-content" style="padding-bottom: 50px;">
	<nav class="nav_wrap">
		<a id="sort">
			<i id="s_h">全部</i>
			<span class="mui-icon mui-icon-arrowdown" ></span>
		</a>
		<a class="myActive" id="lbs">距离</a>
		<a id="score">评分</a>
		<a id="sales">人气</a>
	</nav>
	<ul id="collection_list"  class="collecction_list" style="margin-top: 40px;">
		
	</ul>
	<div id="mynav_wrap">
		<ul id="class_nav" class="first_nav" style="display: none;">
		</ul>
	</div>	
	<div class="telcon">
		<div class="tel">
			<p class="orange"><img src="../../images/loading.gif"/></p>
			<span class="confirmbtn">确定</span>
		</div>
	</div>
	<footer>
		<a href="../index/index.html" class="home">首页</a>
		<a class="shopon">商家</a>
		<a href="../exmall/jifen_shop_list.jsp" class="point_mall">积分商城</a>
		<a href="../community/community_list.jsp" class="community">社区</a>
		<a href="../person_msg/personCenter.html" class="my">我的</a>
	</footer>
</body>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script src="../../js/common.js"></script>
<script type="text/javascript" src="../../js/shop_list.js" ></script>
</html>