package linksharingdomain

class ReadItemController {

    def markasread(params){
        println "Readitems params ----------->>>>>>>> "+params.id;
        User u = session.user
        Resource r = Resource.findById(params.id)
        ReadingItem ri = ReadingItem.findByResourceAndUser(r,u)
        ri.isRead = true
        ri.save(flush:true)

    }
}
