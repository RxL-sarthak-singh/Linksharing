<%@ page import="linksharingdomain.TopicController" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <asset:stylesheet src = "Style_Dashboard.css"></asset:stylesheet>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src = "dashboard_script.js"></script>
    <asset:javascript src= "dashboard_script.js"></asset:javascript>
    <asset:javascript src = "registerscript.js"></asset:javascript>
    <asset:javascript src="markasread.js"></asset:javascript>
    <script>
        var dataurl = "${createLink(controller: 'topic', action: 'createTopic')}"
        var markread = "${createLink(controller: 'readItem', action: 'markasread')}"
        var addlinkurl = "${createLink(controller:'topic',action:'addLink')}"
        var adddocfile = "${createLink(controller:'topic',action:'addDocument')}"
        var searchurl =  "${createLink(controller:'search',action:'searchpost')}"
</script>
</head>
<body>

<div id ="searchbox">
    <a id = "appname" href  = >Link Sharing</a>

    <form class = "searchform" action = "/search/searchpost">
        <input type="text" name = "searchtext" id = "box" placeholder="Search" >
        <button class = "but">Search</button>
    </form>

    <span onclick="openInvite()" id = "showinvitation">
        <i class='fa fa-envelope' style='font-size:24px'></i>
    </span>
    <span onclick="openCtopic()" id = "showcreatetopic">
        <i class='fa fa-comment' style='font-size:24px'></i>
    </span>
    <span onclick="openForm()" id = "showlinkbox">
        <i class='fa fa-link' style='font-size:24px'></i>
    </span>
    <span onclick="openDoc()" id = "showdocbox">
        <i class='fa fa-file' style='font-size:24px'></i>
    </span>

    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <i class='fas fa-user-alt' style='font-size:24px'></i>
    <div class="dropdown">
        <button class="dropbtn">${userdetails.userName}</button>
        <div class="dropdown-content">
            <g:link controller="user" action = "getProfile" id="${session.user.id}">Profile</g:link>
            <a href="#">Posts</a>
            <a href="#">Topics</a>
            <a href="#">Users</a>
            <g:link controller="user" action = "logout">logout</g:link>
        </div>
    </div>



</div>
<div class = "inbox">
    <div id = "inboxheader">Inbox</div>
    <g:each in = "${unreadResource}">
    <div class = "inbox_info">

        <asset:image src="${userdetails.photo}" alt = ""/>

        <span>${userdetails.firstName}</span>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>${userdetails.userName}</span>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href = "#">${it.topic.name}</a>


        <br>

        <p>${it.description}
        </p>

        <a href="www.google.com"><i class="fa fa-dribbble"></i></a>
        <a href="www.google.com"><i class="fa fa-twitter"></i></a>
        <a href="www.google.com"><i class="fa fa-linkedin"></i></a>
        <a href="www.google.com"><i class="fa fa-facebook"></i></a>

        <br>
        <br>
        <g:if test = "${it.class==linksharingdomain.DocumentResource}">
        <g:link controller="topic" action = "postDownload" id="${it.id}"> Download</g:link>
        &nbsp&nbsp&nbsp

            <button class = "mar" onclick = markasread("${it.id}")>Mark as read</button>        &nbsp&nbsp&nbsp
        <g:link controller="topic"  action="aboutpost" id = "${it.id}" >view post</g:link>
        &nbsp&nbsp&nbsp
        </g:if>
        <g:else>
            <a href = ${it.url}> view full site</a>
            &nbsp&nbsp&nbsp
            <button class = "mar"  onclick = markasread("${it.id}")>Mark as read</button>
            %{--<g:link controller = "readItem" action  = "markasread"  id="${it.id}">Mark as read</g:link>--}%
            &nbsp&nbsp&nbsp
            <g:link controller="topic"  action="aboutpost" id = "${it.id}" >view post</g:link>


        </g:else>
    </div>
    </g:each>

