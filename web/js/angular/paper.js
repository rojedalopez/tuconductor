'use strict';

angular.module('MyApp.Papers', []).controller('ControllerNuevo', ['$scope', 'PaperService', function($scope, PaperService) {
          var self = this;
          self.lista1 = [];
          self.lista2 = [];
          self.obj={valor:0};
        
          self.fetchAllPapers = function(){
              PaperService.fetchAllPapers()
                  .then(
      					       function(d) {
      						        self.lista1 = d.lista1;
                                                        self.lista2 = d.lista2;
      					       },
            					function(errResponse){
            						console.error('Error while fetching Currencies');
            					}
      			       );
          };
          
         
          self.fetchAllPapers();
          
         
      }]).factory('PaperService', ['$http', '$q', function($http, $q){

	return {
                    fetchAllPapers: function() {
					return $http.post('prueba')
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

}]);




