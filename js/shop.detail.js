var serviceId=[];
var serviceNum=[];
var storage = window.localStorage;
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
function ImgList(para){
	var Imgsrc=[];
	$.each(para, function(i,j) {
		if(j.type==3){
			Imgsrc.push(j.url);
		}
	});
	
	return Imgsrc;
}

//商户信息
$.ajax({
	url:apiUrl+"/merchant/getmerchantdetails",
	type:'get',
	data:{
		"merchantId":$.getUrlParam("id"),
		"appclient":($.getUrlParam('appclient')?$.getUrlParam('appclient'):''),
		"y":$.getUrlParam("y"),
		"x":$.getUrlParam("x")
	},
	dataType:"json",
	success:function(data){
		var html = '';	
		var htmlA = '';	
		var mallItemHtml='';
		var len = ImgList(data.merchantInfo.imageList).length-1;
		storage['opentime']=data.merchantInfo.openTime;
		storage['openStatus']=data.merchantInfo.openStatus;
		storage['officePhone']=data.merchantInfo.officePhone;
		html+='<div id="slider" class="mui-slider" style="height: 180px;">'+
				'<div class="mui-slider-group mui-slider-loop">'+
					'<div class="mui-slider-item mui-slider-item-duplicate">'+
						'<a href="#">'+
							'<img src="'+ImgList(data.merchantInfo.imageList)[len]+'">'+
						'</a>'+
					'</div>';
				$.each(ImgList(data.merchantInfo.imageList),function(index,item){
					html+='<div class="mui-slider-item">'+
							'<a href="#">'+
							'<img src="'+item+'" alt="img">'+
							'</a>'+
						'</div>'
					if(index==0){
						htmlA+='<div class="mui-indicator mui-active"></div>';
					}else{
						htmlA+='<div class="mui-indicator"></div>';
					}
				})
			html+='<div class="mui-slider-item mui-slider-item-duplicate">'+
					'<a href="#">'+
						'<img src="'+ImgList(data.merchantInfo.imageList)[0]+'">'+
					'</a>'+
				'</div>'+
			'</div>'+
			'<div class="mui-slider-indicator" id="indicatorH">'+htmlA+'</div>'+
			'<div class="openTime">'+
				opentime(data.merchantInfo.openStatus,data.merchantInfo.openTime)+
			'</div>'+
		'</div>'+
		'<section class="shop_head">'+
			'<input type="hidden" value="'+data.merchantInfo.officePhone+'" id="tel_item"/>'+
			'<div class="mui-media-body mui-pull-left con">'+
				'<div class="content" id="mallItem">'+
					'<header id="mallName">'+data.merchantInfo.name+'</header>'+
					'<p class="shop_item1" id="rating">';
						for(var i=0;i<5;i++){
							html+='<span class="rating-item"></span>';
						}
					html+='<span class="t red" >'+
					'<i id="score" >'+data.merchantInfo.score+'</i>分</span>'+
					'<span class="t orange">'+
					'<i id="salesAmount">'+data.merchantInfo.salesAmount+'</i>人气</span>'+
					'</p>'+
				'</div>'+
			'</div>'+
			'<div class="side">'+
				'<img src="../../images/shop_detail/telIcon.png" class="tel_item mui-pull-right"/>'+
			'</div>'+
			'<div style="clear: both;"></div>'+
		'</section>'+
		'<section class="shop_head shopDetail_adr" >'+
			'<div class="mui-media-body mui-pull-left con">'+
				'<div class="content" id="mallItem">'+
					'<a href="#" class="sda1" id="mallAddress" style="display: inline-block;">'+
						data.merchantInfo.address+
					'</a>'+
				'</div>'+
			'</div>'+
			'<div class="side">'+
				'<a href="#" class="sda2">到这里<br />'+
					'<span id="lbs" style="display: inline-block;">';
					if(data.merchantInfo.lbs>1000){
						html+=km(data.merchantInfo.lbs)+'km';
					}else{
						html+=data.merchantInfo.lbs+'m';
					}
				html+='</span>'+
				'</a>'+
			'</div>'+
		'</section>';
		storage['mallName']=data.merchantInfo.name;
		$('#con').html(html)
		$('.tel_item').click(function(){
			if($('#tel_item').val()){
				$('.tel p').text($('#tel_item').val());
				$('.telcon').show()
			}else{
				$('.tel p').text('暂无联系方式');
				$('.telcon').show()
			}
		})
		$('.mui-slider-item img').css("width",$(window).width());
		$('.mui-slider-item img').css("height",$(window).width()*9/16);
		var slider= mui("#slider");
		var score=$('#score').text()/2;
		var sInt=Math.floor(score);
		var dif=score-sInt;
		slider.slider({
			interval: 3000
		});	
		$('#rating .rating-item').each(function(index){//等级	
			if(index<sInt){
				$(this).css('background-position','0 0');
			}else if(index==sInt){
				if(dif>0){
					$(this).css('background-position','0 -13px');
				}			
			}				
		})
		$('#itemList').click(function(){
			if(storage['identStatus']!=1){
				$('#M4').show();
				$('#unidenty').click(function(){
					$('#M4').hide();
				})
				$('#identy').click(function(){
					window.location.assign("../MemberIdenty/memberIdenty.jsp")
				})
			}else{
				if(data.merchantInfo.openStatus==1){
					if(storage['getUserId']){
						$(this).attr('href','submitOrder.jsp?merchantId='+$.getUrlParam("id")+
						'&serviceId='+serviceId+'&serviceNum='+serviceNum+
						'&priceTotal='+$('#priceTotal').text()+
						'&TotalNum='+$("#seviceNum").text())
					}else{
						mui.toast('请先登录')
					}
				}else{
					var txt=data.merchantInfo.openStatus==0?txt="正在停业中":txt="正在休息中";
					$('#M5 #txt').text(txt);
					$('#M5').show();
					$('#stop').click(function(){
						$('#M5').hide();
					})
					
				}
			}
		})
		}
		
	})
