import 'package:flutter/material.dart';
import 'package:GameJams/view/mainInterface.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  Supabase.initialize(
    url: 'https://wozhakobpiapbxstxmjd.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Indvemhha29icGlhcGJ4c3R4bWpkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTEzMjAyNjksImV4cCI6MjAyNjg5NjI2OX0.qOyhIaTC18H6oUSD9sgNcZVU4oAFBRREIZrO703R6mo',
  );

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
