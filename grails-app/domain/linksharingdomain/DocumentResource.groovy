package linksharingdomain

class DocumentResource {
    String filePath

    static belongsTo = [resource: Resource]

    static constraints = {
        filePath blank: false
    }

}
