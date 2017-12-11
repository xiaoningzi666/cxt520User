<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link href="../../css/mui.min.css" rel="stylesheet" />
<link rel="stylesheet" href="../../css/app.css" />
<title>更换手机号</title>
</head>

<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">更换手机号</h1>
	</header>
	<div class="mui-content">
		<form class="mui-input-group" id="Modifyphone">
			<input type="hidden" name="userid" value="15"/>
			<input type="hidden" name="sign" value="b3a31f9661e189e731264ba2d45b368c"/>				
			<div class="mui-input-row" >						
				<input type="text" name="useName" value="15333837112">
			</div>
			<div class="mui-input-row mui-password">
				<input type="password" name="password" class="mui-input-password" placeholder="请输入登录密码">
			</div>
			<div style="width:100%; height:0.5rem;background:#eee;">
			</div>
			<div class="mui-input-row">
				<input type="text" name="newMobilePhone" class="mui-input-clear" placeholder="请填写新手机号">
			</div>
			<div class="mui-input-row">						
				<input type="text" name="verificationCode" placeholder="请输入验证码">
				<button type="button" class="blue identityCode">重新发送3s</button>
			</div>
		</form>				
		<a href="#" class="TelBind_submite" id="updatemobilephone">确认</a>
	</div>
	<script src="../../js/mui.min.js"></script>
	<script src="../../js/jquery-1.7.2.min.js" ></script>
	<script type="text/javascript">
		mui.init();
		$("#updatemobilephone").click(function(){
			$.ajax({
			url:"http://api.cxt520.com/v5/member/updatemobilephone",
			type:"POST",
			data:$('#Modifyphone').serialize(),
			dataType:'json',
			success:function(data){
				var d=data.return_code;
				if(d=="SUCCESS"){
					mui.toast("修改成功");
					window.location.assign("../login-sign/login.jsp");
				}else{
					alert(data.return_msg);
				}
			}
		})
		})
		
	</script>
</body>

</html>