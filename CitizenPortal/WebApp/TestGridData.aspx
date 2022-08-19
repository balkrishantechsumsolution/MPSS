<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestGridData.aspx.cs" Inherits="CitizenPortal.WebApp.TestGridData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../Scripts/angular.min.js"></script>
    <script src="../Scripts/underscore.min.js"></script>
    <script src="../Scripts/restangular.min.js"></script>
    <script src="../Scripts/ng-table.min.js"></script>
    <%--<script src="../Scripts/ng-grid.min.js"></script>--%>
    <script src="../PortalScripts/TestGridData.js"></script>
    <script src="../PortalScripts/customers.controller.js"></script>


    <link href="../Content/bootstrap.min.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server" ng-app="app">
    <div>
    <div ng-controller="CustomersController as vm">
    <h1>Customers</h1>
    <p>
        <input class="form-control" placeholder="Search by name" type="text" ng-model="vm.search" ng-model-options="{ debounce: 500 }" />
    </p>
    <table ng-table="vm.tableParams" class="table">
        <tr ng-repeat="customer in $data">
            <td data-title="'First Name'" data-sortable="'firstName'">{{customer.firstName}}</td>
            <td data-title="'Last Name'" data-sortable="'lastName'">{{customer.lastName}}</td>
        </tr>
    </table>
</div>        
    </div>
    </form>
</body>
</html>
