mui.init();		
var service = 0;
var pageNum=1;
var pages=0;
var hasNextPage=false;
var keyText="LBS";
var serviceType=0;
/**********************分类导航start****************************/
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

	$('#class_nav').height($(window).height()-100);
	document.getElementById('sort').addEventListener('tap',function(){//分类选择
		var state=document.getElementsByClassName('first_nav')[0].style.display;
		if(state=='block'){
			document.getElementsByClassName('first_nav')[0].style.display='none';
		}else{
			document.getElementsByClassName('first_nav')[0].style.display='block';
		}
	})
	
	$.ajax({
		url:apiUrl+"/configration/getservivces",
		type:'get',
		dataType:'json',
		success:function(data){
			$('#class_nav').html(
				class_nav(data.serviceConfigList)
			)
			$('.sec_nav').height($(window).height()-170);
			$('#class_nav>li').click(function(){
				$('#class_nav>li').removeClass('active1');
				$('#class_nav>li').children('.sec_nav').removeClass('active2');
				$(this).addClass('active1');
				$(this).children('.sec_nav').addClass('active2');
			})
			$('.sec_nav>li').each(function(){
				var txt=$(this).text();
				$(this).click(function(){
					$('#s_h').html(txt);
					$('#s_h').addClass('myActive');
					$('#s_h').parent().siblings().removeClass('myActive')
					$('#class_nav').hide();
					service = $(this).attr("id");
					$('#collection_list').html("");
					orderBy('LBS',pageNum);//默认距离
		
				})
			})
		}
	})
	function class_nav(c){
		var html='';
		$.each(c,function(index,item){
			html+=
			'<li class=""><a href="#">'+item.title+'</a>';
				html+='<ul class="sec_nav">';
					$.each(item.serviceConfig,function(i,op){
						html+='<li id="'+op.id+'"><a href="#">'+op.name+'</a></li>';
					})
				html+='</ul>';
			html+='</li>'	;		
		})
		return html;
	} 
})
/**********************分类导航end****************************/

