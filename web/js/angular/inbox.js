'use strict';

angular.module('MyApp.Inbox', []).controller('InboxController', ['$scope', 'InboxService', '$interval', '$timeout', '$q', '$log', 
    function($scope, InboxService, $interval, $timeout, $q, $log) {
    var self = this;
    
    self.chats=[];
    self.mensajes=[];
    self.destinos;
    self.dest={destino:"", n_destino:""};
    self.mensaje={id:0, fecha:"", rol:false, destino:"", n_destino:"", texto:""};
    self.nuevo_mensaje={chat:"", texto:"", destino:""};
    self.chat={id:0, fecha:"", ult_mensaje:"", destino:"", n_destino:"", invisible:false, visto:false};
    self.listaDestinos = function(){
        InboxService.listaDestinos().then(function(d){
            self.destinos = d;
            self.simulateQuery = true;
            self.isDisabled    = false;
            self.repos         = self.destinos;
            self.querySearch   = querySearch;
            self.selectedItemChange = selectedItemChange;
            self.searchTextChange   = searchTextChange;
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
    
    self.listaDestinos();
  
    
    
    function querySearch (query) {
      var results = query ? self.repos.filter( createFilterFor(query) ) : self.repos,
          deferred;
      if (self.simulateQuery) {
        deferred = $q.defer();
        $timeout(function () { deferred.resolve( results ); }, Math.random() * 1000, false);
        return deferred.promise;
      } else {
        return results;
      }
    }
    function searchTextChange(text) {
      $log.info('Text changed to ' + text);
    }
    function selectedItemChange(item) {
        self.mensajes=[];
        self.mensaje={id:0, fecha:"", rol:false, destino:"", n_destino:"", texto:""};
        self.nuevo_mensaje={chat:"", texto:"", destino:""};
        self.chat={id:0, fecha:"", ult_mensaje:"", destino:"", n_destino:"", invisible:false, visto:false};
        self.chat.id=-1;
        self.nuevo_mensaje.destino = item.destino;
        self.nuevo_mensaje.chat = -1;
    }
    
    self.listaChats = function(){
        InboxService.listaChats().then(function(d){
            self.chats = d;
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
    
    
    
    function createFilterFor(query) {
      var lowercaseQuery = angular.lowercase(query);
      return function filterFn(item) {
        return (item.value.indexOf(lowercaseQuery) === 0);
      };
    };
    
    self.listaMensajes = function(id){
        InboxService.listaMensajes(id).then(function(d){
            self.mensajes = d;
            $timeout(function() {
                var scroller = document.getElementById("contenedor_mensaje");
                scroller.scrollTop = scroller.scrollHeight;
            }, 0, false);
        },function(errResponse){
            console.error('Error while creating Paper.');
        });
    };
    
    self.sendMensaje = function(nuevo_mensaje){
        InboxService.sendMensaje(nuevo_mensaje).then(function(d){
            self.listaMensajes(self.chat.id); 
            self.nuevo_mensaje.chat = self.chat.id;
            self.nuevo_mensaje.texto = "";
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
    };
    
    self.reset = function(){
        self.nuevo_mensaje={texto:""};
        console.log(self.chat.id);
        if(self.chat.id!=="0"){
            self.nuevo_mensaje.chat = self.chat.id;
        }
    };
      
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
            listaDestinos: function() {
                return $http.post('../list_destino').then(function(response){
                    return response.data.map( function (repo) {
                        repo.value = repo.n_destino.toLowerCase();
                        console.log(repo);
                        return repo;
                    });
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
        };
}]);
