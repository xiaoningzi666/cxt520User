<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link href="../../css/mui.min.css" rel="stylesheet" />
<link rel="stylesheet" href="../../css/app.css" />
<link rel="stylesheet" href="../../css/myiconfont.css"/>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
	    <a href="index.html" class=" mui-icon mui-icon-left-nav mui-pull-left"></a>
	    <h1 class="mui-title">消息通知</h1>
	    <button type="button" class="mui-pull-right editBtn" id="msg_edit">编辑</button>
	</header>
	<div class="mui-content msg_con">
	    <ul class="Msg_lists" id="msg-lists">
	    </ul>
	    <div class="no_msg" style="display: none;">
	    	<img src="../../images/no_msg.png" width="100%"/>
	    </div>
	    <a id="backup">
	    	
	    </a>
	    <div class="msg_detail" style="">
	    	<!--<div class="msg_text">
	    		<p class="msg_item1"></p>
	    		<div class="msg_item2">
	    			<p><strong></strong></p>
	    		</div>
	    	</div>-->
	    	<span class="iconfont icon-guanbi close"></span>
	    </div>
	    <div class="msg_mask"></div>
	    <div class="delMsg_btn">删除
	    	(<span>0</span>)
	    </div>
	</div>
	<div id="load"></div>
</body>
<script src="../../js/mui.min.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script src="../../js/common.js" ></script>
<script>
	mui.init();
	function timeFormat(nS) { 
	var timestamp4=new Date(nS)
	  return timestamp4.toLocaleDateString().replace(/\//g, "-");     
	};
	document.getElementById('msg_edit').onclick=function(){
		var str=document.getElementById('msg_edit').innerText;
		if(str=="编辑"){
			$('.Msg_lists li').css('marginLeft','4rem');
			document.getElementById('msg_edit').innerText="完成";
			$('.delMsg_btn').show();
		}else{
			$('.Msg_lists li').css('marginLeft','0');
			document.getElementById('msg_edit').innerText="编辑";
			$('.delMsg_btn').hide();
		}
		
	}
	$.ajax({
		type:"get",
		url:apiUrl+"/common/message/getnotices",
		data:{
			"userId":storage['getUserId'],
			"sign":storage['getSign'],
			"pageNum":1,
			"pageSize":10
		},
		dataType:"json",
		beforeSend:function(XMLHttpRequest){
				$('#load').html(
					'加载中...'
				);
			},
		success:function(data){
			var html='';
			$.each(data.pageInfo.list, function(index,item) {
				if(item.status==1){
					html+='<li class="Msg_item" style="background-position:0 -37px">';
				}else{
					html+='<li class="Msg_item" >';
				}
    				html+='<div class="mui-input-row mui-checkbox mui-checkbox1 mui-left" id="delMsg">'+
							'<label style="text-indent: -999px;">选择</label>'+
							'<input name="delBox" value="'+item.id+'" type="checkbox" class="msgChecked">'+
						'</div>';
    				
    				html+='<a href="#">';
    					html+='<article class="mui-ellipsis">'+item.text+'</article>'+
    						  '<i class="">'+timeFormat(item.created)+'</i>';
		    		html+='</a>';
    				html+='<input type="hidden" value="'+item.status+'" class="input_item1"/>';
    				html+='<input type="hidden" value="'+item.id+'" class="input_item2"/>';
    			html+='</li>';
    			
			});
			$('#msg-lists').html(html)
			$('#msg-lists li a').click(function(){
				var t1=$(this).parent().find('.input_item1').val();
				var t2=$(this).parent().find('.input_item2').val();
				var s = $(this).parent();
				if(t1==1){
				}else{
					$.ajax({
						type:"post",
						url:apiUrl+"/common/message/setreadnotices",
						data:{
							"userId":storage['getUserId'],
							"sign":storage['getSign'],
							"noticeArray[]":t2
						},
						dataType:"json",
						success:function(data){
							s.css('background-position','0 -37px');
						}
						
					});	
				}
				$('.msg_detail').html(
					'<div class="msg_text">'+
			    		/*'<p class="msg_item1">'+data.pageInfo. +'</p>'+
			    		'<div class="msg_item2">'+
			    			'<p><strong>'+ +'</strong></p>'+
								+
		
			    		'</div>'+*/
			    			$(this).parent().find('.mui-ellipsis').html()+
			    	'</div>'+
			    	
			    	'<span class="iconfont icon-guanbi close"></span>'
				)

				$('.msg_detail').fadeIn();
				$('.msg_mask').fadeIn();
			})
			$('.msg_detail').click(function(){
				$('.msg_mask').fadeOut()
				$('.msg_detail').fadeOut()
			})
			
			$('input[name=delBox]').click(function(){
				var a = 0;
				$('input[name="delBox"]').each(function(i,item){
					if(item.checked){
						a=a+1;
					}
				})
				$(".delMsg_btn>span").html(a);
			})
			
		},
		complete:function(XMLHttpRequest){
				$('#load').hide()
			},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			
			$('.msg_con').html(
				'<div class="" style="width: 9rem; text-align: center;margin:120px auto;" >'+
				
					'<p style="text-align: center;">网络出错啦，请重新刷新</p>'+
				'</div>'
		).css('background','rgba(255, 255, 255, 0)')
			
		}
	});
	$(function(){
		$(window).bind('scroll',function(){
			var len=$(this).scrollTop();
			if(len>100){
				$('#backup').fadeIn();
			}else{
				$('#backup').hide();
			}
		});
		$('#backup').click(function(){
			$('body,html').animate({scrollTop:0}, 200);
		})
	})

$('.delMsg_btn').click(function(){
	var a = document.getElementsByName("delBox");
	var ck = []; 
	for (var i =0;i<a.length;i++) {
		if(a[i].checked){
			ck.push(a[i].value);
		}
	}
	$.ajax({
		type:"post",
		url:apiUrl+"/common/message/deletenotices",
		data:{
			"userId":storage['getUserId'],
			"sign":storage['getSign'],
			"noticeArray":ck
		},
		dataType:"json",
		success:function(data){
			if(data.return_code=="SUCCESS"){
				mui.toast('删除成功')
				setTimeout(function(){
					location.reload();
				},500)
			}
			
		}
	
	});	
})
</script>
</html>