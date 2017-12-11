$.ajax({
	type:"get",
	url:apiUrl+"/mall/getorderdetails",
	data:{
		"orderId":$.getUrlParam("orderId"),
		"userId":storage['getUserId'],
		"sign":storage['getSign'],
	},
	dataType:"json",
	success:function(data){
		var html='';
		var postAge=data.mallOrderInfo.orderList[0].postage;
		var Postage1=data.mallOrderInfo.postage;
		var totalAmount=parseInt(data.mallOrderInfo.orderList[0].price*data.mallOrderInfo.orderList[0].amount)
		$('.orderDetail_first').css({
			"background": "url(../../images/confirm_order/order_top"+
			data.mallOrderInfo.status +"_good_bg.png) no-repeat",
			"background-size": "contain"
		})
		$('.orderDetail_first .orderStatus'+data.mallOrderInfo.status+'').show();
		html+='<section class="order_content">'+
		    	'<div class="head_item">'+
		    		'<strong class="shop_icon">自营</strong>'+
		    	'</div>'+
		    	'<div class="mui-row product_content">'+
		    	   ' <div class="mui-col-xs-3">'+
		    	    	'<img src="'+data.mallOrderInfo.orderList[0].imageUrl+'" width="100%"/>'+
		    	    '</div>'+
		    	    '<div class="mui-col-xs-9 product_item">'+
		    	    	'<strong>'+data.mallOrderInfo.orderList[0].goods_title+'</strong>'+
		    	    	'<span>'+data.mallOrderInfo.orderList[0].price +'</span>'+
		    	    	'<span>运费：¥'+isdot(postAge)+
		    	    		'<i id="pro_num" class="mui-pull-right">X'+
		    	    		data.mallOrderInfo.orderList[0].amount+'</i></span>'+
		    	    '</div>'+
		    	'</div>'+
		    	'<div class="sum_text">'+
		    		'<p>总积分:<span class="mui-pull-right"><i>'+totalAmount+
		    		'</i> 积分</span></p>'+
		    		'<p>运费：<span class="mui-pull-right">¥'+isdot(Postage1)+'</span></p>'+
		    	'</div>'+
		    '</section>'+
		    '<article>'+
	    		'<span class="iconfont icon-liuyan"></span>'+
	    		'<strong>买家留言</strong>'+
	    		'<p>'+
	    			data.mallOrderInfo.remark+
	    		'</p>'+
		    '</article>'+
		    '<section class="order_msg">'+
				'<p>订单编号：'+data.mallOrderInfo.orderList[0].order_id+'</p>';
				$.each(configList("mallOrderStatus"), function(i,j) {
					if(data.mallOrderInfo.status==j.value){
						html+='<p>订单状态：<span class="red">'+j.title+'</span></p>';
					}
				});
				if(data.mallOrderInfo.postMethod==1){
				html+='<p> 提   货   人：'+storage['nickName']+' '+storage['getPhone']+'</p>'+
					'<p>自提地址：'+data.mallOrderInfo.selfAddress+'</p>'+
					'<p>支付方式：全积分</p>';
					
				}else{
					html+='<p>收  件  人：'+data.mallOrderInfo.memberAddress.name+' '
					+data.mallOrderInfo.memberAddress.phone+'</p>'+
					'<p>配送地址：'+storage['addrdetail']+'</p>'+
					'<p>支付方式：全积分+支付宝</p>';
				}
				html+='<p>订单时间：'+timeFormat(data.mallOrderInfo.created)+'</p>'+
			'</section>'
			if(data.mallOrderInfo.status==1){
				$('.tabfoot').html(
					'<button type="button" class="mui-btn-danger mui-btn-outlined delorder">删除订单</button>')
			}else{
				if(data.mallOrderInfo.postMethod==1){
					$('.tabfoot').html(
					'<button type="button" class="mui-btn-danger  mui-btn-outlined" id="confirm">确认收货</button>')
				}else{
					if(data.mallOrderInfo.status==-1){
						$('.tabfoot').html(
						'<button type="button" class="mui-btn mui-btn-danger mui-btn-outlined delorder">删除订单</button>')
					}else{
						$('.tabfoot').html(
						'<button type="button" class="mui-btn mui-btn-outlined" id="quitorder">取消订单</button>'+
						'<button type="button" class="mui-btn mui-btn-danger mui-btn-outlined" id="paybtn">付款</button>')
					}
				}
			}
			
			$('#getorderDetail').append(html)
			$('#paybtn').click(function(){
				window.location.assign('payWay.jsp?orderId='+d.data.orderNo);
			})
			confirm()
			quitOrder()
			delorder()
				
	}
});
function quitOrder(){//取消订单
	$('#quitorder').click(function(){
		$('#M4').show();
		$('.modal p').text("请三思，您确定要取消次订单吗？")
		$('#unreceipt').text("再想想");
		$('#receipt').text("确定")
		$('#unreceipt').click(function(){
			$('#M4').hide();
		})
		$('#receipt').click(function(){
			$('#M4').hide();
			$.ajax({
				type:"POST",
				url:apiUrl+"/mall/cancelorder",
				async:true,
				data:{
					"orderId":$.getUrlParam("orderId"),
					"userId":storage['getUserId'],
					"sign":storage['getSign'],
				},
				dataType:"json",
				success:function(data){
					if(data.return_code=="SUCCESS"){
						mui.toast("取消成功")
						setTimeout(function(){
							window.location.assign('../exmall/jfexchange_record.jsp')
						},1000)
						
					}
				}
			})
		
		});
	})
}
function confirm(){//确认收货
	$('#confirm').click(function(){
		$('#M4').show();
		$('#unreceipt').click(function(){
			$('#M4').hide();
		})
		$('#receipt').click(function(){
			$.ajax({
				type:"POST",
				url:apiUrl+"/mall/confirmsignfor",
				async:true,
				data:{
					"orderId":$.getUrlParam("orderId"),
					"userId":storage['getUserId'],
					"sign":storage['getSign'],
				},
				dataType:"json",
				success:function(data){
					if(data.return_code=="SUCCESS"){
						window.location.assign('../exmall/jfexchange_record.jsp')
					}
				}
				
			});
		})
	})
}
function delorder(){//删除订单
	$('.delorder').click(function(){
		$('#M4').show();
		$('.modal p').text("请三思，您确定要删除此次订单吗？")
		$('#unreceipt').text("再想想");
		$('#receipt').text("确定")
		$('#unreceipt').click(function(){
			$('#M4').hide();
		})
		$('#receipt').click(function(){
			$.ajax({
				type:"POST",
				url:apiUrl+"/mall/deleteorder",
				async:true,
				data:{
					"orderId":$.getUrlParam("orderId"),
					"userId":storage['getUserId'],
					"sign":storage['getSign'],
				},
				dataType:"json",
				success:function(data){
					if(data.return_code=="SUCCESS"){
						window.location.assign('../exmall/jfexchange_record.jsp')
					}
				}
				
			});
		})
	})
}