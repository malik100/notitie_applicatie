import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'models/notitie.dart';
import 'paginas/notities_pagina.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(NotitieAdapter());
  runApp(NotitieApplicatie());
}

class NotitieApplicatie extends StatefulWidget {
  @override
  _NotitieApplicatieState createState() => _NotitieApplicatieState();
}

class _NotitieApplicatieState extends State<NotitieApplicatie> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notitie Applicatie',
      home: FutureBuilder(
        future: Hive.openBox('notities'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return Text(snapshot.error.toString());
            else
              return NotitiesPagina();
          } else
            return Scaffold();
        },
      ),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
