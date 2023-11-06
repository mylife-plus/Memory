
import 'package:hive/hive.dart';
import 'package:mylife_plus/models/abstractModel.dart';

part 'noteModel.g.dart';




@HiveType(typeId: 2)
class Note extends BaseModel{

  static const type = "Note";


  @HiveField(5)
   Map<String,dynamic> content;
  @HiveField(6)
   List<String>? filesPath;
  @HiveField(7)
    HiveList? recipient ;



  Note(super.title, super.description, super.dateTime, super.coordinates, this.content, this.filesPath, this.recipient) : super();

}