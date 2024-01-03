import 'package:flutter/material.dart';
import 'package:app_dashboard/domain/models/reporte.dart';
import 'dart:js' as js;

class InfoCard extends StatelessWidget {
  final Reporte reporte;

  const InfoCard({
    Key? key,
    required this.reporte,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Map<String, Color> colorMap = {
      'Critico': Color(0xFFD8727D),
      'Rutinario': Color(0xFFD58D49),
      'Prioritario': Color(0xFF68B266),
    };

    Map<String, Color> colorMapAcent = {
      'Critico': Color(0xFFD8727D).withOpacity(0.2),
      'Rutinario': Color(0xFFD58D49).withOpacity(0.2),
      'Prioritario': Color(0xFF68B266).withOpacity(0.2),
    };

    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          final String url = reporte.url;
          js.context.callMethod('open', [url]);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: colorMapAcent[reporte.estado] ?? Colors.amber,
                    ),
                    child: Text(
                      reporte.estado,
                      style: TextStyle(
                        color: colorMap[reporte.estado] ?? Colors.black,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(reporte.tipoDeArchivo),
                ],
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reporte.titulo,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(reporte.descripcion),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  const Icon(Icons.person_pin),
                  const SizedBox(width: 3),
                  FittedBox(
                    child: Text(
                      reporte.usuario,
                      style: const TextStyle(fontSize: 10),
                    ),
                    fit: BoxFit.scaleDown,
                  ),
                  Spacer(),
                  const Icon(Icons.update),
                  const SizedBox(width: 3),
                  FittedBox(
                    child: Text(
                      reporte.actualizacion,
                      style: const TextStyle(fontSize: 10),
                    ),
                    fit: BoxFit.scaleDown,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
