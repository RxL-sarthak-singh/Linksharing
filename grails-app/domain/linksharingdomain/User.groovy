package linksharingdomain

class User {

    String email
    String userName
    String password
    String firstName
    String lastName
    String confirmPassword
    boolean active = true
    boolean admin
    Date dateCreated
    Date lastUpdated
    static transients = ["confirmPassword"]
    String photo;
    static hasMany = [topics:Topic,subscriptions:Subscription,resources:Resource,readingItems:ReadingItem]
//    resourceRating check

    static constraints = {
        email(unique: true, email: true)
        userName(unique: true, blank: false)
        firstName blank: false
        password blank:false
       // photo nullable: true,blank: true
    }
    static mapping={
        table "Usr"
    }
}
