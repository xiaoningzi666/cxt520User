<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<title>管理收货地址</title>
<!--标准mui.css-->
<link rel="stylesheet" href="../../css/mui.min.css">
<!--App自定义的css-->
<link rel= "stylesheet" href="../../css/myiconfont.css"/>
<link rel="stylesheet" type="text/css" href="../../css/app.css"/>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
	    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
	    <h1 class="mui-title">管理收货地址</h1>
	    
	</header>
	<nav class="mui-bar mui-bar-tab" style="padding: 0;border: none;">
		<div class="mui-tab-item" style="height: 40px;">
			<a href="shop_address_add.jsp" class="add_adr" id="addAdr_btn">添加新地址</a>
		</div>
	</nav>
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
<script src="../../js/common.js" ></script>
<script>
	var storage = window.localStorage; 
	/*console.log(storage['getUserId'])
	console.log(storage['getSign'])
	console.log(storage['name'])*/
	mui.init({
		swipeBack:true //启用右滑关闭功能
	});
	$.ajax({
		type:"get",
		url:apiUrl+"/member/getaddress",
		data:{
			"userId":storage['getUserId'],
			"sign":storage['getSign'],
			"pageNum":1,
			"pageSize":10
			
		},
		dataType:"json",
		success:function(data){
			var html='';
			var topHtml = '';			
			if(data.return_code=="SUCCESS"){
				if(data.pageInfo.list.length>0){
					
					$.each(data.pageInfo.list,function(index,item){
						var Aadr=item.address.split('}');
						if(item.isDefault==1){
							topHtml='<li class="mui-table-view-cell cell1" id="del_con">'+
								'<input type="hidden" name="adrDetail" value="'+(Aadr[0]+Aadr[1]).substring(1)+'"/>'+
					        	'<p>'+
					        		'<span>'+ item.name+'</span>'+
					        		'<span class="mui-pull-right">'+item.phone+'</span>' +     		
					        	'</p>'+
					        	'<p class="">'+(Aadr[0]+Aadr[1]).substring(1)+'</p>'+         
					            '<div class="manage_item">'+
					            	'<div class="mui-input-row mui-radio mui-checkbox1 mui-left mui-left1">'+
										'<label class="red">默认地址</label>'+
										'<input name="radio1" checked type="radio" value="'+item.id+'" class="adrLeft">'+
									'</div>'+
									'<div class="m_items">'+
										'<input type="hidden" value='+item.id+' class="adrId"/>'+
										
										'<span class="edit_btn"><i class="iconfont icon-bianji2 " style="font-size:15px"></i>&nbsp;编辑</span>'+
										'<span class="del_btn"><i class="iconfont icon-shanchu "></i>&nbsp;删除</span>'+
									'</div>'+
					            '</div>'+
					        '</li>'
							
						}else{
							html+='<li class="mui-table-view-cell cell1" id="del_con">'+
								'<input type="hidden" name="adrDetail" value="'+(Aadr[0]+Aadr[1]).substring(1)+'"/>'+
					        	'<p>'+
					        		'<span>'+ item.name+'</span>'+
					        		'<span class="mui-pull-right">'+item.phone+'</span>' +     		
					        	'</p>'+
					        	'<p class="">'+(Aadr[0]+Aadr[1]).substring(1)+'</p>'+         
					            '<div class="manage_item">'+
					            	'<div class="mui-input-row mui-radio mui-checkbox1 mui-left mui-left1">'+
										'<label>设为默认</label>'+
										'<input name="radio1" type="radio" value="'+item.id+'">'+
									'</div>'+
									'<div class="m_items">'+
										'<input type="hidden" value='+item.id+' class="adrId"/>'+
										'<span class="edit_btn"><i class="iconfont icon-bianji2 " style="font-size:15px"></i>&nbsp;编辑</span>'+
										'<span class="del_btn"><i class="iconfont icon-shanchu "></i>&nbsp;删除</span>'+
									'</div>'+
					            '</div>'+
					        '</li>'

						}
					})						
					
					$('#address_list').html(topHtml+html)
					del_click();
					$('input[name="radio1"]').click(function(){
						if(data.return_code=="SUCCESS"){
								$.ajax({
									type:"POST",
									url:"http://192.168.1.114:8080/v1/member/setdefaultaddress",
									data:{
										"userId":storage['getUserId'],
										"sign":storage['getSign'],
										"id":$(this).parent().find("input").eq(0).val()
									},
									dataType:"json",
									success:function(data){
										if(data.return_code=="SUCCESS"){
											mui.toast("设置默认地址成功")
											setTimeout(function(){
												location.reload();
											},800)
											
										}
									}
								});
							
						}else{
							mui.toast("已经为默认地址")
						}
					})
				}else{
					$('#no_adr').show()	
				}
				
			}else{
				$('#no_adr').show();
			}
			
		}
	});		
	function del_click(){			
		$('.m_items>span').click(function() {
			var btn=$(this).attr('class');
			var p=$(this).parents('li');
			if(btn=="del_btn"){
				$.ajax({
					url:apiUrl+"/member/deleteaddress",
					type:"post",
					data:{
						"userId":storage['getUserId'],
						"sign":storage['getSign'],
						"id":$(this).parent().find("input").eq(0).val()
					},
					dataType:"json",
					success:function(data){
						if(data.return_code=="SUCCESS"){
							mui.toast("删除成功");
							setTimeout(function(){
								location.reload();
							},1000)								
						}
						
					}
				})
			}else{
				window.location.assign("shop_address_edit.jsp?adrId="+$(this).parent().find("input").eq(0).val());
				storage['adrId']=$(this).parent().find("input").eq(0).val();
				storage['consigneName']=p.find('span').eq(0).text();
				storage['consignePhone']=p.find('span').eq(1).text();
				//console.log(p.find('p').eq(0).text())
				storage['consigneAddress']=p.find('input[name=adrDetail]').val();
				//console.log(storage['consigneAddress'])
//				storage['consigneAdrDetail']=$('#textarea').val();
			}
		});
	}
	document.getElementById('addAdr_btn').addEventListener('tap',function(){
		mui.openWindow({
			url:"shop_address_add.jsp",
			id:"shop_address_add"
		})
	})
	
	
</script>
</html>