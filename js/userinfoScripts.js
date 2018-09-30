/**
 * scripts for userinfo.jsp
 */
$(document).ready(function(){
	$("#pwd-errinfo1").hide();
	$("#pwd-errinfo2").hide();
	$("#address-errinfo1").hide();
	$("#address-errinfo2").hide();
	$("#address-errinfo3").hide(); 
	
	
	$('#target').distpicker({
		  province: '---- 所在省 ----',
		  city: '---- 所在市 ----',
		  district: '---- 所在区 ----'
		});
	$("#updatename").click(function(){
		var userid = $("#userid").val();
		var newusername = $("#newusername").val();
		$.post("../User/updatename",{userid:userid,newusername:newusername},function(data){
				location.reload();
		});
	});
	$("#updatephone").click(function(){
		var userid = $("#userid").val();
		var newphone = $("#newphone").val();
		$.post("../User/updatephone",{userid:userid,newphone:newphone},function(data){
			location.reload();
		});
	});
	$("#updatepassword").click(function(){
		var oldpassword = $("#oldpassword").val();
		var newpassword = $("#newpassword").val();
		var repassword = $("#repassword").val();
		var userid=$("#userid").val();
		var pwdpower = '';
        var spans = $("#pwdpower > span");
		
        if(spans[2].className == "strong"){
			pwdpower = "strong";
		}else if(spans[1].className == "medium"){
			pwdpower = "medium";
		}else{
			pwdpower = "weak";
		}
		if(oldpassword!=$("#password").val()){
			$("#pwd-errinfo2").show();	
			return false;
		}else{
			$("#pwd-errinfo2").hide();	
		}
		if(newpassword!=repassword){
			$("#pwd-errinfo1").show();
			return false;
		}else{
			$("#pwd-errinfo1").hide();
			$.post("../User/updatepassword",{newpassword:newpassword,userid:userid,pwdpower:pwdpower},function(data){
				location.reload();
			});
		}
	});
	$("#newpassword").focus(function(){
		var oInput = document.getElementById('newpassword');
        //oInput.value = '';
        var spans = $("#pwdpower > span");

        oInput.onkeyup = function(){
            //强度状态设为默认
            spans[0].className = spans[1].className = spans[2].className = "default";
            var pwd = this.value;
            var result = 0;
            for(var i = 0, len = pwd.length; i < len; ++i){
                result |= charType(pwd.charCodeAt(i));
            }
            var level = 0;
            //对result进行四次循环，计算其level
            for(var i = 0; i <= 4; i++){
                if(result & 1){
                    level ++;
                }
                //右移一位
                result = result >>> 1;
            }
            if(pwd.length >= 6){
                switch (level) {
                    case 1:
                        spans[0].className = "weak";
                        break;
                    case 2:
                        spans[0].className = "medium";
                        spans[1].className = "medium";
                        break;
                    case 3:
                    case 4:
                        spans[0].className = "strong";
                        spans[1].className = "strong";
                        spans[2].className = "strong";
                        break;
                }
            }
        }
	    /*
	        定义一个函数，对给定的数分为四类(判断密码类型)，返回十进制1，2，4，8
	        数字 0001 -->1  48~57
	        小写字母 0010 -->2  97~122
	        大写字母 0100 -->4  65~90
	        特殊 1000 --> 8 其它
	    */
	    function charType(num){
	        if(num >= 48 && num <= 57){
	            return 1;
	        }
	        if (num >= 97 && num <= 122) {
	            return 2;
	        }
	        if (num >= 65 && num <= 90) {
	            return 4;
	        }
	        return 8;
	    }
	});
	$("#updateAddress").click(function(){
		var province = $("#province").val();
		var city = $("#city").val();
		var district = $("#district").val();
		var detail = $("#detail").val();
		var userid = $("#userid").val();
		if(province==''){
			$("#address-errinfo1").show();
			return false;
		}else{
			$("#address-errinfo1").hide();
		}
		if(city==''){
			$("#address-errinfo2").show();
			return false;
		}else{
			$("#address-errinfo2").hide();
		}
		
		if(detail==''){
			$("#address-errinfo3").show();
			return false;
		}else{
			$("#address-errinfo3").hide();
		}
		$.post("../User/updateAddress",{userid:userid,province:province,city:city,district:district,detail:detail},function(){
			location.reload();
		});
	});
	$("#updatepicture").click(function(){
		var userid = $("#userid").val();
		var newpicture = $("#preview").attr("src");
		$.post("../User/updatepicture",{userid:userid,newpicture:newpicture},function(){
			location.reload();
		});
		$("#picture-change").modal("hide");
	});
});

function imgPreview(fileDom){
    //判断是否支持FileReader
    if (window.FileReader) {
        var reader = new FileReader();
    } else {
        alert("您的设备不支持图片预览功能，如需该功能请升级您的设备！");
        return;
    }
    //获取文件
    var file = fileDom.files[0];
    var imageType = /^image\//;
    var imgMaxSize = 500 * 1024;
    //是否是图片
    if (!imageType.test(file.type)) {
        alert("请选择图片！");
        return;
    }
    else if(file.size > imgMaxSize){
    	alert("图片过大，请重新选择！");
    	return;
    }else{
    	//读取完成  在模态框中显示图片
	    reader.onload = function(e) {
	    	//获取图片dom
	        var img = document.getElementById("preview");
	        //图片路径设置为读取的图片
	        img.src = e.target.result;
	        $("#imageinfo").val(preview.src);
	        $("#picture-change").modal("show");
	    };
	     reader.readAsDataURL(file); //预览图片
    }
}