/*-------------------商户列表start------------------------*/
function serviceList(d,t){
	var tmpArr2=['mybtn1','mybtn2','mybtn3','mybtn4','mybtn5','mybtn6']
	var html='';
	$.each(t, function(index,item) {
		var n=parseInt(Math.random()*6, 6);
		var bclass = tmpArr2[n];
		if(item.service_id==d){
			bclass = "mybtndanger";
		}
		html+='<button type="button" class="'+bclass+'">'+item.service+'</button>'
		
	}); 
	return html;
}
//商户列表
function collection_listHtml(d1,d2){
	var html='';
	var openTimeStartH='';
	var openTimeStartM='';
	var openTimeEndH='';
	var openTimeEndM='';
	$.each(d1,function(index,item){
		html+='<li class="collecction_item" style="margin-bottom:5px">'+
				'<a href="shop_detail.jsp?id='+item.id+'&x='+storage["cityLat"]+'&y='+storage["cityLng"]+'">'+
				'<div class="collecction_box">'+
					'<div class="col_img shop_pic">';
						if(item.isHot==1){
							html+='<img src="../../images/ishot.png" class="isHot"/>';
						}
						html+='<img src='+item.logo+'>';
						if(item.openStatus!=1){
							if(item.openTime!="24"&&item.openTime!="00:00-00:00"){
								html+='<span class="time">'+item.openTime+
								'<img src="../../images/shop_detail/shopStop'+item.openStatus+'.png"/></span>';
							}else{
								html+='<span class="time">24H'+
								'<img src="../../images/shop_detail/shopStop'+item.openStatus+'.png"/></span>';
							}
						}else{
							if(item.openTime!="24"&&item.openTime!="00:00-00:00"){
								openTimeStartH=item.openTime.split('-')[0].split(':')[0];
								openTimeStartM=item.openTime.split('-')[0].split(':')[1];
								openTimeEndH=item.openTime.split('-')[1].split(':')[0];
								openTimeEndM=item.openTime.split('-')[1].split(':')[1];
								html+='<span class="time">'+item.openTime;
								if(nowTimeH>=openTimeStartH&&nowTimeH<=openTimeEndH){
							 	if(nowTimeH==openTimeStartH&&nowTimeM<openTimeStartM){
									html+='<img src="../../images/shop_detail/shopStop'+item.openStatus+'.png"/></span>';
								}else if(nowTimeH==openTimeEndH&&nowTimeM>openTimeEndM){
									html+='<img src="../../images/shop_detail/shopStop'+item.openStatus+'.png"/></span>';
								}else{
									html+='<img src="../../images/shop_detail/open.png"/></span>';		
						 		}
								}else{
									html+='<img src="../../images/shop_detail/shopStop'+item.openStatus+'.png"/></span>';
								}
							}else{
								html+='<span class="time">24H<img src="../../images/shop_detail/open.png"/></span>'
							}
						}
					html+='</div>'+
					'<div class="col_text">'+
						'<div id="shop_h">'+
						'<strong class="mui-ellipsis">'+item.name+'</strong>';
						if(item.lbs>1000){
							html+='<span class="mui-pull-right blue">'+km(item.lbs)+'km'+'</span>';
						}else{
							html+='<span class="mui-pull-right blue">'+item.lbs+'m'+'</span>';
						}
						html+='</div>'+
						'<span class="blue">'+
							item.score+'<i class="small">分</i>'+
						'</span>'+
						'<span class="red">'+
							item.salesAmount+'<i class="small">人气</i>'+
						'</span>'+
						'<p class="mui-ellipsis">'+
								  item.address+
						'</p>'+
						'<div class="service_element">'+
							serviceList(d2,item.serviceList)+
						'</div>'+
					'</div>'+
				'</div>'+
			'</a>'+
			'<div class="line_bottom"></div>'+
			'<div class="link">'+
				'<a href="shop_detail.jsp?id='+item.id+
				'&x='+storage["cityLat"]+'&y='+storage["cityLng"]+'"class="link_item1" id="aaa">下单</a>'+
				'<a class="link_item2">联系</a>'+
				'<input type="hidden" value="'+item.officePhone+'"/>'+
			'</div>'+
		'</li>'
	})
	return html;
}
function orderBy(orderby,pageNum){
	var data={
		"service":service,
		"x":storage["cityLat"],
		"y":storage["cityLng"],
		"region":storage["region"],
		"pageSize":10,
		"pageNum":pageNum,
		"orderBy":orderby,
		"serviceType":serviceType
	}
	$.ajax({
		url:apiUrl+"/merchant/getmerchants",
		type:"post",
		data:data,
		dataType:'json',
		beforeSend:function(XMLHttpRequest){
			$('#collection_list').html(
				'<div class="loading">'+
					'<img src="../../images/shop_detail/reload.gif" />'+
				'</div>'
			);
		},
		success:function(data){
			if(data.return_code=="SUCCESS"){
				pages=data.pageInfo.pages;
				hasNextPage=data.pageInfo.hasNextPage;
				
					$('#collection_list').html(
	//					$('#collection_list').html()+
						collection_listHtml(data.pageInfo.list,data.serviceIdSelect)
					)
				if(data.pageInfo.total>0){
					if(hasNextPage){
						$('#collection_list').append('<div class="more">查看更多</div>')
						
					}else{
						$('#collection_list').append('<div class="more">没有更多了...</div>')
					}
				}
				$('.link_item2').click(function(){
					if($(this).next().val()){
						$('.tel p').text($(this).next().val());
						$('.telcon').show()
					}else{
						$('.tel p').text('暂无联系方式');
						$('.telcon').show()
					}
					
				})
				$('.more').click(function(){
					if(hasNextPage){
						pageNum++;
						orderBy(keyText,pageNum)
						//orderBy(keyText,pageNum);//默认距离
					}
					
				})
				if(data.pageInfo.total==0){
					$('#collection_list').height(windowH-140)
					$('#collection_list').html(
						'<img src="../../images/blank.png" style="height:100%;width:100%"/>'
					)
				}
			}else{
				mui.toast(data.return_msg);
			}
			$('.sec_nav').height($('.first_nav>li').height()*$('.first_nav>li').length)
		},
		error:function(XMLHttpRequest,textStatus,errorThrown){
			$('#collection_list').html(' ');
			$('#collection_list').height(windowH-140)
			$('#collection_list').css({
				"background":"url(../../images/loser.png) no-repeat 100% 100%",
				"background-size":"cover"
			})
		}
	})
}

document.getElementById('lbs').addEventListener('tap',function(){//距离排序
	$(this).addClass('myActive');
	$(this).siblings().removeClass('myActive')
	$('#collection_list').html("");
	pageNum=1;
	keyText="LBS";
	orderBy('LBS',pageNum);
})
document.getElementById('score').addEventListener('tap',function(){//评分排序
	$(this).addClass('myActive');
	$(this).siblings().removeClass('myActive')
	$('#collection_list').html("");
	pageNum=1;
	keyText="score";
	orderBy('score',pageNum);
	
})
document.getElementById('sales').addEventListener('tap',function(){//人气排序
	$(this).addClass('myActive');
	$(this).siblings().removeClass('myActive')
	$('#collection_list').html("");
	pageNum=1;
	keyText="sales";
	orderBy('sales',pageNum);
})
if($.getUrlParam("a")=="vip"){
	service=$.getUrlParam("id");
	$.each(configList("AppHomeVipServices"), function(i,j) {
		if(service==j.value){
			$('#s_h').text(j.title)
		}
	});
	orderBy('LBS',pageNum)
}else{
	orderBy('LBS',pageNum)
}

if($.getUrlParam("a")=="s"){
	serviceType=$.getUrlParam("id");
	$.each(configList("ServiceType"), function(i,j) {
		if(serviceType==j.value){
			$('#s_h').text(j.title)
		}
	});
	orderBy('LBS',pageNum)
}else{
	orderBy('LBS',pageNum)
}	

