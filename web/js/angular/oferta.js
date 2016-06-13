'use strict';

angular.module('MyApp.Oferta', []).controller('OfertaController', ['$scope', 'OfertaService', function($scope, OfertaService) {
    var self = this;
    self.oferta={id:-1, titulo:"", descripcion:"", vacante:"", salario:0,tipo:1, estado:false, fecha_creacion:"", fecha_contratacion:""};
    self.ofertas=[];
    self.SaveOferta = function(oferta){
        OfertaService.SaveOferta(oferta).then(function(d){
            if(d==="true"){
                dialog.modal( "hide" );
                self.resetOferta();
                self.listaOfertas();
            }
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
          
    self.listaOfertas = function(){
        OfertaService.listaOfertas().then(function(d){
            self.ofertas = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
          

    self.listaOfertas();
    
    self.GetUsuarioGeneral = function(){
        OfertaService.GetUsuarioGeneral().then(function(d) {
            self.ofertas = d.oferta;
       },function(errResponse){
           console.error('Error while fetching Currencies');
       });
    };
          
          
          //self.GetUsuarioGeneral();
          
          self.submitOferta = function(){
              self.oferta.fecha_contratacion = self.oferta.fecha_contratacion.toString("yyyy-MM-dd");
              self.SaveOferta(self.oferta);
          };
          
          self.close = function(){
              self.reset();
              dialog.modal( "hide" );
          };
          
          self.openOferta = function(){
              console.log("eentro aca");
              self.resetOferta();
              dialog.modal( "show" );
          };
           
               
        self.editOferta = function(id){
            for(var i = 0; i < self.ofertas.length; i++){
                if(self.ofertas[i].id === id) {
                   self.oferta = angular.copy(self.ofertas[i]);
                   self.oferta.fecha_contratacion = new Date(self.oferta.fecha_contratacion);
                   dialog.modal( "show" );
                   break;
                }
            }
          };
          
        
        self.TipoContrato = [
            {"ID":1,"Value":"Termino Indefinido"},
            {"ID":2,"Value":"Termino Definido"},
            {"ID":3,"Value":"Obra Labor"},
            {"ID":4,"Value":"Por Horas"}
        ];
        
        self.resetOferta = function(){
            self.oferta={id:-1, titulo:"", descripcion:"", vacante:"", salario:0, tipo:1, estado:false, fecha_creacion:"", fecha_contratacion:"",};
            $scope.form_oferta.$setPristine();
          };
        
      }]).factory('OfertaService', ['$http', '$q', function($http, $q){

	return {
                    
                        SaveOferta: function(oferta){
                        return $http.post('../oferta', oferta).then(
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
                        listaOfertas: function() {
					return $http.post('../list_oferta')
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