function opentime(p1,p2){//营业时间
	var Thtml='';
	var thtml='';
	var openTimeStartH='';
	var openTimeStartM='';
	var openTimeEndH='';
	var openTimeEndM='';
	openTimeStartH=p2.split('-')[0].split(':')[0];
	openTimeStartM=p2.split('-')[0].split(':')[1];
	openTimeEndH=p2.split('-')[1].split(':')[0];
	openTimeEndM=p2.split('-')[1].split(':')[1];
	$.each(configList("openStatus"), function(i,j) {
		if(p1==j.value){
			if(p1==1){
				if(p2=="00:00-00:00"&&p2!="24"){
					thtml+='<span id="openTime">24h</span>'+
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
					thtml+='<span id="openTime">'+p2+'</span>';
					thtml+=Thtml;
				}
			}else{
				if(p2=="00:00-00:00"&&p2!="24"){
					thtml+='<span id="openTime">24h</span>';
				}else{
					thtml+='<span id="openTime">'+p2+'</span>';
				}
				thtml+='<img src="../../images/shop_detail/shop_stop'+j.value+'.png"/>';
				$('#tipText').text('温馨提示：商家'+j.title+'，暂停止服务，给您带来的不便敬请谅解！')
				$('#tipText').show();
			}
		}
	});
	return thtml;
}
/*--------------------服务列表start-------------------*/
//服务列表控制函数
function seviveControl(){
	var ul=document.getElementById('seviceList');
	var SevrivArr=ul.getElementsByTagName('li');
	var priceTotal=document.getElementById('priceTotal');
	var selectInputs=document.getElementsByClassName('check');
	function getSubtotal(itemL) {//获取每行的总价钱
		var countInput=itemL.getElementsByTagName('input')[4];
		var price=itemL.getElementsByClassName('priceList');
		var subTotal  ='';
		if(price.length>0){
			subTotal=parseInt((parseInt(countInput.value) * parseFloat(price[0].innerHTML)).toFixed(2));
		}
		//alert(subTotal)
		return subTotal;
	}
	function  getTotal() {//计算总价钱
		var price = 0;
		var HTMLstr = '';
		var selCheckedNum='';
		var j=0;
		serviceId=[];
		serviceNum=[];
		for (var i = 0, len = SevrivArr.length; i < len; i++) {
			if (SevrivArr[i].getElementsByTagName('input')[3].checked) {
				var s=	getSubtotal(SevrivArr[i])
				price += parseFloat(s);
				serviceId[j]=SevrivArr[i].getElementsByTagName('input')[5].value;
				serviceNum[j]=SevrivArr[i].getElementsByTagName('input')[4].value;
				j++		
			}
		}
		storage['serviceId']=serviceId;
		console.log(serviceId)
		$('#priceTotal').html( price.toFixed(2));
		var sNum=0;
		$.each(serviceNum, function(index) {
			index++;
			sNum=index;
		});
		$("#seviceNum").text(sNum)
	}
	$('.check').click(function(){//判断每行服务的单选情况
		var obj = $(this);
		var val = obj.val();
		var p=obj.parents('li')
		var isLbs=p.find('input').eq(0).val();
		if(obj.is(':checked')){
			var s=p.find('input').eq(1).val();
			//单选
			if(s==1){
				//单选，取消其他				
				$('#M').show();
				$('#confirm').click(function(){
					$('#M').hide()
					if(isLbs==1){
						$('#M3').show();
						$('#tipText').text("温馨提示：您选中的有到店服务的项目，您需要到商家现场方可提交")
						$('#tipText').show()
					}
					$('#quit').click(function(){
						getTotal();
						obj.attr('checked',false)
						$('#M3').hide()
					})
					$('#reach').click(function(){
						obj.attr('checked',true)
						for(var i = 0; i < selectInputs.length; i++ ){
		        			if(val!=i){
			        			//取消其他的复选框
			        			selectInputs[i].checked = false;
		        			}
			    		}
						getTotal();
						$('#M3').hide()
					})
					getTotal();
				})
				$('#cancel').click(function(){
					//alert(1)
					obj.attr('checked',false)
		    		$('#M').hide()
		    		getTotal();
				})
			}else{
				//当前选中不限制多选
				var a='';
				var Bool='';
				for(var i = 0; i < selectInputs.length; i++ ){
					var nomulit = $('.check').eq(i).parents('li').find('input').eq(1).val();
					if(selectInputs[i].checked&&val!=i&&nomulit==1){
						a=i;
						Bool=true;
						break;
					}
				}
				if(Bool==true){
					$('#M2').show();
				}
				$('#comeon').click(function(){
					alert(1)
					selectInputs[a].checked=false
					getTotal();
					$('#M2').hide()
					return
				})
				$('#close').click(function(){
					obj.attr("checked",false);
					getTotal();
					$('#M2').hide()
				})
			}
		}else{
			obj.attr("checked",false);
			$('#tipText').hide()
		}
		//alert(2)
		getTotal();
	})
	//为每行元素添加事件
	for (var i = 0; i < SevrivArr.length; i++) {
		//将点击事件绑定到每行元素
		SevrivArr[i].onclick = function (e) {
			var e = e || window.event;
			var el = e.target || e.srcElement; //通过事件对象的target属性获取触发元素
			var cls = el.className; //触发元素的class
			var countInput = this.getElementsByTagName('input')[4]; // 数目input
			var valText = parseInt(countInput.value); //数目
			var limitNum=this.getElementsByTagName('input')[2].value//限购数量
			//通过判断触发元素的class确定用户点击了哪个元素
			switch (cls) {
			    case 'add': //点击了加号
			    	if(limitNum==0){
			    		countInput.value = valText + 1;
			    	}else{
			    		if(countInput.value<limitNum){
			       			countInput.value = valText + 1;
			       		}else{
			       			mui.toast('限购'+limitNum+'件')
			       		}
			    	}
			        getSubtotal(this);
			        getTotal();
			        break;
			    case 'reduce': //点击了减号
			        if (valText > 1) {
			            countInput.value = valText - 1;
			            getSubtotal(this);
			            getTotal();
			        }
			        break;
			}
		}
	}
}	
//获取服务列表
$.ajax({
	url:apiUrl+"/merchant/getmerchantservices",
	type:'get',
	data:{
		"merchantId":$.getUrlParam("id"),	
		"appclient":($.getUrlParam('appclient')?$.getUrlParam('appclient'):''),
		"member_level":storage['level']
	},
	dataType:"json",
	success:function(data){
		var dArry=data.merchantServiceList;
		var Shtml='';
		Shtml+='<header>'+
			'<strong style="display: inline-block;margin: 0.5rem;font-size: 1rem;">'+
				'服务项目'+
			'</strong>'+
			'<span id="tipText" style="display: none">'+
				'温馨提示：您选中的有到店服务的项目，您需要到商家现场方可提交'+
			'</span>'+
		'</header>'+				
		'<ul class="seviceList" style="width:100%;" >';
		$.each(data.merchantServiceList,function(i,j){
			var currPrice=0;
            var oldPrice=0;
            var currP='';
            var Price=(j.price+'').indexOf('.')!=-1?(j.price+''):(j.price+'.00');
			var showStyle = i<3?'':'display:none';
				Shtml+='<li style="width:100%;'+showStyle+'">'+
				'<a href="SeviceDetail.html?id='+$.getUrlParam("id")+'&serviceId='+j.id+'">'+
				'<input type="hidden" value="'+j.isLbs+'"/>'+
				'<input type="hidden" value="'+j.isNoMulti+'"/>'+
				'<input type="hidden" value="'+j.limits+'"/>'+
				'<div class="centerWrap"> ' +
		            '<div class="item">'+
		            	'<h4 class="secvice_item" id="">'+j.service;
		            		if(j.isLbs==1&&j.isNoMulti==0){
			            		Shtml+='<small class="sub"><i>到店</i></small>';
			            	}
			            	if(j.isLbs==0&&j.isNoMulti==1){
			            		Shtml+='<small class="sub"><i>单独</i></small>';
			            	}
			            	if(j.isLbs==1&&j.isNoMulti==1){
			            		Shtml+='<small class="sub"><i>单独</i><i>到店</i></small>';
			            	}
		            Shtml+='</h4>';
		            if(storage['getUserId']){
		            	 $.each(j.priceList, function(index,item) {
		            	 	var price=(item.price+'').indexOf('.')!=-1?(item.price+''):(item.price+'.00');
			            	if(item.member_level==storage['level']){
			            		currP='<div class="saleL" style="margin-bottom:0.5rem;color:#f76116">'+
			            		'<img src="../../images/VIP_experience/v'+item.member_level+'.png" width="15"/>'+
			            		'¥<i class="priceList">'+price+'</i></div>'+currP
			            	}else{
			            		currP=currP+
			            		'<p class="red saleL sale1">'+
			            		'<img src="../../images/VIP_experience/v'+item.member_level+'.png" />'+
			            		'¥<i class="priceList">'+price+'</i></p>';
			            	}
			            });
		            }else{
		            	 $.each(j.priceList, function(index,item) {
			            	if(index==0){
			            		currP='<div class="saleL" style="margin-bottom:0.5rem;color:#f76116">'+
			            		'<img src="../../images/VIP_experience/v1.png" width="15"/>'+
			            		'¥<i class="priceList">0.00</i></div>'+currP
			            	}else{
			            		currP=currP+
			            		'<p class="red saleL sale1"><img src="../../images/VIP_experience/v2.png" />'+
			            		'¥<i class="priceList">0.00</i></p>';
			            	}
			            });
		            }
		            Shtml+=currP
		            Shtml+= '<span class="sale1">门市价：¥<i>'+Price+'</i></span>';
		           	Shtml+= '<p class="ItemT">'+j.abstraction+'</p>'+		               
			            '</div>'+
			        '</div>'  +
			        '<div class="left_margin">'+
			        	'<div class="mui-checkbox  mui-checkbox1" style="margin-right: -1rem;">'+
			        		'<input name="checkbox" type="checkbox" value="'+i+'" class="check">'+
			        	'</div>'+				        	
			        '</div>'  +
			        '<div class="right_margin">'+
			        	'<div class="count">'+
		            		'<span class="reduce">-</span>'+
		                    '<input class="count-input" type="text" value="1"/>'+
		                    '<span class="add">+</span>'+
		            	'</div>';
		            	if(j.limits>0){
		            		Shtml+='<span class="num">限购：'+j.limits+'</span>';
		            	}
		            	
			       Shtml+='</div> '	+
			       '<input type="hidden" value="'+j.id+'"/>'+
				'</a></li>'
		})
		if(dArry.length<4){
			Shtml+='';
		}else{
			Shtml+='<p class="moreSeviceBtn">查看全部服务('+dArry.length+')'+
			'<span class="iconfont icon-jiantou2"</p>';
		}
		Shtml+='</ul>';
		$('#seviceList').html(Shtml);
		$('.moreSeviceBtn').click(function(){
			$('#seviceList li').show();
			$('.moreSeviceBtn').hide()
			})
			seviveControl();
		}
	})
