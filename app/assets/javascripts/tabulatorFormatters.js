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
            responseData = data.firstname + ' ' + data.lastname;
        },
        error: function () {
            responseData = 'Not Found!';
        }
    });
    return responseData;
}
var userFormatterEmail = function (cell) {
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

var roleMutator = function (value, data, type, params, component) {
    var responseData = 'Not Found';
    $.ajax({
        url: '/admin/user/role/' + data.id,
        dataType: 'json',
        async: false,
        success: function (data) {
            responseData = data;
            if (data == null || data == undefined || responseData.length < 1)
                responseData = 'No Role';
        },
        error: function () {
            responseData = 'Not Found';
        }
    });
    return responseData;
}

var roleFormatter = function (cell) {
    let cellValue = cell.getValue();
    if (cellValue != null && cellValue.length >= 1) {
        return cellValue.charAt(0).toUpperCase() + cellValue.slice(1)
    } else
        return "No Role";
}