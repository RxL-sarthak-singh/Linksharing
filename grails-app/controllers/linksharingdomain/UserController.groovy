package linksharingdomain

import grails.converters.JSON

import javax.xml.bind.ValidationException
import java.util.UUID

class UserController {

    def userService
    def readItemService
    def topPostService

    def index() {
        if(session.user){
            redirect(controller:"topic",action:"index",use:session.user.email);
        }
        else{
            List<Resource>toppost = topPostService.topPost()
            println "toppost------>>>>"+toppost;
            render view:'index',model:[toppostlist:toppost]
        }


    }


    def dashboard(){
        render view:"dashboard";
    }


    def loginUser(){
       // User x = User.findByEmail(params.email)
         Map mp = userService.login(params)
        println mp
         if(mp.message.split(" ")[0]=="Successfully"){
             User u = mp.user
            session.setAttribute('user',u)

             redirect(controller:"topic",action: "index",params:[usr:mp.user.email])
             //render "Login sucessfully"

         }
        else if(mp.message.split(" ")[0]=="Wrong"){
             flash.error = mp.message
             redirect(action:"index")
         }
        else{
             flash.error = mp.message
             redirect(action:"index")
         }




    }


    def registerUser(){
        String msg = userService.register(request,params)
        println "msg------>>>>>>> "+msg
        if(msg=="cee"){
            flash.error = "confirm password and password field doesn't match";
            redirect(actionName:"index")
            return
        }

        if(msg=="ee"){
            flash.error = "Email ID already exists"
            redirect(actionName:"index")
            return
        }
        if(msg=="ue"){
            flash.error = "Username already exists"
            redirect(actionName:"index")
            return
        }
        if(msg.split(" ")[1]=="successfully"){


            flash.success = "user successfully registered"
            redirect(actionName:"index")
            return

        }

        else{
            flash.error = "user registration failed"
            redirect(actionName:"index")
            return

        }
        redirect(actionName:"index")
//        render([1,2,3] as JSON)
    }


    def activateUser(){
        return userService.activate()

    }
    def deactivateUser(){
        return  userService.deactivate()
    }
    def logout(){
        session.invalidate()
        redirect(controller: "user", action: "index")
    }

    def getProfile(){
        println params.id.class
        User visiting = User.findById(params.id)
        println "Service visiting------------->>>>>"+visiting
        Map map = ['currUser':session.user,'visitingUser':visiting]
        String msg = userService.profile(map)
        println msg
        if(msg=="Private Page"){
            //redirect(action: "privateProfile")
        }
        else{
            //redirect(action:publicProfile)
        }

    }
    def privateProfile(){
        render view:"getProfile"
    }
    def editProfile(request,params){
        User u = session.user
        println "getProfile username ---->>> "+params.userName
        if(User.findByUserName(params.userName)!=null){
            flash.error = "Username already in use";
            render view:"getProfile"
            return
        }

        u.userName = params.userName
        u.firstName = params.firstName
        u.lastName = params.secondName


            def file = request.getFile('image')

            def name = file.getOriginalFilename()
            println "file is " + name
            if (file && !file.empty) {
                File file2 = new File("/home/rxlogix/IdeaProjects/LinkSharingdomain/grails-app/assets/images/profile/${params.userName}.jpg")
                file.transferTo(file2);
                println(file2.path)
                u.photo = "/profile/${params.userName}.jpg"
            }
        try{
            flash.success = "Information updated"
            u.save(flush:true,failOnError:true)

        }
        catch(Exception e){
            println "EXCEPTION IS ___>>>>>>>>>___<>>><>>>"+e
        }


        render view:"getProfile"
    }
    def updatePassword(){
        if(params.confirmPassword == params.password){
            User u  = User.get(session.user.id)
            u.password  = params.password
            u.save(flush:true,failOnError:true)
            flash.update = "updated Successfully"

        }
        else{
            flash.updateerror = "password update fail"
        }
        render  view:"getProfile"
    }


}
