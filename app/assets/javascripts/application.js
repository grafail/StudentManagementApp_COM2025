// This is a manifest file that'll be compiled into application.files, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require toastr
//= require_tree .

$.ajaxSetup({
    headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
});

toastr.options = {
    "closeButton": false,
    "debug": false,
    "positionClass": "toast-bottom-right",
    "onclick": null,
    "showDuration": "300",
    "hideDuration": "1000",
    "timeOut": "5000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
}

var courseFormatter = function (cell) {
    data = cell.getRow().getData();
    var responseData;
    $.ajax({
        url: '/courses/' + data.course_id,
        dataType: 'json',
        async: false,
        success: function (data) {
            responseData = data.title;
        },
        error: function () {
            responseData = 'Not Found!';
        }
    });
    return responseData;
}

var userFormatter = function (cell) {
    data = cell.getRow().getData();
    var responseData;
    $.ajax({
        url: '/admin/user/' + data.user_id,
        dataType: 'json',
        async: false,
        success: function (data) {
            responseData = data.email;
        },
        error: function () {
            responseData = 'Not Found!';
        }
    });
    return responseData;
}

var assessmentFormatter = function (cell) {
    data = cell.getRow().getData();
    var responseData;
    $.ajax({
        url: '/assessments/' + data.assessment_id,
        dataType: 'json',
        async: false,
        success: function (data) {
            responseData = data.name;
        },
        error: function () {
            responseData = 'Not Found!';
        }
    });
    return responseData;
}

var subjectFormatter = function (cell) {
    data = cell.getRow().getData();
    var responseData;
    $.ajax({
        url: '/subjects/' + data.subject_id,
        dataType: 'json',
        async: false,
        success: function (data) {
            responseData = data.title;
        },
        error: function () {
            responseData = 'Not Found!';
        }
    });
    return responseData;
}

var deleteItem = function (e, cell) {
    $.ajax({

        url: table.getAjaxUrl() + '/' + cell.getRow().getData().id,
        method: 'DELETE',
        dataType: 'json',
        success: function () {
            toastr.success('Removal was successful!')
            cell.getRow().delete();
        },
        error: function () {
            toastr.error('Removal was not successful!')
        }

    })
}
var enrollToCourse = function (e, cell) {
    console.log(e,cell);

    enrollData = {
        enrollment:{
            //user_id: 2,
            subject_id: cell.getData().id
        }
    }
    $.ajax({
        url: 'enrollments/',
        method: 'POST',
        dataType: 'json',
        data: enrollData,
        success: function () {
            toastr.success('Enrollment was successful!');
            table.replaceData();
        },
        error: function () {
            toastr.error('Enrollment was not successful!')
        }

    })
}

var submitForm = function () {
    //Find form inside modal
    let formData = $('#modal-1').find('form').serialize();
    console.log(formData);
    $.ajax({
        url: table.getAjaxUrl(),
        method: 'POST',
        dataType: 'json',
        data: formData,
        success: function () {
            toastr.success('Submission was successful!')
            table.replaceData();
        },
        error: function () {
            toastr.error('Submission was not successful!')
        }

    })
}

document.addEventListener("DOMContentLoaded", function () {

    try {

        MicroModal.init({
            awaitCloseAnimation: true,// set to false, to remove close animation
            onShow: function (modal) {
                console.log("micromodal open");
            },
            onClose: function (modal) {
                console.log(modal)
                console.log("micromodal close");
            }
        });

    } catch (e) {
        console.log("micromodal error: ", e);
    }

});

var addIcon = function(cell, formatterParams, onRendered){ //plain text value
    return "<i class='fa fa-plus'></i>";
};