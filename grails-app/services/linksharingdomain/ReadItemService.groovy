package linksharingdomain

import grails.gorm.transactions.Transactional

@Transactional
class ReadItemService {

    def unReadPost(User u) {
        println "--------->>>>>>>>>>> "+u.userName
        List<Resource> unread = []
        List<Subscription> subs = Subscription.findAllBySubscriber(u)
        println "subs---->>>>>>>>"+ subs
        subs.each{
            List<Resource>allr = Resource.findAllByTopic(it.topic)
            println "Resources------>>>"+allr;
            allr.each{
                println it.topic.name;
            }
            allr.each{
                if(ReadingItem.findByUserAndResource(u,it)!=null) {
                    if (ReadingItem.findByUserAndResource(u, it).isRead == false) {
                        unread.push(it);
                    }
                }

            }

        }
        return unread

    }


    def addreaditems(Topic t,User u){
//        println "topicname  ----->>>>> "+t.name
        List<Resource> r= Resource.findAllByTopic(t);
//        println "topicresource----->>>>>> "+r.description
        List<Subscription> usersub = Subscription.findAllByTopic(t);
//        usersub.each{
//            println "user subscribed to topic --->>>>>>>>>"+ it.subscriber.userName
//        }
        usersub.each {a->
//            println "subscriber---->>>>>> "+a.subscriber.userName
            r.each {
//                println "resource----->>>>>>"+it.topic.name;
                ReadingItem ri = new ReadingItem(user: a.subscriber, resource: it, isRead: false);
                ri.save(flush: true)

            }
        }
        return "success"
    }
    def subaddreaditems(Topic t,User u){
//        println "topicname  ----->>>>> "+t.name
        List<Resource> r= Resource.findAllByTopic(t);
//        println "topicresource----->>>>>> "+r.description

//        usersub.each{
//            println "user subscribed to topic --->>>>>>>>>"+ it.subscriber.userName
//        }

//            println "subscriber---->>>>>> "+a.subscriber.userName
            r.each {
//                println "resource----->>>>>>"+it.topic.name;
                ReadingItem ri = new ReadingItem(user: u, resource: it, isRead: false);
                ri.save(flush: true)

            }

        return "success"
    }

    def removereaditems(Topic t,User u){
        List<Resource> r= Resource.findAllByTopic(t);
        List<Subscription> usersub = Subscription.findAllByTopic(t);

//            println "subscriber---->>>>>> "+a.subscriber.userName
            r.each {
//                println "resource----->>>>>>"+it.topic.name;
                ReadingItem ri = ReadingItem.findByUserAndResource(u,it);

                ri.delete(flush:true)

            }



        return "success"

    }
}
