import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../customs/notitieblok.dart';
import '../models/notitie.dart';

import 'notitie_creator.dart';

class NotitiesPagina extends StatefulWidget {
  const NotitiesPagina({
    Key key,
  }) : super(key: key);

  @override
  _NotitiesPaginaState createState() => _NotitiesPaginaState();
}

class _NotitiesPaginaState extends State<NotitiesPagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Notities'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _buildListView();
              });
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: _buildListView()),
        ],
      ),
      floatingActionButton: getFloatingActionButton(context),
    );
  }

  ListView _buildListView() {
    final notitiesBox = Hive.box('notities');
    return new ListView.builder(
      itemCount: notitiesBox.length,
      itemBuilder: (BuildContext context, int index) {
        final notitie = notitiesBox.getAt(index) as Notitie;
        return Notitieblok(notitie.titel, notitie.inhoud, Colors.red, index,
            notitie.tijdstempel);
      },
    );
  }

  Widget getFloatingActionButton(context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NotitieCreator()),
        );
      },
      child: Icon(Icons.add),
    );
  }
}
