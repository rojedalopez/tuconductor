'use strict';

angular.module('MyApp.Sign', []).controller('SignUpController', ['$scope', 'SignUpService', function($scope, SignUpService) {
          var self = this;
          self.usuario={mail:"", password:"",name:"", lastname:"", phone:""};

         self.SaveUser = function(usuario){
              SignUpService.SaveSign(usuario)
		              .then(
                      self.reset, 
				              function(errResponse){
					               console.error('Error while creating Paper.');
				              }	
                  );
          };
          
          self.submit = function() {
              console.log(self.usuario.name);
              console.log(self.usuario.lastname);
              console.log(self.usuario.mail);
              console.log(self.usuario.password);
              console.log(self.usuario.phone);
            open_message(self.SaveUser(self.usuario));
            self.reset();
          };
          
          self.reset = function(){
              self.usuario={mail:"", password:"",name:"", lastname:"", phone:""};
              $scope.myForm.$setPristine(); //reset Form
              
          };
      }]).factory('SignUpService', ['$http', '$q', function($http, $q){

	return {
                    SaveSign: function(usuario){
                        var fd = new FormData();
                        fd.append("mail", usuario.mail);
                        fd.append("password", usuario.password);
                        fd.append("name", usuario.name);
                        fd.append("lastname", usuario.lastname);
                        fd.append("phone", usuario.phone);
                        
					return $http.post('signup', fd, {
                                                    headers: {'Content-Type': undefined},
                                                    transformRequest: angular.identity
                                                })
							.then(
									function(response){
                                                                                console.log(response.data);
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while updating paper ' +errResponse);
										return $q.reject(errResponse);
									}
							);
			}
		
	};

}]).directive('sameAs', function() { return {
    require : 'ngModel',
    link : function(scope, elm, attrs, ngModelCtrl) {

        ngModelCtrl.$validators.sameAs = function(modelValue, viewValue) {
            var checkedVal = attrs.sameAs;
            var thisInputVal = viewValue;

            if (thisInputVal == checkedVal) {
                return true; // valid
            } else {
                return false;
            }
        };
    }
}; });




