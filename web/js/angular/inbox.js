'use strict';

angular.module('MyApp.Inbox', []).controller('InboxController', ['$scope', 'InboxService', '$interval', 
    function($scope, InboxService, $interval) {
    var self = this;
    self.chats=[];
    self.mensajes=[];
    self.mensaje={id:0, fecha:"", rol:false, destino:"", n_destino:"", texto:""};
    self.nuevo_mensaje={chat:"", texto:""};
    self.chat={id:0, fecha:"", ult_mensaje:"", destino:"", n_destino:"", invisible:false, visto:false};
    self.interval = 10;
    
    self.listaChats = function(){
        InboxService.listaChats().then(function(d){
            self.chats = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
    
    self.listaMensajes = function(id){
        InboxService.listaMensajes(id).then(function(d){
            self.mensajes = d;
            console.log("entro");
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
    
    self.sendMensaje = function(nuevo_mensaje){
        InboxService.sendMensaje(nuevo_mensaje).then(function(d){
            self.listaMensajes(self.chat.id); 
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
    
    self.listaChats();
                 
    self.selectChat = function(id){
        for(var i = 0; i < self.chats.length; i++){
            if(self.chats[i].id === id) {
               self.chat = angular.copy(self.chats[i]);
               self.nuevo_mensaje.chat = self.chat.id;
               self.listaMensajes(self.chat.id);
               break;
            }
        }
    };
    
    self.submitMensaje = function(){
        self.sendMensaje(self.nuevo_mensaje);
        self.reset();
    };
    
    self.reset = function(){
        self.nuevo_mensaje={chat:"", texto:""};
    }
      
}]).factory('InboxService', ['$http', '$q', function($http, $q){
	return {
            listaChats: function() {
                return $http.post('../list_chats').then(function(response){
                    return response.data;
                }, 
                function(errResponse){
                    console.error('Error while fetching expenses');
                    return $q.reject(errResponse);
                });
            },
            listaMensajes: function(id) {
                return $http.post('../list_mensajes',{'chat':id}).then(function(response){
                    return response.data;
                }, 
                function(errResponse){
                    console.error('Error while fetching expenses');
                    return $q.reject(errResponse);
                });
            },
            sendMensaje: function(mensaje) {
                console.log(mensaje);
                return $http.post('../mensaje', mensaje).then(function(response){
                    return response.data;
                }, 
                function(errResponse){
                    console.error('Error while fetching expenses');
                    return $q.reject(errResponse);
                });
            }
	};

}]).directive('scroll', function($timeout) {
  return {
    restrict: 'A',
    link: function(scope, element, attr) {
      scope.$watchCollection(attr.scroll, function(newVal) {
        $timeout(function() {
         element[0].scrollTop = element[0].scrollHeight;
        });
      });
    }
  }
}).directive('reload', ['$interval',
      function($interval) {
        // return the directive link function. (compile function not needed)
        return function(scope, element, attrs) {
          var stopTime; // so that we can cancel the time updates
          
          function updateTime() {
              if(scope.ctrl.chat.id!==0){
                scope.ctrl.listaMensajes(scope.ctrl.chat.id); 
            }
          }  
            
          // watch the expression, and update the UI on change.
          scope.$watch(attrs.myCurrentTime, function() {
              updateTime();
          });

          stopTime = $interval(updateTime, 10000);

          // listen on DOM destroy (removal) event, and cancel the next UI update
          // to prevent updating time after the DOM element was removed.
          element.on('$destroy', function() {
            $interval.cancel(stopTime);
          });
        }
}]);
