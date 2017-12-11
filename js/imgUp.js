$(function(){
	var delParent;
	var defaults = {
		fileType: ["jpg","png","bmp","jpeg"],   // 上传文件的类型
		fileSize: 1024 * 1024 * 10                  // 上传文件的大小 10M
	};
	var data='';
	/*点击图片的文本框*/
	$(".file").change(function(){
		var idFile = $(this).attr("id");
		var file = document.getElementById(idFile);
		var imgContainer = $(this).parents(".z_photo"); //存放图片的父亲元素
		data = new FormData($('#myform')[0]); 
		var fileList = file.files; //获取的图片文件
		data.append('imageArray', fileList[0]);
		console.log(fileList+"======filelist=====");
		var input = $(this).parent();//文本框的父亲元素
		var imgArr = [];
		//遍历得到的图片文件
		var numUp = imgContainer.find(".up-section").length;
		var totalNum = numUp + fileList.length;  //总的数量
		console.log(fileList.length)
		if(fileList.length > 5 || totalNum > 5 ){
			alert("上传图片数目不可以超过5个，请重新选择");  //一次选择上传超过5个 或者是已经上传和这次上传的到的总数也不可以超过5个
		}
		else if(numUp < 5){
			fileList = validateUp(fileList);//验证图片是否符合要求
			for(var i = 0;i<fileList.length;i++){
			 var imgUrl = window.URL.createObjectURL(fileList[i]);
			     imgArr.push(imgUrl);
			 var $section = $("<section class='up-section fl loading'>");
			     imgContainer.prepend($section);
			 var $span = $("<span class='up-span'>");
			     $span.appendTo($section);
		     var $img0 = $("<img class='close-upimg'>").on("click",function(event){
				    event.preventDefault();
					event.stopPropagation();
					$(".works-mask").show();
					delParent = $(this).parent();
				});   
				$img0.attr("src","../../images/uploadImg/a7.png").appendTo($section);
		     var $img = $("<img class='up-img up-opcity'>");
		         $img.attr("src",imgArr[i]);
		         $img.appendTo($section);
		     var $p = $("<p class='img-name-p'>");
		         $p.html(fileList[i].name).appendTo($section);
		     var $input = $("<input id='' name='' value='' type='hidden'>");
		         $input.appendTo($section);
		     var $input2 = $("<input id='tags' name='' value='' type='hidden'/>");
		         $input2.appendTo($section);
		      
		   }
		}
		setTimeout(function(){
             $(".up-section").removeClass("loading");
		 	 $(".up-img").removeClass("up-opcity");
		 },10);
		// numUp = imgContainer.find(".up-section").length;
//		if(numUp >= 5){
//			$(this).parent().hide();
//		}
		//input内容清空
		$(this).val('');
		//console.log(imgFile)
	});
	$('#userId').val(storage['getUserId']);
	$('#sign').val(storage['getSign'])
	$('#region').val(storage['region'])
	$('#release').click(function(){
		$.ajax({  
            url: apiUrl+'/community/createarticle',  
            type: 'POST',  
            data: data,  
            dataType: 'JSON',  
            cache: false,  
            processData: false,  
            contentType: false ,
            success:function(data){
            	if(data.return_code=="SUCCESS"){
            		//window.location.assign('community_list.jsp?para=post')
            	}
            }
        }) 
		
	});
    $(".z_photo").delegate(".close-upimg","click",function(){
     	  $(".works-mask").show();
     	  delParent = $(this).parent();
	});
	$(".wsdel-ok").click(function(){
		$(".works-mask").hide();
		var numUp = delParent.siblings().length;
		if(numUp < 6){
			delParent.parent().find(".z_file").show();
		}
		 delParent.remove();
		
	});
	
	$(".wsdel-no").click(function(){
		$(".works-mask").hide();
	});
		
	function validateUp(files){
		var arrFiles = [];//替换的文件数组
		for(var i = 0, file; file = files[i]; i++){
			//获取文件上传的后缀名,如果把空字符串 ("") 用作 separator，那么 stringObject 中的每个字符之间都会被分割。
			var newStr = file.name.split("").reverse().join("");
			if(newStr.split(".")[0] != null){
				var type = newStr.split(".")[0].split("").reverse().join("");
				console.log(type+"===type===");
				//inArray1.2新增，
				//jQuery.inArray( value, array [, fromIndex ])函数的返回值为Number类型，返回指定值在数组中的索引。
				//如果没有找到，则返回 -1。
				//value用于查找的值，arry指定被查找的数组,fromIndex	可选/Number类型指定从数组的指定索引位置开始查找，默认为 0。
				if(jQuery.inArray(type, defaults.fileType) > -1){
					// 类型符合，可以上传
					if (file.size >= defaults.fileSize) {
						alert(file.size);
						alert('您这个"'+ file.name +'"文件大小过大');	
					} else {
						// 在这里需要判断当前所有文件中
						arrFiles.push(file);	
					}
				}else{
					alert('您这个"'+ file.name +'"上传类型不符合');	
				}
			}else{
					alert('您这个"'+ file.name +'"没有类型, 无法识别');	
				}
		}
		return arrFiles;
	}
	
	

})
