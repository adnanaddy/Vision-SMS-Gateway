import 'package:flutter/material.dart';
import 'package:vision_sms_gateway/drawer_page.dart';
import 'package:vision_sms_gateway/hom_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vision SMS Gateway',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        key: globalKey,
        appBar: AppBar(
          title: Text('Vision SMS Gateway'),
          centerTitle: true,
        ),
        drawer: buildDrawer(),
        body: Home(),
      ),
    );
  }
}
