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
	    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
	    <h1 class="mui-title">体验VIP</h1>
	</header>
	<div class="mui-content vip_con">
		<img src="../../images/VIP_experience/VIP_img0.png" width="100%"/>
		<div class="vip_header">
			<div class="d1">
				<img src="../../images/index/shopDetail/shopDetail_person@3x.png" />
				<span class="VIPnickname"></span>
			</div>
			<div class="d2">
				<a id="triBtn"><img src="../../images/VIP_experience/VIP_apply.png"></a>
				<span class="red">*</span>
			</div>
			
		</div>
		<section>
			<img src="../../images/VIP_experience/VIP_experience.png"  width="50%" />
			<p>经认证的普通会员可申请免费体验VIP专属特权一周，体验期间您将享有和VIP会员同等的服务。</p>
			<div class="mui-row m_b">
			    <div class="mui-col-xs-6"><br />
			    	<img src="../../images/VIP_experience/VIP_img1.png" width="70%"></div>
			    <div class="mui-col-xs-6 x1 x">
			    	免费洗车服务！普通用户申请体验VIP可享受商家提供的同等待遇的洗车服务！
			    </div>
			</div>
			<div class="mui-row m_b">
			    <div class="mui-col-xs-6  x2 x">道路救援服务！服务包括拖车牵引、送油水、电瓶充电紧急修理、困境救援、更换轮胎等，具体参考服务协议。</div>
			    <div class="mui-col-xs-6">
			    	
			    	<img src="../../images/VIP_experience/VIP_img2.png" width="60%">
			    	
			    </div>
			</div>
			<div class="mui-row m_b">
			    <div class="mui-col-xs-6"><img src="../../images/VIP_experience/VIP_img3.png" width="45%"></div>
			    <div class="mui-col-xs-6 x3 x">
			    	免费健身服务！普通用户申请体验VIP可享受商家提供的同等待遇的健身服务！
			    </div>
			</div>
			<div class="mui-row ">
			    <div class="mui-col-xs-6  x4 x">更多服务项目以商家提供服务为准！</div>
			    <div class="mui-col-xs-6">
			    	<img src="../../images/VIP_experience/VIP_img4.png" width="60%">
			    	
			    </div>
			</div>
			
		</section>
	</div>
</body>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script type="text/javascript" src="../../js/common.js" ></script>
<script type="text/javascript">
	mui.init();
	console.log(storage['level'])
	var html='';
	$(function(){
		if(storage['getUserId']){
			$('.d1 img').attr('src',storage['logoUrl']);
			$('.d1 .VIPnickname').text(storage['nickName']);
			if(storage['level']==1){
				$('.d1 .VIPnickname').addClass('VIPlevel1');
			}else{
				$('.d1 .VIPnickname').addClass('VIPlevel2');
			}
			if(storage['isTrial']==0){
				$('.d2 span').text(' ')
			}else if(storage['isTrial']==1){
				$('.d2 span').text('*您已经体验')
			}else{
				$('.d2 span').text('*审核中')
			}
		}else{
			$('.d1 .VIPnickname').text("未登录")
			$('.d2').hide()
		}
		
	})
	$.ajax({
		type:"post",
		url:"http://api.cxt520.com/v5/member/requesttrial",
		data:{
			"userId":storage['getUserId'],
			"sign":storage['getSign']
		},
		dataType:"json",
		success:function(data){
			if(data.return_code=="SUCCESS"){
				$('#triBtn').click(function(){
					$.ajax({
						type:"post",
						url:"http://api.cxt520.com/v5/member/requesttrial",
						data:{
							"userId":storage['getUserId'],
							"sign":storage['getSign']
						},
						dataType:"json",
						success:function(data){
							if(data.return_code=="SUCCESS"){
								
							}else{
								mui.toast(data.return_msg);
							}
						}
					});
				})
			}else{
				$('.d2 span').text('*您已经体验')
			}
		}
	});
	
</script>
</html>