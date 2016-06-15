'use strict';

angular.module('MyApp.Inbox', []).controller('InboxController', ['$scope', 'InboxService', function($scope, InboxService) {
    var self = this;
    self.oferta={id:-1, titulo:"", descripcion:"", vacante:"", salario:0,tipo:1, estado:false, fecha_creacion:"", fecha_contratacion:"", pais:"CO", ciudad:"", depto:-1, dapart:"" };
    self.ofertas=[];
    
    self.Paises=[];
    self.dptos=[];
    self.dpto={id:0, departamento:"", ciudades:[]};
    self.ciudades=[];
    
    self.SaveInbox = function(oferta){
        InboxService.SaveInbox(oferta).then(function(d){
            if(d==="true"){
                dialog_oferta.modal( "hide" );
                self.resetInbox();
                self.listaInboxs();
            }
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
          
    self.listaInboxs = function(){
        InboxService.listaInboxs().then(function(d){
            self.ofertas = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
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
        InboxService.listaDptosCiudad().then(function(d){
            self.dptos = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
    
    self.listaPaises = function() {
        InboxService.listaPaises().then(function(d){
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
        InboxService.GetUsuarioGeneral().then(function(d) {
            self.ofertas = d.oferta;
       },function(errResponse){
           console.error('Error while fetching Currencies');
       });
    };
       
    self.listaInboxs();
    self.listaPaises();
    self.listaDptosCiudad();
    
    //self.GetUsuarioGeneral();

    self.submitInbox = function(){
        self.oferta.fecha_contratacion = self.oferta.fecha_contratacion.toString("yyyy-MM-dd");
        self.SaveInbox(self.oferta);
    };

    self.close = function(){
        self.reset();
        dialog_oferta.modal( "hide" );
    };

    self.openInbox = function(){
        console.log("eentro aca");
        self.resetInbox();
        dialog_oferta.modal( "show" );
    };
           
               
    self.editInbox = function(id){
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

    self.resetInbox = function(){
        self.oferta={id:-1, titulo:"", descripcion:"", vacante:"", salario:0, tipo:1, estado:false, fecha_creacion:"", fecha_contratacion:"",};
        $scope.form_oferta.$setPristine();
      };
        
}]).factory('InboxService', ['$http', '$q', function($http, $q){

	return {
                    
            SaveInbox: function(oferta){
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
            listaInboxs: function() {
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
}; });
