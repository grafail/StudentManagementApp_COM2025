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

var deleteUser = function (e, cell) {
    $.ajax({

        url: '/users/' + cell.getRow().getData().id,
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

function submitForm() {
    //Find form inside modal
    let formData = $('#modal-1').find('form').serialize();
    if(table.getAjaxUrl()!="/admin/index"){
        url = table.getAjaxUrl();
    }
    else{
        url = "/users";
    }
    $.ajax({
        url: url,
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

var addIcon = function(cell, formatterParams, onRendered){ //plain text value
    return "<i class='fa fa-plus'></i>";
};