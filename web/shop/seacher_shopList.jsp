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
<title>商家列表</title>
</head>
<body>
<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 class="mui-title">
    	<form class="search_wrap" id="search">
    		<span class="iconfont icon-sousuo"></span>
    		<input type="text" id="" class="search_btn"/>
    	</form>
    </h1>
    <i class="mui-pull-right editBtn" id="searchBtn">搜索</i>
</header>
<div class="mui-content" style="padding-bottom: 50px;">
	<div id="mynav_wrap">
		<ul id="class_nav" class="first_nav" style="display: none;">
		</ul>
	</div>	
	<div  class="mui-slider mui-fullscreen">
		<div class="mui-scroll-wrapper mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
			<div class="mui-scroll my-mui-scoll" >
				<a href="javascript:void(0)" class="mui-control-item mui-active drap_down" id="sort"><span id="s_h">全部</span><span class="mui-icon mui-icon-arrowdown" ></span></a>
				<a href="javascript:void(0)" class="mui-control-item" id="lbs">距离</a>
				<a href="javascript:void(0)" class="mui-control-item" id="sales">人气</a>
				<a href="javascript:void(0)" class="mui-control-item" id="score">评分</a>
				<!--<a href="javascript:void(0)" class="mui-control-item">筛选<span class="iconfont icon-shaixuan"></span></a>-->
			</div>
		</div>
		<div class="mui-slider-group">
			<div id="item1mobile" class="mui-slider-item mui-control-content mui-active">
				<div id="scroll1" class="mui-scroll-wrapper">
					<div class="mui-scroll" >
						<div class="itemlist_wrap">
							<div class="sel_items white">
						 		<ul id="collection_list"  class="collecction_list">
						        </ul>
						        <!--<div style="text-align: center;padding: 10px;"><a class="more" style="color: #2187E7;">查看更多</a></div>-->
					 		</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="no_order" style="width: 9rem; text-align: center;margin:120px auto;display: none;" >
	<img src="../../images/confirm_order/no_order.png" />
	<p style="text-align: center;">目前没有相关订单</p>
</div>
<footer>
	<a href="../index/index.html" class="home">首页</a>
	<a  class="shopon">商家</a>
	<a href="../exmall/jifen_shop_list.jsp" class="point_mall">积分商城</a>
	<a href="../community/community_list.jsp" class="community">社区</a>
	<a href="../person_msg/personCenter.html" class="my">我的</a>
</footer>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script src="../../js/common.js"></script>
<script src="../../js/seacher_shopList.js" ></script>
</body>
</html>