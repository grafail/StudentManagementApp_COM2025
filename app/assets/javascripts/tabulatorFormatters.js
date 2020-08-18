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