mui.init();	
var type=2;
//-----------------顶部导航start-----------------------
clickA("#btn1","../person_msg/integralList.html")
clickA("#btn2","jfexchange_record.jsp")
clickA("#btn3","IntegralStrategy.html")
function clickA(btn,url){
	$(btn).click(function(){
		if(storage['getUserId']){
			window.location.assign(url)
		}else{
			$('.toast').show();
			setTimeout(function(){
				$('.toast').hide();
			},2000)
		}
	})
}
$('#js_list1').html(getgoodses(2));
$('#js_list2').html(getgoodses(1));

function getgoodses(type){
	var html='';
	$.ajax({
		type:"get",
		url:apiUrl+"/mall/getgoodses",
		async:false,
		data:{
			"userId":storage['getUserId'],
			"sign":storage['getSign'],
			"region":storage['region'],
			"limitArea":type,
			"pageSize":6,
			"pageNum":1
		},
		dataType:"json",
		success:function(data){
			if(data.return_code=="SUCCESS"){
				var C=(type==2)?C="vipH":C="newH";
				$('#js_list'+type).addClass("white")
				html+='<div class='+C+'>'+
						'<img src="../../images/jifen_shop/VIP_Hicon'+type+'.png"/>'+
						'<a href="more_list.html?type='+type+'" class="mui-pull-right">更多'+
							'<img src="../../images/jifen_shop/more_icon'+type+'.png"/>'+
						'</a>'+
					'</div>';
				$.each(data.pageInfo.list, function(index,item) {
				html+='<div class="mui-col-xs-6 jf_list">'+
						'<a href="jfshop_ProDetaill.jsp?id='+item.id + '&region=410100">';
						if(item.limitArea==2){
							html+=
							'<img src="../../images/jifen_shop/VIP_icon5.png" class="mark"/>';
						}
						html+='<p class="jf_item mui-pull-left">'+
						    	'<i class="mui-ellipsis">'+item.title+'</i>'+
						    	'<span>'+item.exchangePrice+'</span>'+
						    '</p>';
						    if(item.imageUrl){
						    	html+='<img src="'+ item.imageUrl+'" class="mui-pull-right">';
						    }else{
						    	html+=
						    	'<img src="../../images/girl2.png" class="mui-pull-right">';
						    }
					html+='</a>'+
					  ' </div>'
				});
				if(data.pageInfo.total==0){
					html='<img src="../../images/blank.png" />'
				}
			}else{
				mui.toast(data.reurn_msg)
			}
		}
	});
	return html;
}

if(storage['getUserId']){
	$.ajax({
		type:"get",
		url:apiUrl+"/member/getsocre",
		data:{
			"userId":storage['getUserId'],
			"sign":storage['getSign'],
		},
		dataType:"json",
		success:function(d){
			if(d.return_code=="SUCCESS"){
				$('#score').text(d.data.balance)
				storage['score']=d.data.balance
			}else{
				mui.toast(d.return_msg)
			}
		}
	})
}else{
	$('#score').text(0)
}
