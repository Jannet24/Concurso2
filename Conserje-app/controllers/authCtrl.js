//Controlador para los usuarios 
app.controller('authCtrl', function ($scope, $rootScope, $routeParams, $location, $http, Data) {
    $scope.login = {};
    //Funcion que valida al usuario
    $scope.doLogin = function (customer) {
        Data.post('login', {
            customer: customer
        }).then(function (results) {
            Data.toast(results);
            if (results.status == "success") {
                $location.path('home');
            }
            else{
                alert("Datos incorrectos");
            }
        });
    };
    //Funcion que termina la sesion 
    $scope.logout = function () {
        Data.get('logout').then(function (results) {
            Data.toast(results);
            $location.path('login');
        });
    }
});