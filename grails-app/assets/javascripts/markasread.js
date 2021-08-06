function markasread(id)
{
    console.log("button clicked")
    $.ajax({
        url:markread,
        data:{
            id:id
        },
        success: function(response){
            console.log(response);
           $(".inbox").load(" .inbox");
        },
        
    });
}




