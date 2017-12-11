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
<body class="white">
<header class="mui-bar mui-bar-nav">
	<h1 class="mui-title">登录</h1>
</header>
<div class="mui-content login_wrap">
	<header>
		<img src="../../images/my_msg/520_logo.png" />
	</header>
	<form class="" id="login" method="post" name="loginform">
		<div class="admin">
			<div class="left">
				<img src="../../images/login/admin.png" />
			</div>
			<div class="right">
				<input type="text" name="userName" id="loginAccout" value="" placeholder="请输入您的手机号" />
			</div>
		</div>
		<div class="password">
			<div class="left">
				<img src="../../images/login/Locked@3x.png" />
			</div>
			<div class="right mui-input-row mui-input-row1">
				<input type="password" name="password" id="loginPwd" class="mui-input-password">
			</div>
			<div style="clear: both;"></div>
		</div>
		<div class="psdCon">
			<div class="Rem_psd">
			<a id="memberBtn">
				<img src="../../images/login/psd_off.png" />
				<input type="checkbox" name="isRemberPwd" id="isRemberPwdId"/>
				记住密码
			</a>
			
			
		</div>
		<a href="seek_psd.jsp" class="mui-pull-right" style="font-size: 0.8rem;">忘记密码？</a>
		</div>
		

	</form>
	<p class="login_btn">
		<a id="login_btn" class="">登录</a>
	</p>
	<p class="sign_item">还没有账号,
		<a href="sign.jsp" class="blue"> 去注册</a>
	</p>
	<p class="loginFoot">登录即代表阅读并同意
		<a href="userNotice.html" class="blue">用户协议</a>及和
		<a href="" class="blue">隐私声明</a>
	</p>

</div>
</body>
<script src="../../js/mui.min.js"></script>
<script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.min.js"></script>  
<script src="../../js/jquery-1.7.2.min.js"></script>
<script src="../../js/common.js"></script>
<script type="text/javascript">
	mui.init();
	 
	$(document).ready(function(){  
	  //读取 localStage 本地存储，填充用户名密码,如果自动登录有值直接跳转；  
	  //相反，跳转到本页面,等待登陆处理  
	    var getname = storage["name"];  
	    var getPwd = (storage["pwd"]);    
	    var getisstroepwd = storage["isstorePwd"];  
	    var getisautologin = storage["isautologin"]; 
	    var getisRemberPwdIdImg=storage['Img'];
	    var U='';
	    var P='';
	    if("yes" == getisstroepwd)  
	    {  
	        if("yes" == getisautologin)  
	        {  
	            if(( ("" != getname) ||(null != getname)) && (("" != getPwd) ||(null != getPwd)))  
	            {  
	                //lacoste  已经保存 登陆信息 直接登陆  
	                $("#loginAccout").val(getname);  
	                $("#loginPwd").val(getPwd);  
	                $('#memberBtn').find('img').attr('src', getisRemberPwdIdImg)
	                window.location="";   
	            } 
	        }  
	        else  
	   		{     
	            $("#loginAccout").val(getname);  
	            $("#loginPwd").val(getPwd);  
	            document.getElementById("isRemberPwdId").checked = true;  
	        }  
	        $('#memberBtn').find('img').attr('src', getisRemberPwdIdImg)
	    }else{
	    	$("#loginAccout").val(getname); 
	    }
	});  
	function loginCheckAjaxFunction()  
	{ 
	    //ajax   登陆验证  
	    var userAccout=$("#loginAccout").val();  
	    var userPassWord=($("#loginPwd").val());  
	  	var isRemberPwdIdImg='../../images/login/psd_on.png'
	    var storage = window.localStorage;  
	   
	    //记住密码  
	    if(document.getElementById("isRemberPwdId").checked)  
	    { 
	        //存储到loaclStage    
	  
	        storage["name"] = userAccout;   
	        storage["pwd"] =  userPassWord;
	        storage['Img']=isRemberPwdIdImg;
	        storage["isstorePwd"] =  "yes";  
	    }  
	    else  
	    {  
	        storage["name"] = userAccout;  
	        storage["isstorePwd"] =  "no";  
	    }  
	   
	    if("" == $("input[name=userName]").val())  
	    {  
	    	alert('输入用户名')
	        document.loginform.userName.focus();  
	        return;  
	        
	    }  
	    if("" == $("input[name=password]").val())  
	    {  
	    	alert('输入密码')
	        document.loginform.password.focus();  
	        return;  
	    }  
	    $.ajax({    
	        url : apiUrl+"/member/login",    
	        type : "post",  
	        data:{
	        	"userName":$('input[name=userName]').val(),
	        	"password":md5($('input[name=password]').val())
	        },
	        dataType:"json",//设置需要返回的数据类型    
	        success:function(data){ 
	        	if(data.return_code== 'SUCCESS') {
					window.location.assign('../index/index.html')
					storage['identStatus']=data.memberInfo.identStatus;
					storage['getUserId']=data.memberInfo.id;
					storage['getSign']=data.memberInfo.sign;
					storage['getPhone']=data.memberInfo.mobilePhone;
					storage['nickName']=data.memberInfo.nickName;
					storage['level']=data.memberInfo.level;
					storage['sex']=data.memberInfo.sex;
					storage['logoUrl']=data.memberInfo.logoUrl;
					storage['isTrial']=data.memberInfo.isTrial;
					
				} else {
					mui.toast(data.return_msg);
				}
	        },  
	        error:function(){  
	               ui.error('登陆失败，请重试',2000);  
	        }//这里不要加","    
	    });    
	}  
	$('#login_btn').click(function() {
		loginCheckAjaxFunction()
		
	})
	$('#memberBtn').click(function() {
		var str = $(this).find('img').attr('src');
		var str1 = '../../images/login/psd_on.png';
		if(str1 == str) {
			$(this).find('img').attr('src', '../../images/login/psd_off.png')
		} else {
			$(this).find('img').attr('src', '../../images/login/psd_on.png')

		}

	})
</script>
	

</html>