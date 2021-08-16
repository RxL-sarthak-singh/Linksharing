package linksharingdomain

import grails.gorm.transactions.Transactional
import linksharingdomain.enums.Visibility

@Transactional
class TrendingTopicsService {

    def serviceMethod() {

    }
    def trendingTopics(){
        List<Topic> allTop = Topic.list();
        Map topicAndCountRes = [:]

        allTop.each{
            if(it.visibility== Visibility.PUBLIC){
                topicAndCountRes.put(it,Resource.countByTopic(it))
            }

        }
        topicAndCountRes = topicAndCountRes.sort{it.value}
        println "map of topic and count---->>>>>> "+topicAndCountRes
        List<Topic> trentops = [];
        topicAndCountRes.each{
            trentops.push(it.key);
        }
        List<Topic> revtrentops = trentops.reverse();
        List<Topic> topfivetrentops = [];
        for(int i=0;i<Math.min(5,revtrentops.size());i++){
            topfivetrentops.push(revtrentops.get(i));
        }
        return topfivetrentops;


    }
}
