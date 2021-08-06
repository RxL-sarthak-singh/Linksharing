<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <asset:stylesheet src = "Style_Dashboard.css"></asset:stylesheet>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <script src = "dashboard_script.js"></script>
    <asset:javascript src= "dashboard_script.js"></asset:javascript>
</head>
<body>
<div id ="searchbox">
    <a id = "appname" href  = >Link Sharing</a>
    <input type="text" id = "box" placeholder="Search" >
    <button class = "but">Search</button>
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
    <div id = "inboxheader">Inbox</div>
    <div class = "inbox_info">

        <asset:image src="${userdetails.photo}" alt = ""/>

        <span>${userdetails.firstName}</span>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>${userdetails.userName}</span>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href = "#"> Topic name</a>


        <br>

        <p>is simply dummy text of the printing and typesetting industry.
        Lorem Ipsum has been
        it to make a type specimen book.
        It has survived not only five centuries,
        </p>

        <a href="www.google.com"><i class="fa fa-dribbble"></i></a>
        <a href="www.google.com"><i class="fa fa-twitter"></i></a>
        <a href="www.google.com"><i class="fa fa-linkedin"></i></a>
        <a href="www.google.com"><i class="fa fa-facebook"></i></a>

        <br>
        <br>
        <a href = "#"> Download</a>
        &nbsp&nbsp&nbsp
        <a href = "#"> view full site</a>
        &nbsp&nbsp&nbsp

        <a href = "#"> Mark as read</a>
        &nbsp&nbsp&nbsp
        <a href = "#"> view post</a>
        &nbsp&nbsp&nbsp
    </div>

</div>
<div class = "profile">



    <img src=${userdetails.photo} >

    <span id="Username">${session.fullname}</span>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <span>${userdetails.userName}</span>
    <br>
    <br>

    &nbsp&nbsp&nbsp
    <span>Subscription</span>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <span>Posts</span>
    <br>
    <br>
    &nbsp&nbsp&nbsp
    <a href="#">${user_no_subscription}</a >
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <a href="#">${user_no_topics}</a>



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

<div id = "subscriptionheader">Subscription</div>
<div id = "subscription">

    <g:each in = "${usersublist}">
    <div class = "subscription_info">
        <img src = "profile.png">
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href = "www.google.com">${it.topic.name}</a>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>${it.topic.createdBy.userName}</span>
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



    </div>
        <br>
    </g:each>
</div>
<div id = "trendingheader">Trending Topics</div>
<div id = "trending">

    <g:each in = "${topiclist}">

    <div class = "trending_info">
        <img src = "profile.png">
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href = "www.google.com">${it.name}</a>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>${it.createdBy.userName}</span>
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
        <select class ="puborprivate1" name="topics">
            <option value="public">public</option>
            <option value="private">private</option>

        </select>



    </div>
        <br>
    </g:each>
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



</body>
</html>