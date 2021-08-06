package linksharingdomain

import linksharingdomain.enums.Seriousness

class Subscription {
    Date dateCreated
    Seriousness seriousness;

//  topic
//  user
    static belongsTo = [topic:Topic,subscriber:User]

//  enum seriousness
    static constraints = {
    }

}
