import 'package:hive/hive.dart';
import 'package:isar/isar.dart';

enum ModelType { note, transaction, contact }

class BaseModel {
  @HiveField(0)
  final String title;
@HiveField(1)
  final String description;
@HiveField(2)
  final DateTime dateTime;
@HiveField(3)
  final List<double> coordinates;

  static String type = "Base";

  BaseModel( this.title, this.description, this.dateTime,
      this.coordinates);

  static String getType() => type;

  List<double> getCoordinates()=> coordinates;
}


