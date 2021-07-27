package linksharingdomain

class Resource {
    String description
    Date dateCreated
    Date lastUpdated

//    createdBy user
//    topic
    static belongsTo = [createdBy:User,topic:Topic]

    static constraints = {
    }
    static mapping={
        table "Res"
    }
}
