package linksharingdomain

class LinkResource extends Resource{
    String url



    static constraints = {
        url blank: false
    }
}
