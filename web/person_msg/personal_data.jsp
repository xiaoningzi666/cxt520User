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
<title>个人资料</title>
</head>
<body>
	<header class="mui-bar mui-bar-nav pHead">
	    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
	    <h1 class="mui-title">个人资料</h1>
	    <button class="mui-pull-right btnNoStyle" id="editBtn">编辑</button>
	    <button class="mui-pull-right btnNoStyle" id="saveBtn" style="display: none;">保存</button>
	</header>
	<div  class="mui-content" id="perMsg">
		<div class="loading">
			<img src="../../images/shop_detail/reload.gif" />
		</div>
	</div>
</body>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>

<script src="../../js/common.js"></script>
<script>
	mui.init();
	var storage = window.localStorage; 
	$.ajax({
		type:"get",
		url:apiUrl+"/member/getmemberinfo",
		data:{
			"userId":storage['getUserId'],
			"sign":storage['getSign']
		},
		dataType:"json",
		success:function(data){
			if(data.return_code=="SUCCESS"){
					var html='';
					html+='<ul class="mui-table-view mui-table-view-chevron" style="margin-top:5px;">'+
					'<li class="mui-table-view-cell cell2" >'+
						'<a class="headPortrait" style="position:relative;">头像';
							if(data.member.logoUrl){
								html+='<img src="'+data.member.logoUrl+'" class="mui-pull-right "/>';
							}else{
								html+='<img src="../../images/index/shopDetail/shopDetail_person@3x.png" class="mui-pull-right "/>';
							}
					html+='</a>'+
					'</li>'+
					'<li class="mui-table-view-cell cell2 ">'+
						'<a href="#about" class=" msg_item " id="nickName">昵称'+
							'<i class="mui-pull-right Mupdate" >'+data.member.nickName+'</i>'+
						'</a>'+
					'</li>'+
					'<li class="mui-table-view-cell cell2">'+
						'<a href="#about" class=" msg_item">性别';
							if(data.member.sex==1){
								html+='<i class="mui-pull-right Mupdate">男</i></a>';
							}else{
								html+='<i class="mui-pull-right Mupdate">女</i></a>';
							}
				html+='</li>'+
				'</ul>'+
				'<ul class="mui-table-view mui-table-view-chevron" style="margin-top:5px;">'+
					
					'<li class="mui-table-view-cell cell2">'+
						'<a href="#about" class="msg_item">会员等级';
							if(data.member.level==1){
								html+='<i class="mui-pull-right Mupdate">普通会员</i></a>';
							}else{
								html+='<i class="mui-pull-right Mupdate" style="color:red">VIP会员</i></a>';
							}
							
					html+='</li>'+
					'<li class="mui-table-view-cell cell2">'+
						'<a href="openVIP.jsp" class="mui-navigate-right  msg_item">有效期至';
						if(data.member.expired==null){
							html+='<a href="openVIP.jsp"><i class="mui-pull-right red Mupdate " >不是VIP会员，请升级VIP</i></a>';
						}else{
							html+='<i class="mui-pull-right Mupdate">'+timeFormat1(data.member.expired)+'</i>';
						}
							
					html+='</a></li>'+
					'<li class="mui-table-view-cell cell2">'+
						'<a href="#about" class=" msg_item">推荐人<i class="mui-pull-right Mupdate">'+ data.member.refereeName+'</i></a>'+
					'</li>'+
				'</ul>'+
				'<ul class="mui-table-view mui-table-view-chevron" style="margin-top:5px;">'+
					'<li class="mui-table-view-cell cell2">'+
						'<a href="#about" class=" msg_item">客户经理<i class="mui-pull-right Mupdate">'+ data.member.refereeName+'</i></a>'+
					'</li>'+
				'</ul>';
				$('#perMsg').html(html);
				var d=new FormData();
				d.append('userId',storage['getUserId']);
				d.append('sign',storage['getSign']);
				$('#editBtn').click(function(){
					$('#nickName').append('<input type="text" value="'+data.member.nickName+'" id="nickNameInput" class="mui-input-clear"/>');
					$('.headPortrait').append(
						'<input type="file" name=""  value="" id="PortraitInput" class=""/>'
					)
					$('.headPortrait').addClass('mui-navigate-right');
					$('#nickName i').remove();
					$('#saveBtn').show()
					$(this).hide()
					$('#PortraitInput').change(function(){
						var f=this.files[0];
						var fr=new FileReader();
						fr.readAsDataURL(f);
						fr.onload=function(e){
							$('.headPortrait img').attr("src",e.target.result);
						}
						d.append('logoImage',f);
					})
						
				})
				$('#saveBtn').click(function(){
					d.append('nickName',$('#nickNameInput').val());
					$.ajax({
							type:"post",
							url:apiUrl+"/member/updatemember",
							data:d,
							dataType:"json",
							cache: false,  
				            processData: false,  //不处理发送的数据，因为data值是Formdata对象，不需要对数据做处理
				            contentType: false  ,//不设置Content-type请求头
							success:function(data){
									if(data.return_code=="SUCCESS"){
										$('.headPortrait').removeClass('mui-navigate-right');
										$('#PortraitInput').remove()
										//window.location.assign('setup.jsp');
										storage['nickName']=data.nickName;
										$('#nickName').append('<i class="mui-pull-right Mupdate" >'+data.nickName+'</i>');
										$('#nickName input').remove();
										$('#saveBtn').hide();
										$('#editBtn').show();
										location.reload();
									}
							}
							
						});
					
				})
				storage['level']=data.member.level;
				
			}else{
				alert(data.return_msg)
			}
				
		}
	});

	

	
	

	
</script>
</html>