document.addEventListener("DOMContentLoaded", function () {

    try {
        MicroModal.init({
            awaitCloseAnimation: true,// set to false, to remove close animation
            onShow: function (modal) {
            },
            onClose: function (modal) {
            }
        });

    } catch (e) {
    }
    finally {
    }


});

$(document).ready(function () {
    $("#loginButton").click(function () {

        $("#modalWindow").modal("show");
        v = $('#modal-1').find('form').validate();

    });
});

function submitButtonAction() {

    v = $('#modal-1').find('form').validate();
    //Find form inside modal
    if (v.form()) {
        MicroModal.close('modal-1');
        submitForm();
    }

}
