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
    self.colombiaExp = true;

    self.Anios=[]; 
          
    self.experiencias=[];
    self.exp_laboral={id:-1, empresa:"", cargo:"", salario:0, bonos:0, supervisor:"", telefono:"", pais:"CO", depto:"", depart:"" ,
        ciudad:"", direccion:"", mes_inicio:"", anio_inicio:"", mes_fin:0, anio_fin:0, labora:false, retiro:"", exp_meses:0, eliminar:false};

    self.formaciones=[];
    self.formacion={id:-1, c_educativo:"", nivel_estudio: "", area_estudio:"", estado:2, mes_inicio:"", anio_inicio:"", mes_fin:"", anio_fin:"", eliminar:false};
    
    
    
    self.Paises=[];
    self.PaisesExp=[];
    self.dptos=[];
    self.dptosExp=[];
    self.dpto={id:0, departamento:"", ciudades:[]};
    self.dptoExp={id:0, departamento:"", ciudades:[]};
    self.ciudades=[];
    self.ciudadesExp=[];
    
    self.passwordValidator = function(password) {
        
        if(!password){return;}

        if (password.length < 6) {
                return "La contraseña debe tener como minimo " + 6 + " caracteres de largo";
        }

        if (!password.match(/[0-9]/)) {
                 return "La contraseña debe tener por lo menos un número";
        }

        return true;
    };
    
    self.lengthValidator = function(texto, length) {
        if(!texto){return;}

        if (texto.length < length) {
                return "El campo debe tener como minimo " + length + " caracteres de largo";
        }
    
        return true;
    };
    
    self.dateValidator = function(mes, anio) {
        var date = new Date();
        if (mes > date.getMonth() && anio >= date.getFullYear()) {
                return "No puede ingresar fecha mayor a la actual";
        }
    
        return true;
    };
    
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
                btn_add_exp.button('reset');
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
            self.usuario_dp.depto="";
        }
    };
    
    self.selectPaisExp = function(pais){
        if(pais==="CO"){
            self.colombiaExp = true;  
        }else{
            self.colombiaExp = false; 
            self.exp_laboral.depart = "";
            self.exp_laboral.ciudad = "";
            self.exp_laboral.depto="";
        }
    };
    
    self.listaDptosCiudad = function(){
        ProfileService.listaDptosCiudad().then(function(d){
            self.dptos = d;
            self.dptosExp = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
    
    self.listaPaises = function() {
        ProfileService.listaPaises().then(function(d){
            self.Paises = d;
            self.PaisesExp = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };

    self.limpiar = function(){
        if(self.exp_laboral.labora){
            self.exp_laboral.mes_fin = "";
            self.exp_laboral.anio_fin = "";
            self.exp_laboral.retiro = "";
        }
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
    
    self.selectDptoExp = function(id){
        for(var i = 0; i < self.dptosExp.length; i++){
            if(self.dptosExp[i].id === id) {
               self.dptoExp = angular.copy(self.dptosExp[i]);
               self.ciudadesExp=self.dptoExp.ciudades;
               self.exp_laboral.depart = self.dptoExp.departamento;
               break;
            }
        }
    };
          
    self.GetUsuarioGeneral = function(){
        ProfileService.GetUsuarioGeneral().then(function(d) {
            self.usuario_dp = d;
            self.usuario_dp.fecha_nac =  new Date(self.usuario_dp.fecha_nac);
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
          
    self.listaPaises();
    self.listaDptosCiudad();
    self.llenarAnios();
    self.GetUsuarioGeneral();
    
    
    self.submitDP = function(){
        btn_guardar_cambios.button('loading');
        self.usuario_dp.date = self.usuario_dp.fecha_nac.toString("yyyy-MM-dd");
        self.SaveDatosPersonales(self.usuario_dp);
    };
          
    self.submitExp = function(){
        btn_add_exp.button('loading');
        self.SaveExpUsuario(self.exp_laboral);
    };
    
    self.deleteExp = function(id){
        for(var i = 0; i < self.experiencias.length; i++){
            if(self.experiencias[i].id === id) {
               self.exp_laboral = angular.copy(self.experiencias[i]);
               self.exp_laboral.eliminar = true;
               self.SaveExpUsuario(self.exp_laboral);
               break;
            }
        }
    };
    
    self.deleteForm = function(id){
        console.log(id);
        for(var i = 0; i < self.formaciones.length; i++){
            if(self.formaciones[i].id === id) {
               self.formacion = angular.copy(self.formaciones[i]);
               self.formacion.eliminar = true;
               self.SaveFormacion(self.formacion);
               break;
            }
        }
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
        self.resetForm();
        form_formacion.modal( "show" );
    };   
        
    self.editExp = function(id){
        for(var i = 0; i < self.experiencias.length; i++){
            if(self.experiencias[i].id === id) {
               self.exp_laboral = angular.copy(self.experiencias[i]);
               if(self.exp_laboral.depto<=0){
                   self.selectDptoExp(self.exp_laboral.depto);
               }
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
         ciudad:"", direccion:"", mes_inicio:"", anio_inicio:"", mes_fin:"", anio_fin:"", labora:false, retiro:"", exp_meses:0, eliminar:false};
        $scope.exp_laboral.$setPristine();
    };
          
    self.resetForm = function(){
        self.formacion={id:-1, c_educativo:"", nivel_estudio: "", area_estudio:"", estado:2, mes_inicio:"", anio_inicio:"", mes_fin:"", anio_fin:"", eliminar:false};
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
        {ID: 1, Value: 'Educación Basica Primaria'},
        {ID: 2, Value: 'Educación Basica Secundaria'},
        {ID: 3, Value: 'Bachillerato / educacion Media'},
        {ID: 4, Value: 'Universidad / Carrera Tecnica'},
        {ID: 5, Value: 'Posgrado'}
    ];
        
}]).factory('ProfileService', ['$http', '$q', function($http, $q){
    return {
        SaveDatosPersonales: function(usuario_dp){
            return $http.post('../usuario_dp', usuario_dp).then(function(response){
                return response.data;
            },function(errResponse){
                console.error('Error guardando datos personales ' +errResponse);
                return $q.reject(errResponse);
            });
	},
        SaveFormacion: function(formacion){
            return $http.post('../formacion_usuario', formacion).then(function(response){
                return response.data;
            },function(errResponse){
                console.error('Error guardando datos personales ' +errResponse);
                return $q.reject(errResponse);
            });
	},
        SaveExpUsuario: function(exp_laboral){
            return $http.post('../experiencia_usuario', exp_laboral).then(function(response){
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
    email_replegal:"", tel_replegal:"", demo:false, id_plan:0, tkn_disp:0, ofertas_disp:0, ult_compra:"", vence_compra:"", tot_tkn:0, tot_ofr:0, trazas:[], eliminar:false}
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
               modal_editadicional.modal( "show" );
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
		return response.data;
            },function(errResponse){
                console.error('Error while fetching expenses');
                return $q.reject(errResponse);
            });
	}
    };
}]).controller('ProfileAdminConductorController', ['$scope', 'ProfileAdminConductorService', function($scope, ProfileAdminConductorService) {
    var self = this;
    
    self.empleado={email:"", cod:"",nombre:"", apellido:"", puntaje:0, hoja_vida:"",experiencia:0, eliminar:false};
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
            return $http.post('../list_employes_byadmin').then(function(response){
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
          lc1:false, lc2:false, lc3:false, cargo:"", perfil:"", verificado:false};
      

    self.colombia = true;
    self.colombiaExp = true;

    self.Anios=[]; 
          
    self.experiencias=[];
    self.exp_laboral={id:-1, cod:"", empresa:"", cargo:"", salario:0, bonos:0, supervisor:"", telefono:"", pais:"CO", depto:"", depart:"",
         ciudad:"", direccion:"", mes_inicio:"", anio_inicio:"", mes_fin:"", anio_fin:"", labora:false, retiro:"", exp_meses:0, eliminar:false};

    self.formaciones=[];
    self.formacion={id:-1, c_educativo:"", nivel_estudio: "", area_estudio:"", estado:2, mes_inicio:"", anio_inicio:"", mes_fin:"", anio_fin:"", cod:"", eliminar:false};
    
    self.multas=[];
    self.multa={id:-1, date:"", lgr_multa:"", fch_multa: "", cgo_multa:"", pgo_multa:false, cod:"", eliminar:false};
    
    self.accidentes=[];
    self.accidente={id:-1, date:"", fch_accidente:"", muertos:false, heridos: false, tipo:"", cod:"", eliminar:false};
    
    self.judiciales=[];
    self.judicial={id:-1, date:"", del_procjudicial:"", fch_procjudicial:"", act_procjudicial:false, cod:"", eliminar:false};
    
    self.Paises=[];
    self.PaisesExp=[];
    self.dptos=[];
    self.dptosExp=[];
    self.dpto={id:0, departamento:"", ciudades:[]};
    self.dptoExp={id:0, departamento:"", ciudades:[]};
    self.ciudades=[];
    self.ciudadesExp=[];
    
    self.lengthValidator = function(texto, length) {
        if(!texto){return;}

        if (texto.length < length) {
                return "El campo debe tener como minimo " + length + " caracteres de largo";
        }
    
        return true;
    };
    
    self.dateValidator = function(mes, anio) {
        var date = new Date();
               
        if (mes > date.getMonth() && anio >= date.getFullYear()) {
                return "No puede ingresar fecha mayor a la actual";
        }
    
        return true;
    };
    
    self.limpiar = function(){
        if(self.exp_laboral.labora){
            self.exp_laboral.mes_fin = "";
            self.exp_laboral.anio_fin = "";
            self.exp_laboral.retiro = "";
        }
    };
    
    self.SaveMultaUsuario = function(multa){
        EditConductorbyAdminService.SaveMultaUsuario(multa).then(function(d){
            if(d==="true"){
                btn_guardar_multa.button('reset');
                form_multa.modal( "hide" );
                self.resetMulta();
                self.listaMultas();
            }
        },function(errResponse){
            console.error('Error while creating Paper.');
	});
    };
    
    self.SaveDatosPersonales = function(usuario_dp){
        EditConductorbyAdminService.SaveDatosPersonales(usuario_dp).then(function(d){
            btn_guardar_cambios.button('reset');
            btn_admitir.button('reset');
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };


    self.submitDP = function(){
        btn_guardar_cambios.button('loading');
        self.usuario_dp.date = self.usuario_dp.fecha_nac.toString("yyyy-MM-dd");
        self.SaveDatosPersonales(self.usuario_dp);
    };
    
    self.listaMultas = function(){
        var cod = self.getVarUrl("cod");
        EditConductorbyAdminService.listaMultas(cod).then(function(d){
            
            self.multas = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
	});
    };
    
    self.SaveAccidenteUsuario = function(accidente){
        EditConductorbyAdminService.SaveAccidenteUsuario(accidente).then(function(d){
            if(d==="true"){
                btn_guardar_accidente.button('reset');
                form_accidente.modal( "hide" );
                self.resetAccidente();
                self.listaAccidentes();
            }
        },function(errResponse){
            console.error('Error while creating Paper.');
	});
    };
    
    self.listaAccidentes = function(){
        var cod = self.getVarUrl("cod");
        EditConductorbyAdminService.listaAccidentes(cod).then(function(d){
            
            self.accidentes = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
	});
    };
    
    self.SaveJudicialUsuario = function(judicial){
        EditConductorbyAdminService.SaveJudicialUsuario(judicial).then(function(d){
            if(d==="true"){
                btn_guardar_judicial.button('reset');
                form_judicial.modal( "hide" );
                self.resetJudicial();
                self.listaJudiciales();
            }
        },function(errResponse){
            console.error('Error while creating Paper.');
	});
    };
    
    self.listaJudiciales = function(){
        var cod = self.getVarUrl("cod");
        EditConductorbyAdminService.listaJudiciales(cod).then(function(d){
            
            self.judiciales = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
	});
    };
    
    self.SaveFormUsuario = function(formacion){
        EditConductorbyAdminService.SaveFormUsuario(formacion).then(function(d){
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
        var cod = self.getVarUrl("cod");
        EditConductorbyAdminService.listaExperiencias(cod).then(function(d){
            self.experiencias = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
	});
    };
    self.SaveExpUsuario = function(exp_laboral){
        EditConductorbyAdminService.SaveExpUsuario(exp_laboral).then(function(d){
            if(d==="true"){
                form_experiencia.modal( "hide" );
                self.resetExp();
                self.listaExperiencias();
            }
        },function(errResponse){
            console.error('Error while creating Paper.');
	});
    };
    self.listaFormaciones = function(){
        var cod = self.getVarUrl("cod");
        EditConductorbyAdminService.listaFormaciones(cod).then(function(d){
            self.formaciones = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
	});
    };
    
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
            self.usuario_dp.depto="";
        }
    };
    
    self.selectPaisExp = function(pais){
        if(pais==="CO"){
            self.colombiaExp = true;  
        }else{
            self.colombiaExp = false; 
            self.exp_laboral.depart = "";
            self.exp_laboral.ciudad = "";
            self.exp_laboral.depto="";
        }
    };
    
    self.listaDptosCiudad = function(){
        EditConductorbyAdminService.listaDptosCiudad().then(function(d){
            self.dptos = d;
            self.dptosExp = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
    
    self.listaPaises = function() {
        EditConductorbyAdminService.listaPaises().then(function(d){
            self.PaisesExp = d;
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
    
    self.selectDptoExp = function(id){
        for(var i = 0; i < self.dptosExp.length; i++){
            if(self.dptosExp[i].id === id) {
               self.dptoExp = angular.copy(self.dptosExp[i]);
               self.ciudadesExp=self.dptoExp.ciudades;
               self.exp_laboral.depart = self.dptoExp.departamento;
               break;
            }
        }
    };
    
    self.getUsuario = function(){
        var cod = self.getVarUrl("cod");
        EditConductorbyAdminService.getUsuario(cod).then(function(d) {
            self.usuario_dp = d;
            self.usuario_dp.fecha_nac =  new Date(self.usuario_dp.fecha_nac);
            self.experiencias = d.exp_laborales;
            self.formaciones = d.formacion;
            self.multas = d.multas;
            self.accidentes = d.accidentes;
            self.judiciales = d.judiciales;
            self.selectDpto(self.usuario_dp.depto);
        },function(errResponse){
            console.error('Error while fetching Currencies');
        });
    };
    
    self.editMulta = function(id){
        for(var i = 0; i < self.multas.length; i++){
            if(self.multas[i].id === id) {
               self.multa = angular.copy(self.multas[i]);
               self.multa.fch_multa = new Date(self.multa.fch_multa);
               form_multa.modal( "show" );
               break;
            }
        }
    };
    
    self.editAccidente = function(id){
        for(var i = 0; i < self.accidentes.length; i++){
            if(self.accidentes[i].id === id) {
               self.accidente = angular.copy(self.accidentes[i]);
               if(self.accidente.muertos===1){
                   self.accidente.muertos=true;
               }else{
                   self.accidente.muertos=false;
               }               
               if(self.accidente.heridos===1){
                   self.accidente.heridos=true;
               }else{
                   self.accidente.heridos=false;
               }
               self.accidente.fch_accidente = new Date(self.accidente.fch_accidente);
               form_accidente.modal( "show" );
               break;
            }
        }
    };
    
    self.editJudicial = function(id){
        for(var i = 0; i < self.judiciales.length; i++){
            if(self.judiciales[i].id === id) {
               self.judicial = angular.copy(self.judiciales[i]);
               self.judicial.fch_procjudicial = new Date(self.judicial.fch_procjudicial);
               form_judicial.modal( "show" );
               break;
            }
        }
    };
    
    self.formatDate = function(date){
        var dateOut = new Date(date);
        return dateOut;
    };
    
    self.textAccidente = function(tip){
        var texto="";
        for(var i = 0; i < self.tipoAccidentes.length; i++){
            if(self.tipoAccidentes[i].ID === tip) {
               texto = self.tipoAccidentes[i].Tipo;
               break;
            }
        }
        return texto;
    };
    
    self.editExp = function(id){
        for(var i = 0; i < self.experiencias.length; i++){
            if(self.experiencias[i].id === id) {
               self.exp_laboral = angular.copy(self.experiencias[i]);
               if(self.exp_laboral.depto<=0){
                   self.selectDptoExp(self.exp_laboral.depto);
               }
               console.log(self.exp_laboral.mes_inicio);
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
    
    self.openMulta = function(){
        self.resetMulta();
        form_multa.modal( "show" );
    };
    
    self.submitMulta = function(){
        var cod = self.getVarUrl("cod");
        self.exp_laboral.cod = cod;
        btn_guardar_multa.button('loading');
        self.multa.date = new Date(self.multa.fch_multa).toString("yyyy-MM-dd");
        self.SaveMultaUsuario(self.multa);
    };
    
    self.openAccidente = function(){
        self.resetAccidente();
        form_accidente.modal( "show" );
    };
    
    self.submitAccidente = function(){
        var cod = self.getVarUrl("cod");
        self.exp_laboral.cod = cod;
        btn_guardar_accidente.button('loading');
        self.accidente.date = new Date(self.accidente.fch_accidente).toString("yyyy-MM-dd");
        self.SaveAccidenteUsuario(self.accidente);
    };
    
    self.openJudicial = function(){
        self.resetJudicial();
        form_judicial.modal( "show" );
    };
    
    self.submitJudicial = function(){
        var cod = self.getVarUrl("cod");
        self.exp_laboral.cod = cod;
        btn_guardar_judicial.button('loading');
        self.judicial.date = new Date(self.judicial.fch_procjudicial).toString("yyyy-MM-dd");
        self.SaveJudicialUsuario(self.judicial);
    };
    
    self.openExp = function(){
        self.resetExp();
        form_experiencia.modal( "show" );
    };
    
    self.submitExp = function(){
        var cod = self.getVarUrl("cod");
        self.exp_laboral.cod = cod;
        self.SaveExpUsuario(self.exp_laboral);
    };
    
    self.deleteExp = function(id){
        for(var i = 0; i < self.experiencias.length; i++){
            if(self.experiencias[i].id === id) {
               self.exp_laboral = angular.copy(self.experiencias[i]);
               self.exp_laboral.eliminar = true;
               self.SaveExpUsuario(self.exp_laboral);
               break;
            }
        }
    };
    
    self.deleteForm = function(id){
        console.log(id);
        for(var i = 0; i < self.formaciones.length; i++){
            if(self.formaciones[i].id === id) {
               self.formacion = angular.copy(self.formaciones[i]);
               self.formacion.eliminar = true;
               self.SaveFormUsuario(self.formacion);
               break;
            }
        }
    };
    
    self.deleteMulta = function(id){
        console.log(id);
        for(var i = 0; i < self.multas.length; i++){
            if(self.multas[i].id === id) {
               self.multa = angular.copy(self.multas[i]);
               self.multa.eliminar = true;
               self.SaveMultaUsuario(self.multa);
               break;
            }
        }
    };
    
    self.deleteAccidente = function(id){
        console.log(id);
        for(var i = 0; i < self.accidentes.length; i++){
            if(self.accidentes[i].id === id) {
               self.accidente = angular.copy(self.accidentes[i]);
               self.accidente.eliminar = true;
               self.SaveAccidenteUsuario(self.accidente);
               break;
            }
        }
    };
    
    self.deleteJudicial = function(id){
        console.log(id);
        for(var i = 0; i < self.judiciales.length; i++){
            if(self.judiciales[i].id === id) {
               self.judicial = angular.copy(self.judiciales[i]);
               self.judicial.eliminar = true;
               self.SaveJudicialUsuario(self.judicial);
               break;
            }
        }
    };
    
    self.submitForm = function(){
        self.SaveFormUsuario(self.formacion);
    };
    
    self.submitAdminision = function(){
        if(self.usuario_dp.verificado===true){
            btn_admitir.button('loading');
            self.usuario_dp.verificado = false;
            self.usuario_dp.date = self.usuario_dp.fecha_nac.toString("yyyy-MM-dd");
            self.SaveDatosPersonales(self.usuario_dp);
        }else{
            btn_admitir.button('loading');
            self.usuario_dp.verificado = true;
            self.usuario_dp.date = self.usuario_dp.fecha_nac.toString("yyyy-MM-dd");
            self.SaveDatosPersonales(self.usuario_dp);
        }
    };
    
    self.openForm = function(){
        self.resetForm();
        form_formacion.modal( "show" );
    }; 
    
    self.resetExp = function(){
       var cod = self.getVarUrl("cod");
        self.exp_laboral={id:-1, cod:"", empresa:"", cargo:"", salario:0, bonos:0, supervisor:"", telefono:"", pais:"CO", dpto:"", 
        ciudad:"", direccion:"", mes_inicio:"", anio_inicio:"", mes_fin:"", anio_fin:"", labora:false, retiro:"", exp_meses:0, eliminar:false};
        self.exp_laboral.cod = cod; 
        $scope.expe_laboral.$setPristine();
    };
    
    self.resetMulta = function(){
        var cod = self.getVarUrl("cod");
        self.multa={id:-1, lgr_multa:"", fch_multa: "", cgo_multa:"", pgo_multa:false, eliminar:false};
        self.multa.cod = cod; 
        $scope.forma_multa.$setPristine();
    };
    
    self.resetAccidente = function(){
        var cod = self.getVarUrl("cod");
        self.accidente={id:-1, date:"", fch_accidente:"", muertos:false, heridos: false, tipo:"", eliminar:false};
        self.accidente.cod = cod; 
        $scope.forma_accidente.$setPristine();
    };
    
    self.resetJudicial = function(){
        var cod = self.getVarUrl("cod");
        self.judicial={id:-1, date:"", del_procjudicial:"", fch_procjudicial:"", act_procjudicial:false, eliminar:false};
        self.judicial.cod = cod; 
        $scope.forma_judicial.$setPristine();
    };

    self.resetForm = function(){
        var cod = self.getVarUrl("cod");
        self.formacion={id:-1, c_educativo:"", nivel_estudio: "", area_estudio:"", estado:2, mes_inicio:"", anio_inicio:"", mes_fin:"", anio_fin:"",eliminar:false};
        self.formacion.cod = cod; 
        $scope.forma_formacion.$setPristine();
    };
    
    self.llenarAnios = function(){
        var Anio = new Date().getFullYear();
        for(var a = Anio; a >= Anio - 100; a--){
            self.Anios.push({ID:a, Year:a});
        }
    };
    
    self.listaPaises();
    self.listaDptosCiudad();
    self.llenarAnios();
    self.getUsuario();
    
    
    self.tipoIdents = [
        {ID: 'CC', Tipo: 'Cedula de ciudadania'},
        {ID: 'CE', Tipo: 'Cedula de extranjeria'},
        {ID: 'PS', Tipo: 'Pasaporte'}
    ];
    
    self.tipoAccidentes = [
        {ID: 'F', Tipo: 'Frontales'},
        {ID: 'S', Tipo: 'Laterales'},
        {ID: 'T', Tipo: 'Volcamiento'}
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
        {ID: 1, Value: 'Educación Basica Primaria'},
        {ID: 2, Value: 'Educación Basica Secundaria'},
        {ID: 3, Value: 'Bachillerato / educacion Media'},
        {ID: 4, Value: 'Universidad / Carrera Tecnica'},
        {ID: 5, Value: 'Posgrado'}
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
	},SaveDatosPersonales: function(usuario_dp){
            return $http.post('../usuario_dp_byadmin', usuario_dp).then(function(response){
                return response.data;
            },function(errResponse){
                console.error('Error guardando datos personales ' +errResponse);
                return $q.reject(errResponse);
            });
	},
        SaveExpUsuario: function(exp_laboral){
            return $http.post('../experiencia_byadmin', exp_laboral).then(function(response){
                return response.data;
            }, 
            function(errResponse){
                    console.error('Error guardando datos personales ' +errResponse);
                    return $q.reject(errResponse);
            });
        },
        listaExperiencias: function(cod) {
            return $http.post('../list_experiencia_byadmin', {'cod':cod}).then(function(response){
                return response.data;
            },function(errResponse){
                console.error('Error while fetching expenses');
                return $q.reject(errResponse);
            });
        },
        SaveFormUsuario: function(exp_laboral){
            return $http.post('../formacion_byadmin', exp_laboral).then(function(response){
                return response.data;
            }, 
            function(errResponse){
                    console.error('Error guardando datos personales ' +errResponse);
                    return $q.reject(errResponse);
            });
        },
        listaFormaciones: function(cod) {
            return $http.post('../list_formacion_byadmin', {'cod':cod}).then(function(response){
                return response.data;
            },function(errResponse){
                console.error('Error while fetching expenses');
                return $q.reject(errResponse);
            });
        },
        SaveMultaUsuario: function(exp_laboral){
            return $http.post('../multa_byadmin', exp_laboral).then(function(response){
                return response.data;
            }, 
            function(errResponse){
                    console.error('Error guardando datos personales ' +errResponse);
                    return $q.reject(errResponse);
            });
        },
        listaMultas: function(cod) {
            return $http.post('../list_multa_byadmin', {'cod':cod}).then(function(response){
                return response.data;
            },function(errResponse){
                console.error('Error while fetching expenses');
                return $q.reject(errResponse);
            });
        },
        SaveAccidenteUsuario: function(accidente){
            return $http.post('../accidente_byadmin', accidente).then(function(response){
                return response.data;
            }, 
            function(errResponse){
                    console.error('Error guardando datos personales ' +errResponse);
                    return $q.reject(errResponse);
            });
        },
        listaAccidentes: function(cod) {
            return $http.post('../list_accidentes_byadmin', {'cod':cod}).then(function(response){
                return response.data;
            },function(errResponse){
                console.error('Error while fetching expenses');
                return $q.reject(errResponse);
            });
        },
        SaveJudicialUsuario: function(judicial){
            return $http.post('../procjudicial_byadmin', judicial).then(function(response){
                return response.data;
            }, 
            function(errResponse){
                    console.error('Error guardando datos personales ' +errResponse);
                    return $q.reject(errResponse);
            });
        },
        listaJudiciales: function(cod) {
            return $http.post('../list_procjudicial_byadmin', {'cod':cod}).then(function(response){
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
