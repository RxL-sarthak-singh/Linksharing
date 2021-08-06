<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 30/7/21
  Time: 1:52 PM
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <asset:stylesheet src = "styleEditProfile.css"></asset:stylesheet>
    <script src = "dashboard_script.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Title</title>
</head>
<body>
<div id ="searchbox">
    <a id = "appname" href  = >Link Sharing</a>
    <input type="text" id = "box" placeholder="Search" >
    <span onclick="openInvite()" id = "showinvitation">
        <i class='fa fa-envelope' style='font-size:24px'></i>
    </span>
    <span onclick="openCtopic()" id = "showcreatetopic">
        <i class='fa fa-comment' style='font-size:24px'></i>
    </span>
    <span onclick="openForm()" id = "showlinkbox">
        <i class="fa fa-link" style="font-size:24px" ></i>
    </span>
    <span onclick="openDoc()" id = "showdocbox">
        <i class="fa fa-file" style="font-size:24px" ></i>
    </span>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <i class='fas fa-user-alt' style='font-size:24px'></i>
    <div class="dropdown">
        <button class="dropbtn">Sarthak@123</button>
        <div class="dropdown-content">
            <a href="#">Profile</a>
            <a href="#">Posts</a>
            <a href="#">Topics</a>
            <a href="#">Users</a>
            <a href="#">Logout</a>
        </div>
    </div>



</div>
<div id = "sharelinkform">
    <div id = "sharelinkheader">Share Link</div>
    <form action = "" id = linkform>

        <label for = "Link">Link</label>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <input type="text" id = "Link" placeholder="Enter link you want to share" >
        <br>
        <br>
        <label for = "linkdescription">Description</label>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <textarea  id = "linkdescription" placeholder="Enter link description" ></textarea>
        <br>
        <br>
        <label for = "selectlinktopic">Select a Topic</label>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <select id ="selectlinktopic" name="topics">
            <option value="Topic1">Topic1</option>
            <option value="Topic2">Topic2</option>
            <option value="Topic3">Topic3</option>
            <option value="Topic4">Topic4</option>
        </select>
    </form>
    <button class="form-button" >Submit</button>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <button class="form-button" onclick="closeForm()">close</button>


</div>
<div id = "sharedocform">
    <div id = "sharedocheader">Share Document</div>
    <form action = "" id = docform>

        <label for = "Doc">Document</label>
        <br>
        <br>
        <input type="file" id = "Doc" placeholder="Insert document you want to share" >
        <br>
        <br>
        <label for = "Docdescription">Description</label>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <textarea  id = "Docdescription" placeholder="Enter Document description" ></textarea>
        <br>
        <br>
        <label for = "selectdoctopic">Select a Topic</label>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <select id="selectdoctopic" name="topics">
            <option value="Topic1">Topic1</option>
            <option value="Topic2">Topic2</option>
            <option value="Topic3">Topic3</option>
            <option value="Topic4">Topic4</option>
        </select>
    </form>
    <button class="form-button" >Submit</button>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <button class="form-button" onclick="closeDoc()">close</button>


</div>

<div id = "createtopic">
    <div id = "createtopicheader">Create Topic</div>
    <form action = "" id = createtopicform>

        <label for = "topicname">Topic Name</label>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <input type="text" id = "topicname" placeholder="Enter topic name" >
        <br>
        <br>
        <label for = "selectvisibility">Visibility</label>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <select id="selectvisibility" name="topics">
            <option value="Private">Private</option>
            <option value="Public">public</option>
        </select>
    </form>
    <button class="form-button" >Submit</button>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <button class="form-button" onclick="closeCtopic()">close</button>


</div>
<div id = "sendinvitation">
    <div id = "sendinvitationheader">Send Invitation</div>
    <form action = "" id = sendinvitationform>

        <label for = "email">Email</label>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <input type="text" id = "email" placeholder="Enter Email" >
        <br>
        <br>
        <label for = "topicinvite">Visibility</label>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <select id="topicinvite" name="topics">
            <option value="topic">topic</option>
            <option value="topic 1">topic 1</option>
        </select>
    </form>
    <button class="form-button" >invite</button>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <button class="form-button" onclick="closeInvite()">close</button>


</div>


<div id = "editprofile">
    <div id = "editprofileheader">Edit Profile</div>

    <div id = "editprofileform">
        <form action = "/user/editProfile">

            <label for = "fname">First Name</label>
            <br>
            <input type="text" name  = "firstName" value = "${session.user.firstName}" id = "fname" placeholder="Enter your First Name" >
            <br>
            <br>
            <label for = "Sname">Second Name</label>
            <br>
            <input type="text" name  = "secondName"  value = "${session.user.lastName}"  id = "Sname" placeholder="Enter your Second Name" >
            <br>
            <br>
            <label for = "Uname">User Name</label>
            <br>
            <input type="text" name  = "userName" value = "${session.user.userName}"  id = "Uname" placeholder="Enter your User Name" >
            <br>
            <br>
            <label for = "userphoto">User Photo</label>
            <br>
            <input type = "file" name = "photo" value id = "userphoto">
            <br>
            <br>
            <input type = "submit" value = "Update">
        </form>


    </div>

</div>



<div id = "changepassword">
    <div id = "changepasswordheader">Register</div>

    <div id = "changepasswordform">
        <form action = "/user/updatePassword">

            <label for = "New Password">New Password</label>
            <br>
            <input type="text" name = "password" id = "New Password" >
            <br>
            <br>
            <label for = "cpassword">Confirm Password</label>
            <br>
            <input type="text" name = "confirmPassword" id = "cpassword">
            <br>
            <br>
            <input type = "submit" value = "Update">
            <span style = "background-color:lightgreen">${flash.update}</span>
            <span style = "background-color:red">${flash.updateerror}</span>
        </form>



    </div>

</div>

<div class = "profile">



    <img src="profile.png" alt = "">

    <span id="Username">${session.user.firstName+" "+session.user.lastName} </span>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <span>${session.user.userName}</span>
    <br>
    <br>

    &nbsp&nbsp&nbsp
    <span>Subscription</span>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <span>Posts</span>
    <br>
    <br>
    &nbsp&nbsp&nbsp
    <a href="#">50</a >
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <a href="#">30</a>



</div>
<div id = "Topicsheader">Topics &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" id = "topic" placeholder="Search" ></div>
<div id = "Topics">


    <div id = "Topics_info">
        <img src = "profile.png">
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href = "www.google.com">Topic Name</a>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>@sarthak</span>
        <br>

        &nbsp&nbsp
        <span>subscription</span>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>Posts</span>
        <br>

        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href ="www.google.com">50</a>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href ="www.google.com">30</a>
        <br>

        &nbsp&nbsp&nbsp&nbsp&nbsp
        <select id="seriousness" name="topics">
            <option value="serious">serious</option>
            <option value="casual">casual</option>
            <option value="not so serious">not so serious</option>
        </select>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <select id="puborprivate" name="topics">
            <option value="public">public</option>
            <option value="private">private</option>

        </select>
        <br>
        <br>
        <i class='fa fa-envelope' style='font-size:24px'></i>
        &nbsp&nbsp
        <i class="fa fa-file" style="font-size:24px" ></i>
        &nbsp&nbsp
        <i class="fa fa-trash" style="font-size:24px" ></i>



    </div>
</div>

</body>
</html>