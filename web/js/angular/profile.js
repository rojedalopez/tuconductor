'use strict';

angular.module('MyApp.Profile', []).controller('ProfileController', ['$scope', 'ProfileService', function($scope, ProfileService) {
          var self = this;
          self.usuario={mail:"", password:"",name:"", lastname:"", phone:""};
          self.publicaciones=[];
          self.publicacion={id:null, fecha:Date(), origen:"", cod_origen:"", destino:"", comentario:"", archivo:"", me_gusta:0, desde:"", num_comentario:0};

         self.SaveUser = function(usuario){
              ProfileService.SaveSign(usuario)
		              .then(
                      self.reset, 
				              function(errResponse){
					               console.error('Error while creating Paper.');
				              }	
                  );
          };
          
          self.llenarPublicaciones = function(){
              ProfileService.llenarPublicaciones()
                  .then(
      					       function(d) {
      						        self.publicaciones = d;
      					       },
            					function(errResponse){
            						console.error('Error while fetching Currencies');
            					}
      			       );
          };
          
          self.llenarPublicaciones();
          
          self.submit = function() {
            self.SaveUser(self.usuario); 
            self.close();
          };
          
          self.close = function(){
              self.reset();
              dialog.modal( "hide" );
          };
           
          self.comentar = function(){
              self.reset();
              dialog.modal( "show" );
          };
          
          self.opener = function(){
              self.reset();
              dialog.modal( "show" );
          };
          
          self.reset = function(){
              self.usuario={mail:"", password:"",name:"", lastname:"", phone:""};
              $scope.myForm.$setPristine(); //reset Form
              
          };
      }]).factory('ProfileService', ['$http', '$q', function($http, $q){

	return {
                    SaveSign: function(usuario){
                        return $http.post('signup', usuario).then(
									function(response){
                                                                                console.log(response.data);
                                                                                open_message(response.data);
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while updating paper ' +errResponse);
										return $q.reject(errResponse);
									}
							);
			},
                        llenarPublicaciones: function() {
					return $http.post('profile')
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while fetching expenses');
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




