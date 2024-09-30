import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final Project',
      home: Scaffold(
        body: Padding(padding: EdgeInsets.all(10.0),
        child: Column(
          children: [Row(
            children: [],
          )],
        ),),

      ),
    );
  }
}