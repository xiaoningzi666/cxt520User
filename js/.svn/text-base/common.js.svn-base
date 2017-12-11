var cityCode = [];
var cityName = [];
var cityLat = '';
var cityLng = '';
var windowH=$(window).height();
var windowW=$(window).width();
var apiUrl='http://dev-api.cxt520.net/v1';
var apiUrlH5='http://dev-h5.cxt520.net/';
var imgUrl='http://dev-img.cxt520.net';
var storage = window.localStorage; 
var nowTime=new Date();
var nowTimeH=nowTime.getHours();
var nowTimeM=nowTime.getMinutes();
var delayTime=0;
function isdot(m){//判断是否数字时候有小数点
	m=(m+'').indexOf('.')!=-1?(m+''):(m+'.00');
	return m
}
function km(n){
	var m='';
	if(n>1000){
		m=(n/1000).toFixed(2);
		return m; 
	}
	else{
		return n;
	}	
}
//获取参数
(function($) {
	$.getUrlParam = function(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if(r != null) return unescape(r[2]);
		return null;
	}
})(jQuery);
//时间转换	
function timeFormat(nS) {
	var timestamp4 = new Date(nS)
	return timestamp4.toLocaleDateString().replace(/\//g, "-") + " " + timestamp4.toTimeString().substr(0, 8);
};

function timeFormat1(nS) {
	var timestamp4 = new Date(nS)
	return timestamp4.toLocaleDateString().replace(/\//g, "-");
};
function timeFormat2(nS) {
	var timestamp4 = new Date(nS)
	return timestamp4.toTimeString().substr(0, 8);
};
//获取验证码
function getcode(thisbtn) {
	var clock = '';
	var nums = 60;
	var btn = thisbtn;
	btn.attr('disabled', true)
	btn.val(nums + '秒后可重新获取');
	clock = setInterval(doLoop, 1000);
	function doLoop() {
		nums--;
		if(nums > 0) {
			btn.val(nums + '秒后可重新获取');
		} else {
			clearInterval(clock); //清除js定时器
			btn.attr('disabled', false)
			btn.val('获取验证码');

			nums = 60; //重置时间
		}
	}
}
function autoScroll(obj){  
	$(obj).find("ul").animate({  
		marginTop : "-30px"  
	},500,function(){  
		$(this).css({marginTop : "0px"}).find("li:first").appendTo(this);  
	})  
}  
var s=setInterval('autoScroll(".news_text")',3000);
function autoScroll1(obj){  
	$(obj).find("ul").animate({  
		marginTop : "-34px"  
	},500,function(){  
		$(this).css({marginTop : "0px"}).find("li:first").appendTo(this);  
	})  
}  
var oil=setInterval('autoScroll("#notice1")',7000);
function commToast(){
	$('.toast').fadeIn()
	setTimeout(function(){
		$('.toast').fadeOut()
	},2000)
}
var $toast=$('<div class="toast" style="display:none">您还没有登录或注册，赶紧去登录或注册吧</div>')
$('body').append($toast)
var $toast1=$('<div class="toast1" style="display:none"></div>')
$('body').append($toast1)
$('.click').click(function(){
		if(storage['getUserId']){
		}else{
			$('.click a').attr('href','javascript:void(0)')
			commToast()
		}
	})
if($.getUrlParam("appclient")==null||$.getUrlParam("appclient")==undefined){
	$('.show').removeClass("hide")
	$('.mui-bar-nav~.Mmui-content').css("padding-top",50)
}
 function configList1(){
 	$.ajax({
		type:"get",
		url:apiUrl + "/configration/getconfigrationitems?keywords=BusinessRules",
		dataType:"json",
		async:false,
		success:function(data){
			if(data.return_code=="SUCCESS"){
				$.each(data.codeItemList, function(f,h) {
					if(h.code.toUpperCase()=="DelayedCreatedConsumeDuration".toUpperCase()){
						delayTime=h.value*60;
					}
					if(h.code.toUpperCase()=="ConsumeValidDuration".toUpperCase()){
						cusumeCodeTime=h.value*60;
					}
				});
				
			}
		}
	});
 }
function clock(delay,Id,text){
	//alert(2)
	var clock='';
	var m=Math.floor(delay/60);
	var s=delay%60;
	clock=setInterval(drop,1000)
   function drop(){
       	delay--;
       	m='0'+Math.floor(delay/60);
       	s=delay%60;
       	if(s<10){
       		s='0'+s;
       	}
       	
       	if(delay>0){
       		$(Id).text(m+"'"+s+'"'+text);
       	}else{
       		clearInterval(clock);
       		$(Id).html('<button type="button" id="createconsumeCode">生成消费码</button>');
       		$('#createconsumeCode').click(function(){
				createconsumeCode()
				//alert(1)
			})
       	}
   }
}
function createconsumeCode(){//生成消费码
	$.ajax({
		type:"post",
		url:apiUrl+"/orders/createconsume",
		data:{
			"userId":storage['getUserId'],
			"sign":storage['getSign'],
			"type":1,
			"x":storage["cityLat"],
			"y":storage["cityLng"],
			"orderId":$('#orderNum').text()
		},
		dataType:"json",
		success:function(data){
			if(data.return_code=="SUCCESS"){
				clock(cusumeCodeTime,'#changeText2',"失效")
				$('#createconsume').html(data.code+'<span id="changeText2"></span>');
				
				
//				setInterval(function(){ 
//					$('#createconsumeTime').text(timeFormat2(data.created))
//				}, 1000);
				
			}else{
				mui.toast(data.return_msg)
			}
		}
	});
}
function configList(config){
 	var codeItemList=null;
 	$.ajax({
		type:"get",
		url:apiUrl + "/configration/getconfigrationitems?keywords="+config,
		dataType:"json",
		async:false,
		success:function(data){
			if(data.return_code=="SUCCESS"){
				codeItemList = data.codeItemList;
			}
		}
	});
	return codeItemList
 }
function checkPhone(){ 
	var phone = document.getElementById('mobilePhone').value;
	if(!(/^1[34578]\d{9}$/.test(phone))){ 
		alert("手机号码有误，请重填");  
		return false; 
	} 
	return true;
}
var vcity={ 11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",
            21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",
            33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",
            42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",
            51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",
            63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"
           };
//校验身份证
function checkCard(card,truename)
{
   // var truename=document.getElementById("yourname").value; 
    var reg = /^[\u4e00-\u9fa5]{2,4}$/i; 
    if (!reg.test(truename)) {
        mui.toast("请输入真实姓名，只能是2-4个汉字！"); 
        //document.getElementById('yourname').focus();
    }
    else{
        //var card = document.getElementById('card_no').value;
        //是否为空
        if(card === '')
        {
            mui.toast('身份证号不能为空');
           // document.getElementById('card_no').focus();
            return false;
        }
        //校验长度，类型，省份
        if(isCardNo(card) === false||checkProvince(card) === false||checkParity(card) === false)
        {
            mui.toast('您输入的身份证号码无效，请重新输入');
           // document.getElementById('card_no').focus();
            return false;
        }
        //校验生日
        if(checkBirthday(card) === false)
        {
            mui.toast('您输入的身份证号码生日无效,请重新输入');
           // document.getElementById('card_no').focus();
            return false;
        }
        return true;
    }
};
//检查号码是否符合规范，包括长度，类型
function isCardNo(card)
{
    //身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
    var reg = /(^\d{15}$)|(^\d{17}(\d|X)$)/;
    if(reg.test(card) === false)
    {
        return false;
    }

    return true;
};

//取身份证前两位,校验省份
function checkProvince(card)
{
    var province = card.substr(0,2);
    if(vcity[province] == undefined)
    {
        return false;
    }
    return true;
};

//检查生日是否正确
function checkBirthday(card)
{
    var len = card.length;
    //身份证15位时，次序为省（3位）市（3位）年（2位）月（2位）日（2位）校验位（3位），皆为数字
    if(len == '15')
    {
        var re_fifteen = /^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/; 
        var arr_data = card.match(re_fifteen);
        var year = arr_data[2];
        var month = arr_data[3];
        var day = arr_data[4];
        var birthday = new Date('19'+year+'/'+month+'/'+day);
        return verifyBirthday('19'+year,month,day,birthday);
    }
    //身份证18位时，次序为省（3位）市（3位）年（4位）月（2位）日（2位）校验位（4位），校验位末尾可能为X
    if(len == '18')
    {
        var re_eighteen = /^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/;
        var arr_data = card.match(re_eighteen);
        var year = arr_data[2];
        var month = arr_data[3];
        var day = arr_data[4];
        var birthday = new Date(year+'/'+month+'/'+day);
        return verifyBirthday(year,month,day,birthday);
    }
    return false;
};

//校验日期
function verifyBirthday(year,month,day,birthday)
{
    var now = new Date();
    var now_year = now.getFullYear();
    //年月日是否合理
    if(birthday.getFullYear() == year && (birthday.getMonth() + 1) == month && birthday.getDate() == day)
    {
        //判断年份的范围（3岁到100岁之间)
        var time = now_year - year;
        if(time >= 3 && time <= 100)
        {
            return true;
        }
        return false;
    }
    return false;
};

//校验位的检测
function checkParity(card)
{
    //15位转18位
    card = changeFivteenToEighteen(card);
    var len = card.length;
    if(len == '18')
    {
        var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2); 
        var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'); 
        var cardTemp = 0, i, valnum; 
        for(i = 0; i < 17; i ++) 
        { 
            cardTemp += card.substr(i, 1) * arrInt[i]; 
        } 
        valnum = arrCh[cardTemp % 11]; 
        if (valnum == card.substr(17, 1)) 
        {
            return true;
        }
        return false;
    }
    return false;
};
changeFivteenToEighteen = function(card)
{
    if(card.length == '15')
    {
        var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2); 
        var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'); 
        var cardTemp = 0, i;   
        card = card.substr(0, 6) + '19' + card.substr(6, card.length - 6);
        for(i = 0; i < 17; i ++) 
        { 
            cardTemp += card.substr(i, 1) * arrInt[i]; 
        } 
        card += arrCh[cardTemp % 11]; 
        return card;
    }
    return card;
};
//时间转换成几个小时之前等的格式
function getDateDiff (dateStr) {
    var publishTime =dateStr/1000,
        d_seconds,d_minutes,d_hours,d_days, d,
        timeNow = parseInt(new Date().getTime()/1000),
        date = new Date(publishTime*1000),
        Y = date.getFullYear(),
        M = date.getMonth() + 1,
        D = date.getDate(),
        H = date.getHours(),
        m = date.getMinutes(),
        s = date.getSeconds();
        //小于10的在前面补0
        if (M < 10) {
            M = '0' + M;
        }
        if (D < 10) {
            D = '0' + D;
        }
        if (H < 10) {
            H = '0' + H;
        }
        if (m < 10) {
            m = '0' + m;
        }
        if (s < 10) {
            s = '0' + s;
        }

    d = timeNow - publishTime;
    d_days = parseInt(d/86400);
    d_hours = parseInt(d/3600);
    d_minutes = parseInt(d/60);
    d_seconds = parseInt(d);
    if(d_days > 0 && d_days < 3){
        return d_days + '天前';
    }else if(d_days <= 0 && d_hours > 0){
        return d_hours + '小时前';
    }else if(d_hours <= 0 && d_minutes > 0){
        return d_minutes + '分钟前';
    }else if (d_seconds < 60) {
        if (d_seconds <= 0) {
            return '刚刚发表';
        }else {
            return d_seconds + '秒前';
        }
    }else if (d_days >= 3 && d_days < 30){
        return M + '-' + D + '&nbsp;' + H + ':' + m;
    }else if (d_days >= 30) {
        return Y + '-' + M + '-' + D;
    }
}