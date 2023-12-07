import 'package:flutter/material.dart';
import 'package:VALTO/pages/cromatic.dart';
import 'package:flutter_html/flutter_html.dart';

class TerminosCondicionesPage extends StatefulWidget {
  @override
  _TerminosCondicionesPageState createState() => _TerminosCondicionesPageState();
}

class _TerminosCondicionesPageState extends State<TerminosCondicionesPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:  getColorCromaticScafold(), // Color sólido como fondo
      appBar: AppBar(
        title: const Text('Términos y condiciones'),
        backgroundColor:getColorCromatic()
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(

          child:  _crearTerminosyCondiciones( context)
        )
        
        
      ),
    );
  }
  
  

  
 Widget _crearTerminosyCondiciones(BuildContext context) {
   
   const data =  r""" 
   <div class="wpb_wrapper">
	<div class="wpb_text_column wpb_content_element ">
		<div class="wpb_wrapper">
			<div></div>
<div style="text-align: center;"><span style="font-size: 24pt; color: #02273F;"><b>TÉRMINOS Y CONDICIONES</b></span></div>

		</div>
	</div>
	
<div class="vc_toggle vc_toggle_default vc_toggle_color_default vc_toggle_size_md vc_toggle_active"><div class="vc_toggle_title"><h2 style="color: #02273F;text-align: left" class="vc_custom_heading">Última actualización: [07/09/2023]</h2><i class="vc_toggle_icon"></i></div><div class="vc_toggle_content" style="display: block;">
<p style="font-weight: 400;">Bienvenido a nuestra aplicación de asesoría jurídica gratuita para Ecuador. Antes de utilizar nuestros servicios, le recomendamos leer detenidamente estos Términos y Condiciones de Uso. El uso de esta aplicación implica la aceptación plena y sin reservas de estos términos. Si no está de acuerdo con alguno de los términos, le recomendamos que no utilice nuestros servicios.</p>
</div></div>
<div class="vc_toggle vc_toggle_default vc_toggle_color_default vc_toggle_size_md vc_toggle_active"><div class="vc_toggle_title"><h2 style="color: #02273F;text-align: left" class="vc_custom_heading">1. Uso de la Aplicación</h2><i class="vc_toggle_icon"></i></div><div class="vc_toggle_content" style="display: block;">
<p style="font-weight: 400;">1.1. Nuestra aplicación tiene como objetivo proporcionar asesoría jurídica gratuita a usuarios en Ecuador. Sin embargo, la información proporcionada a través de la aplicación no constituye asesoramiento legal formal y no crea una relación abogado-cliente. Debe consultar a un abogado calificado para obtener asesoramiento legal específico.</p>
<p style="font-weight: 400;">1.2. Usted acepta utilizar la aplicación de manera responsable y conforme a la legislación ecuatoriana vigente. No debe utilizar la aplicación para actividades ilegales o fraudulentas.</p>
</div></div>

<div class="vc_toggle vc_toggle_default vc_toggle_color_default vc_toggle_size_md vc_toggle_active"><div class="vc_toggle_title"><h2 style="color: #02273F;text-align: left" class="vc_custom_heading">2. Privacidad y Protección de Datos</h2><i class="vc_toggle_icon"></i></div><div class="vc_toggle_content" style="display: block;">
<p style="font-weight: 400;">2.1. Nuestra aplicación recopila y procesa información personal de acuerdo con nuestra Política de Privacidad. Al utilizar la aplicación, usted acepta el procesamiento de sus datos personales de acuerdo con dicha política.</p>
</div></div>
<div class="vc_toggle vc_toggle_default vc_toggle_color_default vc_toggle_size_md vc_toggle_active"><div class="vc_toggle_title"><h2 style="color: #02273F;text-align: left" class="vc_custom_heading">3. Responsabilidad</h2><i class="vc_toggle_icon"></i></div><div class="vc_toggle_content" style="display: block;">
<p style="font-weight: 400;">3.1. Si bien nos esforzamos por proporcionar información precisa y actualizada, no garantizamos la exactitud, integridad o actualidad de la información contenida en la aplicación. No asumimos responsabilidad por las decisiones tomadas basadas en la información proporcionada.</p>
<p style="font-weight: 400;">3.2. No somos responsables de ningún daño directo, indirecto, especial o consecuente que pueda resultar del uso de la aplicación o de la interrupción de nuestros servicios.</p>
</div></div>
<div class="vc_toggle vc_toggle_default vc_toggle_color_default vc_toggle_size_md vc_toggle_active"><div class="vc_toggle_title"><h2 style="color: #02273F;text-align: left" class="vc_custom_heading">4. Propiedad Intelectual</h2><i class="vc_toggle_icon"></i></div><div class="vc_toggle_content" style="display: block;">
<p style="font-weight: 400;">4.1. Todos los derechos de propiedad intelectual relacionados con la aplicación y su contenido (textos, gráficos, logotipos, software, etc.) son propiedad de los titulares de la aplicación y están protegidos por las leyes de propiedad intelectual aplicables.</p>
<p style="font-weight: 400;">4.2. No está permitida la reproducción, distribución, modificación o cualquier otro uso no autorizado del contenido de la aplicación sin el consentimiento previo por escrito de los titulares de la aplicación.</p>
</div></div>
<div class="vc_toggle vc_toggle_default vc_toggle_color_default vc_toggle_size_md vc_toggle_active"><div class="vc_toggle_title"><h2 style="color: #02273F;text-align: left" class="vc_custom_heading">5. Cambios en los Términos y Condiciones</h2><i class="vc_toggle_icon"></i></div><div class="vc_toggle_content" style="display: block;">
<p style="font-weight: 400;">5.1. Nos reservamos el derecho de modificar estos Términos y Condiciones en cualquier momento. Cualquier cambio será efectivo a partir de la fecha de su publicación en la aplicación. Le recomendamos revisar periódicamente estos términos para estar al tanto de las actualizaciones.</p>
</div></div>

<div class="vc_toggle vc_toggle_default vc_toggle_color_default vc_toggle_size_md vc_toggle_active"><div class="vc_toggle_title"><h2 style="color: #02273F;text-align: left" class="vc_custom_heading">6. Contacto</h2><i class="vc_toggle_icon"></i></div><div class="vc_toggle_content" style="display: block;">
<p style="font-weight: 400;">6.1. Si tiene alguna pregunta o comentario sobre estos Términos y Condiciones de Uso, puede ponerse en contacto con nosotros a través de la información de contacto proporcionada en la aplicación.</p>
</div></div>
<div class="vc_toggle vc_toggle_default vc_toggle_color_default vc_toggle_size_md vc_toggle_active"><div class="vc_toggle_title"><h2 style="color: #02273F;text-align: left" class="vc_custom_heading"></h2><i class="vc_toggle_icon"></i></div><div class="vc_toggle_content" style="display: block;">
<p style="font-weight: 400;">Al utilizar nuestra aplicación de asesoría jurídica gratuita para Ecuador, usted acepta estos Términos y Condiciones de Uso. Le agradecemos por confiar en nuestros servicios y esperamos poder brindarle asesoramiento útil en cuestiones legales.</p>
</div></div>
<div class="wpb_text_column wpb_content_element ">
		<div class="wpb_wrapper">
			<div></div>
<div style="text-align: center;"><span style="font-size: 24pt; color: #02273F;"><b>POLÍTICA DE PROTECCIÓN DE DATOS PERSONALES VÁLTO</b></span></div>

		</div>
	</div>

<div class="vc_toggle vc_toggle_default vc_toggle_color_default vc_toggle_size_md vc_toggle_active"><div class="vc_toggle_title"><h2 style="color: #02273F;text-align: left" class="vc_custom_heading">Última actualización: [07/09/2023]</h2><i class="vc_toggle_icon"></i></div><div class="vc_toggle_content" style="display: block;">
<p style="font-weight: 400;">La protección de su privacidad y la seguridad de sus datos personales son fundamentales para nosotros en VÁLTÓ. Esta Política de Protección de Datos tiene como objetivo informarle sobre cómo recopilamos, utilizamos, compartimos y protegemos sus datos personales cuando utiliza nuestra aplicación.</p>
</div></div>
<div class="vc_toggle vc_toggle_default vc_toggle_color_default vc_toggle_size_md vc_toggle_active"><div class="vc_toggle_title"><h2 style="color: #02273F;text-align: left" class="vc_custom_heading">1. Información que Recopilamos</h2><i class="vc_toggle_icon"></i></div><div class="vc_toggle_content" style="display: block;">
<p style="font-weight: 400;">1.1. Datos de Registro: Cuando se registra en la aplicación VÁLTÓ, recopilamos información como su nombre, dirección de correo electrónico y contraseña para crear y mantener su cuenta.</p>
<p style="font-weight: 400;">1.2. Información de Perfil: Puede proporcionar información adicional en su perfil, como su foto, número de teléfono y datos personales relevantes.</p>
<p style="font-weight: 400;">1.3. Información de Uso: Recopilamos datos sobre cómo utiliza la aplicación, incluyendo las interacciones, consultas legales y la información que nos proporciona durante las consultas.</p>
<p style="font-weight: 400;">1.4. Información de Dispositivo: Recopilamos información sobre el dispositivo que utiliza para acceder a la aplicación, incluyendo la dirección IP, el tipo de dispositivo, la versión del sistema operativo y la información de la red.</p>
</div></div>

<div class="vc_toggle vc_toggle_default vc_toggle_color_default vc_toggle_size_md vc_toggle_active"><div class="vc_toggle_title"><h2 style="color: #02273F;text-align: left" class="vc_custom_heading">2. Uso de la Información</h2><i class="vc_toggle_icon"></i></div><div class="vc_toggle_content" style="display: block;">
<p style="font-weight: 400;">2.1. Utilizamos sus datos personales para brindarle servicios legales y asesoramiento a través de la aplicación, responder a sus consultas y mejorar la experiencia del usuario.</p>
<p style="font-weight: 400;">2.2. Podemos utilizar su dirección de correo electrónico para enviarle comunicaciones relacionadas con el servicio, actualizaciones, noticias y promociones, siempre que haya dado su consentimiento para recibirlas.</p>
</div></div>
<div class="vc_toggle vc_toggle_default vc_toggle_color_default vc_toggle_size_md vc_toggle_active"><div class="vc_toggle_title"><h2 style="color: #02273F;text-align: left" class="vc_custom_heading">3. Compartir Información</h2><i class="vc_toggle_icon"></i></div><div class="vc_toggle_content" style="display: block;">
<p style="font-weight: 400;">3.1. No compartimos su información personal con terceros sin su consentimiento, excepto en los casos en que sea necesario para prestar el servicio o cumplir con requisitos legales.</p>
<p style="font-weight: 400;">3.2. Podemos compartir información no identificable de manera personal con fines de análisis y mejora de la aplicación.</p>
</div></div>

<div class="vc_toggle vc_toggle_default vc_toggle_color_default vc_toggle_size_md vc_toggle_active"><div class="vc_toggle_title"><h2 style="color: #02273F;text-align: left" class="vc_custom_heading">4. Seguridad de los Datos</h2><i class="vc_toggle_icon"></i></div><div class="vc_toggle_content" style="display: block;">
<p style="font-weight: 400;">4.1. Tomamos medidas de seguridad técnicas, administrativas y físicas para proteger sus datos personales contra el acceso no autorizado, la divulgación, la alteración o la destrucción.</p>
</div></div>
<div class="vc_toggle vc_toggle_default vc_toggle_color_default vc_toggle_size_md vc_toggle_active"><div class="vc_toggle_title"><h2 style="color: #02273F;text-align: left" class="vc_custom_heading">5. Acceso y Control de sus Datos</h2><i class="vc_toggle_icon"></i></div><div class="vc_toggle_content" style="display: block;">
<p style="font-weight: 400;">5.1. Usted tiene derecho a acceder a sus datos personales, rectificarlos, eliminarlos o limitar su procesamiento. Puede ejercer estos derechos a través de la aplicación o contactando con nuestro equipo de soporte.</p>
</div></div>

<div class="vc_toggle vc_toggle_default vc_toggle_color_default vc_toggle_size_md vc_toggle_active"><div class="vc_toggle_title"><h2 style="color: #02273F;text-align: left" class="vc_custom_heading">6. Cambios en la Política de Protección de Datos</h2><i class="vc_toggle_icon"></i></div><div class="vc_toggle_content" style="display: block;">
<p style="font-weight: 400;">6.1. Nos reservamos el derecho de modificar esta Política de Protección de Datos en cualquier momento. Le notificaremos cualquier cambio sustancial mediante notificaciones en la aplicación o por correo electrónico.</p>
</div></div>
<div class="vc_toggle vc_toggle_default vc_toggle_color_default vc_toggle_size_md vc_toggle_active"><div class="vc_toggle_title"><h2 style="color: #02273F;text-align: left" class="vc_custom_heading">7. Contacto</h2><i class="vc_toggle_icon"></i></div><div class="vc_toggle_content" style="display: block;">
<p style="font-weight: 400;">7.1. Si tiene preguntas o preocupaciones sobre esta Política de Protección de Datos, puede ponerse en contacto con nosotros a través de la información de contacto proporcionada en la aplicación.</p>
</div></div>
<div class="vc_toggle vc_toggle_default vc_toggle_color_default vc_toggle_size_md vc_toggle_active"><div class="vc_toggle_title"><h2 style="color: #02273F;text-align: left" class="vc_custom_heading"></h2><i class="vc_toggle_icon"></i></div><div class="vc_toggle_content" style="display: block;">
<p style="font-weight: 400;">Al utilizar la aplicación VÁLTÓ, usted acepta esta Política de Protección de Datos y consiente el procesamiento de sus datos personales de acuerdo con los términos aquí establecidos. Le agradecemos por confiar en nuestros servicios y por permitirnos asesorarlo de manera efectiva y segura.</p>
</div></div>

<div class="vc_toggle vc_toggle_default vc_toggle_color_default vc_toggle_size_md vc_toggle_active"><div class="vc_toggle_title"><h2 style="color: #02273F;text-align: left" class="vc_custom_heading"></h2><i class="vc_toggle_icon"></i></div><div class="vc_toggle_content" style="display: block;">
<p style="font-weight: 400;">Correo electrónico: <a href="mailto:protecciondedatos@valto.com">protecciondedatos@valto.com</a></p>
</div></div>

<div class="vc_empty_space" style="height: 48px"><span class="vc_empty_space_inner"></span></div></div>
""";
   
   return Center(
      child: Html(
        data: data,
      ),);
 }
 

 
   
}
