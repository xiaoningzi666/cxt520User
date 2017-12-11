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
<link href="../../css/app.css"  rel="stylesheet"/>
<link rel="stylesheet" href="../../css/animate.min.css" />
<title>认证信息</title>
</head>
<body class="">
	<header class="mui-bar mui-bar-nav ">
	    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
	    <h1 class="mui-title">会员认证</h1>
	</header>
	<div class="mui-content memberIdenty">
		<div class="memberIdentyImg">
		</div>
		<section class="memberIdenty_items">
			<ul class="memberIdenty_itemL" id="memberIdentyMsg">
				
			</ul>
			<ul class="memberIdenty_itemL" id="carIdentyMsg" >
				
			</ul>
		</section>
	</div>
</body>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script src="../../js/common.js" ></script>
<script>
	mui.init();
	var storage = window.localStorage; 
	$.ajax({
		type:"get",
		url:apiUrl+"/member/getmemberident",
		data:{
			"userId":storage['getUserId'],
			"sign":storage['getSign']
		},
		dataType:"json",
		success:function(data){
			var html='';
			if(data.return_code=="SUCCESS"){
				storage['Pname']=data.memberIdentInfo.name;
				html+='<li class="memberIdenty_item">'+
					'<div class="left">车主姓名</div>'+
					'<div class="right myupdate">'+
						data.memberIdentInfo.name
					+'</div>'+
				'</li>'+
				'<li class="memberIdenty_item">'+
					'<div class="left">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</div>'+
					'<div class="right myupdate">';
						$.each(configList("sex"), function(i,j) {
							if(j.value==storage['sex']){
								html+=j.title;
							}
						});
					html+='</div>'+
				'</li>'+
				'<li class="memberIdenty_item">'+
					'<div class="left">身&nbsp;份&nbsp;证</div>'+
					'<div class="right  myupdate">'+
						data.memberIdentInfo.idCardNo
					+'</div>'+
				'</li>'+
				'<li class="memberIdenty_item" style="border:none">'+
					'<div class="left">所在地区</div>'+
					'<div class="right myupdate myupdate1">'+
						data.memberIdentInfo.address
					+'</div>'+
				'</li>'
			}else{
				mui.toast(data.return_msg)
			}
			$('#memberIdentyMsg').html(html)
		}
		
	});
	$.ajax({
		type:"get",
		url:apiUrl+"/member/getcars",
		data:{
			"userId":storage['getUserId'],
			"sign":storage['getSign']
		},
		dataType:"json",
		success:function(data){
			var carHtml='';
			if(data.return_code=="SUCCESS"){
				$.each(data.memberCarList, function(index,item) {
					storage["carLogo"]=item.carLogo;
					storage["model_name"]=item.model_name;
					storage["carNo"]=item.carNo;
					carHtml+='<li class="memberIdenty_item">'+
						'<div class="left">车辆品牌</div>'+
						'<div class="right myupdate">'+
							item.brand_name
						+'</div>'+
					'</li>'+
					'<li class="memberIdenty_item">'+
						'<div class="left">爱车车系</div>'+
						'<div class="right myupdate">'+
							item.model_name
						+'</div>'+
					'</li>'+
					'<li class="memberIdenty_item">'+
						'<div class="left">&nbsp;车&nbsp;牌&nbsp;号</div>'+
						'<div class="right myupdate">'+
							item.carNo
						+'</div>'+
					'</li>'+
					'<li class="memberIdenty_item">'+
						'<div class="left">购车日期</div>'+
						'<div class="right myupdate">'+
							'2017-08-08'
						+'</div>'+
					'</li>'
				});
				$('#carIdentyMsg').html(carHtml)
				
			}else{
				mui.toast(data.return_msg)
			}
		}
	});
</script>
</html>