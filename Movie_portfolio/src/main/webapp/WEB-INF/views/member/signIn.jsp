<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/signIn.css">
<script src="/resources/js/signIn.js"></script>
<script src="/resources/axios_js/axios.min.js"></script>
<title>Login</title>
</head>
<body>
	<section>
		<a href="/main" class="logo"><img src="/resources/img/movieIcon.png" class="logo"></a>
        <div class="container">
            <div class="user singinBx">
                <div class="imgBx"><img src="/resources/img/boss.png"></div>
                <div class="formBx">
                    <form action="/member/signInPost" method="post">
                        <h2>Sign In</h2>
                        <input type="text" name="cid" placeholder="UserID">
                        <input type="password" name="cpw" placeholder="UserPassword">
                        <div><input type="submit" value="Login"><span><a href="/member/loginKAKAO"><img src="/resources/img/kakao.png"></a></span></div>
                        <p class="signup">Dont't have an account ? <a href="#" onclick="toggleForm();">Sign Up</a></p>
                    </form>
                </div>
            </div>
            <div class="user singupBx">
                <div class="formBx">
                    <form action="/member/signUpPost" id="frm">
                        <h2>Sign Up</h2>
                        <div><input type="hidden" id="checkId" value="2"></div>
                        <input type="text" name="cid" placeholder="UserID">
                        <input type="button" value="Check" onclick="return chkId()"><span></span><span id="duplicationIdMsg" style="color:red;"></span>
                        <input type="password" name="cpw" placeholder="UserPassword">
                        <input type="password" name="cpwConfirm" placeholder="UserConfirmPassword">
                        <input type="text" name="nm" placeholder="UserName">
                        <input type="email" name="email" placeholder="UserEmail">
                        <input type="submit" value="Join" onclick="return chk()">
                        <p class="signup">Already have an account ? <a href="#" onclick="toggleForm();">Sign In</a></p>
                    </form>
                </div>
                <div class="imgBx"><img src="/resources/img/minion.png" style="background: yellow;"></div>
            </div>
        </div>
    </section>
	
	
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>

