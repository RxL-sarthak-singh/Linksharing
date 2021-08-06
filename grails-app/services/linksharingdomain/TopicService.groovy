package linksharingdomain

import grails.gorm.transactions.Transactional
import linksharingdomain.enums.Seriousness

@Transactional
class TopicService {

    def serviceMethod() {

    }

    def create(User creator, Map params) {
        // User creator  = User.findById(user.id)

        print params
        String msg  = ""
        Topic newTopic = new Topic(name: params.name, visibility: params.visibility, createdBy: creator)
        println newTopic.visibility
        try {
            newTopic.save(flush: true, failOnError: true)
            try {
                Subscription creatorSubscription = new Subscription(subscriber: creator, seriousness: Seriousness.VERY_SERIOUS, topic: newTopic)
                creatorSubscription.save(flush: true, failOnError: true)

            }
            catch (Exception e) {
//                return "Topic created successfully but failed in creating creator's subscripition"
                msg = "Topic created successfully but failed in creating creator's subscripition"

            }
        }
        catch (Exception e) {
//            return "failed in creating topic"
            msg = "failed in creating topic"

        }
        msg = "Topic created successfully"

//        return "Topic created successfully"
        return newTopic


    }


    def document(def request, def params,def user) {

        println "params------->>>>>>>>>>>>> "+params

        Topic t = Topic.findByName(params.topics)
        println "topic---------->>>>>>>>>>> "+t.name
        //Resource r = new Resource(description: params.description, createdBy: user, topic: t);
//        try {
//            r.save(flush: true, failOnError: true)
//            println "Hello "+request
//

            def file = request.getFile('doc')
            def name  = file.getOriginalFilename()
            println "file------>>>>>>>>> "+name



            if (file && !file.empty) {
                println "checking"
                File file2 = new File("/home/rxlogix/IdeaProjects/LinkSharingdomain/grails-app/assets/Docfiles/${user.userName}.txt")
                file.transferTo(file2);



            }

            DocumentResource d = new DocumentResource(description: params.description, createdBy: user, topic: t,filePath: "/home/rxlogix/IdeaProjects/LinkSharingdomain/grails-app/assets/Docfiles/${user.userName}.txt");
            try{
                d.save(flush: true,failOnError:true)
                ReadingItem ri = new ReadingItem(user:user,resource: d);
                ri.isRead = false;
                if(ri.hasErrors()){
                    ri.errors.allErrors.each{
                        println it;
                    }
                }
                else{
                    ri.save(flush:true)
                }

                return "Document resource added successfully"


            }
            catch(Exception e){
                return "Error in creating document"
            }



        }
//    catch(Exception e){
//            return "Error in creating resource"
//
//        }


        def link(Map params,User user){
            println "linktopic------>>>>> "+params.topics
            Topic t = Topic.findByName(params.topics)
            println "link----->>>>>> "+params.linkurl
            LinkResource l = new LinkResource(description: params.description, createdBy: user, topic: t,url:params.linkurl);
            println l.hasErrors()
            if(l.hasErrors()){
                l.errors.allErrors.each{
                    println it;
                }
            }
            try{
                l.save(flush: true,failOnError:true)
                println "link added succesfully"
                ReadingItem ri = new ReadingItem(user:user,resource: l);
                ri.isRead = false;
                if(ri.hasErrors()){
                    ri.errors.allErrors.each{
                        println it;
                    }
                }
                else{
                    ri.save(flush:true)
                }
                return "Link resource added successfully"


            }
            catch(Exception e){
                println e
                return "Error in creating link resource"
            }

        }


        def download(def response,Map params){
            DocumentResource r=Resource.findById(params.get("id") as long)
            println "filepath----->>>>>> "+r.filePath
            File file = new File("${r.filePath}")
            byte[] orderPDF = file.getBytes()
            response.setHeader("Content-disposition", "attachment; filename=" + file.name)
            response.contentLength = orderPDF.length
            response.outputStream << orderPDF
            redirect(controller: "dashboard" , action: "dashboard")
    }

    def getPost(params){
        return Resource.findById(params.id)
    }



    }





