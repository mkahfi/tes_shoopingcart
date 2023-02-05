String.prototype.ucFirst = function() {
    return this.charAt(0).toUpperCase() + this.slice(1);
}

Date.prototype.addMonths = function(monthOffset){
    var dt = new Date(this);
    dt.setMonth(dt.getMonth()+ monthOffset);
    if (dt.getDate() < this.getDate()) { dt.setDate(0); }
    return dt;
};

angular.module('shopping', ['ngMap','ngRoute','angucomplete-alt','fcsa-number','ngFileUpload','720kb.datepicker','chart.js','datatables','ngResource','ui-notification']).config(function($routeProvider,$httpProvider,$provide,ChartJsProvider, NotificationProvider) {

    $routeProvider.when("/",
        {
            templateUrl : base_url("pages/dashboard.html"),
            controller : "shoppingcart"
        }
    );
    $routeProvider.when("/checkout",
    {
        templateUrl : base_url("pages/checkout.html"),
        controller : "checkout"
    }
);
   
    $provide.factory('httpInterceptor', function ($q, $rootScope, $location) {
        return {
            'request': function (config) {
                var paths = $location.path().split("/");
                if(paths[1]!=="home") $rootScope.NowLoading = true;
                console.log('Loading On');
                $rootScope.$broadcast('httpRequest', config);
                return config || $q.when(config);
            },
            'response': function (response) {
                $rootScope.NowLoading = false;
                $rootScope.$broadcast('httpResponse', response);
                if(typeof response.data === 'object') console.log('Ajax Request Success',response);
                console.log('Loading Off Success');
                return response || $q.when(response);
            },
            'requestError': function (rejection) {
                $rootScope.NowLoading = false;
                $rootScope.$broadcast('httpRequestError', rejection);
                console.log('Ajax Request Error',rejection.data);
                console.log('Loading Off Request Error');
                return $q.reject(rejection);
            },
            'responseError': function (rejection) {
               
                $rootScope.NowLoading = false;
                $rootScope.$broadcast('httpResponseError', rejection);
                console.log('Ajax Response Error',rejection.data);
                console.log('Loading Off Response Error');
                return $q.reject(rejection);
            }
        };
    });

    $httpProvider.interceptors.push('httpInterceptor');
    NotificationProvider.setOptions({
        delay: 10000,
        startTop: 40,
        startRight: 10,
        verticalSpacing: 20,
        horizontalSpacing: 20,
        positionX: 'left',
        positionY: 'bottom'
    });

}).run(function($rootScope,$sce,$location,$timeout,$interval){
    $rootScope.toHtml = function( html ){
        return $sce.trustAsHtml( html );
    }
    $rootScope.page_location = 0;
    $rootScope.page_title = "ShoopingCart"
    $rootScope.assigneddate = Date;
    $rootScope.__apiassign = 'http://localhost/tes_shoppingcart/be/index.php';
    $rootScope.__userassign = [];
    $rootScope.__generateid = '';
    $rootScope.intval = function(stringint){
        if(!stringint) stringint = "0";
        return parseInt(stringint);
    }
    $rootScope.onlyNumbers = function(event){    
        var keys = { 38:true,39:true,40:true,37:true,27:true,8:true,9:true,13:true,
                     46:true,48:true,49:true, 50:true,51:true,52:true,53:true,
                     54:true,55:true,56:true,57:true };
    
        if(!keys[event.keyCode]) { event.preventDefault(); }
    }
    $rootScope.mydate = function(dt){
        return dt.substring(8,10) + '/' + dt.substring(5,7) + '/' + dt.substring(0,4);
    }
    $rootScope.mydate_js = function (dt) {
        return dt.substring(5, 7) + '/' + dt.substring(8, 10) + '/' + dt.substring(0, 4);
    }
    $rootScope.mydate2 = function(dt){
        var month = {
            "01" : "Jan",
            "02" : "Feb",
            "03" : "Mar",
            "04" : "Apr",
            "05" : "Mei",
            "06" : "Jun",
            "07" : "Jul",
            "08" : "Agu",
            "09" : "Sep",
            "10" : "Okt",
            "11" : "Nov",
            "12" : "Des"
        };
        return dt.substring(8,10) + ' ' + month[dt.substring(5,7)] + ' ' + dt.substring(0,4);
    }
    $rootScope.mytime = function(dt){
        return dt.substring(11,16);
    }

    $rootScope.mydatetime = function(dt){
        return dt.substring(8,10) + '/' + dt.substring(5,7) + '/' + dt.substring(0,4) + ' '+dt.substring(11,13)+':'+dt.substring(14,16);
    }
});