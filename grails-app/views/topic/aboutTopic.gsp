<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 2/8/21
  Time: 1:25 PM
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <asset:stylesheet src = "topic_style.css"></asset:stylesheet>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>
<body>
<div id ="searchbox">
    <a id = "appname" href  = >Link Sharing</a>
    <input type="text" id = "box" placeholder="Search" >
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
            <a href="#">Logout</a>
        </div>
    </div>
</div>
<div id = "Topic">
    <div id = "Topicheader">Topic</div>

    <div id = "Topic_info">
        <img src = "profile.png">
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href = "www.google.com">${topic.name}</a>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>${topic.createdBy.userName}</span>
        <br>
        <br>
        &nbsp&nbsp
        <span>subscription</span>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>Posts</span>
        <br>
        <br>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href ="www.google.com">${linksharingdomain.Subscription.countByTopic(topic)}</a>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href ="www.google.com">30</a>
        <br><br>
        <a href="www.google.com">unsubscribe</a>

        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <select id="seriousness" name="topics">
            <option value="serious">serious</option>
            <option value="casual">casual</option>
            <option value="not so serious">not so serious</option>
        </select>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <i class='fas fa-envelope' style='font-size:24px'></i>




    </div>
</div>
<div id = "Profileheader">Users</div>

    <div id = "topicUserSection">
<g:each in = "${sublist}">
<div class = "profile">



    <img src="profile.png" alt = "">

    <span id="Username">${it.firstName}</span>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <span>${it.firstName}</span>
    <br>
    <br>

    &nbsp&nbsp&nbsp
    <span>Subscription</span>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <span>Posts</span>
    <br>
    <br>
    &nbsp&nbsp&nbsp
    <a href="#">${linksharingdomain.Subscription.countBySubscriber(it)}</a >
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <a href="#">30</a>


</div>
        <br>
</g:each>
    </div>

<div class = "posts">
    <div id = "postsheader">Posts</div>
    <g:each in ="${resourcelist}">
    <div class = "posts_info">

        <img src="profile.png" alt = "">

        <span>${it.createdBy.firstName}</span>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>${it.createdBy.userName}</span>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href = "#">${it.topic.name}</a>


        <br>

        <p>${it.description}</p>

        <a href="#"><i class="fa fa-dribbble"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-facebook"></i></a>


        <br>
        <br>

        <g:if test = "${it.class==linksharingdomain.DocumentResource}">
        <g:link controller="topic" action = "postDownload" id="${it.id}"> Download</g:link>

        &nbsp&nbsp&nbsp
            <g:link controller = "readItem" action  = "markasread"  id="${it.id}">Mark as read</g:link>
        &nbsp&nbsp&nbsp
            <g:link controller="topic"  action="aboutpost" id = "${it.id}" >view post</g:link>

        &nbsp&nbsp&nbsp
        </g:if>
        <g:else>
            <a href = "${it.url}"> view full site</a>
            &nbsp&nbsp&nbsp

            <g:link controller = "readItem" action  = "markasread"  id="${it.id}">Mark as read</g:link>
            &nbsp&nbsp&nbsp
            <g:link controller="topic"  action="aboutpost" id = "${it.id}" >view post</g:link>
            &nbsp&nbsp&nbsp
        </g:else>
    </div>

    </g:each>

</div>



</body>
</html>