<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<title>论坛列表</title>
<link rel="stylesheet" href="../../css/mui.min.css"/>
<link rel="stylesheet" href="../../css/app.css"/>
<link rel="stylesheet" href="../../css/myiconfont.css"/>
</head>
<body >
<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 class="mui-title">精选热帖</h1>
</header>
<div class="mui-content">
	<div class="commumity_fist" id="featuredPost">
		<div class="commPost_top">
			<div class="loading">
				<img src="../../images/shop_detail/reload.gif" />
			</div>
		</div>
	</div>

</div>
</body>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script src="../../js/common.js" ></script>
<script>
mui.init();	
postHtml()
function postHtml(){
	$.ajax({
	url:apiUrl+"/community/getarticles",
	type:"get",
	data:{
	  	"region":410100,
		"pageSize":10,
		"pageNum":1,
		"isHot":1
	},
	dataType:"json",
	success:function(d){			
		if(d.return_code=="SUCCESS"){
			var html='';
			$.each(d.pageInfo.list,function(i,j){
				html+='<div class="mui-row commumity_item">'+
						'<div class="mui-col-xs-8">'+
							'<a href="community_detail.jsp?id='+ j.id+'" class="mui-row">'+
							'<strong>'+j.title+'</strong></a>'+
							'<div class="commFoot_items">'+
								'<span><i class="iconfont icon-faxian"></i>'+j.clickAmount+'</span>'+
								'<span><i class="iconfont icon-pinglun"></i>'+j.replyAmount+'</span>'+
								'<span><i class="iconfont icon-dianzan"></i>'+j.goodAmount+'</span>'+
							'</div>'+
						'</div>'+
						'<div class="mui-col-xs-4">'+
							'<a href="community_detail.jsp?id='+ j.id+'" style="display:inline-block;">'+
							'<img class="" src="'+j.imageList[0].url+'" width="100%" height="75">'+
							'</a>'+
						'</div>'+
							
					'</div>'
			})
			$('#featuredPost').html(html);
				
		}
	}
})
}
</script>
</html>