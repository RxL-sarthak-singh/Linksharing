$(document).ready(function(){

   $("#btn").click(function () {
       console.log("button clicked")

       $.ajax(
           {

               url:dataurl,
               data:{
                   visibility:$("#selectvisibility").val(),
                   name :$("#topicname").val()


               },

               success:function (response) {
                   console.log(response)
                    closeCtopic();
                     alert("topic added successfully")
                  // $(".subscription_info").load(" .subscription_info")

               }
           })


   });
    function closeCtopic() {
        document.querySelector(".bg-modal-topic").style.display = "none"
        document.getElementById("createtopic").style.pointerEvents = "none";
    }

});

function closeForm() {
    document.querySelector(".bg-modal-link").style.display = "none"
    document.getElementById("sharelinkform").style.pointerEvents = "none";
}

function addlink(){
    console.log("button clicked");
    //console.log(u)
    $.ajax({
        url:addlinkurl,
        data:{
            description:$("#linkdescription").val(),
            linkurl:$("#Link").val(),

            topics:$("#selectlinktopic").val()

        },
        success:function(response){
            console.log(response);
            closeForm();
            $(".inbox").load(" .inbox");
            $(".trending_info").load(" .trending_info")

        }


    })
}
// function addDoc(){
//     console.log("button clicked");
//     //console.log(u)
//     $.ajax({
//         url:addlinkurl,
//         data:{
//             description:$("#Docdescription").val(),
//             linkurl:$("#Link").val(),
//
//             topics:$("#selectdoctopic").val()
//
//         },
//         success:function(response){
//             console.log(response);
//             closeForm();
//             $(".inbox").load(" .inbox");
//
//         }
//
//
//     })
//
// }
