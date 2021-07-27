package linksharingdomain

class TopicController {

    def index() {
        def x = params.usr
        User u = User.findByEmail(x)

        List<Subscription> s = Subscription.list();
        Map mp = [:]
        s.each{
            if(mp[it.topic]){
                mp[it.topic]++
            }
            else{
                mp[it.topic]=1;
            }


        }
        mp.sort{it.value}
        List t = []
        mp.each{t.push(it.key)};
        int c = Math.min(5,t.size());
        List trev = t.reverse();
        List f = []

        for(int i=0;i<c;i++){
            f.push(trev[i])
        }

        List<Subscription> usersubscriptionlist = Subscription.findAllByUser(u)
        List<Subscription> top5usersubscription = []
        int z = usersubscriptionlist.size()
        println z
        for(int i=0;i<Math.min(z,5);i++){
            top5usersubscription.push(usersubscriptionlist.get(i))
        }
        int no_subscription = Subscription.countByUser(u);
        int no_topicscreated = Topic.countByCreatedBy(u);

        render view:"index",model:[topiclist:f,userdetails:u,usersublist:top5usersubscription,user_no_subscription:no_subscription,user_no_topics:no_topicscreated];

    }
}
