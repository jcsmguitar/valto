//const String servidor="http://192.168.0.109:8099/";
const String servidor="https://www.valtogroup.com/";
//const String servidor="https://192.168.0.109:443/";
const String apiautenticacion="api/autenticacion/";
const String apiconsultas="api/consultas/";
const String apiconfiguracion="api/configuracion/";
const String apiproceso="api/proceso/";
const String imagenes="Recursos/Imagenes/";
const String assetPath="assets/";
Map<String, String> getServicios(){
  return <String,String>{
        'creartokenanonimo': '$servidor${apiautenticacion}creartokenanonimo',
        'consultasusuario': '$servidor${apiconsultas}consultausuario',
        'consultasexo': '$servidor${apiconfiguracion}sexo',
        'procesarconsulta': '$servidor${apiproceso}mensaje',
      };
}

Map<String, String> getRecursos(){
  return <String,String>{
        'imagenesserver': '$servidor$imagenes',
      };
}

Map<String, String> servicios = getServicios();
Map<String, String> recursos = getRecursos();