/*--------------------服务列表end-------------------*/
/*-------------------评价功能start----------------*/
$.ajax({
	type:"get",
	url:apiUrl+"/orders/getmerchantevaluatelist",
	data:{
		"userId":storage['getUserId'],
		"sign":storage['getSign'],
		"merchantId":$.getUrlParam("id"),
		"appclient":($.getUrlParam('appclient')?$.getUrlParam('appclient'):''),
		"pageSize":1,
		"pageNum":1
	},
	dataType:"json",
	success:function(data){
		var html='';
		if(data.return_code=="SUCCESS"){
			html+='<header>'+
				'<img src="../../images/shop_detail/shopDetail_evaluation@3x.png"/>'+
			'</header>'+
			'<div class="mui-card mui-card1">'+
				'<div class="appraise_item1">'+
					'<header>客户评价('+data.pageInfo.total+')</header>'+
				'</div>';
			$.each(data.pageInfo.list, function(index,item){
				html+='<div class="mui-card-header mui-card-media Mymedia">'+
					'<img src="'+item.logoUrl+'" />'+
						'<div class="mui-media-body a">'+
							'<span class="name">'+item.nickName.replace(/^(.).*(.)$/,"$1***$2")+'</span>';
							html+='<img src="../../images/VIP_experience/v'+item.level+'.png"/>'+
							'<p class="shop_item1" id="rating" style="margin-left:10px">';
							for(var i=0;i<5;i++){
								var score=item.value/2;
								var sInt=Math.floor(score);
								var dif=score-sInt;
								if(i<sInt){
									html+='<span class="rating-item" style="background-position:0 0"></span>';
								}else if(i==sInt){
									if(dif>0){
										html+=
										'<span class="rating-item" style="background-position:0 -13px"></span>';
									}
								}else{
									html+='<span class="rating-item"></span>';
								}
							}
							html+='</p>'+
								'<span class="T mui-pull-right" style="color:#888;font-size:0.8rem" >'+
								timeFormat1(item.created)+'</span>'+
							'</div>'+
							'<div style="clear:both"></div>'+
							'<div class="mui-card-content Ap_content">'+
							'<div class="apprise_mark">';
							$.each(item.orderList, function(i,j) {
								html+='<span>'+j.mechServiceName+'</span>';
							});
					html+='</div>'+
							'<p class="apprise_text">'+item.content+'</p>'+
						'</div>';
					if(data.pageInfo.total>0){
						html+='<div class="footer" style="padding:0">'+
						'<a href="520_appraise_detail.html?id='+$.getUrlParam("id")+'" class="link getComment">'+
							'查看全部评价</a>'+
						'</div>'
					}	
				html+='</div>'+
					'</div>';
			});
			
		}else{
			html+='<div class="appraise_item1">'+
					'<header>客户评价(0)</header>'+
				'</div>';
		}
		$('#commentListwrap').html(html)
	}
});	
/*-------------------评价功能end----------------*/
/*-------------------收藏功能start-------------*/
var infavoriteId='';
var collArr='';
$.ajax({
	type:"get",
	url:apiUrl+"/member/isinfavorites",
	data:{
		"userId":storage['getUserId'],
		"sign":storage['getSign'],
		"appclient":($.getUrlParam('appclient')?$.getUrlParam('appclient'):''),
		"type":2,
		"objectId":$.getUrlParam("id")
	},
	dataType:"json",
	success:function(data){
		if(data.return_code=="SUCCESS"){
			infavoriteId=data.id;
			$('.collBtn i').text('取消收藏');
			$('.collBtn span').removeClass('icon-shoucang orange');
			$('.collBtn span').addClass('icon-shoucang1 orange');
			
		}else{
			$('.collBtn i').text('收藏');
			$('.collBtn span').removeClass('icon-shoucang1 orange');
			$('.collBtn span').addClass('icon-shoucang orange');
			
		}
	}
});
$('.collBtn').click(function(){
	if(storage['getUserId']){
		var t=$(this).find('span').hasClass('icon-shoucang orange')
		if(t){
			$.ajax({
				type:"post",
				url:apiUrl+"/member/addfavorite",
				data:{
					"userId":storage['getUserId'],
					"sign":storage['getSign'],
					"appclient":($.getUrlParam('appclient')?$.getUrlParam('appclient'):''),
					"type":2,
					"objectId":$.getUrlParam("id")
				},
				dataType:"json",
				success:function(data){
					if(data.return_code=="SUCCESS"){
						mui.toast("收藏成功");
						$('.collBtn i').text('取消收藏');
						$('.collBtn span').removeClass('icon-shoucang orange');
						$('.collBtn span').addClass('icon-shoucang1 orange');
						document.location.reload()
					}else if(data.return_code=="FAVORITE_EXIT"){
						$('.collBtn i').text('取消收藏');
						$('.collBtn span').addClass('icon-shoucang1 orange');
					}else{
						alert(data.return_msg)
					}
				}
			});
		}else{
			$.ajax({
				type:"post",
				url:apiUrl+"/member/cancelfavorite",
				data:{
					"userId":storage['getUserId'],
					"sign":storage['getSign'],
					"appclient":($.getUrlParam('appclient')?$.getUrlParam('appclient'):''),
					"id":infavoriteId
				},
				dataType:"json",
				success:function(data){
					if(data.return_code=="SUCCESS"){
						mui.toast("取消收藏成功");
						$('.collBtn i').text('收藏');
						$('.collBtn span').removeClass('icon-shoucang1 orange');
						$('.collBtn span').addClass('icon-shoucang orange');
						
					}else if(data.return_code=="FAVORITE_EXIT"){
						$('.collBtn i').text('收藏');
						$('.collBtn span').addClass('icon-shoucang orange');
					}else{
						alert(data.return_msg)
					}
				}
			});
		}
	}else{
		$('.toast').show();
		setTimeout(function(){
			$('.toast').hide();
		},1500)
	}
})
