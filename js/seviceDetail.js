$(function(){
	var h=$(window).height();
	var w=$(window).width();
	var t=($(window).height()-200)/2;
	var l=($(window).width()-200)/2;
	$('.telcon').css({
		"height":h,
		"width":w
	})
	$('.tel').css({
		"top":t,
		"left":l
	})
	$('.confirmbtn').click(function(){
		$('.telcon').hide()
	})
	
})
function score(){//评分
	var score=$('#score').text()/2;
	var sInt=Math.floor(score);
	var dif=score-sInt;
	$('#rating .rating-item').each(function(index){//等级	
		if(index<sInt){
			$(this).css('background-position','0 0');
		}else if(index==sInt){
			if(dif>0){
				$(this).css('background-position','0 -13px');
			}			
		}				
	})
}
//商户信息
$.ajax({
	url:apiUrl+"/merchant/getmerchantservices",
type:'get',
data:{
	"merchantId":$.getUrlParam("id"),
	"merchantServiceId":$.getUrlParam("serviceId"),
	"appclient":($.getUrlParam('appclient')?$.getUrlParam('appclient'):''),
},
dataType:"json",
success:function(data){
	var html = '';	
	var htmlA = '';	
	var mallItemHtml='';
	var openTimeStartH='';
	var openTimeStartM='';
	var openTimeEndH='';
	var openTimeEndM='';
	var slider;
	var len;
	var currP='';
	var Thtml='';
	openTimeStartH=storage['opentime'].split('-')[0].split(':')[0];
	openTimeStartM=storage['opentime'].split('-')[0].split(':')[1];
	openTimeEndH=storage['opentime'].split('-')[1].split(':')[0];
	openTimeEndM=storage['opentime'].split('-')[1].split(':')[1];
	var s=data.merchantServiceList[0].score+'';
	var Score=s.indexOf('.')==-1?Score=(s+'.0'):Score=s;
	var Price=(data.merchantServiceList[0].price+'').indexOf('.')!=-1?
	(data.merchantServiceList[0].price+''):(data.merchantServiceList[0].price+'.00');
	var limteNum=data.merchantServiceList[0].limits;
	html+='<div id="slider" class="mui-slider" style="height: 180px;">';
	if(data.merchantServiceList[0].imageList!=''){
		len = data.merchantServiceList[0].imageList.length-1;
		html+='<div class="mui-slider-group mui-slider-loop" id="sImg">'+
			'<div class="mui-slider-item mui-slider-item-duplicate">'+
					'<a href="#">'+
						'<img src="'+data.merchantServiceList[0].imageList[len].url+'">'+
					'</a>'+
				'</div>';
		$.each(data.merchantServiceList[0].imageList,function(index,item){
			html+='<div class="mui-slider-item">'+
					'<a href="#">'+
						'<img src="'+item.url+'" alt="img">'+
					'</a>'+
				'</div>';
				if(index==0){
					htmlA+='<div class="mui-indicator mui-active"></div>';
				}else{
					htmlA+='<div class="mui-indicator"></div>';
				}
			})
			html+='<div class="mui-slider-item mui-slider-item-duplicate">'+
					'<a href="#">'+
						'<img src="'+data.merchantServiceList[0].imageList[0].url+'">'+
					'</a>'+
				'</div>'+
			'</div>';
			'<div class="mui-slider-indicator" id="indicatorH">'+htmlA+'</div>';
		}else{
		html+='<div style="width:100%;height:100%">'+	
				'<img src="../../images/girl2.png" width="100%" style="height:100%"/>'+
			'</div>';
		}
	html+='<div class="openTime">'+
			'<span class="item1">'+storage['mallName']+'</span>';
			$.each(configList("openStatus"), function(i,j) {
				if(storage['openStatus']==j.value){
					if(storage['openStatus']==1){
						if(storage['opentime']=="00:00-00:00"&&storage['opentime']!="24"){
							html+='<span id="openTime">24h</span>'+
								'<img src="../../images/shop_detail/openWhite.png"/>';
						}else{
							if(nowTimeH>=openTimeStartH&&nowTimeH<=openTimeEndH){
							 	if(nowTimeH==openTimeStartH&&nowTimeM<openTimeStartM){
									Thtml+='<img src="../../images/shop_detail/restWhite.png"/></span>';
								}else if(nowTimeH==openTimeEndH&&nowTimeM>openTimeEndM){
									Thtml+='<img src="../../images/shop_detail/restWhite.png"/></span>';
								}else{
									Thtml+='<img src="../../images/shop_detail/openWhite.png"/></span>';		
						 		}
							}else{
								Thtml+='<img src="../../images/shop_detail/restWhite.png"/></span>';
							}
							html+='<span id="openTime">'+storage['opentime']+'</span>';
							html+=Thtml;
						}
					}else{
						if(storage['opentime']=="00:00-00:00"&&storage['opentime']!="24"){
							html+='<span id="openTime">24h</span>';
						}else{
							html+='<span id="openTime">'+storage['opentime']+'</span>';
						}
						html+='<img src="../../images/shop_detail/shop_stop'+j.value+'.png"/>';
					}
				}
			});
		html+='</div>'+
			'<input type="hidden" value="'+storage['officePhone']+'" id="tel_item"/>'+
			'</div>'+
			'<section class="shop_head">'+
				'<div class="mui-media-body mui-pull-left con">'+
					'<div class="content">'+
						'<header>'+data.merchantServiceList[0].service+'</header>'+
						'<p class="shop_item1" id="rating">';
						for(var i=0;i<5;i++){
							html+='<span class="rating-item"></span>';
						}
						html+='<span class="t red" >'+
						'<i id="score">'+Score+'</i>分</span>	'+
						'<span class="t orange">'+
							'<i id="salesAmount">'+data.merchantServiceList[0].salesAmount+'</i>'+
						'人气</span>'+
						'</p>'+
					'</div>'+
				'</div>'+
				'<div class="side">'+
					'<img src="../../images/shop_detail/telIcon.png" class="tel_item mui-pull-right"/>'+
				'</div>'+
				'<div style="clear: both;"></div>'+
				'<div class="itemP">';
				if(storage['getUserId']){
	            	 $.each(data.merchantServiceList[0].priceList, function(index,item) {
	            	 	var price=(item.price+'').indexOf('.')!=-1?(item.price+''):(item.price+'.00');
		            	if(item.member_level==storage['level']){
		            		currP='<p class="">'+
		            		'<img src="../../images/VIP_experience/v'+item.member_level+'.png" width="15"/> '+
		            		'¥<i class="priceList">'+price+'</i></p>'+currP
		            	}else{
		            		currP=currP+
		            		'<p class="red decLine">'+
		            		'<img src="../../images/VIP_experience/v'+item.member_level+'.png" />'+
		            		'¥<i class="priceList">'+price+'</i></p>';
		            	}
		            });
	            }else{
	            	 $.each(data.merchantServiceList[0].priceList, function(index,item) {
		            	if(index==0){
		            		currP='<p class="">'+
		            		'<img src="../../images/VIP_experience/v1.png"/> '+
		            		'¥<i class="priceList">0.00</i></p>'+currP
		            	}else{
		            		currP=currP+
		            		'<p class="red saleL sale1 decLine"><img src="../../images/VIP_experience/v2.png" /> '+
		            		'¥<i class="priceList">0.00</i></p>';
		            	}
		            });
	            }
			html+=currP;
			html+= '<span class="sale1">门市价：¥<i>'+Price+'</i></span>';
			html+='</div>'+
			'</section>'+
			'<section class="section_sec">'+
				'<div class="item1"><span>购买数量';
				if(data.merchantServiceList[0].limits){
					html+='<i class="limitnum red">（限购'+data.merchantServiceList[0].limits+'）</i>';
				}
			html+='</span>'+
					'<p class="mui-pull-right item">'+
						'<span id="reduce">-</span>'+
						'<input type="text" value="1" id="num"/>'+
						'<span id="add">+</span>'+
					'</p>'+
				'</div>'+
				'<header>服务简介</header>'+
				'<p>'+data.merchantServiceList[0].abstraction+'</p>'+
			'</section>'+
			'<section class="section_third">'+
				'<span class="blue">服务详情</span>'+
				'<div class="p">';
				if(data.merchantServiceList[0].abstraction){
					html+=data.merchantServiceList[0].abstraction;
				}else{
					html+='<div style="text-align:center"><img src="../../images/shop_detail/seviceBlank.png" width="60%"/>'+
					'<span class="text">商家很懒，什么都没有描述~</span></div>';
				}
					
				html+='</div>'
			'</section>';
		$('#wrap').html(html)
		score();
		
			var num=$('#num').val();
		$('#add').click(function(){
			if(limteNum==0){
				num++;
				$('#num').val(num);
			}else{
				if(num<limteNum){
					num++;
					$('#num').val(num);
				}else{
					mui.toast("限购"+limteNum)
				}
			}
		})
		$('#reduce').click(function(){
			if(num>1){
				num--;
				$('#num').val(num);
			}
			
		})
		$('.mui-slider-item img').css("width",$(window).width());
		$('.mui-slider-item img').css("height",$(window).width()*9/16);
		slider= mui("#slider")
		slider.slider({interval: 1000});	
		$('.tel_item').click(function(){
			if($('#tel_item').val()){
				$('.tel p').text($('#tel_item').val());
				$('.telcon').show()
			}else{
				$('.tel p').text('暂无联系方式');
				$('.telcon').show()
			}
		})
		
	}
})



