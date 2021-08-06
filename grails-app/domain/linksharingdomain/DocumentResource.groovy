package linksharingdomain

class DocumentResource extends Resource {
    String filePath



    static constraints = {
        filePath blank: false
    }

}
