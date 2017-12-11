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
<title>设置</title>
</head>
<body>
	<header class="mui-bar mui-bar-nav pHead">
	    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
	    <h1 class="mui-title">设置</h1>
	</header>
	<div  class="mui-content" id="perMsg">
		<ul class="mui-table-view mui-table-view-chevron" style="margin-top:5px;">
			<li class="mui-table-view-cell cell2" >
				<a href="personal_data.jsp" class="mui-navigate-right headPortrait">我的资料</a>
			</li>
			<li class="mui-table-view-cell cell2" >
				<a href="#about" class=" msg_item">我的爱车
					<i class="mui-pull-right Mupdate"></i>
				</a>
			</li>
		</ul>
		<ul class="mui-table-view mui-table-view-chevron" style="margin-top:5px;">
			<li class="mui-table-view-cell cell2" >
				<a href="account_security.jsp" class="mui-navigate-right headPortrait">账户与安全</a>
			</li>
			<li class="mui-table-view-cell cell2" >
				<a href="../MemberIdenty/memberIdenty_finsh.jsp" class="mui-navigate-right  msg_item">实名认证
					<i class="mui-pull-right Mupdate inlineBlock" id="identy" style="color: red;">
						<img src="../../images/loading.gif" width="15"/>
					</i>
				</a>
			</li>
			<!--<li class="mui-table-view-cell cell2" >
				<a href="#about" class="mui-navigate-right  msg_item">清除缓存
					<i class="mui-pull-right Mupdate">3.77M</i>
				</a>
			</li>-->
		</ul>
		<!--<ul class="mui-table-view mui-table-view-chevron" style="margin-top:5px;">
			<li class="mui-table-view-cell cell2" >
				<a href="#" class="mui-navigate-right">版本检测
					<i class="mui-pull-right Mupdate">1.0.0</i>
				</a>
				
			</li>
		</ul>-->
		
	</div>
	<p class="setoutBtn" id="quitBtn">退出登录</p>
</body>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.min.js"></script>  
<script src="../../js/common.js"></script>
<script>
	mui.init();
	$('#quitBtn').click(function(){
		//storage.clear()
		window.location.assign('../login-sign/login.jsp')
	})
	if(storage["IdentyText"]){
		$('#identy').text(storage["IdentyText"])
	}else{
		$('#identy').text(
		)
	}
	
</script>
</html>