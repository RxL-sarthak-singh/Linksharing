package linksharingdomain

import linksharingdomain.enums.Visibility

class AdminController {

    def index() {
        if(session.user==null){
            redirect(controller:"user",action:"index");
            return;
        }
        List<User> users = User.list();
        render view:"index",model:[userslist:users];
    }
    def manageuser(){
        println params.id
        User u = User.findById(params.id);
        if(u.active==false){
            u.active=true;
            u.save(flush:true)
        }
        else{
            u.active = false
            u.save(flush:true)
        }
        redirect(action:"index");
    }
    def topicindex(){
        if(session.user==null){
            redirect(controller:"user",action:"index");
            return;
        }
        render view:"manageTopics";
    }
    def manageTopicsVisibility(){
        Topic topic = Topic.findById(params.id)
        if(topic.visibility== Visibility.PRIVATE){
            topic.visibility = Visibility.PUBLIC;
        }
        else{
            topic.visibility = Visibility.PRIVATE
        }
        topic.save(flush:true);
        render view:"manageTopics";

    }
    def manageTopicsAction(){
        println "deleteTopics---->>>> "+params

        Topic topic = Topic.findById(params.id)


            println "hello if"
            List<Subscription> subscriptions = Subscription.findAllByTopic(topic)
            List<Resource> resources = Resource.findAllByTopic(topic)
            Subscription.deleteAll(subscriptions)

            println "deleteTopics subscription deleted---->>>>>>"

            resources.each{
                List<ReadingItem> readingitems = ReadingItem.findAllByResource(it);
                ReadingItem.deleteAll(readingitems);
                List<ResourceRating> rr = ResourceRating.findAllByResource(it);
                ResourceRating.deleteAll(rr);
            }
            Resource.deleteAll(resources)
            println "deleteTopics resources deleted---->>>>>>"

//                    subscriptions.each{
//                        topic.removeFromSubscriptions(it);
//                    }
//                    resources.each{
//                        topic.removeFromResources(it);
//                    }

            topic.delete(flush:true,failOnError:true)



        render view:"manageTopics";
    }
}