</div>
<div class = "profile">



    <asset:image src="${userdetails.photo}" />

    <span id="Username">${session.user.userName}</span>
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
%{--<div id = "sharelinkform">--}%
    %{--<div id = "sharelinkheader">Share Link</div>--}%
    %{--<form action = "" id = linkform>--}%

        %{--<label for = "Link">Link</label>--}%
        %{--&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--}%
        %{--<input type="text" id = "Link" placeholder="Enter link you want to share" >--}%
        %{--<br>--}%
        %{--<br>--}%
        %{--<label for = "linkdescription">Description</label>--}%
        %{--&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--}%
        %{--<textarea  id = "linkdescription" placeholder="Enter link description" ></textarea>--}%
        %{--<br>--}%
        %{--<br>--}%
        %{--<label for = "selectlinktopic">Select a Topic</label>--}%
        %{--&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--}%
        %{--<select id ="selectlinktopic" name="topics">--}%
            %{--<option value="Topic1">Topic1</option>--}%
            %{--<option value="Topic2">Topic2</option>--}%
            %{--<option value="Topic3">Topic3</option>--}%
            %{--<option value="Topic4">Topic4</option>--}%
        %{--</select>--}%
    %{--</form>--}%
    %{--<button class="form-button" >Submit</button>--}%
    %{--&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--}%
    %{--<button class="form-button" onclick="closeForm()">close</button>--}%


%{--</div>--}%

%{--<div id = "sharedocform">--}%
    %{--<div id = "sharedocheader">Share Document</div>--}%
    %{--<form action = "/topic/addDocument" id = docform method = "POST" enctype="multipart/form-data">--}%

        %{--<label >Document</label>--}%
        %{--<br>--}%
        %{--<br>--}%
        %{--<input type="file"  name="doc" placeholder="Insert document you want to share" >--}%
        %{--<br>--}%
        %{--<br>--}%
        %{--<label for = "Docdescription">Description</label>--}%
        %{--&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--}%
        %{--<textarea  id = "Docdescription" name = "description" placeholder="Enter Document description" ></textarea>--}%
        %{--<br>--}%
        %{--<br>--}%
        %{--<label for = "selectdoctopic">Select a Topic</label>--}%
        %{--&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--}%
        %{--<select id="selectdoctopic" name="topics">--}%
            %{--<option value="grails">grails</option>--}%
            %{--<option value="Topic2">Topic2</option>--}%
            %{--<option value="Topic3">Topic3</option>--}%
            %{--<option value="Topic4">Topic4</option>--}%
        %{--</select>--}%
        %{--<input type = "submit" value = "submit">--}%
    %{--</form>--}%

    %{--&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--}%
    %{--<button class="form-button" onclick="closeDoc()">close</button>--}%


%{--</div>--}%



<div id = "subscription">
    <div id = "subscriptionheader">Subscription</div>
    <g:each in = "${usersublist}">
    <div class = "subscription_info" >
        <img src = "profile.png">
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <g:link controller="topic" action = "aboutTopic" id = "${it.topic.id}">${it.topic.name}</g:link>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>${it.topic.createdBy.userName}</span>
        <br>
        <br>
        &nbsp&nbsp
        <span >subscription</span>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>Posts</span>
        <br>
        <br>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href ="www.google.com">50</a>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href ="www.google.com">30</a>
        <br><br>
        <g:link controller="topic" action = "unsubscribeTopic" id = "${it.topic.id}">unsubscribe</g:link>
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
<div id = "trendingheader">Trending topics</div>
<div id = "trending">

    <g:each in = "${topiclist}">

    <div class = "trending_info">
        <img src = "profile.png">
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <g:link controller="topic" action = "aboutTopic" id = "${it.id}"> ${it.name}</g:link>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>${it.createdBy.userName}</span>
        <br>
        <br>
        &nbsp&nbsp

        <span id = "${it.id}">subscription</span>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>Posts</span>
        <br>
        <br>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href ="www.google.com">50</a>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href ="www.google.com">30</a>
        <br><br>
        <g:if test = "${linksharingdomain.Subscription.findBySubscriberAndTopic(session.user,it)!=null}">
            <g:link controller="topic" action = "unsubscribeTopic" id = "${it.id}">unsubscribe</g:link>
        </g:if>
        <g:else>
            <g:link controller="topic" action = "subscribeTopic" id = "${it.id}">subscribe</g:link>
        </g:else>



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
%{--<div id = "createtopic">--}%
    %{--<div id = "createtopicheader">Create Topic</div>--}%
    %{--<form action = "/topic/createTopic" id = createtopicform>--}%

        %{--<label for = "topicname">Topic Name</label>--}%
        %{--&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--}%
        %{--<input type="text" id = "topicname" placeholder="Enter topic name" name = "name">--}%
        %{--<br>--}%
        %{--<br>--}%
        %{--<label for = "selectvisibility">Visibility</label>--}%
        %{--&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--}%
        %{--<select id="selectvisibility" name="visibility">--}%
            %{--<option value="PRIVATE">PRIVATE</option>--}%
            %{--<option value="PUBLIC">PUBLIC</option>--}%
        %{--</select>--}%
        %{--<br>--}%
        %{--<input type = "submit" value = "create">--}%
        %{--&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--}%
        %{--<button class="form-button" onclick="closeCtopic()">close</button>--}%
    %{--</form>--}%




