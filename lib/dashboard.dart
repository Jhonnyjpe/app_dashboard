import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app_dashboard/config/responsive.dart';
import 'package:app_dashboard/config/size_config.dart';
import 'package:app_dashboard/domain/models/reporte.dart';
import 'package:app_dashboard/style/colors.dart';
import 'components/components.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController filterController = TextEditingController();
  List<Reporte> reportes = [
    Reporte(
      estado: "Critico",
      tipoDeArchivo: "Power Bi",
      titulo: "Indicador de estrategicos",
      descripcion:
          "Nostrud tempor quis pariatur commodo reprehenderit nisi eiusmod officia aliqua.",
      usuario: "Jhonny j",
      actualizacion: "1/01/2024",
      url: "https://angular.dev/",
      destinatario: "Gerencia",
    ),
    Reporte(
      estado: "Rutinario",
      tipoDeArchivo: "Power Bi",
      titulo: "Materiales con condicion de vencimiento",
      descripcion:
          "Nostrud tempor quis pariatur commodo reprehenderit nisi eiusmod officia aliqua.",
      usuario: "Jhonny j",
      actualizacion: "1/01/2024",
      url: "https://angular.dev/",
      destinatario: "Operativo",
    ),
    Reporte(
      estado: "Critico",
      tipoDeArchivo: "Power Bi",
      titulo: "Cumplimiento en el ciclo integral",
      descripcion:
          "Nostrud tempor quis pariatur commodo reprehenderit nisi eiusmod officia aliqua.",
      usuario: "Jhonny j",
      actualizacion: "1/01/2024",
      url: "https://angular.dev/",
      destinatario: "Informativo",
    ),
    Reporte(
      estado: "Prioritario",
      tipoDeArchivo: "Excel",
      titulo: "Valorizacion de inventario",
      descripcion:
          "Nostrud tempor quis pariatur commodo reprehenderit nisi eiusmod officia aliqua.",
      usuario: "Jhonny j",
      actualizacion: "1/01/2024",
      url: "https://angular.dev/",
      destinatario: "Gerencia",
    ),
    Reporte(
      estado: "Prioritario",
      tipoDeArchivo: "Excel",
      titulo: "Valorizacion de inventario",
      descripcion:
          "Nostrud tempor quis pariatur commodo reprehenderit nisi eiusmod officia aliqua.",
      usuario: "Jhonny j",
      actualizacion: "1/01/2024",
      url: "https://angular.dev/",
      destinatario: "Gerencia",
    ),
  ];

  List<Reporte> originalReportes = [];

  @override
  void initState() {
    super.initState();
    originalReportes = List.from(reportes);
  }

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  void filterItems(String query) {
    if (query.isEmpty) {
      setState(() {
        reportes = originalReportes.toList();
      });
    } else {
      List<Reporte> filteredList = originalReportes
          .where((item) =>
              item.titulo.toLowerCase().contains(query.toLowerCase()))
          .toList();

      setState(() {
        reportes = filteredList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _drawerKey,
      drawer: const SizedBox(
        width: 300,
        child: SideMenu(),
      ),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                onPressed: () {
                  _drawerKey.currentState!.openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: AppColors.black,
                ),
              ),
            )
          : const PreferredSize(
              child: SizedBox(),
              preferredSize: Size.zero,
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                flex: 2,
                child: SideMenu(),
              ),
            Expanded(
              flex: 10,
              child: SizedBox(
                height: SizeConfig.screenHeight,
                child: SingleChildScrollView(
                  padding:
                      EdgeInsets.all(Responsive.isDesktop(context) ? 30 : 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DashboardHeader(
                        reporte: reportes,
                        searchController: filterController,
                        onChanged: (value) {
                          filterItems(value);
                        },
                      ),
                      const SizedBox(height: 20),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return GridView.builder(
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  Responsive.isDesktop(context) ? 4 : 1,
                              crossAxisSpacing: 16.0,
                              mainAxisSpacing: 16.0,
                            ),
                            itemCount: reportes.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  // Manejar el evento de toque si es necesario
                                },
                                child: InfoCard(
                                  reporte: reportes[index],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
