
//1.
var appWallet = angular.module('appmoduleWallet', []);
//2.
appWallet.service('serv', function ($http) {

    //this.getResources = function () {
    //    var response = $http.get('/api/ServiceResourceAPI');
    //    return response;
    //};

    //this.getTitle = function (serviceID) {
    //    var response = $http.get('/api/TitleAPI/' + serviceID);
    //    return response;
    //};

    this.getBalance = function () {
        var response = $http.get('/api/WalletAPI/');
        return response;
    };

});

//3.
appWallet.controller('ctrlWallet', function ($scope, $window, serv) {

    //$scope.resourcesData = {};
    //$scope.titleData = {};
    //$scope.walletData = {};

    ////$scope.Employees = [];
    //$scope.Message = '';

    //$scope.init = function (serviceID) {
    //    //This function is sort of private constructor for controller
    //    $scope.serviceID = serviceID;
    //    //$scope.name = name;
    //    //Based on passed argument you can make a call to resource
    //    //and initialize more objects
    //    //$resource.getMeBond(007)
    //};

    load();
    function load() {
        //var serviceID = "";
        //var serviceIDCtrl = angular.element(document.querySelector('#HFServiceID'));
        ////console.log($window.m_ServiceID);
        ////console.log(serviceIDCtrl[0].value);
        //serviceID = serviceIDCtrl[0].value;
        //getResources();
        //getTitle(serviceID);
        //getBalance();
    };

    //function getResources() {
    //    var promise = serv.getResources();
    //    promise.then(function (resp) {
    //        $scope.resourcesData = resp.data;
    //    }, function (err) {
    //        $scope.Message = 'Call failed...' + err.status;
    //    });
    //};

    //function getTitle(ServiceID) {
    //    //var serviceID = $scope.serviceID;
    //    var promise = serv.getTitle(ServiceID);
    //    promise.then(function (resp) {
    //        $scope.titleData = resp.data;
    //    }, function (err) {
    //        $scope.Message = 'Call failed...' + err.status;
    //    });
    //};

    function getBalance() {
        var promise = serv.getBalance();
        promise.then(function (resp) {
            $scope.walletData = resp.data;
        }, function (err) {
            $scope.Message = 'Call failed...' + err.status;
        });
    }

});