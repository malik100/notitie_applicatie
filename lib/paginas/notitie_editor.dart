import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:dart_date/dart_date.dart';
import '../models/notitie.dart';

class NotitieEditor extends StatefulWidget {
  final int index;
  NotitieEditor(this.index);
  @override
  _NotitieEditorState createState() => _NotitieEditorState(index);
}

class _NotitieEditorState extends State<NotitieEditor> {
  final int index;
  _NotitieEditorState(this.index);

  @override
  initState() {
    final notitie = Hive.box('notities').getAt(index) as Notitie;
    titleController.text = notitie.titel;
    bodyController.text = notitie.inhoud;
    super.initState();
  }
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
        final editteNotitie = Notitie(titleController.text, bodyController.text, n.secondsSinceEpoch, 'werk');
        notitiesBox.putAt(index, editteNotitie);
        Navigator.popAndPushNamed(context, '/');
        Navigator.pop(context);
      },
      child: Icon(Icons.save),
    );
  }
}
