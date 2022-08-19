/// <reference path="/Scripts/angular.min.js" />
 
app.directive('personForm',
    function () {

        return {
            restrict: 'E',
            templateUrl: '/Areas/Kiosk/Scripts/pTemplate.html'
        }

    });