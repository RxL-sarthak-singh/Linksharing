package linksharingdomain

class Resource {
    String description
    Date dateCreated
    Date lastUpdated

//    createdBy user
//    topic
    static belongsTo = [createdBy:User,topic:Topic]

    static constraints = {
        description maxSize: 1000
    }
    static mapping={
        table "Res"
    }
}
