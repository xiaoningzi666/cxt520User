<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<title>添加收货地址</title>
<link rel="stylesheet" href="../../css/mui.min.css">
<link rel="stylesheet" href="../../css/app.css">
<link rel="stylesheet" type="text/css" href="../../css/public.css">
<link rel="stylesheet" type="text/css" href="../../css/mobileSelect.css">
<!--<link href="https://cdn.bootcss.com/animate.css/3.5.2/animate.css" rel="stylesheet">-->	
</head>
<body>
	<header class="mui-bar mui-bar-nav">
	    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
	    <h1 class="mui-title">添加收货地址</h1>
	    <button  id="add_btn" class="mui-pull-right blue" style="border: 0;margin-top: 1rem;">保存</button>
	</header>
	<div class="mui-content">
	    <form id="add_adr" class="white">
	    	<input type="hidden" name="userId" value=""/>
	    	<input type="hidden" name="sign" value="" />
	    	<input type="hidden" name="region" value="" id="bb"/>
	    	<input type="hidden" name="isDefault" value="0" id=""/>
	    	<input type="hidden" name="address" value="" id="textArea"/>
	    	<div class="mui-input-row cell2">
				<label style="width: 24%;">收货人</label>
				<input type="text" name="name" placeholder="收货人姓名" style="width: 76%;">
			</div>			
			<div class="mui-input-row cell2">
				<label style="width: 24%;">联系电话</label>
				<input type="text" name="phone" placeholder="收货人联系电话" style="width: 76%;">
			</div>
			<div class="mui-table-view-cell cell2">
				<p class="mui-navigate-right">
				<label>省、市</label>
				<i class="mui-pull-right update" id="aa" />请选择</i>
				</p>
			</div>
			<div class="mui-input-row" >
				<textarea id="textarea" rows="5" name=""  placeholder="详细地址" style="border:0;"></textarea>
			</div>
			<div style="width: 100%; height: 20px; background: #eee;">
			</div>
			<div class="mui-input-row mui-checkbox">
			  <label>设置为默认地址</label>
			  <input name="" value="" type="checkbox" style="top:10px;" id="isDefault_btn">
			</div>
	    </form>
	   
	</div>
	<script src="../../js/mui.min.js "></script>

<script src="../../js/mobileSelect.js"></script>
<script src="../../js/jquery-1.7.2.min.js" ></script>
<script src="../../js/common.js" ></script>

<script>
	mui.init();
	/*console.log(storage['getUserId'])
	console.log(storage['getSign'])
	console.log(storage['name'])*/
	$('input[name=userId]').val(storage['getUserId']);
	$('input[name=sign]').val(storage['getSign']);
	var proData='';
	var str='';
		$.ajax({
			type:"get",
			url:apiUrl+"/configration/getregions",
			dataType:"json",
			success:function(data){
				if(data.return_code=="SUCCESS"){
					proData= data.provinceList;
					var mobileSelect5 = new MobileSelect({
						    trigger: '#aa',
						    title: '地区选择',
						    wheels: [
						                {data : proData}
						            ],
						   /* transitionEnd:function(indexArr, data){
						        console.log(data);
						    },*/
						    callback:function(indexArr, data){
						    	var str='';
						    	if(data.length==1){
						    		str=data[0].code
						    	}else if(data.length==2){
						    		str=data[1].code;
						    	}else{
						    		str=data[2].code;
						    	}
						    
						        //console.log(str);
						        $('#bb').val(str);
						        storage['consigneAdrCode']= $('#bb').val();
						        
						       
						        if(data.length==2){
						    		str1=data[0].value+' '+data[1].value
						    	}else{
						    		str1=data[0].value+' '+data[1].value+' '+data[2].value;
						    	}
						    	
						    	$('#textArea').val(str1)
						        
						    }         
						})
					}				
				}
		})
		$('#add_btn').click(function(){
			if($('input[name=name]').val()==''){
				mui.toast("请填写收货人")
			}else if($('input[name=phone]').val()==''){
				mui.toast("请填写手机号")
			}else if($('input[name=address]').val()==''){
				mui.toast("请选择地区")
			}else if($('#textarea').val()==''){
				mui.toast("请填写详细地址")
				
			}else{
				var str2=$('#textArea').val()+'} '+$('#textarea').val();
				$('#textArea').val(str2)
				$.ajax({
					type:"post",
					url:apiUrl+"/member/addaddress",
					data:$('#add_adr').serialize(),
					dataType:"json",
					success:function(data){
					var d=data.return_code;
						if(d=='SUCCESS'){
							mui.toast("添加成功");
							setTimeout(function(){					
								window.location.assign("shop_address_manage.jsp");										
							},1000)
							
						}else{
							alert(data.return_msg);
						}
						
					}
				});
			}
			
		})

$('#isDefault_btn').click(function(){
	if($(this).is(':checked')) {
  		$('input[name="isDefault"]').val(1)		
	}else{
		$('input[name="isDefault"]').val(0)
	}		
})

	
	
</script>
</body>


</html>