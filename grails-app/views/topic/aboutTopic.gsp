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
    <asset:javascript src="edittopic.js"></asset:javascript>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <asset:javascript src="rating.js"></asset:javascript>
    <asset:javascript src= "dashboard_script.js"></asset:javascript>
    <asset:javascript src = "registerscript.js"></asset:javascript>
    <asset:javascript src="markasread.js"></asset:javascript>
    <asset:javascript src="edittopic.js"></asset:javascript>
    <asset:javascript src="deletetopic.js"></asset:javascript>
    <script>
        var dataurl = "${createLink(controller: 'topic', action: 'createTopic')}"
        var markread = "${createLink(controller: 'readItem', action: 'markasread')}"
        var addlinkurl = "${createLink(controller:'topic',action:'addLink')}"
        var adddocfile = "${createLink(controller:'topic',action:'addDocument')}"
        var searchurl =  "${createLink(controller:'search',action:'searchpost')}"
        var editurl =  "${createLink(controller:'edit',action:'editTopic')}"
        var changevisibilty = "${createLink(controller:'edit',action:'visibilityTopic')}"
        var changeseriousness = "${createLink(controller:'edit',action:'seriousnessTopic')}"
        var deleteurl =  "${createLink(controller:'delete',action:'deleteTopic')}"

    </script>
</head>
<body>
<div id ="searchbox">
    <g:link controller="topic" action="index" usr="${session.user.email}">
        <span id = "appname" style="font-weight: bold;font-size: 18px" href  = >Link Sharing</span>
    </g:link>
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

    <div class="dropdown">
        <button class="dropbtn" style="font-weight: bold">${session.user.userName}</button>
        <div class="dropdown-content">
            <g:link controller="user" action = "getProfile" id="${session.user.id}">Profile</g:link>
            <g:if test = "${session.user.admin==true}">
                <g:link controller="admin" action ="index">Users</g:link>
                <g:link controller="admin" action = "topicindex">Topics</g:link>
            </g:if>
            <g:link controller="user" action = "logout">logout</g:link>
        </div>
    </div>
</div>
<div id = "Topic">
    <div id = "Topicheader">Topic</div>
<g:if test = "${topic.createdBy.userName==session.user.userName}">
    <div class = "Topic_info">
        <g:link controller="personalfile" action = "index" id="${topic.createdBy.id}"><asset:image src="${topic.createdBy.photo}" class = "img"></asset:image></g:link>        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <g:link controller="topic" action="aboutTopic" id = "${topic.id}"><span style="font-weight: bold;color:rebeccapurple; font-size: 22px">${topic.name}</span></g:link>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <g:link controller = "personalfile" action = "index" id ="${topic.createdBy.id}">${topic.createdBy.userName}</g:link>
        <br>
        <br>
        &nbsp&nbsp
        <span>subscription</span>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>Posts</span>
        <br>
        <br>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>${linksharingdomain.Subscription.countByTopic(topic)}</span>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>${linksharingdomain.Resource.countByTopic(topic)}</span>
        <br><br>

        <g:if test="${linksharingdomain.Subscription.findByTopicAndSubscriber(topic,session.user)!=null}">
        <g:select name = "seriousness${linksharingdomain.Subscription.findByTopicAndSubscriber(topic,session.user).id}" id="seriousness${linksharingdomain.Subscription.findByTopicAndSubscriber(topic,session.user).id}" value = "${linksharingdomain.Subscription.findByTopicAndSubscriber(topic,session.user).seriousness}" from = "${linksharingdomain.enums.Seriousness.values()}" onchange = "ChangeSeriousness(${linksharingdomain.Subscription.findByTopicAndSubscriber(topic,session.user).id})" ></g:select>        %{--&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--}%
        <g:select name ="visibility${topic.id}" id = "visibility${topic.id}" value = "${topic.visibility}" from = "${linksharingdomain.enums.Visibility.values()}" onchange = "changevisibility(${topic.id})"></g:select>
        </g:if>
        <g:else>
            <g:link controller="topic" action = "subscribeTopic" id = "${topic.id}">subscribe</g:link>
        </g:else>






    </div>
