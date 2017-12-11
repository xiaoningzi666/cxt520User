mui.init()
var cusumeCodeTime=0;
/*---------------------订单内容start----------------------*/
$.ajax({
	type:"get",
	url:apiUrl+"/orders/getorderdetails",
	data:{
		"userId":storage['getUserId'],
		"sign":storage['getSign'],
		"orderId":$.getUrlParam('orderId')
	},
	dataType:"json",
	success:function(data){
		var html='';
		var txt='';
		var status='';
		if(data.return_code=="SUCCESS"){
			$('.orderDetail_first').css({
				"background": "url(../../images/confirm_order/Sorder_top"+data.orderInfo.status +".png) no-repeat",
				"background-size": "contain"
			})
			$('.orderDetail_first .orderStatus'+data.orderInfo.status+'').show();
			if(data.orderInfo.status==4){
				$('#consumCodeWarp').hide();
				$('.tabfoot').html('<button type="button" class="mui-btn mui-btn-outlined">删除订单</button>')
				$('.tabfoot').css("display","block")
			}
			if(data.orderInfo.status==3){
				$('#consumCodeWarp').hide();
				$('.tabfoot').html('<button type="button" class="mui-btn mui-btn-outlined">删除订单</button>'+
				'<button type="button" class="mui-btn mui-btn-danger mui-btn-outlined" style="color:red">去评价</button>')
				$('.tabfoot').css("display","block")
			}
		html+='<div class="mui-row service_item" >'+
					'<div class="mui-col-xs-3">'+
						'<img src="'+data.orderInfo.merchant.logo+'"/>'+
					'</div>'+
					'<div class="mui-col-xs-9 shop_msg" id="orderDetailSItem">'+
						'<a href="#" class="mui-ellipsis h">'+data.orderInfo.merchant.name+'</span></a>'+
						'<p class="orderDetailSItem">';
						$.each(data.orderInfo.orderList, function(index,item) {
							html+='<span class="blue">'+item.mechServiceName+'<i class="red">&nbsp;*'+item.amount+'</i></span>';
						});
						html+='</p>'+
					'</div>'+
				'</div>'+
				'<div class="sum_price" id="sum_price">'+
					'<strong>实付金额</strong>'+
					'<span class="mui-badge mui-badge-inverted mui-pull-right" style="font-size: 1rem;color: #222;">小计:'+
						'<i class="red">'+ data.orderInfo.amount+'</i>'+
					'</span>'+
				'</div>';
				$('#orderNum').text(data.orderInfo.id);
				$.each(configList("serviceOrderStatus"), function(i,j) {
	            	if(j.value==data.orderInfo.status){
	            		if(data.orderInfo.status==3){
	            			$('#orderStatus').text("待评价");
	            		}else{
	            			$('#orderStatus').text(j.title);
	            		}
	            		
	            	}
	            });
				$('#orderTime').text(timeFormat(data.orderInfo.orderTime))
				$('#service_item').html(html)
//				if(data.orderInfo.amount==0){
//					$('.tabfoot').hide()
//				}
				
		}else{
			mui.toast(data.return_msg);
		}
		
	}
});
/*---------------------订单内容end----------------------*/
configList1()
clock(delayTime,'#createconsume',"后生成")
//clock(cusumeCodeTime,'#changeText2')


	