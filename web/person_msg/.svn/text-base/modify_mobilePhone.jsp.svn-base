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
<link rel="stylesheet" href="../../css/app.css" />
</head>
<body>
	<header class="mui-bar mui-bar-nav">
	    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
	    <h1 class="mui-title">更换手机号</h1>
	</header>
	<div class="mui-content">
		<ul class="persinMsg_con">
	    	<li class="persinMsg_item">
	    		<span></span>
	    	</li>
	    	<li class="persinMsg_item">
	    		<div class="mui-input-row mui-password">
					<input type="password" class="mui-input-password">
				</div>
	    	</li>
	    </ul>
	    <ul class="persinMsg_con">
	    	<li class="persinMsg_item">
	    		<input type="text" class="" id="" name="newMobilePhone" placeholder="请填写新的手机号码"/>
	    	</li>
	    	<li class="persinMsg_item">
	    		<input type="text" name="verificationCode" id="verificationCode" placeholder="手机验证码"/>
	    		<input type="button" id="v_btn" value="发送验证码" style="top: 0.7rem;">
	    	</li>
	    </ul>
	    <a href="#" class="TelBind_submite" id="modifyMobilePhoneBtn">确认</a>
	</div>
	<script src="../../js/mui.min.js"></script>
	<script src="../../js/jquery-1.7.2.min.js" ></script>
	<script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.min.js"></script> 
	<script src="../../js/common.js"></script>
	<script type="text/javascript">
		mui.init()
		var storage = window.localStorage; 
		$('.persinMsg_item span').text(storage['getPhone'])
		$('#v_btn').click(function(){//获取验证码
			getcode($(this));
			$.ajax({
				type:"post",
				url:apiUrl+"/common/sms/sendsmscode",
				data:{
					"mobilePhone":$('input[name=newMobilePhone]').val(),
					"type":3
				},
				dataType:"json",
				success:function(d){
					if(d.return_code=="SUCCESS"){
						codeFlag=d.data.codeFlag;
						$('#verificationCode').val(codeFlag);
					}else{
						mui.toast(d.return_msg)
					}
					
				}
			});
		})
	$('#modifyMobilePhoneBtn').click(function(){
		$.ajax({
			type:"post",
			url:"http://api.cxt520.com/v1/member/updatemobilephone",
			data:{
					"userId":storage['getUserId'],
					"sign":storage['getSign'],
					"password":storage["pwd"],
					"mobilePhone":$('input[name=newMobilePhone]').val(),
					"verificationCode":$('#verificationCode').val()
				},
			dataType:"json",
			success:function(data){
				if(data.return_code="SUCCESS"){
					mui.toast("更换成功");
					storage['getPhone']=$('input[name=newMobilePhone]').val()

					setTimeout(function(){
						window.location.assign('account_security.jsp');
					},1000)
				}else{
					mui.toast(data.return_msg)
				}
			}
		});
	})
		
	</script>
</body>
</html>