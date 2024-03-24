import 'package:flutter/material.dart';
import 'package:GameJams/view/mainInterface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        //On retire le bandesau debug
        debugShowCheckedModeBanner: false,
        home: MainInterface());
  }
}
