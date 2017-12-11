<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<title>活动列表</title>
<link href="../../css/mui.min.css" rel="stylesheet" />
<link href="../../css/app.css" rel="stylesheet"/>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
	    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
	    <h1 class="mui-title">活动列表</h1>
	</header>
	<div class="mui-content  white" id="activtyList_wrap">
	    
	</div>
	<div id="load"></div>
</body>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script src="../../js/common.js"></script>
<script type="text/javascript">
	mui.init()
	$.ajax({
		type:"get",
		url:apiUrl+"/activity/getactivities",
		data:{
			"station":410100,
			"pageSize":5,
			"pageNum":1
		},
		dataType:"json",
		beforeSend:function(XMLHttpRequest){
			$('#load').html(
				'加载中...'
			);
		},
		success:function(data){
			var html='';
			if (data.pageInfo.list.length==0) {
				$('#activtyList_wrap').html(
					'<div class="" style="width: 9rem; text-align: center;margin:120px auto;" >'+
						'<img src="../../images/confirm_order/no_order.png" />'+
						'<p style="text-align: center;">还没有相关消息</p>'+
					'</div>'
				)
			}
			$.each(data.pageInfo.list, function(index,item) {
				html+='<div class="mui-row activtyList_wrap">'+
					       '<div class="mui-col-xs-3 actPadding">'+
					       		'<a href="activty_detail.jsp?id='+item.id+'">'+
					       			'<img src="'+item.imageUrl+'" width="100%"/>'+
					       		'</a>'+
					       ' </div>'+
					        '<div class="mui-col-xs-9 actPadding">'+
					        	'<a href="activty_detail.jsp?id='+item.id+'">'+
					        		'<h4>'+item.title+'</h4>'+
					        		'<span style="color:#888">'+timeFormat1(item.created)+'至'+timeFormat1(item.endDate) +'</span>'+
					        	'</a>'+
					        '</div>'+
					    '</div>'
			});
			$('#activtyList_wrap').html(html);
		},
		complete:function(XMLHttpRequest){
			$('#load').hide()
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			$('#activtyList_wrap').html(
				'<div class="" style="width: 9rem; text-align: center;margin:120px auto;" >'+
				'<img src="../../images/confirm_order/no_order.png" />'+
					'<p style="text-align: center;">网络出错啦，请重新刷新</p>'+
				'</div>'
		).css('background','rgba(255, 255, 255, 0)')
			
		}
		
	});

</script>
</html>