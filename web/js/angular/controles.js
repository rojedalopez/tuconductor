'use strict';

angular.module('MyApp.Wall', []).controller('WallController', ['$scope', 'WallService', function($scope, WallService) {
          var self = this;
          self.usuario={mail:"", password:"",name:"", lastname:"", phone:""};
          self.publicaciones=[];
          self.publicacion={id:null, fecha:Date(), origen:"", cod_origen:"", destino:"", comentario:"", archivo:"", me_gusta:0, desde:"", num_comentario:0};
          self.comments=[];
          self.comment={id:null,fecha:Date(), origen:"", cod_origen:"", comentario:"", desde:"", id_publicacion:""};
          self.comentario = "";
          
          self.SaveComment = function(comment){
              WallService.SaveComment(comment)
		              .then(function(d){
                                if(d==="true"){
                                    console.log(self.publicacion.comment.length);
                                    self.publicacion.comment.push(self.comment);
                                    console.log(self.publicacion.comment.length);
                                }else{
                                    console.log("no entro");
                                }
                              }, 
				              function(errResponse){
					               console.error('Error while creating Paper.');
				              }	
                  );
          };
          
          self.llenarPublicaciones = function(){
              WallService.llenarPublicaciones()
                  .then(
      					       function(d) {
      						        self.publicaciones = d;
      					       },
            					function(errResponse){
            						console.error('Error while fetching Currencies');
            					}
      			       );
          };
          
          self.llenarComentarios = function(id){
              WallService.llenarComentarios(id)
                  .then(
      					       function(d) {
      						        self.comments = d;
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
           
           
          self.sendComment = function(id,codigo){
              self.selectPublicacion(id);
              self.comment.id = -1;
              self.comment.cod_origen = codigo;
              self.comment.id_publicacion = id;
              self.comment.comentario = self.comentario;
              self.SaveComment(self.comment);
          };
          
          self.selectPublicacion = function(id){
              for(var i = 0; i < self.publicaciones.length; i++){
                  if(self.publicaciones[i].id == id) {
                     self.publicacion = angular.copy(self.publicaciones[i]);
                     break;
                  }
              }
          };
          
          self.openComment = function(id){
              self.llenarComentarios(id);
              popup.modal( "show" );
          };
          
          self.reset = function(){
             
          };
          
      }]).factory('WallService', ['$http', '$q', function($http, $q){

	return {
                    SaveComment: function(comment){
                        return $http.post('comment', comment).then(
									function(response){
                                                                                console.log(response.data);
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
			},
                        llenarComentarios: function(id) {
					return $http.post('listcomments?id='+id)
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
            self.SaveUser(self.usuario); 
            self.close();
          };
          
          self.close = function(){
              self.reset();
              dialog.modal( "hide" );
          };
           
          self.opener = function(){
              self.reset();
              dialog.modal( "show" );
          };
          
          self.reset = function(){
              self.usuario={mail:"", password:"",name:"", lastname:"", phone:""};
              $scope.myForm.$setPristine(); //reset Form
              
          };
      }]).factory('SignUpService', ['$http', '$q', function($http, $q){

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
			}
		
	};

}]);


angular.module('MyApp.Profile', []).controller('ProfileController', ['$scope', 'ProfileService', function($scope, ProfileService) {
          var self = this;
          self.usuario_dp={
                cod:"", nombre:"", apellido:"", tip_doc:"", 
                num_doc:"", fecha_nac:Date(), genero:"", est_civil:"", 
                movil: "", tel:"", pais:"CO", depto:"", 
                ciudad:"", dir:"", naci:"CO", la1:false, 
                la2:false, lb1:false, lb2:false, lb3:false, 
                lc1:false, lc2:false, lc3:false, cargo:"", perfil:""};
          self.publicaciones=[];
          self.publicacion={id:null, fecha:Date(), date:"", origen:"", cod_origen:"", destino:"", comentario:"", archivo:"", me_gusta:0, desde:"", num_comentario:0};
          self.comments=[];
          self.comment={id:null,fecha:Date(), origen:"", cod_origen:"", comentario:"", desde:"", id_publicacion:""};
          self.comentario = "";
          
          self.SaveDatosPersonales = function(usuario_dp){
              ProfileService.SaveDatosPersonales(usuario_dp)
		              .then(function(d){
                                console.log(d);
                              }, 
				              function(errResponse){
					               console.error('Error while creating Paper.');
				              }	
                  );
          };

          
          self.GetUsuarioGeneral = function(){
              ProfileService.GetUsuarioGeneral()
                  .then(
      					       function(d) {
      						        self.usuario_dp = d;
                                                        self.usuario_dp.fecha_nac =  new Date(self.usuario_dp.fecha_nac);
      					       },
            					function(errResponse){
            						console.error('Error while fetching Currencies');
            					}
      			       );
          };
          
          self.llenarComentarios = function(id){
              ProfileService.llenarComentarios(id)
                  .then(
      					       function(d) {
      						        self.comments = d;
      					       },
            					function(errResponse){
            						console.error('Error while fetching Currencies');
            					}
      			       );
          };
          
          self.GetUsuarioGeneral();
          
          self.submitDP = function(cod){
              self.usuario_dp.cod = cod;
              self.usuario_dp.date = self.usuario_dp.fecha_nac.toString("yyyy-MM-dd");
              self.SaveDatosPersonales(self.usuario_dp);
          };
          
          self.submit = function() {
            self.SaveUser(self.usuario); 
            self.close();
          };
          
          self.close = function(){
              self.reset();
              dialog.modal( "hide" );
          };
           
           
          self.sendComment = function(id,codigo){
              self.selectPublicacion(id);
              self.comment.id = -1;
              self.comment.cod_origen = codigo;
              self.comment.id_publicacion = id;
              self.comment.comentario = self.comentario;
              self.SaveComment(self.comment);
          };
          
          self.selectPublicacion = function(id){
              for(var i = 0; i < self.publicaciones.length; i++){
                  if(self.publicaciones[i].id == id) {
                     self.publicacion = angular.copy(self.publicaciones[i]);
                     break;
                  }
              }
          };
          
          self.openComment = function(id){
              self.llenarComentarios(id);
              popup.modal( "show" );
          };
          
          self.reset = function(){
             
          };
          
        self.tipoIdents = [
            {ID: 'CC', Tipo: 'Cedula de ciudadania'},
            {ID: 'CE', Tipo: 'Cedula de extranjeria'},
            {ID: 'PS', Tipo: 'Pasaporte'}
        ];
          
          
        self.estCiviles = [
            {ID: 'S', Value: 'Soltero(a)'},
            {ID: 'C', Value: 'Casado(a)'},
            {ID: 'U', Value: 'Union libre'},
            {ID: 'D', Value: 'Separado(a)/Divoriado(a)'},
            {ID: 'V', Value: 'Viudo(a)'}
        ];
        
        self.Sexos = [
            {ID: 'M', Tipo: 'Masculino'},
            {ID: 'F', Tipo: 'Femenino'}
        ];
        
      }]).factory('ProfileService', ['$http', '$q', function($http, $q){

	return {
                    SaveDatosPersonales: function(usuario_dp){
                        return $http.post('usuario_dp', usuario_dp).then(
									function(response){
                                                                                console.log(response.data);
										return response.data;
									}, 
									function(errResponse){
										console.error('Error guardando datos personales ' +errResponse);
										return $q.reject(errResponse);
									}
							);
			},
                        GetUsuarioGeneral: function() {
					return $http.post('usuario_general')
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while fetching expenses');
										return $q.reject(errResponse);
									}
							);
			},
                        llenarComentarios: function(id) {
					return $http.post('listcomments?id='+id)
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



