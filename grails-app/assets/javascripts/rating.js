
function call(idx){
    var allids = ["star1","star2","star3","star4","star5"]
    for(var i=0;i<idx;i++){
        var x = document.getElementById(allids[i])
        x.className+=" checked"
    }



}


function give1star(id,score){
    call(1)

    $.ajax({
        url:rateurl,
        data:{
            id:id,
            score:score
        },
        success: function(response){
            console.log(response);

        },

    });

}
function give2star(id,score){
    call(2)
    $.ajax({
        url:rateurl,
        data:{
            id:id,
            score:score
        },
        success: function(response){
            console.log(response);

        },

    });

}
function give3star(id,score){
    call(3)
    $.ajax({
        url:rateurl,
        data:{
            id:id,
            score:score
        },
        success: function(response){
            console.log(response);

        },

    });

}
function give4star(id,score){
    call(4)
    $.ajax({
        url:rateurl,
        data:{
            id:id,
            score:score
        },
        success: function(response){
            console.log(response);

        },

    });

}
function give5star(id,score){
    call(5)
    $.ajax({
        url:rateurl,
        data:{
            id:id,
            score:score
        },
        success: function(response){
            console.log(response);

        },

    });

}