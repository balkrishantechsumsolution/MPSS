(function () {
    'use strict';

    angular.module('app', [
        // Angular modules 

        // Custom modules 

        // 3rd Party Modules
        'restangular',
        'ngTable'
    ])
    .config(restangularConfig);

    restangularConfig.$inject = ['RestangularProvider'];

    function restangularConfig(RestangularProvider) {
        RestangularProvider.setBaseUrl('/api');

        RestangularProvider.addResponseInterceptor(function (data, operation, what, url, response, deferred) {
            var extractedData;
            // .. to look for getList operations
            if (operation === "getList") {
                // .. and handle the data and meta data
                extractedData = data.items;
                extractedData.paging =
                {
                    pageCount: data.pageCount,
                    pageNo: data.pageNo,
                    pageSize: data.pageSize,
                    totalRecordCount: data.totalRecordCount
                };
            } else {
                extractedData = data;
            }
            return extractedData;
        });
    };


})();


//var app = angular.module('MyApp', ['ngGrid']);

//app.controller('MainController', ['$scope', '$http', function ($scope, $http, $apply) {
//    $scope.items = [];

//    // filter
//    $scope.filterOptions = {
//        filterText: "",
//        useExternalFilter: true
//    };

//    // paging
//    $scope.totalServerItems = 0;
//    $scope.pagingOptions = {
//        pageSizes: [25, 50, 100],
//        pageSize: 25,
//        currentPage: 1
//    };

//    // sort
//    $scope.sortOptions = {
//        fields: ["name"],
//        directions: ["ASC"]
//    };

//    // grid
//    $scope.gridOptions = {
//        data: "items",
//        columnDefs: [
//            //{ field: "id", displayName: "ID", width: "60" },
//            { field: "FirstName", displayName: "FirstName", pinnable: true },
//            { field: "LastName", displayName: "LastName", pinnable: true }
//            //{ field: "age", displayName: "Age", width: "60" },
//            //{ field: "isFemale", displayName: "F", width: "40" }
//        ],
//        enablePaging: true,
//        enablePinning: true,
//        pagingOptions: $scope.pagingOptions,
//        filterOptions: $scope.filterOptions,
//        keepLastSelected: true,
//        multiSelect: false,
//        showColumnMenu: true,
//        showFilter: true,
//        showGroupPanel: true,
//        showFooter: true,
//        sortInfo: $scope.sortOptions,
//        totalServerItems: "totalServerItems",
//        useExternalSorting: true,
//        i18n: "en"
//    };

//    $scope.refresh = function () {
//        setTimeout(function () {
//            var sb = [];
//            for (var i = 0; i < $scope.sortOptions.fields.length; i++) {
//                sb.push($scope.sortOptions.directions[i] === "DESC" ? "-" : "+");
//                sb.push($scope.sortOptions.fields[i]);
//            }

//            var p = {
//                name: $scope.filterOptions.filterText,
//                pageNumber: $scope.pagingOptions.currentPage,
//                pageSize: $scope.pagingOptions.pageSize,
//                sortInfo: sb.join("")
//            };

//            $http({
//                url: "/api/customers",
//                method: "GET",
//                params: p
//            }).success(function (data, status, headers, config) {
//                $scope.totalServerItems = data.totalItems;
//                $scope.items = data.items;
//            }).error(function (data, status, headers, config) {
//                alert(JSON.stringify(data));
//            });
//        }, 100);
//    };

//    // watches
//    $scope.$watch('pagingOptions', function (newVal, oldVal) {
//        if (newVal !== oldVal) {
//            $scope.refresh();
//        }
//    }, true);

//    $scope.$watch('filterOptions', function (newVal, oldVal) {
//        if (newVal !== oldVal) {
//            $scope.refresh();
//        }
//    }, true);

//    $scope.$watch('sortOptions', function (newVal, oldVal) {
//        if (newVal !== oldVal) {
//            $scope.refresh();
//        }
//    }, true);

//    $scope.refresh();
//}]);