'use strict';

angular.module('MyApp.Profile', []).controller('ProfileController', ['$scope', 'ProfileService', function($scope, ProfileService) {
    var self = this;
    self.usuario_dp={
          cod:"", nombre:"", apellido:"", tip_doc:"", 
          num_doc:"", fecha_nac:"", genero:"", est_civil:"", 
          movil: "", tel:"", pais:"CO", depto:-1, depart:"" ,
          ciudad:"", dir:"", naci:"CO", la1:false, 
          la2:false, lb1:false, lb2:false, lb3:false, 
          lc1:false, lc2:false, lc3:false, cargo:"", perfil:""};
      
    self.colombia = true;  

    self.Anios=[]; 
          
    self.experiencias=[];
    self.exp_laboral={id:-1, empresa:"", cargo:"", salario:0, bonos:0, supervisor:"", telefono:"", pais:"CO", dpto:"", 
        ciudad:"", direccion:"", mes_inicio:0, anio_inicio:0, mes_fin:0, anio_fin:0, labora:false, retiro:"", exp_meses:0};

    self.formaciones=[];
    self.formacion={id:-1, c_educativo:"", nivel_estudio: "", area_estudio:"", estado:2, mes_inicio:0, anio_inicio:0, mes_fin:0, anio_fin:0};
    
    self.Paises=[];
    self.dptos=[];
    self.dpto={id:0, departamento:"", ciudades:[]};
    self.ciudades=[];
    
    self.SaveDatosPersonales = function(usuario_dp){
        ProfileService.SaveDatosPersonales(usuario_dp).then(function(d){
            btn_guardar_cambios.button('reset');
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };

    self.SaveExpUsuario = function(exp_laboral){
        ProfileService.SaveExpUsuario(exp_laboral).then(function(d){
            if(d==="true"){
                form_experiencia.modal( "hide" );
                self.resetExp();
                self.listaExperiencias();
            }
        },function(errResponse){
            console.error('Error while creating Paper.');
	});
    };
          
    self.SaveFormacion = function(formacion){
        ProfileService.SaveFormacion(formacion).then(function(d){
            if(d==="true"){
                form_formacion.modal( "hide" );
                self.resetForm();
                self.listaFormaciones();
            }
        },function(errResponse){
            console.error('Error while creating Paper.');
	});
    };
          
    self.listaExperiencias = function(){
        ProfileService.listaExperiencias().then(function(d){
            self.experiencias = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
	});
    };
          
    self.listaFormaciones = function(){
        ProfileService.listaFormaciones().then(function(d){
            self.formaciones = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
    
    self.selectPais = function(pais){
        if(pais==="CO"){
            self.colombia = true;  
        }else{
            self.colombia = false; 
            self.usuario_dp.depart = "";
            self.usuario_dp.ciudad = "";
            self.usuario_dp.depto=-1;
        }
    };
    
    self.listaDptosCiudad = function(){
        ProfileService.listaDptosCiudad().then(function(d){
            self.dptos = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
    
    self.listaPaises = function() {
        ProfileService.listaPaises().then(function(d){
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
               self.usuario_dp.depart = self.dpto.departamento;
               break;
            }
        }
    };
          
    self.GetUsuarioGeneral = function(){
        ProfileService.GetUsuarioGeneral().then(function(d) {
            self.usuario_dp = d;
            console.log(self.usuario_dp.fecha_nac);
            self.usuario_dp.fecha_nac =  new Date(self.usuario_dp.fecha_nac);
            console.log(self.usuario_dp.fecha_nac);
            self.experiencias = d.exp_laborales;
            self.formaciones = d.formacion;
            self.selectDpto(self.usuario_dp.depto);
        },function(errResponse){
            console.error('Error while fetching Currencies');
        });
    };
          
    self.llenarAnios = function(){
        var Anio = new Date().getFullYear();
        for(var a = Anio; a >= Anio - 100; a--){
            self.Anios.push({ID:a, Year:a});
        }
    };
          
    self.llenarAnios();
    self.GetUsuarioGeneral();
    self.listaPaises();
    self.listaDptosCiudad();
    
    self.submitDP = function(){
        console.log("aqui entro");
        btn_guardar_cambios.button('loading');
        self.usuario_dp.date = self.usuario_dp.fecha_nac.toString("yyyy-MM-dd");
        self.SaveDatosPersonales(self.usuario_dp);
    };
          
    self.submitExp = function(){
        self.SaveExpUsuario(self.exp_laboral);
    };
          
    self.submitForm = function(){
        self.SaveFormacion(self.formacion);
    };
          
    self.submit = function() {
      self.SaveUser(self.usuario); 
      self.close();
    };
          
    self.close = function(){
        self.reset();
        dialog.modal( "hide" );
    };
          
    self.openExp = function(){
        self.resetExp();
        form_experiencia.modal( "show" );
    };
           
    self.openForm = function(){
        self.resetExp();
        form_formacion.modal( "show" );
    };   
        
    self.editExp = function(id){
        for(var i = 0; i < self.experiencias.length; i++){
            if(self.experiencias[i].id === id) {
               self.exp_laboral = angular.copy(self.experiencias[i]);
               form_experiencia.modal( "show" );
               break;
            }
        }
    };
          
        
    self.editForm = function(id){
        for(var i = 0; i < self.formaciones.length; i++){
            if(self.formaciones[i].id === id) {
               self.formacion = angular.copy(self.formaciones[i]);
               form_formacion.modal( "show" );
               break;
            }
        }
    };
        
        
    self.resetExp = function(){
        self.exp_laboral={id:-1, empresa:"", cargo:"", salario:0, bonos:0, supervisor:"", telefono:"", pais:"CO", dpto:"", 
         ciudad:"", direccion:"", mes_inicio:0, anio_inicio:0, mes_fin:0, anio_fin:0, labora:false, retiro:"", exp_meses:0};
        $scope.exp_laboral.$setPristine();
    };
          
    self.resetForm = function(){
        self.formacion={id:-1, c_educativo:"", nivel_estudio: "", area_estudio:"", estado:2, mes_inicio:0, anio_inicio:0, mes_fin:0, anio_fin:0};
        $scope.form_formacion.$setPristine();
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

    self.Meses = [
        {ID: 1, Mes: 'Enero'},
        {ID: 2, Mes: 'Febrero'},
        {ID: 3, Mes: 'Marzo'},
        {ID: 4, Mes: 'Abril'},
        {ID: 5, Mes: 'Mayo'},
        {ID: 6, Mes: 'Junio'},
        {ID: 7, Mes: 'Julio'},
        {ID: 8, Mes: 'Agosto'},
        {ID: 9, Mes: 'Septiembre'},
        {ID: 10, Mes: 'Octubre'},
        {ID: 11, Mes: 'Noviembre'},
        {ID: 12, Mes: 'Diciembre'}
    ];

    self.NvlFormacion = [
        {'ID': 1, 'Value': 'Educación Basica Primaria'},
        {'ID': 2, 'Value': 'Educación Basica Secundaria'},
        {'ID': 3, 'Value': 'Bachillerato / educacion Media'},
        {'ID': 4, 'Value': 'Universidad / Carrera Tecnica'}  
    ];
        
}]).factory('ProfileService', ['$http', '$q', function($http, $q){
    return {
        SaveDatosPersonales: function(usuario_dp){
            return $http.post('../usuario_dp', usuario_dp).then(function(response){
                console.log(response.data);
                return response.data;
            },function(errResponse){
                console.error('Error guardando datos personales ' +errResponse);
                return $q.reject(errResponse);
            });
	},
        SaveFormacion: function(formacion){
            return $http.post('../formacion_usuario', formacion).then(function(response){
                console.log(response.data);
                return response.data;
            },function(errResponse){
                console.error('Error guardando datos personales ' +errResponse);
                return $q.reject(errResponse);
            });
	},
        SaveExpUsuario: function(exp_laboral){
            return $http.post('../experiencia_usuario', exp_laboral).then(function(response){
                console.log(response.data);
                return response.data;
            }, 
            function(errResponse){
                    console.error('Error guardando datos personales ' +errResponse);
                    return $q.reject(errResponse);
            });
        },
        GetUsuarioGeneral: function() {
            return $http.post('../usuario_general').then(function(response){
                return response.data;
            },function(errResponse){
                console.error('Error while fetching expenses');
                return $q.reject(errResponse);
            });
	},
        listaExperiencias: function() {
            return $http.post('../list_experiencia').then(function(response){
                return response.data;
            },function(errResponse){
                console.error('Error while fetching expenses');
                return $q.reject(errResponse);
            });
        },
        listaFormaciones: function() {
            return $http.post('../list_formacion').then(function(response){
                return response.data;
            },function(errResponse){
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

}]).controller('ProfileAdminController', ['$scope', 'ProfileAdminService', function($scope, ProfileAdminService) {
    var self = this;
    self.traza={fecha:"",hora:"",evento:""};
    //self.list_trazas=[];
    self.empresa={nit:"",r_social:"", dir:"", tel:"", cam_com:"", doc_replegal:"",nombre_replegal:"", 
    email_replegal:"", tel_replegal:"", demo:false, id_plan:0, tkn_disp:0, ofertas_disp:0, ult_compra:"", vence_compra:"", tot_tkn:0, tot_ofr:0, trazas:[]}
    self.list_empresas=[];    
    
    self.llenarEmpresas = function(){
        ProfileAdminService.llenarEmpresas().then(function(d) {
            self.list_empresas = d;
        },function(errResponse){
            console.error('Error while fetching Currencies');
        });
    };
        
    self.edit_empresa = function(id){
        for(var i = 0; i < self.list_empresas.length; i++){
            if(self.list_empresas[i].nit === id) {
               self.empresa = angular.copy(self.list_empresas[i]);
               self.empresa.ult_compra=new Date(self.empresa.ult_compra);
               self.empresa.vence_compra=new Date(self.empresa.vence_compra);
               modal_editempresa.modal( "show" );
               break;
            }
        }
    };
    
    self.ModificarEmpresas = function(empresa){
        ProfileAdminService.ModificarEmpresas(empresa).then(function(d) {
            if(d==="true"){
                btn_add_empresa.button('reset');
                modal_editempresa.modal( "hide" );
                self.llenarEmpresas();
            }
        },function(errResponse){
            console.error('Error while fetching Currencies');
        });
    };
    
    self.llenarEmpresas();
    
    self.submitEmp = function(){
        btn_add_empresa.button('loading');
        self.ModificarEmpresas(self.empresa);
    };
    
    self.open_info_adicional = function(id){
        for(var i = 0; i < self.list_empresas.length; i++){
            if(self.list_empresas[i].nit === id) {
               self.empresa = angular.copy(self.list_empresas[i]);
               self.empresa.ult_compra=new Date(self.empresa.ult_compra);
               self.empresa.vence_compra=new Date(self.empresa.vence_compra);
               self.list_trazas = self.empresa;
               modal_editempresa.modal( "show" );
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
        
          
}]).factory('ProfileAdminService', ['$http', '$q', function($http, $q){
    return {
        llenarEmpresas: function() {
            return $http.post('../list_empresas').then(function(response){
		return response.data;
            },function(errResponse){
                console.error('Error while fetching expenses');
                return $q.reject(errResponse);
            });
	},
        ModificarEmpresas: function(empresa) {
            return $http.post('../empresa_byadmin', empresa).then(function(response){
                console.log(response.data);
		return response.data;
            },function(errResponse){
                console.error('Error while fetching expenses');
                return $q.reject(errResponse);
            });
	}
    };
}]).controller('ProfileAdminConductorController', ['$scope', 'ProfileAdminConductorService', function($scope, ProfileAdminConductorService) {
    var self = this;
    
    self.empleado={email:"", cod:"",nombre:"", apellido:"", puntaje:0, hoja_vida:"",experiencia:0};
    self.list_empleados=[];
    
    self.llenarEmpleados = function(){
        ProfileAdminConductorService.llenarEmpleados().then(function(d) {
            self.list_empleados = d;
        },function(errResponse){
            console.error('Error while fetching Currencies');
        });
    };
    
    self.edit_empleado = function(id){
        for(var i = 0; i < self.list_empleados.length; i++){
            if(self.list_empleados[i].cod === id) {
               self.empleado = angular.copy(self.list_empleados[i]);
               modal_editempleado.modal( "show" );
               break;
            }
        }
    };
    
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
        
          
}]).factory('ProfileAdminConductorService', ['$http', '$q', function($http, $q){
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
}]).controller('EditConductorbyAdminController', ['$scope', 'EditConductorbyAdminService', function($scope, EditConductorbyAdminService) {
    var self = this;

    self.usuario_dp={
          cod:"", nombre:"", apellido:"", tip_doc:"", 
          num_doc:"", fecha_nac:"", genero:"", est_civil:"", 
          movil: "", tel:"", pais:"CO", depto:"", depart:"" ,
          ciudad:"", dir:"", naci:"CO", la1:false, 
          la2:false, lb1:false, lb2:false, lb3:false, 
          lc1:false, lc2:false, lc3:false, cargo:"", perfil:""};
      
    self.colombia = true;  

    self.Anios=[]; 
          
    self.experiencias=[];
    self.exp_laboral={id:-1, empresa:"", cargo:"", salario:0, bonos:0, supervisor:"", telefono:"", pais:"CO", dpto:"", 
        ciudad:"", direccion:"", mes_inicio:0, anio_inicio:0, mes_fin:0, anio_fin:0, labora:false, retiro:"", exp_meses:0};

    self.formaciones=[];
    self.formacion={id:-1, c_educativo:"", nivel_estudio: "", area_estudio:"", estado:2, mes_inicio:0, anio_inicio:0, mes_fin:0, anio_fin:0};
    
    self.Paises=[];
    self.dptos=[];
    self.dpto={id:0, departamento:"", ciudades:[]};
    self.ciudades=[];
    
     self.getVarUrl = function(name) {
            var regexS = "[\\?&]" + name + "=([^&#]*)";
            var regex = new RegExp(regexS);
            var tmpURL = window.location.href;
            var results = regex.exec(tmpURL);
            if (results == null)
                return "";
            else
                return results[1];
    };
    
    self.selectPais = function(pais){
        if(pais==="CO"){
            self.colombia = true;  
        }else{
            self.colombia = false; 
            self.usuario_dp.depart = "";
            self.usuario_dp.ciudad = "";
            self.usuario_dp.depto=-1;
        }
    };
    
    self.listaDptosCiudad = function(){
        EditConductorbyAdminService.listaDptosCiudad().then(function(d){
            self.dptos = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
    
    self.listaPaises = function() {
        EditConductorbyAdminService.listaPaises().then(function(d){
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
               self.usuario_dp.depart = self.dpto.departamento;
               break;
            }
        }
    };
    
    self.getUsuario = function(){
        var cod = self.getVarUrl("cod");
        console.log(cod);
        EditConductorbyAdminService.getUsuario(cod).then(function(d) {
            self.usuario_dp = d;
            self.usuario_dp.fecha_nac =  new Date(self.usuario_dp.fecha_nac);
            self.experiencias = d.exp_laborales;
            self.formaciones = d.formacion;
            self.selectDpto(self.usuario_dp.depto);
        },function(errResponse){
            console.error('Error while fetching Currencies');
        });
    };
    
    self.listaPaises();
    self.listaDptosCiudad();
    self.getUsuario();
    
    
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

    self.Meses = [
        {ID: 1, Mes: 'Enero'},
        {ID: 2, Mes: 'Febrero'},
        {ID: 3, Mes: 'Marzo'},
        {ID: 4, Mes: 'Abril'},
        {ID: 5, Mes: 'Mayo'},
        {ID: 6, Mes: 'Junio'},
        {ID: 7, Mes: 'Julio'},
        {ID: 8, Mes: 'Agosto'},
        {ID: 9, Mes: 'Septiembre'},
        {ID: 10, Mes: 'Octubre'},
        {ID: 11, Mes: 'Noviembre'},
        {ID: 12, Mes: 'Diciembre'}
    ];

    self.NvlFormacion = [
        {'ID': 1, 'Value': 'Educación Basica Primaria'},
        {'ID': 2, 'Value': 'Educación Basica Secundaria'},
        {'ID': 3, 'Value': 'Bachillerato / educacion Media'},
        {'ID': 4, 'Value': 'Universidad / Carrera Tecnica'}  
    ];
}]).factory('EditConductorbyAdminService', ['$http', '$q', function($http, $q){
    return {
        getUsuario: function(cod) {
            return $http.post('../usuario_general_byadmin', {"cod":cod}).then(function(response){
		return response.data;
            },function(errResponse){
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
}]);
