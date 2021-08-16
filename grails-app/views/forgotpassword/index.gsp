<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <asset:stylesheet src = "forgotpasswordstyle.css"></asset:stylesheet>
</head>
<body>
<h3 style ="color:lawngreen">${flash.success}</h3>
<h3 style ="color:lightcoral">${flash.error}</h3>
<div id = "forgotpassword">
    <div id = "forgotpasswordheader">Forgot Password</div>

    <div id = "forgotpasswordform">
        <form action = "/forgotpassword/changepassword" >
            <label for = "emailid">Email</label>
            <br>
            <input type="text" name = "email" id = "emailid" placeholder="Enter your mail id" >
            <br>
            <br>
            <label for = "newpassword">New Password</label>
            <br>
            <input type="password" name = "newpassword" id = "newpassword" placeholder="Enter your new password" >
            <br>
            <br>
            <label for = "cp">confirm Password</label>
            <br>
            <input type="password" name = "confirmpassword" id = "cp" placeholder="Enter your new password" >
            <br>
            <br>
            <label for = "sq">Enter your childhood best friend's name?</label>
            <br>
            <input type = "text" name = "security" id = "sq">
            <br>
            <br>
            <input type = "submit" value = "change password">
        </form>



    </div>

</div>

</body>
</html>