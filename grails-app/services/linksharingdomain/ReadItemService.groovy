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
            allr.each{
                if(ReadingItem.findByUserAndResource(u,it).isRead==false){
                    unread.push(it);
                }

            }

        }
        return unread

    }


    def addreaditems(Topic t,User u){
        List<Resource> r= Resource.findAllByTopic(t);
        r.each{
            ReadingItem ri = new ReadingItem(user:u,resource: it,isRead: false);
            ri.save(flush:true)

        }
        return "success"
    }

    def removereaditems(Topic t,User u){
        List<Resource> r= Resource.findAllByTopic(t);
        r.each{
            ReadingItem ri = ReadingItem.findByUserAndResource(u,it);

            ri.delete(flush:true)


        }
        return "success"

    }
}
