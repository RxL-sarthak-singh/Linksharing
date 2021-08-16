package linksharingdomain

import linksharingdomain.enums.Visibility

class SearchController {
    def trendingTopicsService
    def topPostService

    def index() { }
    def searchpost(String str){
        if(session.user==null){
            redirect(controller:"user",action:"index");
            return;
        }
        List<Topic> l = Topic.list();
        List<Resource> matchingres = []
        println "searchstring---->>>>>"+params.searchtext
        List<Topic> trend = trendingTopicsService.trendingTopics()
        List<Resource>top = topPostService.topPost()

        l.each{

//            println Subscription.findBySubscriberAndTopic(session.user,it)
            if(it.visibility==Visibility.PRIVATE && Subscription.findBySubscriberAndTopic(session.user,it)!=null){
//                println "public resources--->>>>>1111"
               List<Resource> r = Resource.findAllByTopic(it);
                r.each{

                    if(it.topic.name.contains(params.searchtext)){
                        matchingres.push(it);
                    }
                }
            }
            else if(it.visibility==Visibility.PUBLIC ){
//                println "public resources--->>>>>"
                List<Resource> r = Resource.findAllByTopic(it);

                r.each{
//                    println "resources ----->>>>>>> "+r.topic.name;
                    if(it.topic.name.contains(params.searchtext)){
                        matchingres.push(it);
                    }
                }
            }

        }
        println "search----->>>>> "+ matchingres
        render view:"search",model:[matchingresources:matchingres,searchtext:params.searchtext,trendintopics:trend,topPost:top];


    }
}
