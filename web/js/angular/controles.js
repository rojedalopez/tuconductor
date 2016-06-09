'use strict';

angular.module('MyApp.Wall', []).controller('WallController', ['$scope', 'WallService', function($scope, WallService) {
          var self = this;
          self.usuario={mail:"", password:"",name:"", lastname:"", phone:""};
          self.publicaciones=[];
          self.publicacion={id:null, fecha:Date(), origen:"", cod_origen:"", destino:"", comentario:"", archivo:"", me_gusta:0, desde:"", num_comentario:0};
          self.comments=[];
          self.comment={id:null,fecha:Date(), origen:"", cod_origen:"", comentario:"", desde:"", id_publicacion:""};
          self.comentario = "";
          
          self.SaveComment = function(comment){
              WallService.SaveComment(comment)
		              .then(function(d){
                                if(d==="true"){
                                    console.log(self.publicacion.comment.length);
                                    self.publicacion.comment.push(self.comment);
                                    console.log(self.publicacion.comment.length);
                                }else{
                                    console.log("no entro");
                                }
                              }, 
				              function(errResponse){
					               console.error('Error while creating Paper.');
				              }	
                  );
          };
          
          self.llenarPublicaciones = function(){
              WallService.llenarPublicaciones()
                  .then(
      					       function(d) {
      						        self.publicaciones = d;
      					       },
            					function(errResponse){
            						console.error('Error while fetching Currencies');
            					}
      			       );
          };
          
          self.llenarComentarios = function(id){
              WallService.llenarComentarios(id)
                  .then(
      					       function(d) {
      						        self.comments = d;
      					       },
            					function(errResponse){
            						console.error('Error while fetching Currencies');
            					}
      			       );
          };
          
          self.llenarPublicaciones();
          
          self.submit = function() {
            self.SaveUser(self.usuario); 
            self.close();
          };
          
          self.close = function(){
              self.reset();
              dialog.modal( "hide" );
          };
           
           
          self.sendComment = function(id,codigo){
              self.selectPublicacion(id);
              self.comment.id = -1;
              self.comment.cod_origen = codigo;
              self.comment.id_publicacion = id;
              self.comment.comentario = self.comentario;
              self.SaveComment(self.comment);
          };
          
          self.selectPublicacion = function(id){
              for(var i = 0; i < self.publicaciones.length; i++){
                  if(self.publicaciones[i].id == id) {
                     self.publicacion = angular.copy(self.publicaciones[i]);
                     break;
                  }
              }
          };
          
          self.openComment = function(id){
              self.llenarComentarios(id);
              popup.modal( "show" );
          };
          
          self.reset = function(){
             
          };
          
      }]).factory('WallService', ['$http', '$q', function($http, $q){

	return {
                    SaveComment: function(comment){
                        return $http.post('comment', comment).then(
									function(response){
                                                                                console.log(response.data);
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while updating paper ' +errResponse);
										return $q.reject(errResponse);
									}
							);
			},
                        llenarPublicaciones: function() {
					return $http.post('profile')
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while fetching expenses');
										return $q.reject(errResponse);
									}
							);
			},
                        llenarComentarios: function(id) {
					return $http.post('listcomments?id='+id)
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while fetching expenses');
										return $q.reject(errResponse);
									}
							);
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
}; });


angular.module('MyApp.Sign', []).controller('SignUpController', ['$scope', 'SignUpService', function($scope, SignUpService) {
          var self = this;
          self.usuario={mail:"", password:"",name:"", lastname:"", phone:""};

         self.SaveUser = function(usuario){
              SignUpService.SaveSign(usuario)
		              .then(
                      self.reset, 
				              function(errResponse){
					               console.error('Error while creating Paper.');
				              }	
                  );
          };
          
          self.submit = function() {
            self.SaveUser(self.usuario); 
            self.close();
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
                                                                                console.log(response.data);
                                                                                open_message(response.data);
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while updating paper ' +errResponse);
										return $q.reject(errResponse);
									}
							);
			}
		
	};

}]);


