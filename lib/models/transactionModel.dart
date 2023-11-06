import 'package:hive/hive.dart';
import 'package:mylife_plus/models/abstractModel.dart';

part 'transactionModel.g.dart';

@HiveType(typeId: 1)
class Transaction extends BaseModel{
  static const type ="Transaction";
  @HiveField(5)
   double amount;
  @HiveField(6)
   HiveList recipient ;

  Transaction(super.title, super.description, super.dateTime, super.coordinates, this.amount, this.recipient) : super();

}





