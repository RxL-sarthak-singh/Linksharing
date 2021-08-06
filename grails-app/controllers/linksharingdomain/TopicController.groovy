package linksharingdomain

import grails.converters.JSON
import linksharingdomain.enums.Seriousness

class TopicController {
    def topicService
    def readItemService
    def trendingTopicsService

    def index() {
        def email = params.usr
        User u = User.findByEmail(email)

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
        Topic t = topicService.create(session.user,params)
        List li = []
        li.add(t)
        render(li as JSON)


    }

    def addDocument(){
        render topicService.document(request,params,session.user)
    }


    def addLink(){
        render topicService.link(params,session.user)
    }

    def aboutTopic(){
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
        println "params------>>>>> "+params
        Resource r = topicService.getPost(params)
        render view:"aboutpost",model:[resource:r];


    }

    def subscribeTopic(){
        Topic t = Topic.findById(params.id);
        Subscription s = new Subscription(topic:t,subscriber: session.user,seriousness:  Seriousness.VERY_SERIOUS);
        readItemService.addreaditems(t,session.user);
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
