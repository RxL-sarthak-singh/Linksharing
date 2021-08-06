package linksharingdomain

class RatingController {

    def index() { }
    def rate(){
        Resource r  =  Resource.findById(params.id);
        User u = session.user
        if(ResourceRating.findByUserAndResource(u,r)!=null){
            ResourceRating rs = ResourceRating.findByUserAndResource(u,r);
            rs.delete(flush:true)
        }
        ResourceRating scoretoresource = new ResourceRating(user:u,resource: r,score:params.score);
        scoretoresource.save(flush:true);
        render params.score
    }
}
