package linksharingdomain

import grails.converters.JSON
import linksharingdomain.enums.Seriousness
import linksharingdomain.enums.Visibility

class EditController {

    def index() { }
    def editTopic(){
        println "edittopic params.id ---->>> "+params.id
        Topic t = Topic.findById(params.id);
        t.name = params.name;
        t.save(flush:true);
        render (["topic created successfully"] as JSON)
    }
    def visibilityTopic() {
        println "visibilityTopic---->>>> "
        Map mp = ["PUBLIC": Visibility.PUBLIC, "PRIVATE": Visibility.PRIVATE]
        Topic t = Topic.findById(params.topicid)
        t.visibility = Visibility.valueOf(params.topicvis)
        t.save(flush: true);
    }
    def seriousnessTopic(){
        println "SeriousnessTopic"
        Subscription s = Subscription.findById(params.subid)
        s.seriousness = Seriousness.valueOf(params.topicser)
        s.save(flush:true);
    }

}
