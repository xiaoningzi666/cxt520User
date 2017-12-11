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
<link href="../../css/app.css" rel="stylesheet"/>
</head>
<body>
<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" id="back"></a>
    <h1 class="mui-title">520车信通VIP</h1>
     <a href="VIPPayRecorde.jsp" class="mui-pull-right" style="display: inline-block;margin-top: 14px;">缴费记录</a>
</header>
<div class="mui-content vip_pay">
    <header>开通520车信通vip即可享受更多免费服务项目</header>
    <div class="vp_way">
    	<!--<img src="../../images/VIP_experience/VIP_img0.png" width="100%"/>-->
    	<div class="vp_items">
    		<div class="p1" id="p1">
    		</div>
			<div class="p2">
    			<img src="../../images/my_msg/xianxia.png" id="offlinePay"/>
    			<a>
    				<img src="../../images/my_msg/zaixian.png"  id="onlinePay"/>
    			</a>
    		</div>
    		
    		<div class="p3">
    			<span class="checkbox">
    				<input type="checkbox" id="checkbox"/>
    				<img src="../../images/nochecked.png"></i>
    			</span>
    			<a href="520notice.html">我已阅读《<i class="red">520VIP须知</i>》</a>
    		</div>
    	</div>
    	<h4>选择VIP套餐</h4>
    </div>
    <section class="vipPay_package">
    	<ul id="vipPay_list">
    	</ul>
    </section>
    
</div>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>	
<script src="../../js/common.js"></script>
<script type="text/javascript">
	
	mui.init();
	var newLevel='';
	var step='';
	var payType='';
	var totalAmount='';
	var html='';
	var dur='';
	$('.checkbox').click(function(){
		if($('#checkbox').is(":checked")){
			$(this).find("img").attr("src","../../images/checked.png")
		}else{
			$(this).find("img").attr("src","../../images/nochecked.png")
		}
	})
	if(storage['level']==1){
		$('#p1').html(
			'<img src="../../images/VIP_experience/rank0.png"/>'+
    		'<span>您当前未开通VIP</span>'
		)
	}else{
		$('#p1').html(
			'<img src="../../images/my_msg/vip@3x.png"/>'+
    		'<span>12个月VIP</span><br />'+
    		'<small>有效期至'+storage["expiredDate"]+'</small>'
		)
	}
	$.ajax({
		type:"get",
		url:apiUrl+"/configration/getmemberpackages",
		data:{
				"userId":storage['getUserId'],
				"sign":storage['getSign']
			},
		dataType:"json",
		success:function(data){
			if(data.return_code="SUCCESS"){
				$.each(data.memberPackages, function(index,item) {
						if(index==0){
							html+='<li class="on">';
						}else{
							html+='<li>';
						}
						html+='<input type="hidden" value="'+item.level+'"/>';
						html+='<p>';
							html+='<span class="t1"><strong>'+item.duration+'</strong>个月vip</span>';
							html+='<span class="t2">送<i>'+item.score+'</i>积分</span>';
							html+='<span class="t3">';
								html+='<strong>¥'+isdot(item.currentPrice)+'</strong>';
								html+='<i>¥'+isdot(item.salesPrice)+'</i>';
							html+='</span>';
						html+='</p>';
						html+=' <img src="../../images/VIP_experience/vipPay_img.png" />';
						if(dateLine(item.duration)){
							html+= ' <span class="t4">有效期至'+dateLine(item.duration)+
									'</span>';
						}
						html+='</li>';
				});
				$('#vipPay_list').html(html)
				selmemberPackage();
			}
		}
	});
	//selmemberPackage()
	$.ajax({
		type:"get",
		url:apiUrl+"/member/getpaymentlist",
		data:{
				"userId":storage['getUserId'],
				"sign":storage['getSign'],
				"pageSize":0,
				"pageNum":0,
				"status":0
			},
		dataType:"json",
		success:function(data){
			if(data.return_code=="SUCCESS"){
				if(data.pageInfo.total>0){
					$('.p2').html('客户经理正在为您办理线下付款业务'+
							'<p>我要<a href="VIPPayRecorde.jsp"  class="blue">撤销</a></p>')
				}
			}else{
				mui.toast(data.return_msg)
			}
		}
	});
	function selmemberPackage(){
		var items=$('#vipPay_list li');
		$.each(items, function(i) {
			if(items.eq(i).hasClass('on')){
				newLevel=$(this).find('input').eq(0).val();
				step=$(this).find('.t1 strong').text();
				totalAmount=$(this).find('.t3 strong').text().slice(1);
			}
		});	
		$('#vipPay_list>li').click(function(){
			$(this).siblings().removeClass('on');
			$(this).addClass('on');
			$('.t4').css('color','#444')
			newLevel=$(this).find('input').eq(0).val();
			step=$(this).find('.t1 strong').text();
			storage['step']=step;
			totalAmount=$(this).find('.t3 strong').text().slice(1);
			storage['totalAmount']=totalAmount;
		})
		
		$('#onlinePay').click(function(){
			if($('#checkbox').is(":checked")){
				window.location.assign("onlinePay.jsp")
			}else{
				mui.toast('请确认您已阅读了《520VIP须知》')
			}
		})
		$('#offlinePay').click(function(){
			
			if($('#checkbox').is(":checked")){
				$.ajax({
					type:"post",
					url:apiUrl+"/member/updatelevel",
					data:{
						"userId":storage['getUserId'],
						"sign":storage['getSign'],
						"newLevel":newLevel,
						"step":step,
						"payType":99,
						"totalAmount":totalAmount
					},
					dataType:"json",
					success:function(data){
						if(data.return_code=="SUCCESS"){
//							$('.p2').html('客户经理正在为您办理线下付款业务'+
//							'<p>我要<a href="VIPPayRecorde.jsp"  class="blue">撤销</a></p>')
							mui.toast('您的申请我们已经收到,您的客户经理将于您联系核实')
							document.location.reload();
						}else{
							mui.toast(data.return_msg)
						}
					}
				});
			}else{
				mui.toast('请确认您已阅读了《520VIP须知》')
			}
			
		})
	}
	function CheckIsChinese(val){  //检验是否有汉字
	 	var Arr='';
	　　var reg = new RegExp("[\\u4E00-\\u9FFF]+","g");
	　　if(reg.test(val)){
			val=val.replace(/[\u4e00-\u9fa5]/g,'-')
			Arr=val.split("-");
			val=Arr[0]+'-'+Arr[1]+'-'+Arr[2]+Arr[3];
		}
		return val
	 }
	function dateLine(n){
		var d1=new Date().getTime();
		var d2=storage["expired"];
		var oldyear='',oldmonth='',t=0,middleware1='',d='';
		var newyear='',newmonth='',newdate='',dArr='';
		if(d2){
			d1>d2?d=CheckIsChinese(timeFormat1(d1)):d=CheckIsChinese(storage["expiredDate"]);
		}else{
			d=CheckIsChinese(timeFormat1(d1));
		}
		dArr=d.split('-');
		oldyear=dArr[0];
		oldmonth=parseInt(dArr[1]);
		middleware1=Math.floor((oldmonth+parseInt(n))/12);
		newmonth=(oldmonth+parseInt(n))%12;
		newyear=parseInt(parseInt(oldyear)+parseInt(middleware1));
		newdate=newyear+'-'+newmonth+'-'+dArr[2]
		return newdate;
	}
</script>
</body>
</html>