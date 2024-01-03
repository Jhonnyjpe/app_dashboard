import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String titulo;
  final int index;

  CustomTile({
    required this.titulo,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Manejar la acción cuando se selecciona el ListTile
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: 1 == index ? Colors.blue.withOpacity(0.5) : null,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.factory),
            SizedBox(width: 16),
            Text(
              titulo,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  
  }
}
