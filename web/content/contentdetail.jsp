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
<body class="white">
<header class="mui-bar mui-bar-nav show hide">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 class="mui-title">头条</h1>
</header>
<div class="mui-content active_wrap" id="active_wrap">
</div>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script src="../../js/common.js"></script>
<script type="text/javascript">
mui.init();
var Url=apiUrl+'/appcms/getcontentdetails?contentId='+$.getUrlParam('id');
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
		html+='<header class="activtyHead">'+'<h3>'+ d.appContentInfo.title+'</h3>'+
		
		'<span>'+timeFormat1(d.appContentInfo.releaseTime)+'</span>&nbsp;&nbsp;<span style="color:#777"></span> '+
	'</header>'+
	
	'<section class="actDetail">'+d.appContentInfo.showContent+
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

</script>
</body>
</html>