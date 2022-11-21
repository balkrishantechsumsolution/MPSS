/// <reference path="/Scripts/angular.min.js" />
/// <reference path="/Areas/Citizen/Scripts/pModule.js" />
app.service("personInfoService", function ($http) {

    this.getInfo = function (id) {
        var req = $http.get('/api/PersonInformationAPI/' + id);
        return req;
    };

    this.getAppInfo = function () {
        var req = $http.get('/api/PersonInformationAPI');
        return req;
    }

    this.postInfo = function (personInfo) {
        var req = $http.post('/api/PersonInformationAPI', personInfo).success(function () {
            // Add your success stuff here
        }).error(function (data, status, headers, config) {
            handleErrors(data);
        });
        return req;
    };

    //function updateErrors(errors) {
    //    $scope.errors.formErrors = {};
    //    $scope.errors.pageError = "";

    //    if (errors) {
    //        for (var i = 0; i < errors.length; i++) {
    //            $scope.errors.formErrors[errors[i].Key] = errors[i].Message;
    //        }
    //    }
    //}

    //$scope.handleErrors = function (data) {
    //    if (data.Errors) {
    //        updateErrors(data.Errors);
    //    } else if (data.message) {
    //        $scope.errors.pageError = data.message;
    //    } else if (data) {
    //        $scope.errors.pageError = data;
    //    } else {
    //        $scope.errors.pageError = "An unexpected error has occurred, please try again later.";
    //    }
    //};

});
