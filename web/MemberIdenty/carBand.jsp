<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<title>选择品牌</title>
<link href="../../css/car.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--显示点击的是哪一个字母-->
<div id="showLetter" class="showLetter"><span>A</span></div>
<!--索引查询-->
<div class="loadCon">
	<img src="../../images/loading.gif" />
</div>
<div class="letter">
    <ul id="firstLetter">
    	
    </ul>
 </div>
<!--城市列表-->
<div class="container">
  <div class="city">
  </div>
</div>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script type="text/javascript" src="../../js/zepto.js"></script>
<script type="text/javascript" src="../../js/car.js"></script>
<script type="text/javascript" src="../../js/common.js" ></script>
<script>
	$.ajax({
		type:"get",
		url:apiUrl+"/configration/getcarbrands",
		data:{
			"pageSize":100,
			"pageNum":1
		},
		dataType:"json",
		success:function(data){
			var html='';
			var arr=[];
			var A=[];
			var htmlLetter='';
			if(data.return_code=="SUCCESS"){
				var first_l = '';
				var second_l = '';
				$.each(data.carBrandList, function(index,item) {
					second_l = item.firstLetter;
					html+='<div class="city-list">';
						html+='<input type="hidden" value="'+item.id+'"/>';
						if(second_l!=first_l){
							first_l = second_l;									
							html+='<span class="city-letter" id="'+item.firstLetter +'1">'+item.firstLetter+'</span>';
							htmlLetter+='<li><a href="javascript:;">'+item.firstLetter+'</a></li>';
						}
				      			html+='<p><a class="carSerice"><img src="'+item.logo+'" width="25"/>'+item.name+'</a></p>'+
				   			'</div>'
				   	
				});
				$('.city').html(html)
				$('#firstLetter').html(htmlLetter)
				$('.carSerice').click(function(){
					$(this).attr('href','carSeries.jsp?id='+$(this).parents('.city-list').find('input').val())
					 storage['carSeriesName']=$(this).text();
				})
			}
		},
		complete:function(xhr){
			$('.loadCon').hide()
		}
		
	});
</script>
</body>
</html>

