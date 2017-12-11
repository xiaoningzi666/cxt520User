<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link href="../../css/mui.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="../../css/public.css">
<link rel="stylesheet" type="text/css" href="../../css/mobileSelect.css">
<link rel="stylesheet" href="../../css/app.css" />
<title>会员注册</title>
</head>
<body class="white">
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">会员注册</h1>
	</header>
	<div class="mui-content login_wrap">
		<form class="sign_con" id="sign">
			<input type="hidden" name="codeFlag" value="" id="codeFlag"/>
			<div class="admin1">
				<div class="left">
					<img src="../../images/login/Sign_admin.png" />
				</div>
				<div class="right" >
					<input type="text" name="mobilePhone" id="mobilePhone" value="" placeholder="请输入您的手机号" />
				</div>
			</div>
			<div class="identyID">
				<div class="left">
					<img src="../../images/login/identy_code.png" />
				</div>
				<div class="right">
					<input type="text" name="verificationCode" id="verificationCode" value="" placeholder="验证码"/>
				</div>
				<input type="button" id="v_btn" value="发送验证码">
			</div>
			<div class="password2">
				<div class="left">
					<img src="../../images/login/site.png" />
				</div>
				<div class="right" >
					<input type="text" name="" id="trigger" value="" placeholder="请输入地区"/>
					<input type="hidden" name="region" id="trigger1" value=""/>
				</div>
			</div>
			<div class="password1">
				<div class="left">
					<img src="../../images/login/sign_Lock.png" />
				</div>
				<div class="right">
					<input type="password" name="password" id="password" value="" placeholder="请输入密码"/>
					<!--<input type="hidden" name="" id="password" value="" placeholder="请输入密码"/>-->
				</div>
			</div>
			<div class="password2">
				<div class="left">
					<img src="../../images/login/sign_Lock.png" />
				</div>
				<div class="right">
					<input type="password" name="password_confirm" id="password_confirm" value="" placeholder="请再次确认密码"/>
					<!--<input type="hidden" name="" id="" value="" placeholder="请再次确认密码"/>-->
				</div>
			</div>
		</form>
		<p class="login_btn sign_btn" >
			<a href="javascript:void(0)" id="signIn_btn" class="">会员注册</a>
		</p>
		<p class="sign_item">已有账号<a href="login.jsp" class="blue"> 去登录</a></p>
		<p class="st">注册即代表阅读并同意<a href="userNotice.html" class="blue">用户协议</a>及<a href="#" class="blue">隐私声明</a></p>
	</div>
</body>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.min.js"></script> 
<script src="../../js/common.js" ></script>
<script src="../../js/mobileSelect.js"></script>
<script>	
	mui.init();
	var weekdayArr=[];
	var codeFlag='';
	var regionData = [];
	$.ajax({
		type:"get",
		url:apiUrl+"/configration/getstations",
		data:{
			"pageSize":10,
			"pageNum":1
		},
		dataType:"json",
		success:function(data){
			if(data.return_code=="SUCCESS"){
				$.each(data.pageInfo.list, function(index,item) {
					weekdayArr[index] = {"id":item.region,"name":item.name}
				});
			}
			var mobileSelect1 = new MobileSelect({
		    trigger: '#trigger', 
		    title: '单项选择',  
		    wheels: [
		                {data:weekdayArr}
		            ],
		    
		  
		    callback:function(indexArr, data){
		       // console.log($('#trigger1').val(data[0].id));
		        $('#trigger').val(data[0].name)
		        $('#trigger1').val(data[0].id)
		    } 
			});
		}
	});
	function checkPhone(){ 
		var phone = document.getElementById('mobilePhone').value;
		if(!(/^1[34578]\d{9}$/.test(phone))){ 
			alert("手机号码有误，请重填");  
			return false; 
		} 
		return true;
	}
	$('#v_btn').click(function(){//获取验证码
		getcode($(this));
		$.ajax({
			type:"post",
			url:apiUrl+"/common/sms/sendsmscode",
			data:{
				"mobilePhone":$('input[name=mobilePhone]').val(),
				"type":1
			},
			dataType:"json",
			success:function(d){
				if(d.return_code=="SUCCESS"){
					codeFlag=d.data.codeFlag;
					$('#codeFlag').val(codeFlag);
				}else{
					mui.toast("发送验证码失败")
				}
				
			}
		});
	})
	
	function checkPhoneIsExist(){//验证手机是否存在
		 var phone = $("#mobilePhone").val();
		 var flag = false;
		 $.ajax({ 
			url: apiUrl+"/member/checkexist",
			data:{"mobilePhone":$('input[name=mobilePhone]').val()},
			dataType:"json",
			type:"POST",
			async:false,
			success:function(data) {
			var status = data.return_code;
			if(status == "NOT_EXIST"){
			  flag = true;
			}else{
				alert(data.return_msg);
			}
		 }
		});
		return flag;
   }
	$('#signIn_btn').click(function(){//注册
		var s=checkPhone();//phone 格式
		if(s){//true
				var flag=checkPhoneIsExist();//phone not exist	
				if(!$('#mobilePhone').val()){
					mui.toast("手机号不能为空")
				}else if(!$('#verificationCode').val()){
					mui.toast("验证码不能为空")
				}else if(!$('#trigger1').val()){
					mui.toast("地区不能为空")
				}else if(!$('#password').val()){
					mui.toast("密码不能为空")
				}else if($('input[name="password"]').val()!=$('input[name="password_confirm"]').val()){
					mui.toast("两次密码输入不同")
				}else{
					if(flag){
						$.ajax({
							url:apiUrl+"/member/register",
							type:'POST',
							data:{
								'mobilePhone':$('#mobilePhone').val(),
								"verificationCode":$('#verificationCode').val(),
								"region":$('#trigger1').val(),
								'password':md5($('#password').val()),
								'password_confirm':md5($('#password_confirm').val()),
								'codeFlag':$('#codeFlag').val()
							},
							dataType:'json', 
							success:function(data){
								var d=data.return_code;
								if(d=='SUCCESS'){
									window.location.assign("../login-sign/login.jsp");
								}else{
									alert(data.return_msg);
								}
								
							}
						})
					}
				}
				
				
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
					"type":1
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
</html>