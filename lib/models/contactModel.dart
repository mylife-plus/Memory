import 'package:hive/hive.dart';
import 'package:mylife_plus/models/abstractModel.dart';


part 'contactModel.g.dart';
@HiveType(typeId: 3)

class Contact extends BaseModel {

  static String type="Contact";


  @HiveField(5)
  final String telephone;
  @HiveField(6)
  final String email;
  @HiveField(7)
  final String homeAddress;
  @HiveField(8)
  final String workAddress;
  @HiveField(9)
  final String photoPath;
  @HiveField(10)
  final DateTime? birthday;
  @HiveField(11)
  final String? faith;
  @HiveField(12)
  final String? hobby;
  @HiveField(13)
  final String? job;
  @HiveField(14)
  final String? firstMemory;







  Contact(super.title, super.description, super.dateTime, super.coordinates, this.telephone, this.email, this.photoPath, this.homeAddress, this.workAddress, this.birthday, this.faith, this.hobby, this.job, this.firstMemory) : super();
}