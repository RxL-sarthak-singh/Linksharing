<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 3/8/21
  Time: 12:29 PM
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Post</title>
    <asset:stylesheet src = "style_about_post.css"></asset:stylesheet>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <asset:javascript src="rating.js"></asset:javascript>
    <asset:javascript src="dashboard_script.js"></asset:javascript>
    <script>
    var rateurl =  "${createLink(controller:'rating',action:'rate')}"

    </script>



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
<div class = "inbox">

    <div class = "inbox_info">

        <img src="profile.png" alt = "">

        <span>${resource.createdBy.firstName}</span>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>${resource.createdBy.userName}</span>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href = "#">${resource.topic.name}</a>


        <br>

        <p id = "example">${resource.description}
        </p>


        <a href="#"><i class="fa fa-dribbble"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-facebook"></i></a>


        <br>
        <br>
        <g:link controller="topic" action = "postDownload" id="${resource.id}"> Download</g:link>
        &nbsp&nbsp&nbsp
        <g:if test = "${resource.class!=linksharingdomain.DocumentResource}">
        <a href = "${resource.url}"> view full site</a>
        &nbsp&nbsp&nbsp
        </g:if>

        <g:link controller = "readItem" action  = "markasread"  id="${resource.id}">Mark as read</g:link>
        &nbsp&nbsp&nbsp
        <span class = "ratepost">
            <span class = "fa fa-star fa-2x " id = "star1" onclick=give1star("${resource.id}",1)></span>
            <span class = "fa fa-star fa-2x " id = "star2" onclick=give2star("${resource.id}",2)></span>
            <span class = "fa fa-star fa-2x " id = "star3" onclick=give3star("${resource.id}",3)></span>
            <span class = "fa fa-star fa-2x " id = "star4" onclick=give4star("${resource.id}",4)></span>
            <span class = "fa fa-star fa-2x " id = "star5" onclick=give5star("${resource.id}",5)></span>


        </span>


    </div>


</div>
<div id = "trendingheader">Trending Topics</div>
<div id = "trending">


    <div class = "trending_info">
        <img src = "profile.png">
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href = "www.google.com">Topic Name</a>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>@sarthak</span>
        <br>
        <br>
        &nbsp&nbsp
        <span>subscription</span>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>Posts</span>
        <br>
        <br>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href ="www.google.com">50</a>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href ="www.google.com">30</a>
        <br><br>
        <a href="www.google.com">unsubscribe</a>
        &nbsp&nbsp&nbsp&nbsp&nbsp
        <select class="seriousnes" name="topics">
            <option value="serious">serious</option>
            <option value="casual">casual</option>
            <option value="not so serious">not so serious</option>
        </select>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <select class="puborprivate1" name="topics">
            <option value="public">public</option>
            <option value="private">private</option>

        </select>
        <br>
        <a href = "#">Edit</a>
        &nbsp&nbsp&nbsp
        <a href = "#">Delete</a>


    </div>
    <div class = "trending_info">
        <img src = "profile.png">
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href = "www.google.com">Topic Name</a>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>@sarthak</span>
        <br>
        <br>
        &nbsp&nbsp
        <span>subscription</span>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>Posts</span>
        <br>
        <br>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href ="www.google.com">50</a>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href ="www.google.com">30</a>
        <br><br>
        <a href="www.google.com">unsubscribe</a>
        &nbsp&nbsp&nbsp&nbsp&nbsp



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


<script src = "rating.js"></script>
</body>
</html>