var cityMsg=[];
var cityName=[];
var cityLat='';
var cityLng='';
var cityadcode='';
var map = new AMap.Map("container", {
	    resizeEnable: true,
		//center: [116.397428, 39.90923],
	    zoom: 13
	});
var MsgNum='';
var pageNum=1;
var pages=0;
var hasNextPage=false;
var t=0;
window.onscroll=function(){
	if(document.body.scrollTop>100){
		$('#top_wrap').css("background","rgb(65, 175, 252)")
	}
	if(document.body.scrollTop<100){
		$('#top_wrap').css("background","rgba(255, 255, 255, 0)")
	}
	
}


/******************签到开始**********************************/
$(function(){
	$('.third_item1').click(function(){
	if(storage['getUserId']){
		var w=$(document).width();
		var h=$(document).height();
		$('.mark').css('width',w);
		$('.mark').css('height',h);
		$('.mark').show();
		var h1=($(window).height()-$('#qd_box').height())/2;
		var w1=($(window).width()-$('#qd_box').width())/2;
		$('#qd_box').css('top',h1).css('left',w1).fadeIn(300);
		$.ajax({
			type:"post",
			url:apiUrl+"/member/signin",
			data:{
				"userId":storage['getUserId'],
				"sign":storage['getSign'],
			},
			dataType:"json",
			success:function(data){
				if(data.return_code=="SUCCESS"){
					$('#score_num').text(data.data.socre)
					$('.dayNum').text(data.data.days)
				}else{
					window.location.assign('../index/timeaixs.html')
				}
			}
		});	
		}else{
			$('.toast').fadeIn()
			setTimeout(function(){
				$('.toast').fadeOut()
			},2000)
		}	
	});
	$('#qd_box').click(function(){
		$('#qd_box').fadeOut(200);
		$('.mark').fadeOut(200);
	})
})	
/******************签到结束**********************************/
/********************获取站点开始*****************************/
function showCityInfo() {
    //实例化城市查询类
    var citysearch = new AMap.CitySearch();
    //自动获取用户IP，返回当前城市
    citysearch.getLocalCity(function(status, result) {
        if (status === 'complete' && result.info === 'OK') {
            if (result && result.city) {
                var cityinfo = result.city;
                   	cityadcode=result.adcode;
                var flag = false;
                cityLat=result.bounds.eb.lat;
               	cityLng=result.bounds.eb.lng;
               	storage["cityLat"]=result.bounds.eb.lat;
               	storage["cityLng"]=result.bounds.eb.lng;
             	storage["region"]=cityadcode;
             	storage["regionName"]=cityinfo;
               $.each(cityMsg, function(index,item) {
                   	if (item.id==cityadcode) {
	                 	flag = true;
	                 	return ;
					}
               });
               if(flag){
               		document.getElementById('vv').innerHTML =cityinfo;
               }else{
               		document.getElementById('vv').innerHTML =cityMsg[0].name;
               		cityadcode=cityMsg[0].id;
               }
               $('#vvcode').val(cityadcode)
             	getWeather();
             	getOil();
             	getactivitie();
             	getcontents();
             	getHotmerchants(pageNum)
             	
             	
            }
        }
    });
}
$('#searchBtn').click(function(){
	window.location.assign("search.html?region="+ $('#vvcode').val())
})
$.ajax({//获取站点列表
	type:"get",
	url:apiUrl+"/configration/getstations",
	data:{
		"pageSize":10,
		"pageNum":1
	},
	dataType:"json",
	success:function(data){
		if(data.return_code=="SUCCESS"){
			var html='';
			$.each(data.pageInfo.list, function(index,item) {
				html+='<a href="javascript:void(0);">'+item.name+'<input type="hidden" value="'+item.region+'" class="vvcode"/></a>';
				cityMsg[index]={'id':item.region,"name":item.name}
			});
			$('#area_block').html(html);
			if(storage["region"]){
				getWeather();
             	getOil();
             	getactivitie();
             	getcontents();
             	getHotmerchants(pageNum);
			}else{
				showCityInfo();
			}
			
			$('#area_block>a').click(function(){
				var text=$(this).text();
				$('#vv').html(text);
				
				$('#vvcode').val($(this).find('input').val())
				storage["region"]=$('#vvcode').val();
               	storage["regionName"]=$('#vv').html();
				$('#area_block').hide();
				getWeather();
	            getOil();
	            document.location.reload();
				//alert($('#vvcode').val())
			})
		}			
	}
});
$('#vvcode').val(storage["region"]);
//console.log(storage["region"])
$('#vv').html(storage["regionName"]);
$('.V_item').click(function(){
	if($(this).attr("data-value")){
		window.location.assign("../shop/shop_list.jsp?id="+$(this).attr("data-value")+'&region='+$('#vvcode').val()+'&a=vip&')
	}
})
$('#site').click(function(){
	$('#area_block').slideToggle(100);
})

