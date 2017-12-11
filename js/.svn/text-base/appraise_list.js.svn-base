var pageNum=1;
var pages=0;
getmerchantevaluatelist(1)

function getmerchantevaluatelist(pageNum){
	$.ajax({
		type:"get",
		url:apiUrl+"/orders/getmerchantevaluatelist",
		data:{
			"userId":storage['getUserId'],
			"sign":storage['getSign'],
			"merchantId":$.getUrlParam("id"),
			"appclient":($.getUrlParam('appclient')?$.getUrlParam('appclient'):''),
			"pageSize":10,
			"pageNum":pageNum
		},
		dataType:"json",
		success:function(data){
			var html='';
			if(data.return_code=="SUCCESS"){
				pages=data.pageInfo.pages;
				$('.loading').hide()
				html+=$('#commentListwrap').html()+html;
				$.each(data.pageInfo.list, function(index,item) {
					if(item.creatorType==1){
						html+='<div class="mui-card-header mui-card-media Mymedia">'+
						'<img src="'+item.logoUrl+'" />'+
						'<div class="mui-media-body a">'+
							'<span class="name">'+item.nickName.replace(/^(.).*(.)$/,"$1***$2")+'</span>';
								html+='<img src="../../images/VIP_experience/v'+item.level+'.png"/>'+
										'<p class="shop_item1" id="rating" style="margin-left:5px">';
								for(var i=0;i<5;i++){
									var score=item.value/2;
									var sInt=Math.floor(score);
									var dif=score-sInt;
									if(i<sInt){
										html+='<span class="rating-item" style="background-position:0 0"></span>';
									}else if(i==sInt){
										if(dif>0){
											html+='<span class="rating-item" style="background-position:0 -13px"></span>';
										}
									}else{
										html+='<span class="rating-item"></span>';
									}
								}
						html+='</p>'+
							'<span class="T mui-pull-right" style="color:#888;font-size:0.8rem" >'+
							timeFormat1(item.created)+'</span>'+
						'</div>'+
						'<div style="clear:both"></div>'+
						'<div class="mui-card-content Ap_content">'+
						'<div class="apprise_mark">';
						$.each(item.orderList, function(i,j) {
							html+='<span>'+j.mechServiceName+'</span>';
						});
				html+='</div>'+
						'<p class="apprise_text">'+item.content+'</p>'+
					'</div>'+
					'</div>';
					}
				});
			}
			$('#commentListwrap').html(html)
			if(pages<=pageNum){
				$('.more').text("没有更多了")
			}else{
				$('.more').text("查看更多")
				$('.more').show()
			}
		}
	});	
}
$('.more').click(function(){
	if(pages>pageNum){
		$('.more').text("查看更多")
		$('.more').show()
		pageNum++;
		getmerchantevaluatelist(pageNum);
	}else{
		$('.more').text("没有更多了")
		$('.more').unbind()
	}
})