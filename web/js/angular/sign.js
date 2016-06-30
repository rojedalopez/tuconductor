'use strict';

angular.module('MyApp.Sign', []).controller('SignUpController', ['$scope', 'SignUpService', function($scope, SignUpService) {
    var self = this;
    self.usuario={mail:"", password:"",name:"", lastname:"", phone:"", confirmPassword:"", nacimiento:"", date:""};
    self.empresa={nit:"",r_social:"", dir:"", tel:"", cam_com:null, rut:"", nombre_replegal:"", 
        doc_replegal:"", email_replegal:"", tel_replegal:"", mail:"", password:"", confirmPassword:"", 
        pais:"CO", depto:"", depart:"", ciudad:""};
    self.mail="";
    self.colombia = true;
    self.Paises=[];
    self.dptos=[];
    self.dpto={id:0, departamento:"", ciudades:[]};
    self.ciudades=[];
    
    self.SaveUser = function(usuario){
        SignUpService.SaveSign(usuario).then(function(d){
            if(d){
                btn_add_conductor.button('reset');
                self.close_conductor();
                Modal_choise_options.modal('hide');
                Modal_Confirmacion.modal('show');
            }
            
            if(d){
                Modal_confirm_success.removeClass('hide');                
            }else{
                Modal_confirm_error.removeClass('hide');                
            }
        }, function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
        
    self.SaveEmpresa = function(empresa){
        SignUpService.SaveEmpresa(empresa).then(function(d){
            if(d){
                btn_add_empresa.button('reset');
                self.close_empresa();
                Modal_choise_options.modal('hide');
                Modal_Confirmacion.modal('show');
            }

            if(d){
                Modal_confirm_success.removeClass('hide');                
            }else{
                Modal_confirm_error.removeClass('hide');                
            }
            Modal_Confirmacion.modal('show');
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
     
    self.sendForgot = function(mail){
        SignUpService.sendForgot(mail).then(function(d){
            console.log(d.forgot);
            if(d.forgot===true){
                console.log("entro aqui");
                Modal_forgotpass_success.removeClass('hide');                
            }else{
                console.log("entro aca");
                Modal_forgotpass_error.removeClass('hide');                
            }
            btn_sending_mail.button('reset');
        }), function(errResponse){
            console.error('Error while creating Paper.');
        };
    };
    
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
    

     self.selectPais = function(pais){
        if(pais==="CO"){
            self.colombia = true;  
        }else{
            self.colombia = false; 
            self.empresa.depart = "";
            self.empresa.ciudad = "";
            self.empresa.depto="";
        }
    };
    
    self.listaDptosCiudad = function(){
        SignUpService.listaDptosCiudad().then(function(d){
            self.dptos = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
    
    self.listaPaises = function() {
        SignUpService.listaPaises().then(function(d){
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
               self.empresa.depart = self.dpto.departamento;
               break;
            }
        }
    };
    
    self.listaPaises();
    self.listaDptosCiudad();
    
    self.submit = function() {
      btn_add_conductor.button('loading');
      self.usuario.date = new Date(self.usuario.nacimiento).toString('yyyy-MM-dd');
      self.SaveUser(self.usuario); 
    };
          
    self.submit_Empresa = function() {
        btn_add_empresa.button('loading');
        self.SaveEmpresa(self.empresa); 
    };
    
    self.sendingForgot = function(){
        btn_sending_mail.button('loading');
        self.sendForgot(self.mail);
    };
    
    self.openForgotPassword = function(){
        modalforgot.modal("show");
    };
    
    self.close_conductor = function(){
        self.reset_conductor();
        dialog_conductor.modal( "hide" );
    };
    
    self.close_empresa = function(){
        self.reset_empresa();
        dialog_empresa.modal( "hide" );
    };
           
    self.open_conductor = function(){
        self.reset_conductor();
        dialog_conductor.modal( "show" );
    };
    
    self.open_empresa = function(){
        self.reset_empresa();
        dialog_empresa.modal( "show" );
    };

    self.reset_conductor = function(){
        $scope.add_conductor.reset(); //reset Form
        self.usuario={mail:"", password:"",name:"", lastname:"", phone:"", confirmPassword:"", nacimiento:"", date:""};
    };
    
    self.reset_empresa = function(){
        $scope.add_empresa.$setPristine(); //reset Form
        self.empresa={nit:"",r_social:"", dir:"", tel:"", cam_com:null, rut:"", nombre_replegal:"", doc_replegal:"", 
            email_replegal:"", tel_replegal:"", mail:"", password:"", confirmPassword:"", pais:"CO", depto:"", 
            depart:"", ciudad:""}
    };
}]).factory('SignUpService', ['$http', '$q', function($http, $q){
    return {
        SaveSign: function(usuario){
            return $http.post('signup', usuario).then(
                function(response){
                    return response.data;
                },function(errResponse){
                    console.error('Error while updating paper ' +errResponse);
                    return $q.reject(errResponse);
                }
            );
	},
        SaveEmpresa: function(empresa){
            var fd = new FormData();
            fd.append("nit", empresa.nit);
            fd.append("r_social", empresa.r_social);
            fd.append("dir", empresa.dir);
            fd.append("tel", empresa.tel);
            fd.append("cam_com", empresa.cam_com);
            fd.append("nombre_replegal", empresa.nombre_replegal);
            fd.append("doc_replegal", empresa.doc_replegal);
            fd.append("email_replegal", empresa.email_replegal);
            fd.append("tel_replegal", empresa.tel_replegal);
            fd.append("mail", empresa.mail);
            fd.append("password", empresa.password);
            fd.append("pais", empresa.pais);
            fd.append("depto", empresa.depto);
            fd.append("depart", empresa.depart);
            fd.append("ciudad", empresa.ciudad);
            
            return $http.post('signup_empresa', fd, {
                transformRequest: angular.identity,
                headers: {'Content-Type': undefined}
            }).then(
                function(response){
                    open_message(response.data);
                    return response.data;
                },function(errResponse){
                    console.error('Error while updating paper ' +errResponse);
                    return $q.reject(errResponse);
                }
            );
	},sendForgot: function(mail){
            return $http.post('forgot', {'mail':mail}).then(
                function(response){
                    return response.data;
                },function(errResponse){
                    console.error('Error while updating paper ' +errResponse);
                    return $q.reject(errResponse);
                }
            );
	},
        listaDptosCiudad: function() {
            return $http.post('assets/colombia.json').then(function(response){
                return response.data;
            },function(errResponse){
                console.error('Error while fetching expenses');
                return $q.reject(errResponse);
            });
	},
	listaPaises: function() {
            return $http.post('assets/paises.json').then(function(response){
                return response.data;
            },function(errResponse){
                console.error('Error while fetching expenses');
                return $q.reject(errResponse);
            });
	}
		
    };

}]).directive('uploaderModel', ["$parse", function($parse){
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
