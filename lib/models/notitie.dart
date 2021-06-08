import 'package:hive/hive.dart';

part 'notitie.g.dart';

@HiveType(typeId: 1)
class Notitie {
  @HiveField(0)
  final String titel;
  @HiveField(1)
  final String inhoud;
  @HiveField(2)
  final int tijdstempel;
  @HiveField(3)
  final String categorie;
  
  Notitie(this.titel, this.inhoud, this.tijdstempel, this.categorie);
}
