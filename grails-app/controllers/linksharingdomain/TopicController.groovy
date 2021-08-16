package linksharingdomain

import grails.converters.JSON
import linksharingdomain.enums.Seriousness

class TopicController {
    def topicService
    def readItemService
    def trendingTopicsService

    def index() {
        if(session.user==null){
            redirect(controller:"user",action:"index");
            return;
        }
        def email = params.usr
        User u = session.user

        List<Subscription> s = Subscription.list();
        Map mp = [:]
        s.each{
            if(mp[it.topic]){
                mp[it.topic]++
            }
            else{
                mp[it.topic]=1;
            }


        }
        mp.sort{it.value}
        List t = []
        mp.each{t.push(it.key)};
        int c = Math.min(5,t.size());
        List trev = t.reverse();
        List f = trendingTopicsService.trendingTopics();

        println "trending topics--->>>>> "+f

        List<Subscription> usersubscriptionlist = Subscription.findAllBySubscriber(u)
        List<Subscription> top5usersubscription = []
        int z = usersubscriptionlist.size()
        println z
        for(int i=0;i<Math.min(z,5);i++){
            top5usersubscription.push(usersubscriptionlist.get(i))
        }
        int no_subscription = Subscription.countBySubscriber(u);
        int no_topicscreated = Topic.countByCreatedBy(u);
        List<Resource> unread = readItemService.unReadPost(u);
        println "--------->>>>>>>>>>> "+u.userName
        render view:"index",model:[topiclist:f,userdetails:u,usersublist:top5usersubscription,user_no_subscription:no_subscription,user_no_topics:no_topicscreated,unreadResource:unread];

    }


    def createTopic(){

//        flash.success =  topicService.create(session.user,params)
//
//        redirect(action: "index",params:[usr:session.user.email])
        println "ajax------>>>>>>> "+params.visibility

        if(Topic.findByCreatedByAndName(session.user,params.name)!=null){
            String msg2 = "user can't create topic with same name"
            render([m:msg2] as JSON)
            return
        }
        else{
            String msg = topicService.create(session.user,params)
            Map li = [m:msg]
            render(li as JSON)
            return

        }




    }

    def addDocument(){

        Topic t = Topic.findByName(params.topics)
        String msg = topicService.document(request,params,session.user)
        readItemService.addreaditems(t,session.user)
        if(msg.split(" ").last()=="successfully"){
            flash.success = msg;
        }
        else{
            flash.error = msg
        }

       redirect(action:"index",params: [usr:session.user.email])
    }


    def addLink(){
        Topic t = Topic.findByName(params.topics)
        String msg = topicService.link(params,session.user)
        readItemService.addreaditems(t,session.user)
        render ([msg] as JSON)
    }

    def aboutTopic(){
        if(session.user==null){
            redirect(controller:"user",action:"index");
            return;
        }
        Topic t = Topic.findById(params.id)

        println "topic name is----------->>>>>>>>>>> "+ t.name
        List<User> subscriberlist = []
        List<Subscription> s = Subscription.findAllByTopic(t)
        s.each{subscriberlist.push(it.subscriber)}
        List<Resource> r = Resource.findAllByTopic(t);




        render view:"aboutTopic" ,model:[sublist:subscriberlist,topic:t,resourcelist:r];

    }
    def postDownload(){
        topicService.download(response,params);
    }
    def aboutpost(){
        if(session.user==null){
            redirect(controller:"user",action:"index");
            return;
        }
        println "params------>>>>> "+params
        Resource r = topicService.getPost(params)
        List<Topic>trend = trendingTopicsService.trendingTopics()
        render view:"aboutpost",model:[resource:r,trendingtopics:trend];


    }

    def subscribeTopic(){
        Topic t = Topic.findById(params.id);
        Subscription s = new Subscription(topic:t,subscriber: session.user,seriousness:  Seriousness.VERY_SERIOUS);
        readItemService.subaddreaditems(t,session.user);
        s.save(flush:true,failOnError:true);
//        render "subscription successfull"
       redirect (action:"index",params:[usr:session.user.email])
    }

    def unsubscribeTopic(){
        Topic t = Topic.findById(params.id);
        readItemService.removereaditems(t,session.user);
        Subscription s = Subscription.findBySubscriberAndTopic(session.user,t);
        s.delete(flush:true);
        redirect (action:"index",params:[usr:session.user.email])

    }


}
