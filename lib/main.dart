import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const ChefApp());
}

class ChefApp extends StatelessWidget {
  const ChefApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white
          ),

        ),
      )
    );
  }
}


