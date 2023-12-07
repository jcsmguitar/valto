
import 'package:flutter/material.dart';
import 'package:VALTO/pages/cromatic.dart';
import 'package:VALTO/pages/formulario_consulta_page.dart';

class MisConsultasPage extends StatelessWidget {
  final List<Item> items = [
    Item(
      icon: Icons.check_circle_outline,
      title: 'Caso de Paternidad',
      description: 'Necesito ayuda sobre un caso de...',
      date: '2023-07-18',
      status: 'Pendiente',
    ),
    Item(
      icon: Icons.check_circle_outline,
      title: 'Documentos necesarios',
      description: '¿Qué Documentos son los necesarios para...',
      date: '2023-07-19',
      status: 'Contestado',
    ),
    Item(
      icon: Icons.check_circle_outline,
      title: 'Información sobre causas legales',
      description: 'Por favor su ayuda con la información de...',
      date: '2023-07-20',
      status: 'Pendiente',
    ),
    // Agrega más items aquí
    // Agrega más items aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis consultas'),
        backgroundColor:getColorCromatic()
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            final route = MaterialPageRoute(builder: (context)=> FormularioConsultaPage());
                         Navigator.push(context, route);
          },
          child: const Icon(Icons.add),
          backgroundColor:getColorCromatic(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(items[index].icon,     color: items[index].status == 'Contestado' ? const Color.fromARGB(255, 47, 185, 13) : null,),
            title: Text(items[index].title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(items[index].description),
                Text(items[index].date),
              ],
            ),
            trailing: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/detalle');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.arrow_forward
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
class Item {
  final IconData icon;
  final String title;
  final String description;
  final String date;
  final String status;

  Item({
    required this.icon,
    required this.title,
    required this.description,
    required this.date,
    required this.status,
  });
}