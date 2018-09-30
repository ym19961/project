
jQuery(document).ready(function() {

    /*
        Background slideshow
    */
    $.backstretch([
      "../images/m1.jpg"
    , "../images/m2.jpg"
    , "../images/m3.jpg"
    ], {duration: 3000, fade: 750});

    /*
        Tooltips
    */
    $('.links a.home').tooltip();
    $('.links a.blog').tooltip();

    /*
        Form validation
    */
    $('.register form').submit(function(){
        $(this).find("label[for='userid']").html('User Id');
        $(this).find("label[for='password']").html('password');
        $(this).find("label[for='repassword']").html('repassword');
        $(this).find("label[for='username']").html('Username');
        $(this).find("label[for='email']").html('Email');
        $(this).find("label[for='phone']").html('phone');
        
		
		
        ////
        var userid = $(this).find('input#userid').val();
        var password = $(this).find('input#password').val();
        var repassword = $(this).find('input#repassword').val();
        var username = $(this).find('input#username').val();
        var email = $(this).find('input#email').val();
        var phone = $(this).find('input#phone').val();
        var pwdpower = '';
        var spans = $("#pwdpower > span");
		
        if(spans[2].className == "strong"){
			pwdpower = "strong";
		}else if(spans[1].className == "medium"){
			pwdpower = "medium";
		}else{
			pwdpower = "weak";
		}
        $("#pwdpowersend").val(pwdpower);
        if(userid == '') {
            $(this).find("label[for='userid']").append("<span style='display:none' class='red'> - Please enter your user ID.</span>");
            $(this).find("label[for='userid'] span").fadeIn('medium');
            return false;
        }
        if(password == '') {
            $(this).find("label[for='password']").append("<span style='display:none' class='red'> - Please enter a valid password.</span>");
            $(this).find("label[for='password'] span").fadeIn('medium');
            return false;
        }
        if(repassword == '' || repassword!=password) {
            $(this).find("label[for='repassword']").append("<span style='display:none' class='red'> - Please enter repassword.</span>");
            $(this).find("label[for='repassword'] span").fadeIn('medium');
            return false;
        }
        if(username == '') {
            $(this).find("label[for='username']").append("<span style='display:none' class='red'> - Please enter a valid username.</span>");
            $(this).find("label[for='username'] span").fadeIn('medium');
            return false;
        }
        if(email == '') {
        	$(this).find("label[for='email']").append("<span style='display:none' class='red'> - Please enter a valid email.</span>");
        	$(this).find("label[for='email'] span").fadeIn('medium');
        	return false;
        }
        if(phone == '') {
        	$(this).find("label[for='phone']").append("<span style='display:none' class='red'> - Please enter a valid phone.</span>");
        	$(this).find("label[for='phone'] span").fadeIn('medium');
        	return false;
        }
        
    });


});


