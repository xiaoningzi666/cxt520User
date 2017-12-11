mui.init();
function orderList(s){
	$.ajax({
		type:"get",
		url:apiUrl+"/orders/getorders",
		async:false,
		data:{
			"userId":storage['getUserId'],
			"sign":storage['getSign'],
			"pageSize":10,
			"pageNum":1,
			"status":s!=-1000?s:""
		},
		dataType:"json",
		success:function(data){
			if(data.return_code=="SUCCESS"){
				var html='';
				var totalP=0;
				if(data.pageInfo.total>0){
					$('.itemlist_wrap>ul').css({"background":"none"})
					$.each(data.pageInfo.list, function(index,item) {
						html+='<li class="service_item">'+
							'<div  class="order_h">'+
					            '<span>订单号：<i>'+item.id+'</i></span>';
					           $.each(configList("serviceOrderStatus"), function(i,j) {
					            	if(j.value==item.status){
					            		html+='<span class="mui-pull-right red">'+j.title+'</span>';
					            	}
					            	
					            });
							html+='</div>'+
							'<a href="../shop/order_detail.jsp?orderId='+item.id+'">'+
								'<div class="left order_img">'+
									'<img src="'+item.merchant.logo+'" width="20%" height="20% " />'+
								'</div>'+
								'<div class="right">'+
									'<p class="mui-ellipsis h">'+item.merchant.name+'</small></p>'+
							      	'<p id="OrderSevericeL" class="">';
							      	$.each(item.orderList,function(i,j){
							      		html+='<span  style="color:#00a0e9">'+j.mechServiceName+'*'+'<i style="color:red">'+j.amount+'</i></span>'
							      		totalP=parseInt(j.amount)*parseInt(j.price)
							      	})
									html+='</p>'+
								'</div>'+
							'</a>'+
							'<div style="clear: both;"></div>';
								if(item.status==0){
									html+='<p  class="order_total"><span class="mui-pull-right">小计¥'+totalP+'</span></p>'+
									'<p class="orderItem2">'+
								 	'<span style="color:#807C7C;border-color:#807C7C">取消订单</span>'+'<span class="red" id="paybtn">付款</span></p>';
								 	}else if(item.status==2){
								 		html+='<p  class="order_total">'+
								 		'<span>消费码:<i class="createconsume"></i></span>'+
								 		'<span class="mui-pull-right">小计¥'+totalP+'</span></p>'+
								 		'<p class="orderItem2">'+
								 			'<span class="gray" >生成消费码</span></p>';
								 	}else if(item.status==3){
								 		html+='<p  class="order_total"><span class="mui-pull-right">小计¥'+totalP+'</span></p>'+
										'<p class="orderItem2">'+
									 	'<span style="color:#807C7C;border-color:#807C7C">删除订单</span>'+
									 	'<span style="color:red;border-color:red">去评价</span>'+
									 	'</p>';
								 		
								 	}else{
								 		html+='<p  class="order_total"><span class="mui-pull-right">小计¥'+totalP+'</span></p>'+
										'<p class="orderItem2">'+
									 	'<span style="color:#807C7C;border-color:#807C7C">删除订单</span>'+
									 	'</p>';
								 	}
						html+='</li>'
					});
				}else{
					$('.itemlist_wrap>ul').height($(window).height()-90)
					$('.itemlist_wrap>ul').css({"background":"url(../../images/blank.png) no-repeat","background-size":"cover"})
				}
				$('.itemlist_wrap>ul').html(html)
				configList1()
				clock(delayTime,'.createconsume',"后生成")
			}
		}
	});
}
//orderList(-1000)
document.getElementById('list0').addEventListener('tap',function(){
	$('.itemlist_wrap>ul').html('')
	orderList(-1000)
})
document.getElementById('list1').addEventListener('tap',function(){
	$('.itemlist_wrap>ul').html('')
	orderList(0)
})
document.getElementById('list3').addEventListener('tap',function(){
	$('.itemlist_wrap>ul').html('')
	orderList(3)
})
document.getElementById('list2').addEventListener('tap',function(){
	$('.itemlist_wrap>ul').html('')
	orderList(2)
})
document.getElementById('list4').addEventListener('tap',function(){
	$('.itemlist_wrap>ul').html('')
	orderList(4)
})

if($.getUrlParam('status')!=-1000){
	if($.getUrlParam('status')==2){
		$('#list2').addClass("mui-active");
		$('#list2').siblings("a").removeClass("mui-active")
	}else if($.getUrlParam('status')==0){
		$('#list1').addClass("mui-active")
		$('#list1').siblings("a").removeClass("mui-active")
	}else if($.getUrlParam('status')==3){
		$('#list3').addClass("mui-active")
		$('#list3').siblings("a").removeClass("mui-active")
	}else if($.getUrlParam('status')==4){
		$('#list4').addClass("mui-active")
		$('#list4').siblings("a").removeClass("mui-active")
	}
	else{
		$('#list0').addClass("mui-active")
		$('#list0').siblings("a").removeClass("mui-active")
	}
	//alert($.getUrlParam('status'))
	orderList($.getUrlParam('status'))
}else{
	orderList(-1000)
}