mui.init();
var arrGoods='';
var postWay='';
$.ajax({
	type:"get",
	url:apiUrl+"/mall/getgoodsdetails",
	data:{
		"id":$.getUrlParam("id"),
		"userId":storage['getUserId'],
		"sign":storage['getSign'],
		"region":storage['region'],
	},
	dataType:"json",
	success:function(data){
		var html='';
		var selAddress=data.goodsInfo.selfAddress.split(';');
		var selAdrHtm='';
		var total=0;
		var postageTotal='';
		total=parseInt(data.goodsInfo.exchangePrice*$.getUrlParam("num"));
		postageTotal=data.goodsInfo.postage;
		html+='<div class="head_con">'+
		    	'<span class="Pname"><i class="label">自提人</i>:'+
		    	'<i class="nameItem">'+storage['nickName']+'</i></span>'+
		    	'<span class="Pmobile">'+storage['getPhone']+'</span>'+
		    '</div>'+
		    '<section class="order_content" >'+
				'<div class="head_item">'+
		    		'<strong class="shop_icon">自营</strong>'+
		    	'</div>'+
		    	'<div class="mui-row product_content">'+
		    	    '<div class="mui-col-xs-3">';
		    	if(data.goodsInfo.imageUrl){
		    		html+='<img src="'+data.goodsInfo.imageUrl+'" width="100%"/>';
		    	}else{
		    		html+='<img src="'+data.goodsInfo.imageList[0].url+'" width="100%"/>';
		    	}
		     html+='</div>'+
		    	    '<div class="mui-col-xs-9 product_item">'+
		    	    	'<strong class="">'+data.goodsInfo.title+'</strong>'+
		    	    	'<span>'+
		    	    		'<i class="orange">'+data.goodsInfo.exchangePrice+'</i>'+
		    	    		'<i class="mui-pull-right" id="pro_num"></i></span>';
		    	  html+='<span>运费：¥'+
		    	  			'<strong style="font-weight:normal">'+isdot(postageTotal)+'<strong>'+
		    	  		'</span>';
		 	 html+='</div>'+
		    	'</div>'+
		    '</section>'+
		    '<ul class="mui-table-view mui-table-view-chevron1  " style="margin-top:5px;">'+
				'<li class="mui-table-view-cell cell1">'+
					'<span class="buy_num">配送方式</span>'+
					'<div class="mui-pull-right" id="adrLi">';
			$.each(configList("mallPostMethod"), function(i,j) {
				html+='<div class="mui-input-row mui-radio man mui-left sendway">'+
						'<label class="sel">'+j.title+'</label>';
				if(i==0){
					html+='<input name="postMedthod" type="radio" checked="checked" value="'+j.value+'">'+
					  '</div>';
				}else{
					html+='<input name="postMedthod" type="radio" value="'+j.value+'"></div>';
				}
			});
			html+='</div>'+
				'</li>'+
				'<li class="mui-table-view-cell cell1" id="adr2" style="display: none;">'+
					'<span class="buy_num">配送至</span>'+
					'<div class="mui-pull-right mui-navigate-right  " style="padding: 0.4rem; ">'+
						'<a class="mui-ellipsis AdrText" style="display:inline-block;width: 96%;"></a>'+
					'</div>'+
				'</li>'+
				'<li class="mui-table-view-cell cell1" id="adr1">'+
					'<span class="buy_num">自提地址</span>'+
					'<div class="mui-pull-right mui-navigate-right  " style="padding: 0.4rem; ">'+
						'<a class="mui-ellipsis AdrText" style="display:inline-block;width: 96%;">请选择地址</a>'+
					'</div>'+
				'</li>'+
				'<li class="mui-table-view-cell cell1">'+
					'<span class="buy_num">买家留言</span>'+
					'<div class="my_textarea" >'+
						'<textarea type="text" name="remark" placeholder="选填对本次交易的说明" '+
							'class=" mui-ellipsis" id="remark"/></textarea>'+
					'</div>'+
				'</li>'+
			'</ul>'+
			'<p class="product_foot">'+
				'<span class="red"></span>'+
			'</p>';
			$('#mallMsg').html(html)
			$.each(selAddress, function(i,j) {
				selAdrHtm+='<ul><li>'+j+'</li></ul>'
			});
			$('#selAdr').append(selAdrHtm);
			$('#total').text(total);
			$('#num').text($.getUrlParam("num"))
			if($('.sendway input').eq(0).is(":checked")){
				$('#postageTotal').text("0.00");
			}else{
				$('#postageTotal').text(isdot(postageTotal));
			}
			$('#adrLi input[name=postMedthod]').click(function(){
				if($(this).val()==1){
					$('.head_con .Pname .label').text("自提人")
					$('#adr1').show();
			 		$('#adr2').hide();
			 		storage.removeItem("sendway")
			 		storage.removeItem("addrdetail")
			 		$('.product_foot').hide()
			 		$('.AdrText').text('');
			 		$('#postageTotal').text("0.00");
				}else{
					$('.head_con .Pname .label').text("收件人")
					$('#adr1').hide();
			 		$('#adr2').show();
			 		$('.AdrText').text('');
			 		storage["sendway"]=2;
			 		$('.product_foot').hide()
			 		$('#postageTotal').text(isdot(postageTotal))
				}

			 })
			$('#adr1').click(function(){
				$('#selAdr').slideToggle();
			})
			$('#adr2').click(function(){
				window.location.assign('../address/shop_address_list.jsp');
			});
			$('#selAdr>ul>li').click(function(){
				$('#selAdr>ul>li').removeClass('selAdrOn');
				$(this).addClass('selAdrOn');
			})
			$('#selecAdrtBtn').click(function(){
				var	s=$('#selAdr>ul>.selAdrOn').text();
				$('#adr1 .AdrText').text(s);
				$('.product_foot span').html('自提地址：'+s);
				$('.product_foot').show()
				$('#selAdr').hide();
			})
			if(storage["sendway"]){
				$('#adr2').show();
				$('#adr1').hide();
				$('.sendway input').eq(1).attr("checked","checked")
				$('#adr2 .AdrText').text(storage['addrdetail']);
				$('.head_con .Pname .nameItem').text(storage['addrname']);
				$('.head_con .Pmobile').text(storage['addrPhone']);
				
				$('.product_foot span').html('配送地址：'+storage['addrdetail']);
				$('.product_foot').show()
				$('#postageTotal').text(isdot(postageTotal))
			}
			$('#pro_num').text('X'+$.getUrlParam("num"));
			var p1=$.getUrlParam("num");
			var p2=$.getUrlParam("id");
			arrGoods=p2+','+p1
			$('#submitOrder').click(function(){
				var postMethod=$('input[name=postMedthod]:checked').val();
				if(!$('.AdrText').text()){
					mui.toast("请选择地址")
				}else{
					$.ajax({
						type:"post",
						url:apiUrl+"/mall/createorder",
						data:{
							"userId":storage['getUserId'],
							"sign":storage['getSign'],
							"postMethod":$('#adrLi input[name=postMedthod]:checked').val(),
							"totalPrice":$('#total').text(),
							"postage":parseInt($('#postageTotal').text()),
							"remark":$('#remark').val(),
							"selfAddress":$('.AdrText').text(),
							"postAddress":storage['addrId'],
							"goodsArray":arrGoods
							
						},
						dataType:"json",
						success:function(d){
							if(d.return_code=="SUCCESS"){
								if($('#adrLi input[name=postMedthod]:checked').val()==2){
									if(postageTotal){
										window.location.assign('payWay.jsp?orderId='+d.data.orderNo+'&postage='+parseFloat(isdot(postageTotal)));
									}else{
										window.location.assign('jfOrder_success.jsp?orderId='+d.data.orderNo);
									}
									
									
								}else{
									window.location.assign('jfOrder_success.jsp?orderId='+d.data.orderNo);
								}
								
							}else{
								mui.toast(d.return_msg);
							}
						}
					});
				}
			})
			
		}
})