mui.init();	

var serviceId = 0;
var pageNum=1;
var pages=0;
var s=$.getUrlParam('key');
$('.search_btn').val(localStorage.getItem(s))
$('#searchBtn').click(function(){
	$('#collection_list').html('')
	orderBy('LBS')
})
$(function(){$('#class_nav').height($(window).height() - 100);})
function serviceList(d,t){
var tmpArr2=['mui-btn-danger mui-btn-outlined','mui-btn-success mui-btn-outlined','mui-btn-warning mui-btn-outlined','mui-btn mui-btn-royal mui-btn-outlined']
var html='';
	$.each(t, function(index,item) {
		var n=parseInt(Math.random()*4, 4);
		var bclass = tmpArr2[n];
		if(item.service_id==d){
			bclass = "mui-btn-danger";
		}
		html+='<button type="button" class="'+bclass+'">'+item.service+'</button>'
	}); 
	return html;
}
//	商户列表
function collection_listHtml(d1,d2){
	var html='';
	var openTimeStartH='';
	var openTimeStartM='';
	var openTimeEndH='';
	var openTimeEndM='';
	$.each(d1,function(index,item){
		openTimeStartH=item.openTime.split('-')[0].split(':')[0];
		openTimeStartM=item.openTime.split('-')[0].split(':')[1];
		openTimeEndH=item.openTime.split('-')[1].split(':')[0];
		openTimeEndM=item.openTime.split('-')[1].split(':')[1];
		html+='<li class="collecction_item">'+
				'<a href=" shop_detail.jsp?id='+item.id+'&x='+$.getUrlParam('x')+'&y='+$.getUrlParam('y')+'">'+
				'<div class="collecction_box">'+
					'<div class="col_img shop_pic">'+
						'<img src='+item.logo+'>'+
						'<span class="time">'+item.openTime;
					 	if(nowTimeH>=openTimeStartH&&nowTimeH<=openTimeEndH){
						 	if(nowTimeH==openTimeStartH&&nowTimeM<openTimeStartM){
								html+='<img src="../../images/shop_detail/rest.png"/></span>';
							}else if(nowTimeH==openTimeEndH&&nowTimeM>openTimeEndM){
								html+='<img src="../../images/shop_detail/rest.png"/></span>';
							}else{
								html+='<img src="../../images/shop_detail/open.png"/></span>';		
					 		}
						}else{
							html+='<img src="../../images/shop_detail/rest.png"/></span>';
						}
					html+='</div>'+
					'<div class="col_text">'+
						'<div id="shop_h">'+
						'<strong class="mui-ellipsis">'+item.name+'</strong>';
						if(item.lbs>100){
							html+='<span class="mui-pull-right blue">'+km(item.lbs)+'km'+'</span>';
						}else{
							html+='<span class="mui-pull-right blue">'+item.lbs+'m'+'</span>';
						}
						html+='</div>'+
						'<span class="blue">'+
							item.score+'<i class="small">分</i>'+
						'</span>'+
						'<span class="red">'+
							item.salesAmount+'<i class="small gray">人气</i>'+
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
				'<a href="shop_detail.jsp?id='+item.id+'&x='+$.getUrlParam('x')+'&y='+$.getUrlParam('y')+'" class="link_item1" id="aaa">下单</a>'+
				'<a href="" class="link_item2">联系</a>'+
			'</div>'+
		'</li>'
	})
	return html;
}
function orderBy(orderby){
	var data={
		"service":serviceId,
		"x":storage["cityLat"],
		"y":storage["cityLng"],
		"region":$.getUrlParam('region'),
		"searchKeywords":$('.search_btn').val(),
		"pageSize":10,
		"pageNum":1,
		"orderBy":orderby	
	}
	$.ajax({
		url:apiUrl+"/merchant/getmerchants",
		type:"post",
		data:data,
		dataType:'json',
		success:function(data){
		if(data.return_code=="SUCCESS"){
			pages=data.pageInfo.pages;
			if(data.pageInfo.list.length>0){
					$('#collection_list').html(
						collection_listHtml(data.pageInfo.list,data.serviceIdSelect)
					)
//					if(data.pageInfo.pageSize<4){
//						$('.more').hide()
//					}
					
			}else{
				$('#collection_list').height($(window).height()-142)
				$('#collection_list').css({"background":"url(../../images/blank.png) no-repeat center center","background-size":"cover"})
			}
			
		}else{
			mui.toast(data.return_msg);
		}
			
			$('.sec_nav').height($('.first_nav>li').height()*$('.first_nav>li').length)
			
		},
		error:function(XMLHttpRequest,textStatus,errorThrown){
			$('#collection_list').height($(window).height()-142)
				$('#collection_list').css({"background":"url(../../images/loser.png) no-repeat center center","background-size":"cover"})
		}
	})
} 	
orderBy('LBS');//默认距离
$('.more').click(function(){
	pageNum++;
	orderBy('LBS',pageNum);//默认距离
//	if(pageNum==pages){
//		$('.more').text('没有更多了')
//	}else{
//		$('.more').text('查看更多')
//	}
})
	
document.getElementById('lbs').addEventListener('tap',function(){//距离排序
	
	pageNum=1;
	orderBy('LBS',pageNum);
	$('.more').click(function(){
		pageNum++;
		orderBy('LBS',pageNum);//默认距离
//		if(pageNum==pages){
//			$('.more').text('没有更多了')
//		}else{
//			$('.more').text('查看更多')
//		}
	})
})
document.getElementById('score').addEventListener('tap',function(){//评分排序
	pageNum=1;
	orderBy('score',pageNum);
	$('.more').click(function(){
		pageNum++;
		orderBy('score',pageNum);//默认距离
//		if(pageNum==pages){
//			$('.more').text('没有更多了')
//		}else{
//			$('.more').text('查看更多')
//		}
	})
})
document.getElementById('sales').addEventListener('tap',function(){//人气排序
	pageNum=1;
	orderBy('sales',pageNum);
	$('.more').click(function(){
		pageNum++;
		orderBy('sales',pageNum);//默认距离
//		if(pageNum==pages){
//			$('.more').text('没有更多了')
//		}else{
//			$('.more').text('查看更多')
//		}
	})
})

//类别导航
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
				$('#class_nav').hide();
				serviceId = $(this).attr("id");
				orderBy('LBS');//默认距离
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
document.getElementById('sort').addEventListener('tap',function(){//分类选择
	var state=document.getElementsByClassName('first_nav')[0].style.display;
	if(state=='block'){
		document.getElementsByClassName('first_nav')[0].style.display='none';
		document.getElementById('sort').getElementsByTagName('span')[1].className='mui-icon mui-icon-arrowdown';
	}else{
		document.getElementsByClassName('first_nav')[0].style.display='block';
		document.getElementById('sort').getElementsByTagName('span')[1].className='mui-icon mui-icon-arrowup';
	}
	
})
