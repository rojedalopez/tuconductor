'use strict';

angular.module('MyApp.Wall', []).controller('WallController', ['$scope', 'WallService', 'PagerService', 
    function($scope, WallService, PagerService) {
    var self = this;
    self.usuario={mail:"", password:"",name:"", lastname:"", phone:""};
    self.oferta={id:-1, titulo:"", descripcion:"", vacante:"", salario:0,tipo:1, estado:false, fecha:"", fecha_contratacion:"", visto:false, pais:"CO", ciudad:"", depto:-1, dapart:""};
    self.ofertas=[];
    self.hoja_vida={file:null, fecha:"", token:"", nombre:"", archivo:""};
    
    self.dptos=[];
    self.dpto={id:0, departamento:"", ciudades:[]};
    self.tamano = 0;
    self.lugar = "";
    self.mensaje = "Se ha ejecutado el proceso correctamente...";
    self.error = false;
    self.palabra_clave = "";
    self.pag = 1;
      
    self.pager = {};
    
    self.setPage = function(page){
        console.log(page);
        if (page < 1 || page > self.pager.totalPages) {
            return;
        }
        self.pag = page;
        self.listaOfertas(page);
    };
    
    self.listaOfertas = function(pagina){
        console.log(pagina);
        WallService.listaOfertas(self.palabra_clave, (self.lugar===null||self.lugar==="")?"-1":self.lugar,pagina).then(function(d){
            self.ofertas = d.lista;
            self.tamano = d.tamano;
            self.pager = PagerService.GetPager(self.tamano, pagina);
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
    
    self.initController = function() {
        // initialize to page 1
        self.setPage(1);
    };
        
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
       
    self.buscarOferta = function(){
        WallService.listaOfertas(self.palabra_clave, (self.lugar===null)?"-1":self.lugar,1).then(function(d){
            self.ofertas = d.lista;  
            self.setPage(1);
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
          
    self.verOferta = function(id){
        WallService.verOferta(id).then(function(d) {
            btn_aplicacion.button("reset");
            dialog_oferta.modal( "hide" );
            if(d==="1"){
                Modal_Mensaje.modal("show");
                self.setPage(self.pag);
            }else if(d==="2"){
                self.error = true;
                self.mensaje = "Se ha ocurrido un error, no puede aplicar dos veces a una oferta...";
                Modal_Mensaje.modal("show");
            }else if(d==="-1"){
                self.error = true;
                self.mensaje = "Se ha ocurrido un error, no puede aplicar a una oferta, hasta no ser admitido por nuestro equipo...";
                Modal_Mensaje.modal("show");
            }
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
    self.getDatosUser();
    self.initController();
    
    self.submit = function() {
        self.SaveUser(self.usuario); 
        self.close();
    };
    
    self.formatDate = function(date){
        var dateOut = new Date(date);
        return dateOut;
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
        btn_aplicacion.button("loading");
        self.verOferta(id);
    };           
    

    self.reset = function(){

    };
          
}]).factory('PagerService', ['$http', '$q', function($http, $q){
    // default to first page
    // service definition
        var service = {};

        service.GetPager = GetPager;

        return service;

        // service implementation
        function GetPager(totalItems, currentPage, pageSize) {
            // default to first page
            currentPage = currentPage || 1;

            // default page size is 10
            pageSize = pageSize || 20;

            // calculate total pages
            var totalPages = Math.ceil(totalItems / pageSize);

            var startPage, endPage;
            if (totalPages <= 10) {
                // less than 10 total pages so show all
                startPage = 1;
                endPage = totalPages;
            } else {
                // more than 10 total pages so calculate start and end pages
                if (currentPage <= 6) {
                    startPage = 1;
                    endPage = 10;
                } else if (currentPage + 4 >= totalPages) {
                    startPage = totalPages - 9;
                    endPage = totalPages;
                } else {
                    startPage = currentPage - 5;
                    endPage = currentPage + 4;
                }
            }

            // calculate start and end item indexes
            var startIndex = (currentPage - 1) * pageSize;
            var endIndex = startIndex + pageSize;

            // create an array of pages to ng-repeat in the pager control
            var pages = _.range(startPage, endPage + 1);

            // return object with all pager properties required by the view
            return {
                totalItems: totalItems,
                currentPage: currentPage,
                pageSize: pageSize,
                totalPages: totalPages,
                startPage: startPage,
                endPage: endPage,
                startIndex: startIndex,
                endIndex: endIndex,
                pages: pages
            };
        }
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
        listaOfertas: function(txt, dpto_select, pagina) {
            return $http.post('../list_oferta_empleado', {'txt':txt,'dpto_select':dpto_select,'pagina':pagina}).then(function(response){
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
    self.empleado={email:"", cod:"",nombre:"", apellido:"", puntaje:0, hoja_vida:"",experiencia:0, adquirir:false};
    self.empleados=[];
    
    self.info_empresa={nit:"",r_social:"", dir:"", tel:"", cam_com:"", doc_replegal:"",nombre_replegal:"", 
    email_replegal:"", tel_replegal:"", demo:false, id_plan:0, tkn_disp:0, ofertas_disp:0, ult_compra:"", vence_compra:"", tot_tkn:0, tot_ofr:0};
    self.list_trazas=[];
    self.traza={fecha:"",hora:"",evento:""};
    self.mensajeModal="";
    
    self.GetEmpresaGeneral = function(){
        WallEmpresaService.GetEmpresaGeneral().then(function(d) {
            self.info_empresa = d;
            self.list_trazas = d.trazas;
            console.log(self.info_empresa);
        },function(errResponse){
            console.error('Error while fetching Currencies');
        });
    };
    
    self.ComprarEmpleado = function(cod){
        WallEmpresaService.ComprarEmpleado(cod).then(function(d) {
            if(d==="true"){
                self.mensajeModal="Usted ha adquirido la informacion correctamente y ha sido enviada a su correo.";
                btn_add_compra.button('reset');
                self.llenarEmpleados();
            }
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
    
    self.adquirirEmp = function(cod){
        self.empleado.adquirir = true;
        self.ComprarEmpleado(cod);
        btn_add_compra.button('loading');
    };
    
    self.openAdquirir = function(cod){
        for(var i = 0; i < self.empleados.length; i++){
            if(self.empleados[i].cod === cod) {
               self.empleado = angular.copy(self.empleados[i]);
               Modal_confirmacion.modal("show");
               break;
            }
        }
    };
    
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
	}, ComprarEmpleado: function(cod) {
            return $http.post('../compra_empleado', {'cod':cod}).then(function(response){
                return response.data;
            },function(errResponse){
                console.error('Error while fetching expenses');
                return $q.reject(errResponse);
            });
	}	
    };
}]);