angular.module('MyApp.Profile', []).controller('ProfileController', ['$scope', 'ProfileService', function($scope, ProfileService) {
          var self = this;
          self.usuario_dp={
                cod:"", nombre:"", apellido:"", tip_doc:"", 
                num_doc:"", fecha_nac:"", genero:"", est_civil:"", 
                movil: "", tel:"", pais:"CO", depto:"", 
                ciudad:"", dir:"", naci:"CO", la1:false, 
                la2:false, lb1:false, lb2:false, lb3:false, 
                lc1:false, lc2:false, lc3:false, cargo:"", perfil:""};
            
          self.Anios=[]; 
          
          self.experiencias=[];
          self.exp_laboral={id:-1, empresa:"", cargo:"", salario:0, bonos:0, supervisor:"", telefono:"", pais:"CO", dpto:"", 
              ciudad:"", direccion:"", mes_inicio:0, anio_inicio:0, mes_fin:0, anio_fin:0, labora:false, retiro:"", exp_meses:0};
          
          
          self.SaveDatosPersonales = function(usuario_dp){
              ProfileService.SaveDatosPersonales(usuario_dp)
		              .then(function(d){
                                btn_guardar_cambios.button('reset');
                              }, 
				              function(errResponse){
					               console.error('Error while creating Paper.');
				              }	
                  );
          };

          self.SaveExpUsuario = function(exp_laboral){
              ProfileService.SaveExpUsuario(exp_laboral)
		              .then(function(d){
                                if(d==="true"){
                                    form_experiencia.modal( "hide" );
                                    self.resetExp();
                                    self.listaExperiencias();
                                }
                              }, 
				              function(errResponse){
					               console.error('Error while creating Paper.');
				              }	
                  );
          };
          
          self.listaExperiencias = function(){
              ProfileService.listaExperiencias()
		              .then(function(d){
                                    self.experiencias = d;
                              }, 
				              function(errResponse){
					               console.error('Error while creating Paper.');
				              }	
                  );
          };
          
          self.GetUsuarioGeneral = function(){
              ProfileService.GetUsuarioGeneral()
                  .then(
      					       function(d) {
      						        self.usuario_dp = d;
                                                        console.log(self.usuario_dp.fecha_nac);
                                                        self.usuario_dp.fecha_nac =  new Date(self.usuario_dp.fecha_nac);
                                                        console.log(self.usuario_dp.fecha_nac);
                                                        self.experiencias = d.exp_laborales;
     					       },
            					function(errResponse){
            						console.error('Error while fetching Currencies');
            					}
      			       );
          };
          
                    
          self.llenarAnios = function(){
            var Anio = new Date().getFullYear();
            for(var a = Anio; a >= Anio - 100; a--){
                self.Anios.push({ID:a, Year:a});
            }
          };
          
          self.llenarAnios();
          self.GetUsuarioGeneral();
                   
          
          self.submitDP = function(){
              console.log("aqui entro");
              btn_guardar_cambios.button('loading');
              self.usuario_dp.date = self.usuario_dp.fecha_nac.toString("yyyy-MM-dd");
              self.SaveDatosPersonales(self.usuario_dp);
          };
          
          self.submitExp = function(){
              self.SaveExpUsuario(self.exp_laboral);
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
           
           
        
          self.editExp = function(id){
              for(var i = 0; i < self.experiencias.length; i++){
                  if(self.experiencias[i].id === id) {
                     self.exp_laboral = angular.copy(self.experiencias[i]);
                     form_experiencia.modal( "show" );
                     break;
                  }
              }
          };
          
                   
          self.resetExp = function(){
             self.exp_laboral={id:-1, empresa:"", cargo:"", salario:0, bonos:0, supervisor:"", telefono:"", pais:"CO", dpto:"", 
              ciudad:"", direccion:"", mes_inicio:0, anio_inicio:0, mes_fin:0, anio_fin:0, labora:false, retiro:"", exp_meses:0};
             $scope.exp_laboral.$setPristine();
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
        
        self.Paises = [
            {ID: 'AF', Nombre : 'Afganistán'},
            {ID: 'AL', Nombre : 'Albania'},
            {ID: 'DE', Nombre : 'Alemania'},
            {ID: 'AD', Nombre : 'Andorra'},
            {ID: 'AO', Nombre : 'Angola'},
            {ID: 'AI', Nombre : 'Anguilla'},
            {ID: 'AQ', Nombre : 'Antártida'},
            {ID: 'AG', Nombre : 'Antigua y Barbuda'},
            {ID: 'AN', Nombre : 'Antillas Holandesas'},
            {ID: 'SA', Nombre : 'Arabia Saudí'},
            {ID: 'DZ', Nombre : 'Argelia'},
            {ID: 'AR', Nombre : 'Argentina'},
            {ID: 'AM', Nombre : 'Armenia'},
            {ID: 'AW', Nombre : 'Aruba'},
            {ID: 'AU', Nombre : 'Australia'},
            {ID: 'AT', Nombre : 'Austria'},
            {ID: 'AZ', Nombre : 'Azerbaiyán'},
            {ID: 'BS', Nombre : 'Bahamas'},
            {ID: 'BH', Nombre : 'Bahrein'},
            {ID: 'BD', Nombre : 'Bangladesh'},
            {ID: 'BB', Nombre : 'Barbados'},
            {ID: 'BE', Nombre : 'Bélgica'},
            {ID: 'BZ', Nombre : 'Belice'},
            {ID: 'BJ', Nombre : 'Benin'},
            {ID: 'BM', Nombre : 'Bermudas'},
            {ID: 'BY', Nombre : 'Bielorrusia'},
            {ID: 'MM', Nombre : 'Birmania'},
            {ID: 'BO', Nombre : 'Bolivia'},
            {ID: 'BA', Nombre : 'Bosnia y Herzegovina'},
            {ID: 'BW', Nombre : 'Botswana'},
            {ID: 'BR', Nombre : 'Brasil'},
            {ID: 'BN', Nombre : 'Brunei'},
            {ID: 'BG', Nombre : 'Bulgaria'},
            {ID: 'BF', Nombre : 'Burkina Faso'},
            {ID: 'BI', Nombre : 'Burundi'},
            {ID: 'BT', Nombre : 'Bután'},
            {ID: 'CV', Nombre : 'Cabo Verde'},
            {ID: 'KH', Nombre : 'Camboya'},
            {ID: 'CM', Nombre : 'Camerún'},
            {ID: 'CA', Nombre : 'Canadá'},
            {ID: 'TD', Nombre : 'Chad'},
            {ID: 'CL', Nombre : 'Chile'},
            {ID: 'CN', Nombre : 'China'},
            {ID: 'CY', Nombre : 'Chipre'},
            {ID: 'VA', Nombre : 'Ciudad del Vaticano (Santa Sede)'},
            {ID: 'CO', Nombre : 'Colombia'},
            {ID: 'KM', Nombre : 'Comores'},
            {ID: 'CG', Nombre : 'Congo'},
            {ID: 'CD', Nombre : 'Congo, República Democrática del'},
            {ID: 'KR', Nombre : 'Corea'},
            {ID: 'KP', Nombre : 'Corea del Norte'},
            {ID: 'CI', Nombre : 'Costa de Marfíl'},
            {ID: 'CR', Nombre : 'Costa Rica'},
            {ID: 'HR', Nombre : 'Croacia (Hrvatska)'},
            {ID: 'CU', Nombre : 'Cuba'},
            {ID: 'DK', Nombre : 'Dinamarca'},
            {ID: 'DJ', Nombre : 'Djibouti'},
            {ID: 'DM', Nombre : 'Dominica'},
            {ID: 'EC', Nombre : 'Ecuador'},
            {ID: 'EG', Nombre : 'Egipto'},
            {ID: 'SV', Nombre : 'El Salvador'},
            {ID: 'AE', Nombre : 'Emiratos Árabes Unidos'},
            {ID: 'ER', Nombre : 'Eritrea'},
            {ID: 'SI', Nombre : 'Eslovenia'},
            {ID: 'ES', Nombre : 'España'},
            {ID: 'US', Nombre : 'Estados Unidos'},
            {ID: 'EE', Nombre : 'Estonia'},
            {ID: 'ET', Nombre : 'Etiopía'},
            {ID: 'FJ', Nombre : 'Fiji'},
            {ID: 'PH', Nombre : 'Filipinas'},
            {ID: 'FI', Nombre : 'Finlandia'},
            {ID: 'FR', Nombre : 'Francia'},
            {ID: 'GA', Nombre : 'Gabón'},
            {ID: 'GM', Nombre : 'Gambia'},
            {ID: 'GE', Nombre : 'Georgia'},
            {ID: 'GH', Nombre : 'Ghana'},
            {ID: 'GI', Nombre : 'Gibraltar'},
            {ID: 'GD', Nombre : 'Granada'},
            {ID: 'GR', Nombre : 'Grecia'},
            {ID: 'GL', Nombre : 'Groenlandia'},
            {ID: 'GP', Nombre : 'Guadalupe'},
            {ID: 'GU', Nombre : 'Guam'},
            {ID: 'GT', Nombre : 'Guatemala'},
            {ID: 'GY', Nombre : 'Guayana'},
            {ID: 'GF', Nombre : 'Guayana Francesa'},
            {ID: 'GN', Nombre : 'Guinea'},
            {ID: 'GQ', Nombre : 'Guinea Ecuatorial'},
            {ID: 'GW', Nombre : 'Guinea-Bissau'},
            {ID: 'HT', Nombre : 'Haití'},
            {ID: 'HN', Nombre : 'Honduras'},
            {ID: 'HU', Nombre : 'Hungría'},
            {ID: 'IN', Nombre : 'India'},
            {ID: 'ID', Nombre : 'Indonesia'},
            {ID: 'IQ', Nombre : 'Irak'},
            {ID: 'IR', Nombre : 'Irán'},
            {ID: 'IE', Nombre : 'Irlanda'},
            {ID: 'BV', Nombre : 'Isla Bouvet'},
            {ID: 'CX', Nombre : 'Isla de Christmas'},
            {ID: 'IS', Nombre : 'Islandia'},
            {ID: 'KY', Nombre : 'Islas Caimán'},
            {ID: 'CK', Nombre : 'Islas Cook'},
            {ID: 'CC', Nombre : 'Islas de Cocos o Keeling'},
            {ID: 'FO', Nombre : 'Islas Faroe'},
            {ID: 'HM', Nombre : 'Islas Heard y McDonald'},
            {ID: 'FK', Nombre : 'Islas Malvinas'},
            {ID: 'MP', Nombre : 'Islas Marianas del Norte'},
            {ID: 'MH', Nombre : 'Islas Marshall'},
            {ID: 'UM', Nombre : 'Islas menores de Estados Unidos'},
            {ID: 'PW', Nombre : 'Islas Palau'},
            {ID: 'SB', Nombre : 'Islas Salomñn'},
            {ID: 'SJ', Nombre : 'Islas Svalbard y Jan Mayen'},
            {ID: 'TK', Nombre : 'Islas Tokelau'},
            {ID: 'TC', Nombre : 'Islas Turks y Caicos'},
            {ID: 'VI', Nombre : 'Islas Vírgenes (EEUU)'},
            {ID: 'VG', Nombre : 'Islas Vírgenes (Reino Unido)'},
            {ID: 'WF', Nombre : 'Islas Wallis y Futuna'},
            {ID: 'IL', Nombre : 'Israel'},
            {ID: 'IT', Nombre : 'Italia'},
            {ID: 'JM', Nombre : 'Jamaica'},
            {ID: 'JP', Nombre : 'Japón'},
            {ID: 'JO', Nombre : 'Jordania'},
            {ID: 'KZ', Nombre : 'Kazajistán'},
            {ID: 'KE', Nombre : 'Kenia'},
            {ID: 'KG', Nombre : 'Kirguizistán'},
            {ID: 'KI', Nombre : 'Kiribati'},
            {ID: 'KW', Nombre : 'Kuwait'},
            {ID: 'LA', Nombre : 'Laos'},
            {ID: 'LS', Nombre : 'Lesotho'},
            {ID: 'LV', Nombre : 'Letonia'},
            {ID: 'LB', Nombre : 'Líbano'},
            {ID: 'LR', Nombre : 'Liberia'},
            {ID: 'LY', Nombre : 'Libia'},
            {ID: 'LI', Nombre : 'Liechtenstein'},
            {ID: 'LT', Nombre : 'Lituania'},
            {ID: 'LU', Nombre : 'Luxemburgo'},
            {ID: 'MK', Nombre : 'Macedonia, Ex-República Yugoslava de'},
            {ID: 'MG', Nombre : 'Madagascar'},
            {ID: 'MY', Nombre : 'Malasia'},
            {ID: 'MW', Nombre : 'Malawi'},
            {ID: 'MV', Nombre : 'Maldivas'},
            {ID: 'ML', Nombre : 'Malí'},
            {ID: 'MT', Nombre : 'Malta'},
            {ID: 'MA', Nombre : 'Marruecos'},
            {ID: 'MQ', Nombre : 'Martinica'},
            {ID: 'MU', Nombre : 'Mauricio'},
            {ID: 'MR', Nombre : 'Mauritania'},
            {ID: 'YT', Nombre : 'Mayotte'},
            {ID: 'MX', Nombre : 'México'},
            {ID: 'FM', Nombre : 'Micronesia'},
            {ID: 'MD', Nombre : 'Moldavia'},
            {ID: 'MC', Nombre : 'Mñnaco'},
            {ID: 'MN', Nombre : 'Mongolia'},
            {ID: 'MS', Nombre : 'Montserrat'},
            {ID: 'MZ', Nombre : 'Mozambique'},
            {ID: 'NA', Nombre : 'Namibia'},
            {ID: 'NR', Nombre : 'Nauru'},
            {ID: 'NP', Nombre : 'Nepal'},
            {ID: 'NI', Nombre : 'Nicaragua'},
            {ID: 'NE', Nombre : 'Níger'},
            {ID: 'NG', Nombre : 'Nigeria'},
            {ID: 'NU', Nombre : 'Niue'},
            {ID: 'NF', Nombre : 'Norfolk'},
            {ID: 'NO', Nombre : 'Noruega'},
            {ID: 'NC', Nombre : 'Nueva Caledonia'},
            {ID: 'NZ', Nombre : 'Nueva Zelanda'},
            {ID: 'OM', Nombre : 'Omán'},
            {ID: 'NL', Nombre : 'Países Bajos'},
            {ID: 'PA', Nombre : 'Panamá'},
            {ID: 'PG', Nombre : 'Papúa Nueva Guinea'},
            {ID: 'PK', Nombre : 'Paquistán'},
            {ID: 'PY', Nombre : 'Paraguay'},
            {ID: 'PE', Nombre : 'Perú'},
            {ID: 'PN', Nombre : 'Pitcairn'},
            {ID: 'PF', Nombre : 'Polinesia Francesa'},
            {ID: 'PL', Nombre : 'Polonia'},
            {ID: 'PT', Nombre : 'Portugal'},
            {ID: 'PR', Nombre : 'Puerto Rico'},
            {ID: 'QA', Nombre : 'Qatar'},
            {ID: 'UK', Nombre : 'Reino Unido'},
            {ID: 'CF', Nombre : 'República Centroafricana'},
            {ID: 'CZ', Nombre : 'República Checa'},
            {ID: 'ZA', Nombre : 'República de Sudáfrica'},
            {ID: 'DO', Nombre : 'República Dominicana'},
            {ID: 'SK', Nombre : 'República Eslovaca'},
            {ID: 'RE', Nombre : 'Reuniñn'},
            {ID: 'RW', Nombre : 'Ruanda'},
            {ID: 'RO', Nombre : 'Rumania'},
            {ID: 'RU', Nombre : 'Rusia'},
            {ID: 'EH', Nombre : 'Sahara Occidental'},
            {ID: 'KN', Nombre : 'Saint Kitts y Nevis'},
            {ID: 'WS', Nombre : 'Samoa'},
            {ID: 'AS', Nombre : 'Samoa Americana'},
            {ID: 'SM', Nombre : 'San Marino'},
            {ID: 'VC', Nombre : 'San Vicente y Granadinas'},
            {ID: 'SH', Nombre : 'Santa Helena'},
            {ID: 'LC', Nombre : 'Santa Lucía'},
            {ID: 'ST', Nombre : 'Santo Tomé y Príncipe'},
            {ID: 'SN', Nombre : 'Senegal'},
            {ID: 'SC', Nombre : 'Seychelles'},
            {ID: 'SL', Nombre : 'Sierra Leona'},
            {ID: 'SG', Nombre : 'Singapur'},
            {ID: 'SY', Nombre : 'Siria'},
            {ID: 'SO', Nombre : 'Somalia'},
            {ID: 'LK', Nombre : 'Sri Lanka'},
            {ID: 'PM', Nombre : 'St Pierre y Miquelon'},
            {ID: 'SZ', Nombre : 'Suazilandia'},
            {ID: 'SD', Nombre : 'Sudán'},
            {ID: 'SE', Nombre : 'Suecia'},
            {ID: 'CH', Nombre : 'Suiza'},
            {ID: 'SR', Nombre : 'Surinam'},
            {ID: 'TH', Nombre : 'Tailandia'},
            {ID: 'TW', Nombre : 'Taiwán'},
            {ID: 'TZ', Nombre : 'Tanzania'},
            {ID: 'TJ', Nombre : 'Tayikistán'},
            {ID: 'TF', Nombre : 'Territorios franceses del Sur'},
            {ID: 'TP', Nombre : 'Timor Oriental'},
            {ID: 'TG', Nombre : 'Togo'},
            {ID: 'TO', Nombre : 'Tonga'},
            {ID: 'TT', Nombre : 'Trinidad y Tobago'},
            {ID: 'TN', Nombre : 'Túnez'},
            {ID: 'TM', Nombre : 'Turkmenistán'},
            {ID: 'TR', Nombre : 'Turquía'},
            {ID: 'TV', Nombre : 'Tuvalu'},
            {ID: 'UA', Nombre : 'Ucrania'},
            {ID: 'UG', Nombre : 'Uganda'},
            {ID: 'UY', Nombre : 'Uruguay'},
            {ID: 'UZ', Nombre : 'Uzbekistán'},
            {ID: 'VU', Nombre : 'Vanuatu'},
            {ID: 'VE', Nombre : 'Venezuela'},
            {ID: 'VN', Nombre : 'Vietnam'},
            {ID: 'YE', Nombre : 'Yemen'},
            {ID: 'YU', Nombre : 'Yugoslavia'},
            {ID: 'ZM', Nombre : 'Zambia'},
            {ID: 'ZW', Nombre : 'Zimbabue'}
        ];
        
      }]).factory('ProfileService', ['$http', '$q', function($http, $q){

	return {
                    SaveDatosPersonales: function(usuario_dp){
                        return $http.post('usuario_dp', usuario_dp).then(
									function(response){
                                                                                console.log(response.data);
										return response.data;
									}, 
									function(errResponse){
										console.error('Error guardando datos personales ' +errResponse);
										return $q.reject(errResponse);
									}
							);
			},
                        SaveExpUsuario: function(exp_laboral){
                        return $http.post('experiencia_usuario', exp_laboral).then(
									function(response){
                                                                                console.log(response.data);
										return response.data;
									}, 
									function(errResponse){
										console.error('Error guardando datos personales ' +errResponse);
										return $q.reject(errResponse);
									}
							);
			},
                        GetUsuarioGeneral: function() {
					return $http.post('usuario_general')
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while fetching expenses');
										return $q.reject(errResponse);
									}
							);
			},
                        listaExperiencias: function() {
					return $http.post('list_experiencia')
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while fetching expenses');
										return $q.reject(errResponse);
									}
							);
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
}; });



