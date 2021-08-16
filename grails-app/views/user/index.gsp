<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 22/7/21
  Time: 2:21 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <asset:stylesheet src= "style_landing.css"></asset:stylesheet>
    <title>User Login</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <asset:javascript src="registerscript.js"></asset:javascript>
    <asset:javascript src="changepassword.js"></asset:javascript>
    <script>
    var dataurl = "${createLink(controller: 'user', action: 'registerUser')}"

        </script>
</head>


<body>

<h3 style ="color:lightgreen">${flash.success}</h3>
<h3 style ="color:lightcoral">${flash.error}</h3>
<div id ="searchbox">
    <a id = "appname" style="font-weight: bold" href  = >Link Sharing</a>


</div>









<div id = "login">
    <div id = "loginheader">Login</div>

    <div id = "loginform">
        <form action = "/user/loginUser" method="POST">

            <label for = "mailid">Email</label>
            <br>
            <input type="text" name = "email" id = "mailid" placeholder="Enter your Email Id" required>
            <br>
            <br>
            <label for = "password">Password</label>
            <br>
            <input type="password" name = "password" id = "password" placeholder="Enter your password" required>
            <br>
            <br>
            <input type = "submit" value = "login">
        </form>

        <g:link controller="forgotpassword" action="index">Forgot Password</g:link>

    </div>

</div>
<br>
<br>
<div id = "Recentshareheader"  style="border: 1px solid black">Recent Shares</div>
    <div id ="Recentshare"style="border: 1px solid black;height:346px; width: 302px">
        <g:each in = "${linksharingdomain.Resource.list([max:0,sort:"dateCreated",order:"desc"])}">

        <div class = "RecentSharesposts">

            <asset:image src="${it.createdBy.photo}" class = "RecentSharespic"></asset:image>

    <span class = "Recentname" style="font-weight: bold;color:rebeccapurple;font-size: 22px">${it.topic.name}</span>
    <br>
    <span class = "Recentusername"style="font-weight: bold;color:rebeccapurple;font-size: 22px">${it.createdBy.userName}</span>
    <br>
    <div class = "Recentshareot">
        <a href="#"><i class="fa fa-dribbble"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-facebook"></i></a>
    </div>
    <br>
    <a class = "Recenttopicname" href = "www.google.com">${it.topic.name}</a>
    <br>
    <br>
    <div class = "Recentpostinfo">
        <p >${it.description} </p>
    </div>
    <a  class = "Recentviewpost" href = "www.google.com">View post</a>
</div>
        </g:each>
    </div>
<br>
<br>

<div id = "topshareheader" style="border: 1px solid black">top posts</div>


    <div id = "topshares" style="border: 1px solid black;height:346px;width: 302px" >
<g:each in = "${toppostlist}">
<div class = "topshareposts">


    <asset:image src = "${it.createdBy.photo}" class = "topSharespic" ></asset:image>

    <span class = "topname" style="font-weight: bold;color:rebeccapurple;font-size: 22px">${it.topic.name}</span>
    <br>
    <span class = "topusername"style="font-weight: bold;color:rebeccapurple;font-size: 22px">${it.createdBy.userName}</span>
    <br>
    <div id = "topshareot">
        <a href="#"><i class="fa fa-dribbble"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-facebook"></i></a>
    </div>
    <br>
    <a class = "toptopicname" href = "www.google.com">${it.topic.name}</a>
    <br>
    <br>
    <div class = "toppostinfo">
        <p >${it.description}</p>
    </div>
    <a  class = "topviewpost" href = "www.google.com">View post</a>
    <br>
    <br>
</div>

</g:each>
</div>
<div class = "boundary">
<div id = "Register">

    <div id = "registerheader">Register</div>

    <div id = "registerform">

        <form action = "/user/registerUser" method = "POST" enctype="multipart/form-data">

            <label for = "firstname">First name</label>
            <br>
            <input type="text" name = "firstName" id = "firstname" placeholder="Enter your first name" required >
            <br>
            <br>
            <label for = "secondname">Second name</label>
            <br>
            <input type="text" name = "lastName"  id = "secondname" placeholder="Enter your second name" >
            <br>
            <br>
            <label for = "registermailid">Email</label>
            <br>
            <input type="email" name = "email" id = "registermailid" placeholder="Enter your Email Id" required>
            <br>
            <br>
            <label for = "username">Username</label>
            <br>
            <input type="text" name ="userName" id = "username" placeholder="Enter your Username" required>
            <br>
            <br>
            <label for = "registerpassword">Password</label>
            <br>
            <input type="password" name ="password" id = "registerpassword" placeholder="Enter your password" required>
            <br>
            <br>
            <label for = "confirmpassword">confirm Password</label>
            <br>
            <input type="password" name ="confirmpassword" id = "confirmpassword" placeholder="Confirm your password" required>
            <br>
            <br>
            <label for = "userphoto">User Photo</label>
            <br>
            <input type = "file"  name = "image"  id = "userphoto">
            <br>
            <br>
            <label for = "security">Enter your childhood best friend's name?</label>
            <br>
            <input type = "text" name = "security" id = "security">
            <br>
            <br>
            <input type = "submit" id = "registeruser" value = "Register">
        </form>



    </div>

</div>

</div>





</body>


</html>