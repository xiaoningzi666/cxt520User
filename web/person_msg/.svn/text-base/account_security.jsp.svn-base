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
<link rel="stylesheet" href="../../css/myiconfont.css" />
<link rel="stylesheet" href="../../css/app.css" />
<title>账户安全</title>
</head>
<body>
	<header class="mui-bar mui-bar-nav pHead">
	    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
	    <h1 class="mui-title">账户安全</h1>
	</header>
	<div  class="mui-content" id="perMsg">
		<ul class="mui-table-view mui-table-view-chevron" style="margin-top:5px;">
			<li class="mui-table-view-cell cell2" >
				<a href="modify_mobilePhone.jsp" class="mui-navigate-right headPortrait">修改手机号
				<i class="mui-pull-right Mupdate" id="mobilePhone"></i></a>
			</li>
			<li class="mui-table-view-cell cell2" >
				<a href="../person_msg/ModifyPassword.jsp" class="mui-navigate-right msg_item">修改登录密码
				</a>
			</li>
			<!--<li class="mui-table-view-cell cell2" >
				<a href="#about" class="mui-navigate-right msg_item">社交号绑定
					<i class="mui-pull-right Mupdate"></i>
				</a>
			</li>-->
		</ul>
		
	</div>
</body>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>

<script src="../../js/common.js"></script>
<script>
	mui.init();
	var storage = window.localStorage; 
	//console.log(storage['getUserId'])
	console.log(storage['getPhone'])
	$('#mobilePhone').text(storage['getPhone'])
	
</script>
</html>