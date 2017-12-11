	var html='';
	var s1=0,s2=0
	$.ajax({
		type:"get",
		url:apiUrl+"/member/getmemberinfo",
		data:{
			"userId":storage['getUserId'],
			"sign":storage['getSign']
		},
		dataType:"json",
		success:function(data){
			if(storage["name"]==undefined||storage["name"]==""||storage["name"]==null){
				html+='<ul class="mui-table-view">'+
					'<li class="mui-table-view-cell mui-media" style="padding-right: 1rem;">'+
						'<div class="w">'+
							'<img class="mui-media-object mui-pull-left head-img"  src="../../images/inite.png">'+
							'<div class="mui-media-body">'+
								'<p class="item1 item2">'+
								'<button type="button" id="login">登录</button>'+
								'<button type="button" id="sign">注册</button></p>'+
							'</div>'+
							'<div class="jifen integral" id="integral">'+
								'<a>'+
									'积分<span>0</span><span class="iconfont icon-jiantou-copy"></span>'+
								'</a>'+
							'</div>'+
						'</div>'+
					'</li>'+
				'</ul>';
			}else{
				html+='<ul class="mui-table-view">'+
				'<li class="mui-table-view-cell mui-media" style="padding-right: 1rem;">'+
					'<div class="w" style="margin:25px 0">'+
						'<a href="personal_data.jsp" class="mui-pull-left head-img">'+
						'<img class="mui-media-object  "  src="';
							if(data.member.logoUrl){
								html+=data.member.logoUrl;
							}else{
								html+='../../images/inite.png';
							}
						html+='"></a>'+
						'<div class="mui-media-body" style="margin-left: 5rem; padding-top: 5px">'+
							'<p class="item1"><span>'+storage['nickName']+'</span>';
							if(data.member.level==undefined||data.member.level==""||data.member.level==null){
								mui.toast('服务器出错')
							}else{
								html+='<img src="../../images/VIP_experience/v'+data.member.level+'.png" class="levelImg"/>';
								$.each(configList("memberIdentStatus"), function(i,j) {
									if(j.value==data.member.identStatus){
										if(data.member.identStatus==1&&!data.member.expired){
											html+='<a class="approve">'+j.title+'</a></p>'+
											'<a href="openVIP.jsp" class="upgrade">升级VIP'+
											'<span class="mui-icon mui-icon-arrowright" style="color:#FBF623">'+
											'</span></a>';
										}else{
											html+='<a href="../MemberIdenty/memberIdenty.jsp" class="approve">'+j.title+'</a>'+
											'</p>';
										}
										storage["IdentyText"]=j.title
									}
								});
							}
							if(data.member.expired){
								storage["expired"]=data.member.expired;
								storage["expiredDate"]=timeFormat1(data.member.expired);
								html+='<p class="mui-ellipsis"><span>'+timeFormat1(data.member.expired)+'到期</span>'+
								'<a href="openVIP.jsp"><span style="">续期</span></a></p>';
							}
						html+='</div>'+
						'<div class="jifen  integral">'+
							'<a href="integralList.html">'+
							'积分<span id="integralNum"></span><span class="iconfont icon-jiantou-copy"></span>'+
							'</a>'+
						'</div>'+
					'</div>'+
				'</li>'+
			'</ul>'			
			}
			$('#head_wrap').append(html)
			$('#login').click(function(){
				window.location.assign('../login-sign/login.jsp')
			})
			$('#sign').click(function(){
				window.location.assign('../login-sign/sign.jsp')
			})
			$.ajax({
				type:"get",
				url:apiUrl+"/member/getsocre",
				data:{
					"userId":storage['getUserId'],
					"sign":storage['getSign']
				},
				dataType:"json",
				success:function(d){
					if(d.return_code=="SUCCESS"){
						$('#integralNum').text(d.data.balance);
					}else{
						d.return_msg;
					}
				}
			});
			$('#integral').click(function(){
				if(storage['getUserId']){
					window.location.assign('integralList.html')
				}else{
					$('.click a').attr('href','javascript:void(0)')
					$('.toast').fadeIn()
					setTimeout(function(){
						$('.toast').fadeOut()
					},2000)
				}
			})
		}
	});
	//$('#d1').append('<span class="mui-badge" >'+n+'</span>')
if(storage['getUserId']){
	
	function num(status){
		var totalNum = 0;
		$.ajax({
			type:"get",
			url:apiUrl+"/orders/getorderscount",
			async:false,
			data:{
				"userId":storage['getUserId'],
				"sign":storage['getSign'],
				"status":status
				
			},
			dataType:"json",
			success:function(data){
					totalNum =  data.total
			}
		});	
		return totalNum;
	}
	if(num(0)!=0){
		$('#d1').append('<span class="mui-badge" >'+num(0)+'</span>')
	}
	if(num(2)!=0){
		$('#d2').append('<span class="mui-badge" >'+num(2)+'</span>')
	}
	if(num(3)!=0){
		$('#d3').append('<span class="mui-badge" >'+num(3)+'</span>')
	}
	if(num(4)!=0){
		$('#d4').append('<span class="mui-badge" >'+num(4)+'</span>')
	}
	
}
$('#phone').text(storage['getPhone'])
$('.d').click(function(){
		window.location.assign('order_list.html?status='+$(this).attr("data-id"))
})


		
