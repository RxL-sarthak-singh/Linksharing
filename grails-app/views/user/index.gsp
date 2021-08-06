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
    <script>
    var dataurl = "${createLink(controller: 'user', action: 'registerUser')}"

        </script>
</head>


<body>

<h3 style ="background-color:green">${flash.success}</h3>
<h3 style ="background-color:red">${flash.error}</h3>
<div id ="searchbox">
    <a id = "appname" href  = >Link Sharing</a>
    <input type="text" id = "box" placeholder="Search" >

</div>
<div id = "login">
    <div id = "loginheader">Login</div>

    <div id = "loginform">
        <form action = "/user/loginUser" enctype="multipart/form-data">

            <label for = "mailid">Email</label>
            <br>
            <input type="text" name = "email" id = "mailid" placeholder="Enter your Email Id" >
            <br>
            <br>
            <label for = "password">Password</label>
            <br>
            <input type="password" name = "password" id = "password" placeholder="Enter your password" >
            <br>
            <br>
            <input type = "submit" value = "login">
        </form>

        <a href = "www.google.com" id = "frgotpasswrd">Forgot Password</a>
    </div>

</div>
<br>
<br>
<div id = "Recentshareheader">Recent Shares</div>
<div id = "RecentSharesposts">

    <img id = "RecentSharespic" src = "profile.png">

    <span id = "Recentname">sarthak singh</span>
    <br>
    <span id = "Recentusername">Sarthak@123</span>
    <br>
    <div id = "Recentshareot">
        <a href="#"><i class="fa fa-dribbble"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-facebook"></i></a>
    </div>
    <br>
    <a id = "Recenttopicname" href = "www.google.com">Topic name</a>
    <br>
    <br>
    <div id = "Recentpostinfo">
        <p > is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been  it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was</p>
    </div>
    <a  id = "Recentviewpost" href = "www.google.com">View post</a>
</div>
<br>
<br>
<div id = "topshareheader">top posts
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

    <select >
        <option value="volvo">1 day</option>
        <option value="saab">1 week</option>
        <option value="mercedes">1 month</option>
        <option value="audi">1 year</option>
    </select>

</div>


    <div id = "topshares">
<g:each in = "${toppostlist}">
<div class = "topshareposts">


    <asset:image src = "${it.createdBy.photo}" class = "topSharespic" ></asset:image>

    <span class = "topname">${it.topic.name}</span>
    <br>
    <span class = "topusername">${it.createdBy.userName}</span>
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
            <input type="email" name = "email" id = "registermailid" placeholder="Enter your Email Id" >
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
            <input type = "submit" id = "registeruser" value = "Register">
        </form>



    </div>

</div>





</body>


</html>