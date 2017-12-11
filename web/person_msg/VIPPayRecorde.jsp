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
<link rel="stylesheet" href="../../css/app.css" />
<title>缴费记录</title>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
	    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
	    <h1 class="mui-title">缴费记录</h1>
	   
	</header>
	<div class="mui-content" id="getpaymentlist">
		<div class="loading">
			<img src="../../images/shop_detail/reload.gif" />
		</div>
	</div>
	<p id="loadmore">加载更多...</p>
	<div class="mui-content" id="noVipRecord" style="display: none;">
	    <img src="../../images/VIP_experience/no-record.png"  width="40%"/>
	</div>
</body>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>	
<script type="text/javascript" src="../../js/common.js" ></script>
<script type="text/javascript">
	mui.init();
	var storage = window.localStorage; 
	var pageNum=1;
	var html='';
	var pages='';
	function getpaymentlist(pageNum){
		$.ajax({
			type:"get",
			url:apiUrl+"/member/getpaymentlist",
			data:{
					"userId":storage['getUserId'],
					"sign":storage['getSign'],
					"pageSize":10,
					"pageNum":pageNum
				},
			dataType:"json",
			success:function(data){
				if(data.return_code=="SUCCESS"){
					if(data.pageInfo.list.length>0){
						$.each(data.pageInfo.list,function(index,item){
							html+='<div class="wrap white">'+
									'<input type="hidden"  value="'+item.id+'"/>'+
								'<p><span>'+timeFormat(item.created)+'</span>';
									if(item.status==0){
										html+='<span class="mui-pull-right red">处理中</span>';
									}
									
								html+='</p>'+
								'<p><span>'+item.duration+'个月VIP</span><span class="mui-pull-right">-¥'+item.amount+'</span>'+
									'<span style="display:block;clear:both"></span>';
										if(item.expired&&item.startDate){
											html+='<span style="display:block;font-size:0.8rem;color:#aaa">有效期至:'+
											timeFormat1(item.startDate)+'至'+timeFormat1(item.expired)
											'<span>';
										}
									
								html+='</p>'+
						 		'<p><span>';
						 		$.each(configList("memberPaymentType"), function(i,j) {
						       		if(j.value==item.tradeType){
						       			if(item.tradeType==99||item.tradeType==90){
						       				html+='<strong>'+j.title+'</strong>';
						       			}else{
						       				html+='<strong class="orange">'+j.title+'支付</strong>';
						       			}
						       		}
						       	});
						html+='</span><span class="mui-pull-right">';
							$.each(configList("memberPaymentStatus"), function(i,j) {
						       		if(j.value==item.status){
						       			if(item.status==0){
						       				html+='<button class="mui-btn-danger mui-btn-outlined" style="color:red" id="cancel">撤销</button>';
						       			}else{
						       				html+='<strong class="blue">'+j.title+'</strong>';
						       			}
						       			
						       		}
						       	});
						html+='</span></p></div>';
						})
						html+='<input type="hidden" value="'+data.pageInfo.pages+'"/>'
						$('#getpaymentlist').html(html)
						pages=$('input[type=hidden]').val()
						if(data.pageInfo.list.length<10){
							$('#loadmore').hide()
						}else{
							$('#loadmore').show()
						}
						$('#cancel').click(function(){
							var orderId=$(this).parents(".wrap").find("input").val()
							$.ajax({
								type:"post",
								url:apiUrl+"/member/cancelpayment",
								async:true,
								data:{
									"userId":storage['getUserId'],
									"sign":storage['getSign'],
									"orderId":orderId
								},
								dataType:"json",
								success:function(data){
									if(data.return_code=="SUCCESS"){
										document.location.reload();
									}
								}
							});
		
						})
					}else{
						$('#noVipRecord').show()
						$('.loadCon').hide()
						$('#loadmore').hide()
					}
				}else{
					mui.toast(data.return_msg);
				}
			}
		});
	}
	getpaymentlist(pageNum)
	
	$('#loadmore').click(function(){
		pageNum++;
		if(pageNum<=pages){
			getpaymentlist(pageNum)
			if(pageNum==pages){
				$('#loadmore').text('没有更多啦...')
			}
		}
	})
</script>
</html>