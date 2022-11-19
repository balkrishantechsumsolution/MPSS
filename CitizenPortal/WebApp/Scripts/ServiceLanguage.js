
//1.
var app = angular.module('appmodule', []);
//2.
app.service('serv', function ($http) {

    this.getResources = function () {
        var response = $http.get('/api/ServiceResourceAPI');
        return response;
    };

    this.getTitle = function (serviceID) {
        var response = $http.get('/api/TitleAPI/' + serviceID);
        return response;
    };

    this.getBalance = function () {
        var response = $http.get('/api/WalletAPI/');
        return response;
    };

    this.getServiceName = function (serviceID) {
        var response = $http.get('/api/ServiceNameAPI/' + serviceID);
        return response;
    };

});

//3.
app.controller('ctrl', function ($scope, $window, serv) {
    
    $scope.resourcesData = {};
    $scope.titleData = {};
    $scope.walletData = {};
    $scope.ServiceNameData = {};

    //$scope.Employees = [];
    $scope.Message = '';

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
        var serviceID = "";
        var serviceIDCtrl = angular.element(document.querySelector('#HFServiceID'));
        //console.log($window.m_ServiceID);
        //console.log(serviceIDCtrl[0].value);
        if (serviceIDCtrl != null && serviceIDCtrl[0] != null) {
            serviceID = serviceIDCtrl[0].value;
        }
        getResources();
        if (serviceID != null && serviceID != "") {
            getTitle(serviceID);
        }
        //getBalance();

        var qs = getQueryStrings();

        var queryValue = qs["SvcID"];
        if (queryValue != null && queryValue !="") {
            getServiceName(queryValue);
        }
    };

    function getResources() {
        var promise = serv.getResources();
        promise.then(function (resp) {
            $scope.resourcesData = resp.data;
        }, function (err) {
            $scope.Message = 'Call failed...' + err.status;
        });
    };

    function getTitle(ServiceID) {
        //var serviceID = $scope.serviceID;
        var promise = serv.getTitle(ServiceID);
        promise.then(function (resp) {
            $scope.titleData = resp.data;
        }, function (err) {
            $scope.Message = 'Call failed...' + err.status;
        });
    };

    //function getBalance() {
    //    var promise = serv.getBalance();
    //    promise.then(function (resp) {
    //        $scope.walletData = resp.data;
    //    }, function (err) {
    //        $scope.Message = 'Call failed...' + err.status;
    //    });
    //}

    function getServiceName(ServiceID) {
        //var serviceID = $scope.serviceID;
        var promise = serv.getServiceName(ServiceID);
        promise.then(function (resp) {

            if ($scope.titleData.lblTitle == null) {
                $scope.titleData.lblTitle = resp.data.lblSvcName;
            }
            else if ($scope.titleData.lblTitle == resp.data.lblSvcName) {
                //$scope.ServiceNameData.lblSvcName = "";
                resp.data.lblSvcName = "";
            }
            else {
                //$scope.titleData.lblTitle = $scope.titleData.lblTitle + " for " + resp.data.lblSvcName;
                $scope.ServiceNameData.lblSvcName = " for " + resp.data.lblSvcName;
            }


            //$scope.ServiceNameData = resp.data;
        }, function (err) {
            $scope.Message = 'Call failed...' + err.status;
        });
    };

    function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }

    function getQueryStrings() {
        
        var assoc = {};
        var decode = function (s) { return decodeURIComponent(s.replace(/\+/g, " ")); };
        var queryString = location.search.substring(1);
        var keyValues = queryString.split('&');

        for (var i in keyValues) {
            var key = keyValues[i].split('=');
            if (key.length > 1) {
                assoc[decode(key[0])] = decode(key[1]);
            }
        }

        return assoc;
    }

});
