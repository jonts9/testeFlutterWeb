import 'package:flutter/material.dart';
import 'package:movies_web/pages/movies_page.dart';

import 'firebase.dart';

void main() {
 initFirebase();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MoviesPage(),
    );
  }
}

class HelloPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste"),
      ),
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
