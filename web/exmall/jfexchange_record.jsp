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
<title>兑换记录</title>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
	    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
	    <h1 class="mui-title">兑换记录</h1>
	</header>
	<div class="mui-content" id="getorderList">
		
	</div>
</body>
<script src="../../js/mui.min.js"></script>
	<script src="../../js/jquery-1.7.2.min.js" ></script>
	<script src="../../js/common.js"></script>
	<script type="text/javascript">
		mui.init()
		$.ajax({
			type:"get",
			url:apiUrl+"/mall/getorders",
			data:{
				"userId":storage['getUserId'],
				"sign":storage['getSign'],
				"pageSize":10,
				"pageNum":1
			},
			dataType:"json",
			success:function(data){
				var html='';
				$.each(data.pageInfo.list, function(index,item) {
					html+='<section class="order_content">'+
					    	'<div class="head_item">'+
					    		'<span style="color:#888">'+timeFormat(item.created)+'</span>';
					    		$.each(configList("mallOrderStatus"), function(i,j) {
					    			if(item.status==j.value){
					    				html+='<span class="red">'+j.title+'</span>';
					    			}
					    		});
					    html+='</div><a href="jfOrder_success.jsp?orderId='+item.id+'" style="display:block;">'+
					    	'<div class="mui-row product_content">'+
					    	    '<div class="mui-col-xs-3">'+
					    	    	'<img src="'+item.orderList[0].imageUrl+'" width="100%"/>'+
					    	    '</div>'+
					    	    '<div class="mui-col-xs-9 product_item">'+
					    	    	'<strong>'+item.orderList[0].goods_title+'</strong>'+
					    	    	'<span class="orange">'+item.orderList[0].price+'</span>'+
					    	    	'<span>运费：¥'+item.orderList[0].postage+
					    	    		'<i id="pro_num" class="mui-pull-right">X'+
					    	    		item.orderList[0].amount+'</i>'+'</span>'+
					    	    '</div>'+
					    	'</div></a>'+
					    '</section>'
				});
				$('#getorderList').html(html)
				if(data.pageInfo.total==0){
					var h=$(window).height();
					$('#getorderList').css("height",h)
					$('#getorderList').html('<img src="../../images/blank.png" height="100%" width="100%"/>')
				}
			}
		
		});
	</script>
</html>