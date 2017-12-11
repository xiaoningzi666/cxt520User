function utf16to8(str) {
    var out, i, len, c;
    out = "";
    len = str.length;
    for (i = 0; i < len; i++) {
        c = str.charCodeAt(i);
        if ((c >= 0x0001) && (c <= 0x007F)) {
            out += str.charAt(i);
        } else if (c > 0x07FF) {
            out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));
            out += String.fromCharCode(0x80 | ((c >> 6) & 0x3F));
            out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
        } else {
            out += String.fromCharCode(0xC0 | ((c >> 6) & 0x1F));
            out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
        }
    }
    return out;
};
$("#qrCodeDiv").qrcode({
   render: "canvas", // 渲染方式有table方式（IE兼容）和canvas方式
    width: 60, //宽度
    height: 60, //高度
    text:apiUrlH5+"dapp.html?m="+$.getUrlParam("m"), //内容
    typeNumber: -1,//计算模式
    correctLevel: QRErrorCorrectLevel.H,//二维码纠错级别
    background: "#ffffff",//背景颜色
    foreground: "#000000"  //二维码颜色
});
$("#qrCodeDivBig").qrcode({
   render: "canvas", // 渲染方式有table方式（IE兼容）和canvas方式
    width: 180, //宽度
    height: 180, //高度
    text:apiUrlH5+"dapp.html?m="+$.getUrlParam("m"), //内容
    typeNumber: -1,//计算模式
    correctLevel: QRErrorCorrectLevel.H,//二维码纠错级别
    background: "#ffffff",//背景颜色
    foreground: "#000000"  //二维码颜色
});
var margin = ($("#qrCodeDiv").height() - $("#qrCodeIco").height()) / 2; //控制Logo图标的位置
$("#qrCodeIco").css("margin", margin);
var margin1 = (180 - $("#qrCodeIcoBig").height()) / 2;//控制Logo图标的位置
$("#qrCodeIcoBig").css("margin", margin1);
$('#qrCodeDiv').click(function(){
	$(".bigcode").show()
})
$('#qrCodeDivBig').click(function(){
	$(".bigcode").hide()
})