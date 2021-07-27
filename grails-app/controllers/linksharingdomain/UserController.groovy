package linksharingdomain

import javax.xml.bind.ValidationException

class UserController {

    def index() {

        render view:'index'

    }
    def loginUser(){
        User x = User.findByEmail(params.email);

        if(x!= null){
            if(x.password==params.password){
                session.fullname=x.firstName+" "+x.lastName
                redirect(controller:"topic",action: "index",params:[usr:x.email])
                return
            }
            else{
                render "Oops wrong password"
                return
            }
        }
        render "email doesn't exist"
        return
    }
    def registerUser(){
        User u1 = new User(params)
        String msg

        try{
            u1.save(flush:true,failOnError:true)
            flash.success = "user successfully registered"

        } catch(Exception e){
           flash.error = "user registration failed"

        }
        redirect(actionName:"index")
    }



}
