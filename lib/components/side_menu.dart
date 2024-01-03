import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:app_dashboard/config/responsive.dart';
import 'package:app_dashboard/config/size_config.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int selectedIndex = 0; // Índice del elemento seleccionado

  @override
  Widget build(BuildContext context) {
    List<String> menuItems = ['Abastecimiento interno', 'Producto terminado'];

    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 15, top: 15),
      child: Drawer(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.8),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
          ),
        ),
        child: Container(
          height: SizeConfig.screenHeight,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Responsive.isDesktop(context)
                    ? Padding(
                        padding: const EdgeInsets.only(top: 40,bottom: 70),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spin(child: const Icon(Icons.data_saver_off_rounded,size: 40,),animate: true,infinite: true,duration: const Duration(seconds: 5),spins: 1),
                            const SizedBox(width: 10,),
                            const Text(
                              "Indicadores",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(
                        height: 50,
                      ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        tileColor: index == selectedIndex
                            ? const Color(0xFFE8DEF8)
                            : null,
                        title: Center(child: Text(menuItems[index])),
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                          // Puedes realizar otras acciones aquí al seleccionar el elemento
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
