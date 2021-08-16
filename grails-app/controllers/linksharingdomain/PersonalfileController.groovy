package linksharingdomain

class PersonalfileController {

    def index() {
        if(session.user==null){
            redirect(controller:"user",action:"index");
            return;
        }
        println "usersid---->>>>>>>> "+params.id;
        User u = User.findById(params.id)
        List<Topic> userstopic = Topic.findAllByCreatedBy(u);
        List<Resource> userspost = Resource.findAllByCreatedBy(u);
        List<Subscription> userssublist = Subscription.findAllBySubscriber(u);
        render view:"index",model:[user:u,usertopiclist:userstopic,userpostlist:userspost,usersublist:userssublist];
    }
}
