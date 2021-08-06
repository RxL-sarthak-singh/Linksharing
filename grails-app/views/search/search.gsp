<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 5/8/21
  Time: 5:02 PM
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search</title>
    <asset:stylesheet src = "style_search.css"></asset:stylesheet>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

<div class = "searchpost">
    <div id = "searchpostheader">Search for "test"</div>
    <g:each in = "${matchingresources}">
    <div class = "searchpost_info">

       <asset:image src="${it.createdBy.photo}"></asset:image>

        <span>${it.createdBy.firstName}</span>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>${it.createdBy.userName}</span>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href = "#"> ${it.topic.name}</a>


        <br>

        <p>${it.description}
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
    </g:each>

</div>

<div class = "searchtoppost">
    <div id = "searchtoppostheader">Top Posts</div>
    <div class = "searchtoppost_info">

        <img src="profile.png" alt = "">

        <span>Sarthak</span>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>sarthak@123</span>
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
<div id = "trending">
    <div id = "trendingheader">Trending Topics</div>

    <div id = "trending_info">
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
        <select id="seriousnes" name="topics">
            <option value="serious">serious</option>
            <option value="casual">casual</option>
            <option value="not so serious">not so serious</option>
        </select>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <select id="puborprivate1" name="topics">
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