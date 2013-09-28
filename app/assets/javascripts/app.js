angular.module ('insite', []).
	config (['$routeProvider', function ($routeProvider) {
		$routeProvider.
			when ('/main', { templateUrl: 'partial/main.html', controller: MainCtrl }).
			when ('/login', { templateUrl: 'partial/login.html', controller: LoginCtrl }).
			otherwise ({redirectTo: '/login'});
}]);
