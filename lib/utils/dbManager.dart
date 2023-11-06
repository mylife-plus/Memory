import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DBManager {
  late Isar isar;
  static final DBManager _instance = DBManager._internal();

  factory DBManager() {
    return _instance;
  }

  DBManager._internal();

  Future<void> init() async {
    final dir= await getApplicationDocumentsDirectory();
    try {
       isar =  await Isar.open([], directory: dir.path);
    } catch (e) {

    }
  }
  Future<void> close() async {
    await isar.close();
  }


}