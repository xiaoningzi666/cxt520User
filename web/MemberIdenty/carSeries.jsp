<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<title>选择车系</title>
<link href="../../css/car.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
  <div class="city">
  	<div class="loadCon">
			<img src="../../images/loading.gif" />
		</div>
  </div>
</div>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script type="text/javascript" src="../../js/zepto.js"></script>
<script type="text/javascript" src="../../js/car.js"></script>
<script type="text/javascript" src="../../js/common.js" ></script>
<script>
	var storage = window.localStorage;
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
			if(data.return_code=="SUCCESS"){
				var carSericeId=$.getUrlParam('id');
				$.each(data.carBrandList, function(index,item) {
					if(carSericeId==item.id){
						html+='<p class="carSeriesNameHead">'+storage['carSeriesName']+
							'<span style="float:right" class="confirmbtn">确认</span>'+
						'</p>';
						$.each(item.carModel, function(i,j) {
							html+='<div class="city-list">';
				   	 		html+='<p>';
				   	 						if(i==0){
				   	 							html+='<a class="carListItem selectedCar">'+
				   	 							'<input type="hidden" value="'+j.id+'"/>'+
				   	 							j.name+'</a>';
				   	 						}
				   	 						html+='<a class="carListItem">'+
				   	 							'<input type="hidden" value="'+j.id+'"/>'+
				   	 							j.name+'</a>'+
				   	 						'</p>'+
				   					'</div>'
						});
					}
				   	
				});
				$('.city').html(html)
				$('.carListItem').click(function(){
					$('.carListItem').removeClass('selectedCar')
					$(this).addClass('selectedCar')
					
				})
				$('.confirmbtn').click(function(){
					if($('.carListItem').hasClass('selectedCar')){
						storage['carItemName']=$('.selectedCar').text();
						storage['carModel']=$('.selectedCar').find('input').val();
						window.history.go(-2)//回到上一个页面
					}
				})
				
			}
		}
		
	});
</script>
</body>
</html>

