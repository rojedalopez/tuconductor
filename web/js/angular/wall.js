'use strict';

angular.module('MyApp.Wall', []).controller('WallController', ['$scope', 'WallService', function($scope, WallService) {
    var self = this;
    self.usuario={mail:"", password:"",name:"", lastname:"", phone:""};
    self.publicaciones=[];
    self.publicacion={id:null, fecha:Date(), origen:"", cod_origen:"", destino:"", comentario:"", archivo:"", me_gusta:0, desde:"", num_comentario:0};
    self.comments=[];
    self.comment={id:null,fecha:Date(), origen:"", cod_origen:"", comentario:"", desde:"", id_publicacion:""};
    self.comentario = "";
    self.hoja_vida={file:null, fecha:"", token:"", nombre:"", archivo:""};

    self.SaveHV = function(hoja_vida){
        WallService.SaveHV(hoja_vida).then(function(d){
            if(d==="true"){
                self.getDatosUser();
            }
        },function(errResponse){
            console.error('Error while creating Paper.' + errResponse);
        });
    };
          
    self.SaveComment = function(comment){
        WallService.SaveComment(comment).then(function(d){
            if(d==="true"){
                console.log(self.publicacion.comment.length);
                self.publicacion.comment.push(self.comment);
                console.log(self.publicacion.comment.length);
            }else{
                console.log("no entro");
            }
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
          
    self.submitHV = function (){
        self.SaveHV(self.hoja_vida);
    };
          
    self.getDatosUser = function(){
        WallService.getDatosUser().then(function(d) {
            self.hoja_vida = d;
        },function(errResponse){
            console.error('Error while fetching Currencies');
        });
    };
          
    self.llenarPublicaciones = function(){
        WallService.llenarPublicaciones().then(function(d) {
            self.publicaciones = d;
        },function(errResponse){
            console.error('Error while fetching Currencies');
        });
    };
          
    self.llenarComentarios = function(id){
        WallService.llenarComentarios(id).then(function(d) {
            self.comments = d;
        },function(errResponse){
            console.error('Error while fetching Currencies');
        });
    };
          
    self.llenarPublicaciones();
    self.getDatosUser();
          
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
            return $http.post('../comment', comment).then(function(response){
                console.log(response.data);
                return response.data;
            },function(errResponse){
                console.error('Error while updating paper ' +errResponse);
                return $q.reject(errResponse);
            });
	},
        llenarPublicaciones: function() {
            return $http.post('../profile').then(function(response){
		return response.data;
            },function(errResponse){
                console.error('Error while fetching expenses');
                return $q.reject(errResponse);
            });
	},
        llenarComentarios: function(id) {
            return $http.post('../listcomments?id='+id).then(function(response){
                return response.data;
            },function(errResponse){
                console.error('Error while fetching expenses');
                return $q.reject(errResponse);
            });
        },
        
        SaveHV: function(hoja_vida){
            var fd = new FormData();
            fd.append("file", hoja_vida.file);
            
            return $http.post('../upload_hv', fd, {
                transformRequest: angular.identity,
                headers: {'Content-Type': undefined}
            }).then(function(response){
                console.log(response);
                return response.data;
            },function(errResponse){
                console.error('Error while updating paper ' +errResponse);
                return $q.reject(errResponse);
            });
	},
        getDatosUser: function(){
            return $http.post('../usuario_info').then(function(response){
                console.log(response);
                return response.data;
            },function(errResponse){
		console.error('Error while updating paper ' +errResponse);
		return $q.reject(errResponse);
            });
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
}; 
}).directive('uploaderModel', ["$parse", function($parse){
    return{
        restrict : 'A',
        link : function(scope, iElement, iAttrs){
            iElement.on("change", function(e){
                var f = iElement[0].files[0];
                var reader = new FileReader();
                reader.onload = (function(theFile) {
                    return function(e) {
                      // Render thumbnail.
                      //scope.ctrl.paper.img = e.target.result;
                    };
                })(f);

                reader.readAsDataURL(f);
                $parse(iAttrs.uploaderModel).assign(scope, f); 
            });
        }
    };
}]).controller('WallEmpresaController', ['$scope', 'WallEmpresaService', function($scope, WallEmpresaService) {
    var self = this;
    self.empleado={email:"", cod:"",nombre:"", apellido:"", puntaje:0, hoja_vida:"",experiencia:0};
    self.empleados=[];
    
    self.llenarEmpleados = function(){
        WallEmpresaService.llenarEmpleados().then(function(d) {
            self.empleados = d;
        },function(errResponse){
            console.error('Error while fetching Currencies');
        });
    };
          
    self.llenarEmpleados();
    
          
}]).factory('WallEmpresaService', ['$http', '$q', function($http, $q){
    return {
        llenarEmpleados: function() {
            return $http.post('../list_employes').then(function(response){
		return response.data;
            },function(errResponse){
                console.error('Error while fetching expenses');
                return $q.reject(errResponse);
            });
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
}; 
}).directive('uploaderModel', ["$parse", function($parse){
    return{
        restrict : 'A',
        link : function(scope, iElement, iAttrs){
            iElement.on("change", function(e){
                var f = iElement[0].files[0];
                var reader = new FileReader();
                reader.onload = (function(theFile) {
                    return function(e) {
                      // Render thumbnail.
                      //scope.ctrl.paper.img = e.target.result;
                    };
                })(f);

                reader.readAsDataURL(f);
                $parse(iAttrs.uploaderModel).assign(scope, f); 
            });
        }
    };
}]);