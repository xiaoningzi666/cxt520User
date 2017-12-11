<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">		
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<link href="../../css/mui.min.css" rel="stylesheet" />
	<link href="../../css/app.css" rel="stylesheet" />
	<title>修改账户密码</title>
	<style>
		#modifyPsd .mp>input{
			width:100%;
			border: none;
		}
	</style>
</head>
<body>
<header class="mui-bar mui-bar-nav">
	<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
	<h1 class="mui-title">修改账户密码</h1>
</header>
<div class="mui-content">
	<form class="mui-input-group" id="modifyPsd">
		<input type="hidden" name="userId" value=""/>
		<input type="hidden" name="sign" value=""/>				
		<div class="mui-input-row mp">	
			<input type="password" name="oldPassword" placeholder="请输入原始密码">
		</div>
		<div class="mui-input-row mp">
			<input type="password" name="newPassword" class="mui-input-clear" placeholder="请输入新密码" id="psd">
		</div>
		<div class="mui-input-row mp">
			<input type="password" name="confirmPassword" class="mui-input-clear" placeholder="请再次确认密码">
		</div>
	</form>
	
	<span class=""  style="display: inline-block;margin-left: 1rem;margin-top: 10px;">密码有6-20位英文字母,数字,或符号组成</span>
	<a href="#" class="TelBind_submite" id="modifyPsd_btn">确认</a>
</div>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>	
<script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.min.js"></script>  
<script type="text/javascript" src="../../js/common.js" ></script>
<script type="text/javascript">
mui.init();
var storage = window.localStorage; 
//function checkPhone(){ 
//	var phone = document.getElementById('psd').value;
//	if(!(/^[\x21-\x7E]{6,20}$/.test(phone))){ 
//	
//		mui.toast('密码格式有误');
//		return false; 
//	} 
//	return true;
//}
$(function(){
	$('input[name=userId]').val(storage['getUserId']);
	$('input[name=sign]').val(storage['getSign']);
	
})
$('#modifyPsd_btn').click(function(){
	//var t=checkPhone();
	alert($('input[name=oldPassword]').val())
	if(!$('input[name=oldPassword]').val()||!$('input[name=newPassword]').val()){
		mui.toast("密码不能为空")
	}else if($('input[name=newPassword]').val()!=$('input[name=confirmPassword]').val()){
		mui.toast("两次密码不同")
	}else{
		
			$.ajax({
				url:apiUrl+"/member/updatepassword",
				type:'POST',
				data:{
					"userId":storage['getUserId'],
					"sign":storage['getSign'],
					"oldPassword":md5($('input[name=oldPassword]').val()),
					"newPassword":md5($('input[name=newPassword]').val()),
					"confirmPassword":md5($('input[name=confirmPassword]').val()),
				},
				dataType:'json', 
				success:function(data){
				var d=data.return_code;
					if(d=='SUCCESS'){
						window.location.assign("../login-sign/login.jsp");
					}else{
						mui.toast(data.return_msg);
					}
				}
			})
		
	}
})
//$('#modifyPsd_btn').click(function(){
//	//var t=checkPhone();
//	//if(t){
//		$.ajax({
//		url:"http://api.cxt520.com/v5/member/updatepassword",
//		type:'post',
//		data:$('#modifyPsd').serialize(),
//		dataType:'json', 
//		success:function(data){
//		var d=data.return_code;
//			if(d=='SUCCESS'){
//				window.location.assign("../login-sign/login.jsp");
//				
//			}else{
//				alert(data.return_msg);
//			}
//			
//		}
//	})
//	//}
//	
//	
//})
</script>
</body>

</html>