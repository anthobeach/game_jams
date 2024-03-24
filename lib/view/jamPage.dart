import 'package:flutter/material.dart';

class JamPage extends StatefulWidget {
  const JamPage({super.key});

  @override
  State<JamPage> createState() => _JamPageState();
}

class _JamPageState extends State<JamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('Jam Page'),
    ));
  }
}
