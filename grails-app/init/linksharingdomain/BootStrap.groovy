package linksharingdomain
import grails.validation.ValidationException

class BootStrap {

    def init = { servletContext ->

            createUser()
            createTopic()
            createSubs()


    }

    def createUser(){
        User u1 = new User(firstName: "Sarthak",lastName: "singh",userName: "sarthakx",password: "1234"
                ,email: "sarthak@gmail.com",admin:"true",active: "true",photo: "/profile/sarthakx.jpg",security:  "kheerganga")
        User u2 = new User(firstName: "naman",lastName: "jain",userName: "namanx",password: "1234"
                ,email: "naman@gmail.com",admin:"false",active: "true",photo: "/profile/naman.jpeg",security: "diggin")
        User u3 = new User(firstName: "tom",lastName: "cruise",userName: "tomcruisex",password: "1234"
                ,email: "tomcruise@gmail.com",admin:"false",active: "true",photo:"/profile/tomcruisex.jpg",security: "hollywood")
        User u4 = new User(firstName: "dhruv",lastName: "rathore",userName: "dhruvx",password: "1234"
                ,email: "dhruv@gmail.com",admin:"false",active: "true",photo:"/profile/dhruvrathorex.jpg",security: "zoo")
        u1.save(flush:true)
        u2.save(flush:true)
        u3.save(flush:true)
        u4.save(flush:true)
    }
    def createTopic(){

        List<User> u1 = User.list()
        List<String> topic = ["ONE PIECE","Dragon ball","xyz","Naruto","Demon Slayer","Death Note","Rory the racing car","Oswald","Ninja hatori","Doremon","Bleach","Brooklyn 99"]
        for(int i=0;i<4;i++){

            Topic t1 = new Topic(name:topic[i],visibility:1,createdBy:u1.get(i));
            println t1.validate()
            try{
                t1.save(flush:true)
            }
            catch(ValidationException e){
                println e
            }


            println u1.get(i)

        }

    }


    def createSubs(){
        List<User> u = User.list()
        List<Topic> t = Topic.list()
        for(int i=0;i<4;i++){
            for(int j=0;j<=i;j++){
                Subscription s = new Subscription(subscriber:u[j],seriousness:1,topic:t[i])
                s.save(flush:true,failOnError:true)
            }
        }

    }
    def destroy = {


    }
}
