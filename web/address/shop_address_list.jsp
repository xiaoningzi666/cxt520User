<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<title>选择收货地址</title>
<link rel="stylesheet" href="../../css/mui.min.css">
<link rel= "stylesheet" href="../../css/myiconfont.css"/>
<link rel="stylesheet" type="text/css" href="../../css/app.css"/>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
	    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
	    <h1 class="mui-title">选择收货地址</h1>
	    <a class="mui-pull-right aaa" id="manageBtn">管理</a>
	</header>
	<div class="mui-content">
	    <ul class="mui-table-view mui-table-view-striped mui-table-view-condensed" id="address_list">
	       
	    </ul>
	</div>
	<div id="no_adr" style="margin-top: 80px;display: none;text-align: center;" >
		<span class="iconfont icon-meiyoushouhuodizhi" style="display:block;font-size: 100px;text-align: center;width:100%;color: #aaa;"></span>
		没有相关地址
	</div>
</body>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script src="../../js/common.js"></script>
<script>
mui.init();
var adrArr='';
var adrdetail='';
$.ajax({
	type:"get",
	url:apiUrl+"/member/getaddress",
	data:{
		"userId":storage['getUserId'],
		"sign":storage['getSign'],
		"pageNum":1,
		"pageSize":10,
	},
	dataType:"json",
	success:function(data){
		var html='';
		var topHtml = '';			
		if(data.return_code=="SUCCESS"){
			if(data.pageInfo.list.length>0){
				$.each(data.pageInfo.list,function(index,item){
					adrArr=item.address.substring(1).split('}');
					adrdetail=adrArr[0]+' '+adrArr[1];
					if(item.isDefault==1){
						topHtml='<li class="mui-table-view-cell cell1">'+
									'<input type="hidden" value="'+item.id+'"/>'+
									'<a>'+
							        	'<p class="additem1">'+
							        		'<span>'+ item.name+'</span>'+
							        		'<span class="mui-pull-right">'+item.phone+'</span>' +     		
							        	'</p>'+
							        	'<p class="additem2">'+
							        		'<span class="red">[默认地址]</span><i>'+adrdetail+'</i></p>'+
						            '</a>'
				        		'</li>'
						
					}else{
						html+='<li class="mui-table-view-cell cell1">'+
									'<input type="hidden" value="'+item.id+'"/>'+
									'<a>'+
							        	'<p class="additem1">'+
							        		'<span>'+ item.name+'</span>'+
							        		'<span class="mui-pull-right">'+item.phone+'</span>' +     		
							        	'</p>'+
							        	'<p class="additem2"><i>'+adrdetail+'</i></p>'+ 
							       '</a>'+
				        		'</li>'
					}
				})						
				$('#address_list').html(topHtml+html)
				$('.cell1').click(function(){
					storage['addrname']=$(this).find(".additem1").find("span").eq(0).text();
					storage['addrPhone']=$(this).find(".additem1").find("span").eq(1).text();
					storage['addrId']=$(this).find("input").val();
					storage['addrdetail']=adrdetail;
					window.history.go(-1);
				})
			}else{
				$('#no_adr').show()	
			}
		}else{
			$('#no_adr').show();
		}
	}
});		
</script>
</html>