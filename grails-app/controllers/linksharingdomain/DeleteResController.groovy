package linksharingdomain

class DeleteResController {

    def index() {
        Resource r = Resource.findById(params.id);
        List<ReadingItem> ri = ReadingItem.findAllByResource(r);
        ReadingItem.deleteAll(ri);
        List<ResourceRating> Resra= ResourceRating.findAllByResource(r);
        ResourceRating.deleteAll(Resra);
        r.delete(flush:true);
        redirect(controller:"topic",action:"index",params:[usr:r.id]);

    }

}
