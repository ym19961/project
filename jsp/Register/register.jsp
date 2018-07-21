<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Register</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        
		<script type="text/javascript" src="<%=path%>/js/jquery-2.2.2.min.js"></script>
        <!-- CSS -->
        <style type="text/css">
        	.register form button[class="btn btn-default dropdown-toggle"]{
        		background:
        	}
        	.weak {background-color: #FF0000 !important;}
			.medium {background-color: #FF9900 !important;}
			.strong {background-color: #33CC00 !important;}
			#pwdpower > span {display: inline-block;width: 70px;height: 30px;line-height: 30px;background: #ddd;text-align: center;margin: 4px 2px;}
			#errinfo{
				color:red;
			}
			#errinfo1{
				color:red;
			}
        </style>
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Oleo+Script:400,700'>
        <link rel="stylesheet" href="<%=path %>/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=path %>/css/registerstyle.css">
        
		<script type="text/javascript">
		$(document).ready(function(){
			var spans = $("#pwdpower > span");
			$("#password").focus(function(){
				var oInput = document.getElementById('password');
		        oInput.value = '';
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
		});
		
		</script>
        
    </head>
    <body>
        <div class="header">
            <div class="container">
                <div class="row">
                    <div class="logo span4">
                        <h1><a href="">Tasty Register <span class="red">.</span></a></h1>
                    </div>
                    <div class="links span8">
                        <a class="home" href="" rel="tooltip" data-placement="bottom" data-original-title="Home"></a>
                        <a class="blog" href="" rel="tooltip" data-placement="bottom" data-original-title="Blog"></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="register-container container">
            <div class="row">
                <!-- <div class="iphone span5">
                    <img src="images/iphone.png" alt="">
                </div> -->
                <div class="register span6">
                    <form action="../Register/addUser" method="post">
                        <h2>REGISTER TO <span class="red"><strong>Tasty</strong></span></h2>
                        <label for="userid">User Id</label>
                       	 <input type="text" id="userid" name="userid" placeholder="choose a userid...">
                        
                        <label for="email">Email</label>
                    	<input type="text" id="email" name="email" placeholder="enter your email...">
                    	
                        
                        <label for="password">Password</label>
                      	 <input type="password" id="password" name="password" placeholder="choose a password...">
                    	<div id="pwdpower"> 
                    	<span>弱</span><span>中</span><span>强</span>
                    	 </div>
						<input id="pwdpowersend" type="hidden" name="pwdpower" value="" />
						
                    	 <label for="repassword">Repeat Password</label>
                    	 <input type="password" id="repassword" name="repassword" placeholder="choose a password...">
                        
                        <label for="username">User Name</label>
                        	<input type="text" id="username" name="username" placeholder="enter your user name...">
                        
                        <label for="phone">Phone</label>
                        <input type="text" id="phone" name="phone" placeholder="enter your phone...">
                                         								                                                
                        <button id="register" type="submit">REGISTER</button>
                    </form>
                </div>
            </div>
        </div>
		<!-- Javascript -->
        <script src="<%=path %>/js/bootstrap.min.js"></script>
        <script src="<%=path %>/js/jquery.backstretch.min.js"></script>
        <script src="<%=path %>/js/scripts.js"></script>
        
    </body>

</html>
