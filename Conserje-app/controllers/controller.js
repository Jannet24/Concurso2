var app = angular.module('App', ['ngRoute', 'ngAnimate', 'toaster']);
//Controlador manejador de rutas
app.config(['$routeProvider',
  function ($routeProvider) {
        $routeProvider.
            when('/login', { // Logear usuario
                title: 'Login',
                templateUrl: 'views/login.html',
                controller: 'authCtrl'
            })
            .when('/home', {
                    title: 'Home',
                    templateUrl: 'views/home.html', //Usuario logeado 
                    controller: 'authCtrl'
                })
            .when('/myreservation',{
                title: 'reservation',
                templateUrl: 'views/myreservation.html', //Reservaciones del usuario
                controller: 'reservationCtrl'
            })
            .when('/reservation',{
                title: 'reservation',
                templateUrl: 'views/reservation.html', //Servicios que puede reservar el usuario
                controller: 'reservationCtrl'
            })
            .otherwise({
                    redirectTo: '/login'
                });
  }])

    /*Mientras se este corriendo la app
    se obtiene los datos de la session si un usuario se ha logeado 
    de lo contrario mustra la el login*/
    .run(function ($rootScope, $location, Data) {
        $rootScope.$on("$routeChangeStart", function (event, next, current) {
            $rootScope.authenticated = false;
            Data.get('session').then(function (results) {
                if (results.uid) {
                    $rootScope.authenticated = true;
                    $rootScope.uid = results.uid;
                    $rootScope.name = results.name;
                    $rootScope.email = results.email;
                } else {
                    $location.path("/login");
                    
                }
            });
        });
    });