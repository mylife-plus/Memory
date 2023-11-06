
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'config.g.dart';


class AppConfig {
  late SharedPreferences prefs;

  //Singleton
  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() {
    return _instance;
  }

  AppConfig._internal();

  //End Singleton

  Future<void> init() async {
     prefs = await SharedPreferences.getInstance();
final dir= await getApplicationDocumentsDirectory();
     Hive.init(dir.path);
  }

  Future<void> dispose() async {
    await Hive.close();
  }

  Future<void> saveTheme(String theme) async {
    await prefs.setString("theme", theme);
  }

  Future<void> saveLanguage(String language) async {
    await prefs.setString("language", language);
  }

  Future<void> saveKeyStored(bool keyStored) async {
    await prefs.setBool("keyStored", keyStored);
  }

  Future<void> savePinCodeEnabled(bool pinCodeEnabled) async {
    await prefs.setBool("pinCodeEnabled", pinCodeEnabled);
  }


  Future<String?> getTheme() async {
    return prefs.getString("theme");
  }

  Future<String?> getLanguage() async {
    return prefs.getString("language");
  }

  Future<bool?> getKeyStored() async {
    return prefs.getBool("keyStored");
  }

  Future<bool?> getPinCodeEnabled() async {
    return prefs.getBool("pinCodeEnabled");
  }

  Future<void> saveConfig(DBConfig dbConfig) async {

    final dir= await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(DBConfigAdapter());
   var box = await Hive.openBox<DBConfig>("config");
   
   box.put("config", dbConfig);
    
  }









}

@HiveType(typeId: 0)
class DBConfig{
@HiveField(0)
 String theme;
@HiveField(1)
 String language;
@HiveField(2)
 bool keyStored;
@HiveField(3)
 bool pinCodeEnabled;

DBConfig(this.theme, this.language, this.keyStored, this.pinCodeEnabled);
}