</g:if>
    <g:else>
        <div class = "Topic_info">
            <g:link controller="personalfile" action = "index" id="${topic.createdBy.id}"><asset:image src="${topic.createdBy.photo}" class = "img"></asset:image></g:link>
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <g:link controller="topic" action="aboutTopic" id = "${topic.id}"><span style="font-weight: bold;color:rebeccapurple; font-size: 22px">${topic.name}</span></g:link>
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
            <span>${linksharingdomain.Subscription.countByTopic(topic)}</span>
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <span>${linksharingdomain.Resource.countByTopic(topic)}</span>
            <br><br>

        <g:if test="${linksharingdomain.Subscription.findByTopicAndSubscriber(topic,session.user)!=null}">
            <g:select name = "seriousness${linksharingdomain.Subscription.findByTopicAndSubscriber(topic,session.user).id}" id="seriousness${linksharingdomain.Subscription.findByTopicAndSubscriber(topic,session.user).id}" value = "${linksharingdomain.Subscription.findByTopicAndSubscriber(topic,session.user).seriousness}" from = "${linksharingdomain.enums.Seriousness.values()}" onchange = "ChangeSeriousness(${linksharingdomain.Subscription.findByTopicAndSubscriber(topic,session.user).id})" ></g:select>        %{--&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--}%
            <button onclick="openInvite()"><i class="fa fa-envelope"></i></button>
        </g:if>
            <g:else>
                <g:link controller="topic" action = "subscribeTopic" id = "${topic.id}">subscribe</g:link>
            </g:else>


        </div>

    </g:else>
</div>
<div id = "Profileheader">Users</div>

    <div id = "topicUserSection">
<g:each in = "${sublist}">
<div class = "profile">



    <g:link controller="personalfile" action = "index" id="${it.id}"><asset:image src="${it.photo}" class = "img"></asset:image></g:link>
    &nbsp&nbsp&nbsp&nbsp
    <g:link controller="personalfile" action = "index" id="${it.id}"><span style="font-weight: bold;color:rebeccapurple; font-size: 22px">${it.userName}</span></g:link>
    &nbsp&nbsp&nbsp&nbsp
    <span>${it.firstName}</span>
    <br>
    <br>

    &nbsp&nbsp&nbsp
    <span>Subscription</span>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <span>Posts</span>
    <br>
    <br>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <span>${linksharingdomain.Subscription.countBySubscriberAndTopic(it,topic)}</span >
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <span href="#">${linksharingdomain.Resource.countByCreatedBy(it)}</span>


</div>
        <br>
</g:each>
    </div>

<div class = "posts" style="height: auto; border: 1px solid">
    <div id = "postsheader">Posts</div>
    <div id = "postoutline" style="min-height: 150px; max-height: 300px; overflow-y: scroll">
    <g:each in ="${resourcelist}">

    <div class = "posts_info">

        <g:link controller="personalfile" action = "index"  id="${it.createdBy.id}"><asset:image src="${it.createdBy.photo}"></asset:image></g:link>

        <g:link controller="personalfile" action = "index"  id="${it.createdBy.id}">${it.createdBy.userName}</g:link>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <span>${it.createdBy.userName}</span>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <g:link controller="topic" action="aboutTopic" id = "${it.topic.id}">${it.topic.name}</g:link>

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
            <button class = "mar" onclick = markasread("${it.id}")>Mark as read</button>
        &nbsp&nbsp&nbsp
            <g:link controller="topic"  action="aboutpost" id = "${it.id}" >view post</g:link>

        &nbsp&nbsp&nbsp
        </g:if>
        <g:else>
            <a href = "${it.url}"> view full site</a>
            &nbsp&nbsp&nbsp

            <button class = "mar" onclick = markasread("${it.id}")>Mark as read</button>
            &nbsp&nbsp&nbsp
            <g:link controller="topic"  action="aboutpost" id = "${it.id}" >view post</g:link>
            &nbsp&nbsp&nbsp
        </g:else>
    </div>

    </g:each>
    </div>

</div>


<div class = "bg-modal-invite">
    <div class = "modal-content-invite">
        <div id = "sendinvitation">
            <div id = "sendinvitationheader">Send Invitation</div>

            <form action = "/invite/invite" id = sendinvitationform>

                <label for = "email">Email</label>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <input type="text" id = "email" name="email" placeholder="Enter Email" >
                <br>
                <br>
                <label for = "topicinvite">Visibility</label>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <select id="topicinvite" name="topics">
                    <g:each in="${linksharingdomain.Topic.list()}" var="t">
                        <g:if test="${linksharingdomain.Subscription.findByTopicAndSubscriber(t,session.user)}">
                            <option value="${t.id}">${t.name}</option>
                        </g:if>
                    </g:each>
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
                        <g:if test="${linksharingdomain.Subscription.findByTopicAndSubscriber(t,session.user)}">
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
                        <g:if test="${linksharingdomain.Subscription.findByTopicAndSubscriber(t,session.user)}">
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