package linksharingdomain

import grails.gorm.transactions.Transactional

@Transactional
class UserService {

    def serviceMethod() {

    }

    Map login(Map params){
        User x = User.findByEmail(params.email);
        String msg = "";
        Map map = ['user':x,'message':msg]
        if(x==null){
            map.message = "email doesn't exist"
            return map;
        }


        x.active=true

        if(x!= null){
            if(x.password==params.password && x.active){
                map.user = x;
                map.message = "Successfully logged in"
                return map
            }
            else{
                map.user = x;
                map.message = "Wrong password"
                return map;

            }
        }
        map.user = null
        return map

    }

    def register(def request, def params){
        User u1 = new User(params)

        if(params.password as String != params.confirmpassword as String){
            return "cee"
        }
        println "register----->>>>"+params

        if(User.findByUserName(params.userName)!=null){
            return "ue";
        }
        if(User.findByEmail(params.email)!=null){
            return "ee";
        }


        def file = request.getFile('image')

        def name = file.getOriginalFilename()
        println "file is "+name
        if (file && !file.empty) {
            File file2 = new File("/home/rxlogix/IdeaProjects/LinkSharingdomain/grails-app/assets/images/profile/${params.userName}.jpg")
            file.transferTo(file2);
            println(file2.path)
            u1.photo= "/profile/${params.userName}.jpg"
        }




//
//        String baseImageName = u1.userName
//        println baseImageName+"abc"
//// Saving image in a folder assets/channelImage/, in the web-app, with the name: baseImageName
//        def downloadedFile = request.getFile( "photo" )
//        println downloadedFile
//        String fileUploaded = fileUploadService.uploadFile( downloadedFile, "${baseImageName}.jpg", "assets/channelImage/" )
//        if( fileUploaded ){
//            u1.photo = fileUploaded
//            println "uploaded"
//
//        }
        try{
            u1.active=true
            u1.save(flush:true,failOnError:true)
            return "user successfully registered"

        } catch(Exception e){
            println e
            return "user registration failed"

        }
        redirect(actionName:"index")
    }
    def activate(){
        if(User.active==false){
            User.active = true;
            return "user activated"
        }
        return "no change";
    }
    def deactivate(){
        if(User.active==true){
            User.active = false;
            return "user deactivated";
        }
        return "no change";
    }


    def profile(Map map){
        println "CurrUser-------------->>>>>>>>>>>>>" +map.get('currUser').id
        println "vistingUser-------------->>>>>>>>>>>>>" +map.get('visitingUser').id
        if(map.get('currUser').id == map.get('visitingUser').id){
            return "Private Page"
        }else{
            return "Public Page"
        }
    }

}
