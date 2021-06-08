import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:dart_date/dart_date.dart';
import '../models/notitie.dart';

class NotitieCreator extends StatefulWidget {
  @override
  _NotitieCreatorState createState() => _NotitieCreatorState();
}

class _NotitieCreatorState extends State<NotitieCreator> {

  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Notitie Editor'),
      ),
      body: getBody(context),
      floatingActionButton: getFloatingActionButton(context),
    );
  }
  
  Widget getBody(context) {
    return ListView(
      children: [
        TextFormField(
          controller: titleController,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Titel',
          ),
        ),
        TextFormField(
          controller: bodyController,
          maxLines: null,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Body',
          ),
        ),
      ],
    );
  }

  Widget getFloatingActionButton(context) {
    return FloatingActionButton(
      onPressed: () {
        final n = DateTime.now();
        final notitiesBox = Hive.box('notities');
        final nieuweNotitie = Notitie(titleController.text, bodyController.text, n.secondsSinceEpoch, 'werk');
        notitiesBox.add(nieuweNotitie);
        Navigator.popAndPushNamed(context, '/');
        Navigator.pop(context);
      },
      child: Icon(Icons.save),
    );
  }
}
