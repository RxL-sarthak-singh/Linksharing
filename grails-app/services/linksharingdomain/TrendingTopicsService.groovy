package linksharingdomain

import grails.gorm.transactions.Transactional

@Transactional
class TrendingTopicsService {

    def serviceMethod() {

    }
    def trendingTopics(){
        List<Topic> allTop = Topic.list();
        Map topicAndCountRes = [:]

        allTop.each{
            topicAndCountRes.put(it,Resource.countByTopic(it))
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
