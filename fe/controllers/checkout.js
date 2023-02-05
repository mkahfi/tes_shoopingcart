angular.module('shopping').controller('checkout', function ($scope, $rootScope, $location, $http, $filter, $window, $route, $timeout, $interval, $sce, $resource, Upload, Notification) {
    $scope.cart = [];
    $scope.discount = 1000;
   
    if (typeof $rootScope.customer === "undefined") $location.path("/");
        
        $scope.customer = $rootScope.customer;
        $scope.fn_cart = function(){
            $scope.pagesizes = [10, 15, 20, 25];
            $scope.pagesize = $scope.pagesizes[0];
            $scope.currentpage = 0;
            $scope.g2 = $scope.pagesize;

            $scope.cart =  $rootScope.cart_list;
            $scope.pagenumber = Math.ceil($scope.cart.length / $scope.pagesize);
            $scope.paging = function(type){
                if(type == 0 && $scope.currentpage > 0){
                    --$scope.currentpage;
                }else if(type == 1 && $scope.currentpage <= $scope.pagenumber-1){
                    ++$scope.currentpage;
                    $rootScope.NowLoading = false;
                }                
            }

        }
        $scope.fn_submit = function(){
            $http.post($rootScope.__apiassign + "/api/ShoppingController/mutasi", {
                'variable': $scope.cart, 
                'promo': $rootScope.promo.promo_code,
                'discount': $scope.discount,
                'net': $scope.getTotal(),
                'ppn' :$scope.ppn(),
                'total': $scope.all_total(),
                'cust_id' : $rootScope.__generateid
            }).then(function(response){
                console.log(response);
                if(response.data.status === true) {
                    $http.post($rootScope.__apiassign + "/api/ShoppingController/checkoutstok", {
                        'variable': $scope.cart, 
                    }).then(function(respone){
                        if(response.data.status === true) {
                            Notification.success({message: 'Berhasil diproses &nbsp; <i class="fa fa-cloud-upload"></i>', positionY: 'top', positionX: 'right'});
                        }else{
                            Notification.warning({message: 'Gagal di proses &nbsp; <i class="fa fa-cloud-upload"></i>', positionY: 'top', positionX: 'right'});
                        }
                    });
                }else{
                    Notification.warning({message: 'Gagal di proses &nbsp; <i class="fa fa-cloud-upload"></i>', positionY: 'top', positionX: 'right'});
                }
            }).catch(function(response){
                Notification.warning({message: 'Network Error &nbsp; <i class="fa fa-cloud-upload"></i>', positionY: 'top', positionX: 'right'});
                $scope[key] = [];
                return false;
            });
        }
        $scope.getCost = function(item) {
            return item.item_qty * item.item_total;
        };
        $scope.getTotal = function() {
            var total =  _.reduce($scope.cart, function(sum, item) {
              return sum + $scope.getCost(item);
            }, 0);
            return total;
        };
       $scope.ppn = function() {
        // console.log($scope.getTotal() * 0.1);
            return ($scope.getTotal() * 0.1);
            
       }
       $scope.all_total = function() 
       {
            return $scope.getTotal() - $scope.discount + $scope.ppn();
       } 
 
})