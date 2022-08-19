<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestLanguage.aspx.cs" Inherits="CitizenPortal.WebApp.TestLanguage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="../Scripts/angular.min.js"></script>
    <script src="../PortalScripts/TestLanguage.js"></script>
    
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    
</head>
<body ng-app="appmodule">
    <form id="form1" runat="server">
    <div>
    <h2>{{resourcesData.EmployeeInformationLabel}}</h2>
   

    <table class="table table-striped table-bordered table-condensed" 
           ng-controller="ctrl">
        <tr>
            <td>
                <table class="table table-striped table-bordered table-condensed">
                    <tr>
                        <td>{{resourcesData.EmpNoLabel}}</td>
                        <td>
                            <input type="text" ng-model="Employee.EmpNo" />
                        </td>
                    </tr>
                    <tr>
                        <td>{{resourcesData.EmpNameLabel}}</td>
                        <td>
                            <input type="text" ng-model="Employee.EmpName" />
                        </td>
                    </tr>
                    <tr>
                        <td>{{resourcesData.SalaryLabel}}</td>
                        <td>
                            <input type="text" ng-model="Employee.Salary" />
                        </td>
                    </tr>
                    <tr>
                        <td>{{resourcesData.DeptNameLabel}}</td>
                        <td>
                            <input type="text" ng-model="Employee.DeptName" />
                        </td>
                    </tr>
                    <tr>
                        <td>{{resourcesData.DesignationLabel}}</td>
                        <td>
                            <input type="text" ng-model="Employee.Designation" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="button" value="{{resourcesData.ClearLabel}}" ng-click="clear()" />
                        </td>
                        <td>
                            <input type="button" value="{{resourcesData.SaveLabel}}" ng-click="save()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table class="table table-striped table-bordered table-condensed">
                    <thead>
                        <tr>
                            <td>{{resourcesData.EmpNoLabel}}</td>
                            <td>{{resourcesData.EmpNameLabel}}</td>
                            <td>{{resourcesData.SalaryLabel}}</td>
                            <td>{{resourcesData.DeptNameLabel}}</td>
                            <td>{{resourcesData.DesignationLabel}}</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="Emp in Employees">
                            <td>{{Emp.EmpNo}}</td>
                            <td>{{Emp.EmpName}}</td>
                            <td>{{Emp.Salary |currency}}</td>
                            <td>{{Emp.DeptName}}</td>
                            <td>{{Emp.Designation}}</td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
