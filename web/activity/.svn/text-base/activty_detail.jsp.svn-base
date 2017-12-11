<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link href="../../css/mui.min.css" rel="stylesheet" />
<link rel="stylesheet" href="../../css/app.css" />
<link rel="stylesheet" href="../../css/myiconfont.css" />
<title>活动详情</title>
</head>
<body>
<header class="mui-bar mui-bar-nav show hide">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 class="mui-title">活动详情</h1>
</header>
<div class="mui-content active_wrap" id="active_wrap">
</div>
<div class="activityBtn">
	<a href="activty_list.jsp"><img src="../../images/activity/moreActivity.png"/> </a>
	<img src="../../images/activity/top@2x.png" class="backtopBtn"/>
</div>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script src="../../js/common.js"></script>
<script type="text/javascript">
mui.init();
var Url=apiUrl+'/activity/getactivitydetails?activityId='+$.getUrlParam("id");
if($.getUrlParam('appclient')){
	Url=Url+'&appclient='+$.getUrlParam('appclient');
}
$.ajax({
	type:"get",
	url:Url,
	dataType:"json",
	beforeSend:function(XMLHttpRequest){
		$('#active_wrap').html(
			'<div style="text-align:center;margin-top:40%">加载中...</div>'
		).css('background','rgba(255, 255, 255, 0)');
	},
	success:function(d){
		var html='';
		html+='<header class="activtyHead">'+'<h3>'+ d.data.title+'</h3>'+
		'<span class="activty_time">'+timeFormat1(d.data.created)+'</span>'+
		'&nbsp;&nbsp;<span class="activty_address" style="color:#777">'+storage["regionName"]+'520</span> '+
	'</header>'+
	'<div class="activtyTop">'+
		'<div class="left">'+
			'<strong>活动时间：</strong>'+
		'</div>'+
		'<div class="right">'+
			timeFormat1(d.data.startDate)+'至'+timeFormat1(d.data.endDate)+
		'</div>'+
	'</div>'+
	'<div class="activtyTop">'+
		'<div class="left">'+
			'<strong>活动地点：</strong>'+
		'</div>'+
		'<div class="right">'+
			d.data.address+
		'</div>'+
	'</div>'+
	'<div class="activtyTop">'+	
		'<div class="left">'+
			'<strong>活动要求：</strong>'+
		'</div>'+
		'<div class="right">'+d.data.required+
		'</div>'+	
	'</div>'+
	'<section class="abstract">'+
		'<strong>摘要：</strong>'+d.data.abstraction+
	'</section>'+
	'<section class="actDetail">'+d.data.showDetail+
	'</section>';
		$('#active_wrap').html(html).css('background','#fff');
		
	},
	error:function(XMLHttpRequest, textStatus, errorThrown){
		$('#active_wrap').html(
			'<div class="" style="width: 9rem; text-align: center;margin:120px auto;" >'+
//				'<img src="../../images/confirm_order/no_order.png" />'+
				'<p style="text-align: center;">网络出错啦，请重新刷新</p>'+
			'</div>'
	)
		
	}
	
});	
function backTop(){
	var btn=document.getElementsByClassName('backtopBtn')[0];
	var timer=null;
	var isTop=true;
	var clientHeight=document.documentElement.clientHeight
	window.onscroll=function(){
		var osTop=document.documentElement.scrollTop||document.body.scrollTop;
//		if(osTop>=clientHeight){
//			btn.style.display="block";
//		}
		if(!isTop){
			clearInterval(timer)
		}
		isTop=false;
	}
	btn.onclick=function(){
		timer=setInterval(function(){
			var osTop=document.documentElement.scrollTop||document.body.scrollTop;
			var ispeed=Math.floor(-osTop/6);//向下取整数
			document.documentElement.scrollTop=document.body.scrollTop=osTop+ispeed;
			isTop=true;
			if(osTop==0){
				clearInterval(timer)
			}
		},50)
		
	}
}
backTop()
</script>
</body>
</html>