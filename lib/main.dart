import 'package:firebase/firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_web/alerts.dart';
import 'package:movies_web/pages/movies_page.dart';
import 'package:movies_web/pages/send_push_page.dart';

import 'firebase.dart';
import 'movie.dart';

void main() {
 // initFirebase();

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
