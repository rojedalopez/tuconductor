'use strict';

angular.module('MyApp.Sign', []).controller('SignUpController', ['$scope', 'SignUpService', function($scope, SignUpService) {
    var self = this;
    self.usuario={mail:"", password:"",name:"", lastname:"", phone:"", confirmPassword:""};
    self.empresa={nit:"",r_social:"", dir:"", tel:"", cam_com:null, rut:"", nombre_replegal:"", doc_replegal:"", email_replegal:"", tel_replegal:"", mail:"", password:"", confirmPassword:""}
    self.mail="";
    
    self.SaveUser = function(usuario){
        SignUpService.SaveSign(usuario).then(function(d){
            if(d){
                btn_add_conductor.button('reset');
                self.close_conductor();
                Modal_choise_options.modal('hide');
                Modal_Confirmacion.modal('show');
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
                Modal_forgotpass_success.removeClass('hide');                
            }else{
                Modal_forgotpass_error.removeClass('hide');                
            }
            Modal_Confirmacion.modal('show');
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
     
    self.sendForgot = function(mail){
        SignUpService.sendForgot(mail).then(function(d){
            if(d.forgot===true){
                Modal_forgotpass_success.removeClass('hide');                
            }else{
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
    
    self.submit = function() {
      btn_add_conductor.button('loading');
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
        self.reset();
        dialog_conductor.modal( "hide" );
    };
    
    self.close_empresa = function(){
        self.reset_empresa();
        dialog_empresa.modal( "hide" );
    };
           
    self.open_conductor = function(){
        self.reset();
        dialog.modal( "show" );
    };
    
    self.open_empresa = function(){
        self.reset_empresa();
        dialog_empresa.modal( "show" );
    };

    self.reset = function(){
        self.usuario={mail:"", password:"",name:"", lastname:"", phone:"", confirmPassword:""};
        $scope.add_conductor.$setPristine(); //reset Form
    };
    
    self.reset_empresa = function(){
        self.empresa={nit:"",r_social:"", dir:"", tel:"", cam_com:null, rut:"", nombre_replegal:"", doc_replegal:"", email_replegal:"", tel_replegal:"", mail:"", password:"", confirmPassword:""}
        $scope.add_empresa.$setPristine(); //reset Form
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
