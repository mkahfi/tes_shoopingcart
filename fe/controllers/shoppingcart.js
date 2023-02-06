angular.module('shopping').controller('shoppingcart', function ($scope, $rootScope, $location, $http, $filter, $window, $route, $timeout, $interval, $sce, $resource, Upload, Notification) {
    $scope.pagesizes = [10, 15, 20, 25];
    $scope.cart = [];

    var findItemById = function(items, id) {
        return _.find(items, function(item) {
          return item.id === id;
        });
      };
    $scope.fn_item = function(key) {
        $scope.NowLoading = true;
        $http.get($rootScope.__apiassign + "/api/itemController/item").then(function(response){
            let result = [];
            let variable = [];
            $timeout(function(){
                result = response.data;
                $scope[key] = result.data;
                if(result.data.length>= 1) {
                    Notification.success({message: 'Data Berhasil didownload &nbsp; <i class="fa fa-cloud-download"></i>', positionY: 'top', positionX: 'right'});
                }else{
                    Notification.warning("Data Tidak Ditemukan");
                }
                $scope.NowLoading = false;
               
            });
        }).catch(function(response){
          
            $scope[key] = [];
            $rootScope.NowLoading = false;
            return false;
        });
    }
    $scope.fn_promo = function(key){
        $http.get($rootScope.__apiassign + "/api/ItemController/promo").then(function(response){
            let result = [];
            let variable = [];
            $timeout(function(){
                result = response.data;
                $scope[key] = result.data;
                if(result.data.length>= 1) {
                    $rootScope.promo = result.data[0];
                    Notification.success({message: 'Data Berhasil didownload &nbsp; <i class="fa fa-cloud-download"></i>', positionY: 'bottom', positionX: 'right'});
                }else{
                    Notification.warning("Data Tidak Ditemukan");
                }               
            });
        }).catch(function(response){
          
            $scope[key] = [];
            return false;
        });
    }
    $scope.fn_customer = function(key) 
    {
        $http.get($rootScope.__apiassign + "/api/CustomerController/").then(function(response){
            let result = [];
            let variable = [];
            $timeout(function(){
                result = response.data;
                $scope[key] = result.data;
              
                if(result.data.length>= 1) {
                    $rootScope.__userassign = result.data[0].customer_name;
                    $rootScope.customer = result.data[0];
                    Notification.success({message: 'Data Berhasil didownload &nbsp; <i class="fa fa-cloud-download"></i>', positionY: 'bottom', positionX: 'right'});
                }else{
                    Notification.warning("Data Tidak Ditemukan");
                }               
            });
        }).catch(function(response){
          
            $scope[key] = [];
            return false;
        });
    }
    $scope.fn_generate = function() 
    {
        $http.get($rootScope.__apiassign + "/api/ShoppingController/generate_id").then(function(response){
            let result = [];
            let variable = [];
            $timeout(function(){
                result = response.data;
              
                if(result.data.length>= 1) {
                    $rootScope.__generateid = result.data;
                    $scope.generateid = result.data;
                }else{
                    return false;
                }               
            });
        }).catch(function(response){
          
            $scope[key] = [];
            return false;
        });
    }
    $scope.show_modal = function(){
        jQuery('#modal-activity-y').modal('toggle');    
    }
    $scope.luxor_statement_checkout = function(val) {
        jQuery('#modal-activity-y').modal('toggle');    
        $scope.pagesizes = [10, 15, 20, 25];
        $scope.pagesize = $scope.pagesizes[0];
        $scope.currentpage = 0;
        $scope.g2 = $scope.pagesize;
        if($scope.cart.length >= 1){
            var found = findItemById($scope.cart, val.pcode);
            if (found) {
                found.item_qty += 1;
            }else{
                // $scope.cart.push(angular.copy(val))
                $scope.cart.push({id: val.pcode, item_name: val.product_name, item_price: val.price, item_qty: 1, item_total : val.price, cust_id: $rootScope.__generateid});
            }
            $scope.pagenumber = Math.ceil($scope.cart.length / $scope.pagesize);
            $scope.paging = function(type){
                if(type == 0 && $scope.currentpage > 0){
                    --$scope.currentpage;
                }else if(type == 1 && $scope.currentpage <= $scope.pagenumber-1){
                    ++$scope.currentpage;
                    $rootScope.NowLoading = false;
                }                
            }
        }else{
            $scope.cart.push({id: val.pcode, item_name: val.product_name, item_price: val.price, item_qty: 1, item_total: val.price, cust_id: $rootScope.__generateid});
        }
    }
    $scope.luxor_statement_invoice = function() { 
        $rootScope.cart_list = $scope.cart;
        jQuery('#modal-activity-y').modal('hide');   
        $location.path("/checkout");
    }
    $scope.getCost = function(item) {
        return item.item_qty * item.item_total;
    };
    $scope.getTotal = function() {
        var total =  _.reduce($scope.cart, function(sum, item) {
          return sum + $scope.getCost(item);
        }, 0);
        console.log('total: ' + total);
        return total;
    };
    $scope.removeItem = function(item) {
        var index = $scope.cart.indexOf(item);
        $scope.cart.splice(index, 1);
      };
})