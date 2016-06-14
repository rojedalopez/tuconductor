'use strict';

angular.module('MyApp.Wall', []).controller('WallController', ['$scope', 'WallService', function($scope, WallService) {
    var self = this;
    self.usuario={mail:"", password:"",name:"", lastname:"", phone:""};
    self.oferta={id:-1, titulo:"", descripcion:"", vacante:"", salario:0,tipo:1, estado:false, fecha:"", fecha_contratacion:"", visto:false, pais:"CO", ciudad:"", depto:-1, dapart:""};
    self.ofertas=[];
    self.hoja_vida={file:null, fecha:"", token:"", nombre:"", archivo:""};
    
    self.dptos=[];
    self.dpto={id:0, departamento:"", ciudades:[]};
    
    self.lugar = "";
    
    self.palabra_clave = "";
      
    
    self.SaveHV = function(hoja_vida){
        WallService.SaveHV(hoja_vida).then(function(d){
            if(d==="true"){
                self.getDatosUser();
            }
        },function(errResponse){
            console.error('Error while creating Paper.' + errResponse);
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
          
    self.listaOfertas = function(txt,dpto_select){
        WallService.listaOfertas(txt,dpto_select).then(function(d){
            self.ofertas = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
    
    self.buscarOferta = function(){
        WallService.listaOfertas(self.palabra_clave, (self.lugar==="")?-1:self.lugar).then(function(d){
            self.ofertas = d;            
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
          
    self.verOferta = function(id){
        WallService.verOferta(id).then(function(d) {
            console.log(d);
       },function(errResponse){
           console.error('Error while fetching Currencies');
       });
    };    
    
    self.listaDptosCiudad = function(){
        console.log("entro lista dptos");
        WallService.listaDptosCiudad().then(function(d){
            self.dptos = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
    
    self.listaDptosCiudad();
    self.listaOfertas("","-1");
    self.getDatosUser();
    
    
    self.submit = function() {
        self.SaveUser(self.usuario); 
        self.close();
    };
    
    self.editOferta = function(id){
        for(var i = 0; i < self.ofertas.length; i++){
            if(self.ofertas[i].id === id) {
               self.oferta = angular.copy(self.ofertas[i]);
               self.oferta.fecha_contratacion = new Date(self.oferta.fecha_contratacion);
               self.oferta.fecha_contratacion = self.oferta.fecha_contratacion.toString("yyyy/MM/dd");
               self.oferta.fecha = new Date(self.oferta.fecha);
               self.oferta.fecha = self.oferta.fecha.toString("yyyy/MM/dd");
               console.log(self.oferta.visto);
               dialog_oferta.modal( "show" );
               break;
            }
        }
    };

    
    
    self.close = function(){
        self.reset();
        dialog.modal( "hide" );
    };
           
    self.ver = function (id){
        console.log("entro aca id");
        self.verOferta(id);
        dialog_oferta.modal( "hide" );
    };           
    

    self.reset = function(){

    };
          
}]).factory('WallService', ['$http', '$q', function($http, $q){
    return {
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
	},
        listaOfertas: function(txt, dpto_select) {
            return $http.post('../list_oferta_empleado', {'txt':txt,'dpto_select':dpto_select}).then(function(response){
                return response.data;
            },function(errResponse){
                console.error('Error while fetching expenses');
                return $q.reject(errResponse);
            });
        },
        verOferta: function(id) {
            return $http.post('../vista_oferta', {"id":id}).then(function(response){
                return response.data;
            },function(errResponse){
                console.error('Error while fetching expenses');
                return $q.reject(errResponse);
            });
        },listaDptosCiudad: function() {
            return $http.post('../assets/colombia.json').then(function(response){
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
}]).controller('WallEmpresaController', ['$scope', 'WallEmpresaService', function($scope, WallEmpresaService) {
    var self = this;
    self.empleado={email:"", cod:"",nombre:"", apellido:"", puntaje:0, hoja_vida:"",experiencia:0};
    self.empleados=[];
    
    self.info_empresa={nit:"",r_social:"", dir:"", tel:"", cam_com:"", doc_replegal:"",nombre_replegal:"", 
    email_replegal:"", tel_replegal:"", demo:false, id_plan:0, tkn_disp:0, ofertas_disp:0, ult_compra:"", vence_compra:"", tot_tkn:0, tot_ofr:0};
    self.list_trazas=[];
    self.traza={fecha:"",hora:"",evento:""};
    
    self.GetEmpresaGeneral = function(){
        WallEmpresaService.GetEmpresaGeneral().then(function(d) {
            self.info_empresa = d;
            self.list_trazas = d.trazas;
            console.log(self.info_empresa);
        },function(errResponse){
            console.error('Error while fetching Currencies');
        });
    };
    
    self.llenarEmpleados = function(){
        WallEmpresaService.llenarEmpleados().then(function(d) {
            self.empleados = d;
        },function(errResponse){
            console.error('Error while fetching Currencies');
        });
    };
        
    self.GetEmpresaGeneral();    
    self.llenarEmpleados();
    
    self.dtOptions = {
            bAutoWidth:true,
            stateSave: true,
            language: {
                "lengthMenu": "Mostrar _MENU_ registros",
                "zeroRecords": "No se encontraron registros",
                "info": "",
                "infoEmpty": "No se encontraron registros",
                "infoFiltered": "(filtrado de _MAX_ registros)",
                "search": "Buscar"
            }
        };
        
          
}]).factory('WallEmpresaService', ['$http', '$q', function($http, $q){
    return {
        llenarEmpleados: function() {
            return $http.post('../list_employes').then(function(response){
		return response.data;
            },function(errResponse){
                console.error('Error while fetching expenses');
                return $q.reject(errResponse);
            });
	},
        GetEmpresaGeneral: function() {
            return $http.post('../empresa_general').then(function(response){
                return response.data;
            },function(errResponse){
                console.error('Error while fetching expenses');
                return $q.reject(errResponse);
            });
	}	
    };
}]);