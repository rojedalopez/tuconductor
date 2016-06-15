'use strict';

angular.module('MyApp.Inbox', []).controller('InboxController', ['$scope', 'InboxService', function($scope, InboxService) {
    var self = this;
    self.chats=[];
    self.mensajes=[];
    self.mensaje={id:0, fecha:"", rol:false, destino:"", n_destino:"", texto:""};
    self.nuevo_mensaje={chat:"", origen:"", destino:"", texto:""};
    self.chat={id:0, fecha:"", ult_mensaje:"", destino:"", n_destino:"", invisible:false, visto:false};
    
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
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
    
    self.sendMensaje = function(nuevo_mensaje){
        InboxService.sendMensaje(nuevo_mensaje).then(function(d){
            self.ofertas = d;
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
               self.nuevo_mensaje.destino = self.chat.destino;
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
        self.nuevo_mensaje={chat:"", destino:"", texto:""};
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
                return $http.post('../mensaje', mensaje).then(function(response){
                    return response.data;
                }, 
                function(errResponse){
                    console.error('Error while fetching expenses');
                    return $q.reject(errResponse);
                });
            }
	};

}]).directive('watchScope', [function () {
  return {
    scope: {
      item: '=watchScope'
    },
    link: function (scope, element, attrs) {
      console.log('element ' + scope.item.name + ' created');
    }
  };
}]);
