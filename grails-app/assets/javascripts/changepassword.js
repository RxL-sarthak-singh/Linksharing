function forgotPassword()
{
    $.ajax({
        url:dataurl,
        data:{email:$("#email").val(),
            password:$("#p").val(),
            confirmPassword: $("#cp").val(),
            securityQuestion:$("#sec").val()
        },
        success: function (response) {
            alert(response.m);
            f1();
        }
    })
}
function openfp() {
    document.querySelector(".bg-modal-fp").style.display = "flex"
    document.getElementById("forgotpassword").style.pointerEvents = "auto";

}

function closefp() {
    document.querySelector(".bg-modal-fp").style.display = "none"
    document.getElementById("forgotpassword").style.pointerEvents = "none";
}