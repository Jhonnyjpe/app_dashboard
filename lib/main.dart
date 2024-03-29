import 'package:flutter/material.dart';
import 'package:app_dashboard/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Dashboard',
      theme: ThemeData(
        
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const Dashboard(),
    );
  }
}
