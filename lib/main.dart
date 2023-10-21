import 'package:cred_neo_pop_button/widgets/add_money.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.light),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cred Neo Pop Buttons'),
          backgroundColor: Colors.black87,
        ),
        body: const Center(
          child: AddMoney(),
        ),
      ),
    );
  }
}
