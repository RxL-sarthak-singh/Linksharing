package linksharingdomain

class ForgotpasswordController {

    def index() { }
    def changepassword(){
        println "forgotpassword params--->>>>>> "+params.security
        User u = User.findByEmail(params.email);
        if(u==null){
            flash.error = "email doesn't exist"
            redirect(controller:"user",action:"index")
            return

        }
        String msg = ""
        println "user security--->>>>> "+u.security
        if(u.security==(params.get("security") as String)){
            if(params.newpassword==params.confirmpassword){
                u.password = params.newpassword
                u.save(flush:true)
                flash.success = "password changed"
            }
            else{
                flash.error = "Fields don't match"
            }
        }
        else{
            flash.error = "Security question's answer is wrong"
        }

        redirect(controller:"user",action:"index")
    }

}
