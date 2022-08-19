/// <reference path="/Scripts/angular.min.js" />
var app;
(function () {
    app = angular.module("personInfoModule", ["ui.bootstrap"]);    
})();


    //app.config(function ($routeProvider) {
    //    $routeProvider
    //        .when("/home", {
    //            templateUrl: "/MyScripts/home.html",
    //            controller: "HomeController"
    //        })
    //        .when("/newPersonForm", {
    //            templateUrl: "/MyScripts/pTemplate.html",
    //            controller: "pController"
    //        })
    //        .otherwise({
    //            redirectTo: "/home"
    //        });
    //});

    //app.controller("HomeController",
    //    function ($scope, $location, personInfoService) {
    //        $scope.showNewPersonForm = function () {
    //            $location.path('/newPersonForm');
    //        };


    //    });


