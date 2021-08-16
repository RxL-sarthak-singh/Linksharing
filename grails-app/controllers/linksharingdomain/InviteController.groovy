package linksharingdomain

import grails.artefact.Controller
import linksharingdomain.enums.Seriousness

class InviteController {

    def index() { }
    def invite(params){
        User u = User.findByEmail(params.email);
        if(u==null){
            flash.error = "user doesn't exist"
            redirect(controller:"topic",action:"index",params:[usr:session.user.email])
            return ;
        }
        Topic t = Topic.findById(params.topics);
        println "Invite------->>>>> "+u.userName
        println "Invite------->>>>> "+t.name
        if(Subscription.findByTopicAndSubscriber(t,u)){
            flash.error = "User already subscribred"
        }
        else{
            Subscription s = new Subscription(subscriber: u,topic:t,seriousness: Seriousness.SERIOUS);
            s.save(flush:true)
            t.addToSubscriptions(s);
            u.addToSubscriptions(s);
            t.resources.each{
                ReadingItem item = new ReadingItem(isRead: false,resource: it,user: u);
                item.save(flush:true);

            }
            println "user invited--------------------->>>>>>>>>>"
            flash.success = "User Invited";
        }
        redirect(controller:"topic",action:"index",params:[usr:u.email])
    }
}
