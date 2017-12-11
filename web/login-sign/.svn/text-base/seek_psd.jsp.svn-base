<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">		
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link href="../../css/mui.min.css" rel="stylesheet" />
<link rel="stylesheet" href="../../css/app.css" />
<title></title>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">找回密码</h1>
	</header>
	<div class="mui-content">
		<form class="mui-input-group" id="seekPsd">
			<input type="hidden" name="codeFlag" value="" id="codeFlag"/>
			<div class="mui-input-row">						
				<input type="text" name="mobilePhone" placeholder="请输入手机号码">
			</div>
			<div class="mui-input-row">						
				<input type="text" name="verificationCode" placeholder="请输入验证码">
				<input type="button" id="v_btn" value="发送验证码" style="top: 0.7rem;border-left: 1px solid #eee;">
			</div>
			<div class="mui-input-row">
				<input type="password" name="newPassword" class="mui-input-clear" placeholder="请填写新密码">
			</div>
			<div class="mui-input-row">
				<input type="password" name="confirmPassword" class="mui-input-clear" placeholder="请再次输入密码，确保两次输入保持一致">
			</div>
			
		</form>
		<a class="TelBind_submite white">提交</a>
	</div>
	<script src="../../js/mui.min.js"></script>
	<script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.min.js"></script>  
	<script src="../../js/jquery-1.7.2.min.js"></script>
	<script src="../../js/common.js"></script>
	<script type="text/javascript">
		mui.init()
		$('.TelBind_submite').click(function(){
			if(!$('input[name="mobilePhone"]').val()){
				mui.toast("手机号不能为空")
			}else if(!$('input[name="verificationCode"]').val()){
				mui.toast("验证码不能为空")
			}else if(!$('input[name="newPassword"]').val()){
				mui.toast("密码不能为空")
			}else if($('input[name="newPassword"]').val()!=$('input[name="confirmPassword"]').val()){
				mui.toast("两次密码不一致，请重新输入")
			}else{
				$.ajax({
					type:"post",
					url:apiUrl+"/member/forgetpassword",
					async:true,
					data:{
						"mobilePhone":$('input[name="mobilePhone"]').val(),
						"verificationCode":$('input[name="verificationCode"]').val(),
						"newPassword":md5($('input[name="newPassword"]').val()),
						"confirmPassword":md5($('input[name="confirmPassword"]').val()),
						"codeFlag":$('input[name="codeFlag"]').val()
						
					},
					dataType:"json",
					success:function(data){
						if(data.return_code=="SUCCESS"){
							mui.toast("修改成功");
							setTimeout(function(){
								window.location.assign("../login-sign/login.jsp")
							},2000)
						}else{
							mui.toast(data.return_msg)
						}
					}
				});
			}
			
		})
		$('#v_btn').click(function(){//获取验证码
		if($('input[name=mobilePhone]').val()){
			getcode($(this));
			$.ajax({
				type:"post",
				url:apiUrl+"/common/sms/sendsmscode",
				data:{
					"mobilePhone":$('input[name=mobilePhone]').val(),
					"type":2
				},
				dataType:"json",
				success:function(d){
					codeFlag=d.data.codeFlag;
					$('#codeFlag').val(codeFlag);
				}
			});
		}else{
			mui.toast("手机号不能为空")
		}
	})
	</script>
</body>

</html>