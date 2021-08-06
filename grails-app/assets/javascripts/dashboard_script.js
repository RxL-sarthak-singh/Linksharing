
function openForm() {
    document.querySelector(".bg-modal-link").style.display = "flex"
    document.getElementById("sharelinkform").style.pointerEvents = "auto";


}

function closeForm() {
    document.querySelector(".bg-modal-link").style.display = "none"
    document.getElementById("sharelinkform").style.pointerEvents = "none";
}
function openDoc() {
    document.querySelector(".bg-modal-doc").style.display = "flex"
    document.getElementById("sharedocform").style.pointerEvents = "auto";

}

function closeDoc() {
    document.querySelector(".bg-modal-doc").style.display = "none"
    document.getElementById("sharedocform").style.pointerEvents = "none";
}
function openCtopic() {
    document.querySelector(".bg-modal-topic").style.display = "flex"
    document.getElementById("createtopic").style.pointerEvents = "auto";

}

function closeCtopic() {
    document.querySelector(".bg-modal-topic").style.display = "none"
    document.getElementById("createtopic").style.pointerEvents = "none";
}
function openInvite() {
    document.querySelector(".bg-modal-invite").style.display = "flex"
   //document.getElementById("sendinvitation").style.display = "block";
    document.getElementById("sendinvitation").style.pointerEvents = "auto";


}

function closeInvite() {
    document.querySelector(".bg-modal-invite").style.display = "none"
    document.getElementById("sendinvitation").style.pointerEvents = "none";

}
function show_modal(){
    document.querySelector(".bg-modal").style.display = "flex"
}

