package linksharingdomain

import linksharingdomain.enums.Visibility

class SearchController {

    def index() { }
    def searchpost(String str){
        List<Topic> l = Topic.list();
        List<Resource> matchingres = []
        println "searchstring---->>>>>"+params.searchtext

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
        println matchingres
        render view:"search",model:[matchingresources:matchingres];


    }
}
