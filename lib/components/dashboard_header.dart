import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:app_dashboard/config/responsive.dart';
import 'package:app_dashboard/domain/models/reporte.dart';
import 'package:app_dashboard/style/colors.dart';

class DashboardHeader extends StatefulWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onChanged;
  final List<Reporte> reporte;

  DashboardHeader({
    Key? key,
    required this.searchController,
    required this.onChanged,
    required this.reporte,
  }) : super(key: key);

  @override
  State<DashboardHeader> createState() => _DashboardHeaderState();
}

class _DashboardHeaderState extends State<DashboardHeader> {
  List<String> propiedades = [];

  @override
  void initState() {
    super.initState();
    updatePropiedades();
  }

  void updatePropiedades() {
    propiedades = widget.reporte.map((e) => e.destinatario).toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (Responsive.isDesktop(context))
          SizedBox(
            width: 420,
            child: TextField(
              onChanged: widget.onChanged,
              controller: widget.searchController,
              decoration: InputDecoration(
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: AppColors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: AppColors.white),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: 'Buscar por nombre',
                hintStyle: const TextStyle(
                  color: AppColors.secondary,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        Spacer(),
        if (propiedades.isNotEmpty)
          SizedBox(
            width: 200,
            child: CustomDropdown(
              decoration: CustomDropdownDecoration(
                  closedFillColor: Color(0xFFE7E0EC),
                  expandedFillColor: Color(0xFFE7E0EC),
                  closedBorderRadius: BorderRadius.all(Radius.circular(30)),
                  expandedBorderRadius: BorderRadius.all(Radius.circular(30))),
              initialItem: propiedades[0],
              items: propiedades,
              onChanged: (value) {},
            ),
          ),
        SizedBox(
          width: 10,
        ),
        IconButton(
          iconSize: 40,
          onPressed: () {},
          icon: Icon(Icons.settings),
        )
      ],
    );
  }
}
