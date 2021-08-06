package linksharingdomain

import grails.converters.JSON

import javax.xml.bind.ValidationException
import java.util.UUID

class UserController {

    def userService
    def readItemService
    def topPostService

    def index() {
        List<Resource>toppost = topPostService.topPost()
        println "toppost------>>>>"+toppost;
        render view:'index',model:[toppostlist:toppost]

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
             render mp.message
         }
        else{
             render "email doesn't exist"
         }




    }


    def registerUser(){
        String msg = userService.register(request,params)
        if(msg.split(" ")[1]=="successfully"){


            flash.success = "user successfully registered"

        }
        else{
            flash.error = "user registration failed"

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
    def editProfile(){
        User u = User.get(session.user.id)
        u.userName = params.userName
        u.firstName = params.firstName
        u.lastName = params.secondName
        u.save(flush:true,failOnError:true)

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
