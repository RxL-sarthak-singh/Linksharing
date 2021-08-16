package linksharingdomain

import linksharingdomain.enums.Visibility

class Topic {

    String name
    Date dateCreated
    Date lastUpdated
    Visibility visibility;
//  createdBy user
//  resources
    static belongsTo = [createdBy:User]
    static hasMany = [resources:Resource,subscriptions:Subscription]

//  enum visibility
//    static mapping = {
//        id composite :[name,createdBy]
//    }
    static constraints = {
        name blank: false
    }
}
