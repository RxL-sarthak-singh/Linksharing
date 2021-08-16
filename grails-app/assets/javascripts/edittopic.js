function edit(id) {
    var x = "#"+id
    console.log("button clicked")
    $.ajax({
        url: editurl,
        data: {id:id,
            name:$(x).val()

        },
        success: function (response) {
            alert("successfully edited")
            $("#subscriptionajax").load(" #subscriptionajax")
            console.log(response);

        }
    });
}
function changevisibility(id){

    console.log("cv--->>> "+id);
    var vs = "#visibility"+id;

    var value = $(vs).val();
    console.log(value);
    $.ajax({
        url: changevisibilty,
        data: {
            topicvis: $(vs).val(),

            topicid: id
        },
        success:function(response){
            console.log("visibility successfully changed");


            alert("visibility changed successfully");


        }

    })
}
function ChangeSeriousness(id){
    console.log("button clicked");
    var vs = "#seriousness"+id;
    var value = $(vs).val();
    console.log(value);
    $.ajax({
        url:changeseriousness,
        data: {
            topicser: $(vs).val(),

            subid: id
        },
        success:function(response){
            console.log("seriousness successfully changed");


            alert("seriousness  changed successfully");


        }

    })
}