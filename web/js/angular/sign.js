'use strict';

angular.module('MyApp.Sign', []).controller('SignUpController', ['$scope', 'SignUpService', function($scope, SignUpService) {
    var self = this;
    self.usuario={mail:"", password:"",name:"", lastname:"", phone:""};
    self.empresa={nit:"",r_social:"", dir:"", tel:"", cam_com:null, rut:"", nombre_replegal:"", doc_replegal:"", email_replegal:"", tel_replegal:"", mail:"", password:""}
    self.mail="";
    
    self.SaveUser = function(usuario){
        SignUpService.SaveSign(usuario).then(self.reset, function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
        
    self.SaveEmpresa = function(empresa){
        SignUpService.SaveEmpresa(empresa).then(self.reset,function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
     
    self.sendForgot = function(mail){
        SignUpService.sendForgot(mail).then(function(d){
            open_message_forgot(d.forgot);
            btn_sending_mail.button('reset');
        }), function(errResponse){
            console.error('Error while creating Paper.');
        };
    };
    
    self.submit = function() {
      self.SaveUser(self.usuario); 
      self.close();
    };
          
    self.submit_Empresa = function() {
        self.SaveEmpresa(self.empresa); 
        self.close();
    };
    
    self.sendingForgot = function(){
        btn_sending_mail.button('loading');
        self.sendForgot(self.mail);
    };
    
    self.close = function(){
        self.reset();
        dialog.modal( "hide" );
    };
           
    self.opener = function(){
        self.reset();
        dialog.modal( "show" );
    };

    self.reset = function(){
        self.usuario={mail:"", password:"",name:"", lastname:"", phone:""};
        $scope.myForm.$setPristine(); //reset Form
    };
}]).factory('SignUpService', ['$http', '$q', function($http, $q){
    return {
        SaveSign: function(usuario){
            return $http.post('signup', usuario).then(
                function(response){
                    open_message(response.data);
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
