'use strict';

angular.module('MyApp.Oferta', []).controller('OfertaController', ['$scope', 'OfertaService', function($scope, OfertaService) {
    var self = this;
    self.oferta={id:-1, titulo:"", descripcion:"", vacante:"", salario:0,tipo:1, estado:false, 
    fecha_creacion:"", fecha_contratacion:"", pais:"CO", ciudad:"", depto:-1, dapart:"", eliminar:false };

    self.ofertas=[];
    
    self.Paises=[];
    self.dptos=[];
    self.dpto={id:0, departamento:"", ciudades:[]};
    self.ciudades=[];
    
    self.SaveOferta = function(oferta){
        OfertaService.SaveOferta(oferta).then(function(d){
            if(d==="true"){
                dialog_oferta.modal( "hide" );
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
          
    self.lengthValidator = function(texto, length) {
        if(!texto){return;}

        if (texto.length < length) {
                return "El campo debe tener como minimo " + length + " caracteres de largo";
        }
    
        return true;
    };
    
    self.selectPais = function(pais){
        if(pais==="CO"){
            self.colombia = true;  
        }else{
            self.colombia = false; 
            self.oferta.depart = "";
            self.oferta.ciudad = "";
            self.oferta.depto=-1;
        }
    };
    
    self.listaDptosCiudad = function(){
        OfertaService.listaDptosCiudad().then(function(d){
            self.dptos = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
    
    self.listaPaises = function() {
        OfertaService.listaPaises().then(function(d){
            self.Paises = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };

    self.selectDpto = function(id){
        for(var i = 0; i < self.dptos.length; i++){
            if(self.dptos[i].id === id) {
               self.dpto = angular.copy(self.dptos[i]);
               self.ciudades=self.dpto.ciudades;
               self.oferta.depart = self.dpto.departamento;
               break;
            }
        }
    };
    
    self.GetUsuarioGeneral = function(){
        OfertaService.GetUsuarioGeneral().then(function(d) {
            self.ofertas = d.oferta;
       },function(errResponse){
           console.error('Error while fetching Currencies');
       });
    };
       
    self.listaOfertas();
    self.listaPaises();
    self.listaDptosCiudad();
    
    //self.GetUsuarioGeneral();

    self.submitOferta = function(){
        self.oferta.fecha_contratacion = self.oferta.fecha_contratacion.toString("yyyy-MM-dd");
        self.SaveOferta(self.oferta);
    };

    self.close = function(){
        self.reset();
        dialog_oferta.modal( "hide" );
    };

    self.openOferta = function(){
        console.log("eentro aca");
        self.resetOferta();
        dialog_oferta.modal( "show" );
    };
           
               
    self.editOferta = function(id){
        for(var i = 0; i < self.ofertas.length; i++){
            if(self.ofertas[i].id === id) {
               self.oferta = angular.copy(self.ofertas[i]);
               self.oferta.fecha_contratacion = new Date(self.oferta.fecha_contratacion);
               dialog_oferta.modal( "show" );
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
        self.oferta={id:-1, titulo:"", descripcion:"", vacante:"", salario:0,tipo:1, estado:false, 
        fecha_creacion:"", fecha_contratacion:"", pais:"CO", ciudad:"", depto:-1, dapart:"", eliminar:false };
        $scope.form_oferta.reset();
      };
        
}]).factory('OfertaService', ['$http', '$q', function($http, $q){

	return {
                    
            SaveOferta: function(oferta){
                return $http.post('../oferta', oferta).then(function(response){
                    return response.data;
                },function(errResponse){
                    console.error('Error guardando datos personales ' +errResponse);
                    return $q.reject(errResponse);
                });
            },
            listaOfertas: function() {
                return $http.post('../list_oferta').then(function(response){
                    return response.data;
                }, 
                function(errResponse){
                    console.error('Error while fetching expenses');
                    return $q.reject(errResponse);
                });
            },
            listaDptosCiudad: function() {
                return $http.post('../assets/colombia.json').then(function(response){
                    return response.data;
                },function(errResponse){
                    console.error('Error while fetching expenses');
                    return $q.reject(errResponse);
                });
            },
            listaPaises: function() {
                return $http.post('../assets/paises.json').then(function(response){
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
}; })
.controller('PlanesController', ['$scope', 'PlanesService', function($scope, PlanesService) {
    var self = this;
    self.plan={id:-1, nombre:"", visual:0, oferta:0, duracion:0,valor:0};
    self.transaccion={id:-1, id_plan:-1, visual:0, oferta:0, valor:0, iso_cur:"COP", medio:"W"};
    self.formulario ={merchant_id:'', po_id: '', iso_currency: '', amount: 0,
        pv_checksum: '',lifetime: 0, error:0};
    self.planes=[];
    
    self.SaveCompraPlanes = function(transaccion){
        PlanesService.SaveCompraPlanes(transaccion).then(function(d){
            self.formulario = d;
            self.transaccion.id = self.formulario.po_id;
            form_compra.modal('show');
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };

    self.compra = function(id){
        for(var i = 0; i < self.planes.length; i++){
            if(self.planes[i].id === id) {
                self.plan = angular.copy(self.planes[i]);
                self.transaccion.id_plan = self.plan.id;
                self.transaccion.visual = self.plan.visual;
                self.transaccion.oferta = self.plan.oferta;
                self.transaccion.valor = self.plan.valor;                
                self.SaveCompraPlanes(self.transaccion);
                break;
            }
        }
    };
    
    self.listaPlanes = function(){
        PlanesService.listaPlanes().then(function(d){
            self.planes = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
          
    self.GetUsuarioGeneral = function(){
        PlanesService.GetUsuarioGeneral().then(function(d) {
            self.Planess = d.Planes;
       },function(errResponse){
           console.error('Error while fetching Currencies');
       });
    };
       
    self.listaPlanes();

    self.submitCompraPlanes = function(){
        self.SaveCompraPlanes(self.Planes);
    };
       
}]).factory('PlanesService', ['$http', '$q', function($http, $q){

	return {
            SaveCompraPlanes: function(transaccion){
                return $http.post('../pago_plan', transaccion).then(function(response){
                    return response.data;
                },function(errResponse){
                    console.error('Error guardando datos personales ' +errResponse);
                    return $q.reject(errResponse);
                });
            },
            listaPlanes: function() {
                return $http.post('../list_planes').then(function(response){
                    return response.data;
                }, 
                function(errResponse){
                    console.error('Error while fetching expenses');
                    return $q.reject(errResponse);
                });
            }
	};
}]);
