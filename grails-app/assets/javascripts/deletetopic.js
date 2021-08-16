function deletet(tid,uid) {
    console.log("button clicked");
    $.ajax({
        url: deleteurl ,
        data: {tid:tid,
            uid:uid
        },
        success: function (respo) {
            alert("successfully deleted");
            console.log(respo);
            $("#subscriptionajax").load(" #subscriptionajax")
            $("#trendingajax").load(" #trendingajax")

        }
    })
}