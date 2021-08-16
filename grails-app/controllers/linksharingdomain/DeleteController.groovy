package linksharingdomain

class DeleteController {

    def index() { }
    def deleteTopic(){
        println "deleteTopics---->>>> "+params
            User user = User.findById(params.uid)
            Topic topic = Topic.findById(params.tid)
            try {

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

                render "Topic along with associated subscriptions and resources deleted successfully"
            } catch (Exception e) {
                render e
            }



    }
}
