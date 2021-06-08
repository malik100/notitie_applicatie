import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:dart_date/dart_date.dart';
import 'package:notitie_applicatie/paginas/notitie_editor.dart';


class Notitieblok extends StatelessWidget {
  final String titel;
  final String inhoud;
  final Color achtergrondKleur;
  final int index;
  final int tijdstempel;
  Notitieblok(this.titel, this.inhoud, this.achtergrondKleur, this.index,
      this.tijdstempel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        direction: Axis.vertical,
        actionPane: SlidableBehindActionPane(),
        actions: [
          IconSlideAction(
            icon: Icons.delete,
            caption: 'Delete',
            onTap: () {
              Hive.box('notities').deleteAt(index);
            },
          ),
          IconSlideAction(
            icon: Icons.edit,
            caption: 'Edit',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotitieEditor(index)),
              );
            },
          ),
        ],
        actionExtentRatio: 1 / 2,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: achtergrondKleur,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titel.toLowerCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  inhoud.length > 200
                      ? inhoud.substring(0, 200) + ' ... '
                      : inhoud,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  DateTime.fromMillisecondsSinceEpoch(tijdstempel * 1000)
                      .toHumanString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
