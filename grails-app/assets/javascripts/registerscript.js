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
                   console.log(response.m)
                    closeCtopic();
                   if(response.m=="suberror"||response.m=="te"){
                       alert("Error in creating topic")
                   }
                   else if(response.m=="ts"){
                       alert("Topic created successfully")
                   }
                   else{
                       alert(response.m)
                   }

                   $("#subscriptionajax").load(" #subscriptionajax")
                   $("#trendingajax").load(" #trendingajax")

               }
           })


   });
    function closeCtopic() {
        document.querySelector(".bg-modal-topic").style.display = "none"
        document.getElementById("createtopic").style.pointerEvents = "none";
    }

});

function closeForm() {
    console.log("hello")
    document.querySelector(".bg-modal-link").style.display = "none"
    document.getElementById("sharelinkform").style.pointerEvents = "none";
}

function addlink() {
    console.log("button clicked");
    //console.log(u)
    $.ajax({
        url: addlinkurl,
        data: {
            description: $("#linkdescription").val(),
            linkurl: $("#Link").val(),

            topics: $("#selectlinktopic").val()

        },
        success: function (response) {
            console.log(response)
            // console.log("link successfully created");
             alert(response[0]);
            $(".inbox").load(" .inbox")
            $("#subscriptionajax").load(" #subscriptionajax")
            $("#trendingajax").load(" #trendingajax")
            closeForm();

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