%{--</div>--}%




<div class = "bg-modal-invite">
    <div class = "modal-content-invite">
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
            <br>
            <br>
            <input type = "submit" value = "invite"  class  = "but">
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <input type = "button" onclick = "closeInvite()" value ="close" class = "but">
        </form>


        </div>
    </div>
</div>

<div class = "bg-modal-doc">
    <div class = "modal-content-doc">
        <div id = "sharedocform">
            <div id = "sharedocheader">Share Document</div>
            <form action = "/topic/addDocument" id = docform method = "POST" enctype="multipart/form-data">

                <label >Document</label>
                <br>
                <br>
                <input type="file"  name="doc" placeholder="Insert document you want to share" >
                <br>
                <br>
                <label for = "Docdescription">Description</label>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <textarea  id = "Docdescription" name = "description" placeholder="Enter Document description" ></textarea>
                <br>
                <br>
                <label for = "selectdoctopic">Select a Topic</label>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <select id="selectdoctopic" name="topics">
                <g:each in="${linksharingdomain.Topic.list()}" var="t">
                    <g:if test="${linksharingdomain.Subscription.findByTopicAndSubscriber(t,userdetails)}">
                        <option value="${t.name}">${t.name}</option>
                    </g:if>
                </g:each>
                </select>
                <br>

                <input type = "submit" class = "but" value= "submit">
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <input type = "button"  class = "form-button but" value = "close" onclick="closeDoc()">
            </form>





        </div>
    </div>
</div>
<div class = "bg-modal-link">
    <div class = "modal-content-link">
        <div id = "sharelinkform">
            <div id = "sharelinkheader">Share Link</div>
            <form action = "" id = linkform>

                <label for = "Link">Link</label>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <input type="text" id = "Link" name = "url" placeholder="Enter link you want to share" >
                <br>
                <br>
                <label for = "linkdescription">Description</label>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <textarea  id = "linkdescription" name  = "description" placeholder="Enter link description" ></textarea>
                <br>
                <br>
                <label for = "selectlinktopic">Select a Topic</label>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <select id ="selectlinktopic" name="topics">
                <g:each in="${linksharingdomain.Topic.list()}" var="t">
                    <g:if test="${linksharingdomain.Subscription.findByTopicAndSubscriber(t,userdetails)}">
                        <option value="${t.name}">${t.name}</option>
                    </g:if>
                </g:each>
                </select>
            </form>
            <button id = "linksubmit" class = "but" onclick=addlink()>create link</button>
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

            <input type = "button" class = "but" value = "close" onclick ="closeForm()">





        </div>
    </div>
</div>

<div class = "bg-modal-topic">
    <div class = "modal-content-topic">
        <div id = "createtopic">
            <div id = "createtopicheader">Create Topic</div>
            <form action = "" id = createtopicform>

                <label for = "topicname">Topic Name</label>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <input type="text" id = "topicname" placeholder="Enter topic name" name = "name">
                <br>
                <br>
                <label for = "selectvisibility">Visibility</label>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <select id="selectvisibility" name="visibility">
                    <option value="PRIVATE">PRIVATE</option>
                    <option value="PUBLIC">PUBLIC</option>
                </select>

                %{--<input type = "submit" id = "ct" class = "but" value = "create">--}%

                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

            </form>
            <button id = "btn" class = "but" >create</button>
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

            <input type = "button" class = "but" value = "close" onclick ="closeCtopic()">






        </div>

    </div>
</div>



</body>
</html>