$('.S_item').click(function(){
	if($(this).attr("data-value")){
		window.location.assign("../shop/shop_list.jsp?id="+$(this).attr("data-value")+'&region='+$('#vvcode').val()+'&a=s&')
	}
})
/***************************获取站点结束******************************/	
function getcontents(){//头条
	$.ajax({
		type:"get",
		url:apiUrl+"/appcms/getcontents",
		data:{
			"userId":storage['getUserId'],
			"sign":storage['getSign'],
			"region":$('#vvcode').val(),
			"columnCode":"H01M04",
			"isGetImage":1,
			"pageSize":5,
			"pageNum":1
		},
		dataType:"json",
		success:function(data){
			var h='';
			if(data.return_code=="SUCCESS"){
				$.each(data.pageInfo.list, function(i,j){
					h+='<li>'+
						'<input type="hidden" value="'+j.id+'"/>'+
						'<a>'+
							j.title+
						'</a>'+
					'</li>';
				});
				$('#notice2').html(h)
			}else{
				alert(data.return_msg)
			}
			$('#notice2 li a').click(function(){
				window.location.assign('../content/contentdetail.jsp?id='+$('#notice2 li input').val())
			})
		}
   });
}
function getWeather(){//天气
	$.ajax({
		type:"post",
		url:apiUrl+"/common/third/getdata",
		data:{
			"keyword":"weather",
			"region":$('#vvcode').val()
		},
		dataType:"json",
		success:function(data){
			if(data.return_code=="SUCCESS"){
				var item=data.result[0].HeWeather5[0].daily_forecast[0];
				$('.weather').html(
					'<p class="t t1">'+
					'<img src="../../images/weather/'+data.result[0].HeWeather5[0].now.cond.code+'.png" />'+
					'</p>'+
					'<p class="t t2">'+data.result[0].HeWeather5[0].now.cond.txt+'<br />'+ item.tmp.min+'℃-'+item.tmp.max+'℃</p>'
				)
				$(".bdiItem1").text(data.result[0].HeWeather5[0].suggestion.trav.brf)
				$(".bdiItem2").text(data.result[0].HeWeather5[0].suggestion.cw.brf)
			}
		}
    });
}
function getOil(){//油价
	$.ajax({
		type:"post",
		url:apiUrl+"/common/third/getdata",
		data:{
			"keyword":"oil",
			"region":$('#vvcode').val()
		},
		dataType:"json",
		success:function(data){
			if(data.return_code=="SUCCESS"){
				var item1=data.result[0];
				var html='';
				html+='<p>'+
				'<span class="text1">0#</span>'+
				'<span class="text2 ">¥'+item1.oil0+'/L</span></p>'+
				'<p>'+
				'<span class="text1">89#</span>'+
				'<span class="text2 ">¥'+item1.oil89+'/L</span></p>'+
				'<p>'+
				'<span class="text1">90#</span>'+
				'<span class="text2 ">¥'+item1.oil90+'/L</span></p>'+
				'<p>'+
				'<span class="text1">92#</span>'+
				'<span class="text2 ">¥'+item1.oil92+'/L</span></p>'+
				'<p>'+
				'<span class="text1">93#</span>'+
				'<span class="text2 ">¥'+item1.oil93+'/L</span></p>'+
				'<p>'+
				'<span class="text1">95#</span>'+
				'<span class="text2 ">¥'+item1.oil95+'/L</span></p>'+
				'<p>'+
				'<span class="text1">97#</span>'+
				'<span class="text2 ">¥'+item1.oil97+'/L</span></p>';
				$('.oil1').text(item1.oil0)
				$('.oil2').text(item1.oil89)
				$('.oil3').text(item1.oil90)
				$('.oil4').text(item1.oil92)
				$('.oil5').text(item1.oil93)
				$('.oil6').text(item1.oil95)
				$('.oil7').text(item1.oil97)
				$('.oilItem').html(html)
			}
		}
    });
}
function getactivitie(){//活动
	$.ajax({
		type:"get",
		url:apiUrl+"/activity/getactivities",
		data:{
			"station":$('#vvcode').val(),
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
				html+='<section>'+
						'<a href="../activity/activty_detail.jsp?id='+item.id+'">'+
							
							'<p>'+item.title+
								'<span>'+timeFormat1(item.created)+'至'+timeFormat1(item.endDate) +'</span></p>'+
								'<img src="'+item.imageUrl+'"/>'+
					    '</a>'+

					'</section>';
			});
			$('#activtyList').html(html);
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
}
//---------------------轮播图-------------------------------------

function getHotmerchants(pageNum){//推荐商家
	$.ajax({
		type:"post",
		url:apiUrl+"/merchant/getmerchants",
		data:{
			"x":storage["cityLat"],
			"y":storage["cityLng"],
			"region":$('#vvcode').val(),
			"isHot":1,
			"pageSize":10,
			"pageNum":pageNum
		},
		dataType:"json",
		success:function(data){
			if(data.return_code=="SUCCESS"){
				var shophtml='';
				if(data.pageInfo.list.length>0){
					pages=data.pageInfo.pages;
					hasNextPage=data.pageInfo.hasNextPage;
					$.each(data.pageInfo.list, function(index,item) {
						var score=(item.score+'').indexOf('.')!=-1?(item.score+''):(item.score+'.0');
						shophtml+='<li>'+
								'<a href="../shop/shop_detail.jsp?id='+item.id+'&x='+storage["cityLat"]+'&y='+storage["cityLng"]+'" style="display:block">'+
								'<div class="left">'+
									'<img src="'+item.logo+'" />'+
								'</div>'+
								'<div class="right">'+
									'<p><strong>'+item.name+'</strong></p>'+
									'<span class="red">'+score+'<i>人气</i></span>'+
									'<span class="blue">'+item.salesAmount+'<i>分</i></span>'+
									'<p>'+item.address+'</p>'+
								'</div>'+
								'</a>'+
							'</li>'
					});
					if(pageNum==pages){
						$('.more').text('没有更多了')
					}else{
						$('.more').text('查看更多')
					}
					$('#hotShop').html(shophtml);
				}
			}
		}
	});
}
$('.more').click(function(){
	if(hasNextPage){
		pageNum++;
		orderBy(keyText,pageNum);//默认距离
		if(pageNum==pages){
			$('.more').text('没有更多了')
		}else{
			$('.more').text('查看更多')
		}
	}
})
if(storage['getUserId']){
	$.ajax({
		type:"get",
		url:apiUrl+"/common/message/getnotices",
		data:{
			"userId":storage['getUserId'],
			"sign":storage['getSign'],
			"status":0
		},
		dataType:"json",
		success:function(data){
			if(data.return_code=="SUCCESS"){
				MsgNum=data.pageInfo.total
				//alert(data.pageInfo.total)
				if(MsgNum==0){
					$('#news').html('<a href="../index/msg_list.jsp">'+
					'<span class="iconfont icon-xiaoxi1"></span></a>')
				}else{
					$('#news').html('<a href="../index/msg_list.jsp">'+
					'<span class="iconfont icon-xiaoxi1"><i class="bage">'+MsgNum+'</i></span></a>')
				}
			}
		}
	});
}else{
	$('#news').html('<a href="../login-sign/login.jsp" style="color:#fff">登录</a>')
}
/***************************链接商家列表*****************************/	
$('#shop').click(function(){
	var F=false;
	var t='';
	$.each(cityMsg, function(index,item){
		if ($('#vvcode').val()==item.id){
           F = true;
           t=index;
           return;
		}
	});
	if(F){
		$(this).attr('href','../shop/shop_list.jsp?region='+cityMsg[t].id+'&x='+cityLat+'&y='+cityLng)
	}else{
		$(this).attr('href','../shop/shop_list.jsp?region='+cityMsg[0].id+'&x='+cityLat+'&y='+cityLng)
	}
})

