import 'package:flutter/material.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:mylife_plus/pages/downloadPage.dart';
import 'package:mylife_plus/pages/homePage.dart';
import 'package:mylife_plus/pages/mapPage.dart';
import 'package:mylife_plus/pages/pinSetupPage.dart';
import 'package:mylife_plus/pages/settings/dataSettingsPage.dart';
import 'package:mylife_plus/pages/settings/memorySettingsPage.dart';
import 'package:mylife_plus/pages/settings/securityPage.dart';
import 'package:mylife_plus/pages/settingsPage.dart';
import 'package:mylife_plus/pages/setupPage.dart';
import 'package:mylife_plus/pages/settings/uiSettingsPage.dart';
import 'package:path_provider/path_provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
   Hive.init(dir.path);
  await FlutterMapTileCaching.initialise();

  runApp(
      const ProviderScope(
          child: MyApp()
      ));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: const Color.fromARGB(255, 43, 250, 77),
        textTheme: const TextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      routes: {
        "setup": (BuildContext context) => const SetupScreen(),
        "home": (BuildContext context) => const HomeScreen(),
        "settings": (BuildContext context) => const SettingsScreen(),
        "pinSetup":(BuildContext context) => const PinSetupScreen(),
        "map":(BuildContext context) => const MapScreen(),
        "Profile":(BuildContext context)=> Scaffold(appBar: AppBar(),),
        "Cash":(BuildContext context)=> Scaffold(appBar: AppBar(),),
        "Chat":(BuildContext context)=> Scaffold(appBar: AppBar(),),
        "Contact":(BuildContext context)=> Scaffold(appBar: AppBar(),),
        "Match":(BuildContext context)=> Scaffold(appBar: AppBar(),),
        "Memory":(BuildContext context)=> MapScreen(),
        "Download":(BuildContext context) => DownloadScreen(),
        "Idea":(BuildContext context)=> DownloadScreen(),
        "Investment":(BuildContext context)=> Scaffold(appBar: AppBar(),),
        "Plans":(BuildContext context)=> Scaffold(appBar: AppBar(),),
        "Health":(BuildContext context)=> Scaffold(appBar: AppBar(),),
        "Task":(BuildContext context)=> Scaffold(appBar: AppBar(),),
        "Wallet":(BuildContext context)=> Scaffold(appBar: AppBar(),),
        "Settings":(BuildContext context)=> const SettingsScreen(),
        "UI":(BuildContext context)=> const UISettingsScreen(),
        "language":(BuildContext context)=> const UISettingsScreen(),
        "security":(BuildContext context)=> const SecurityScreen(),
        "Data":(BuildContext context)=> const DataSettingsScreen(),
        "MemorySettings": (BuildContext context) => const MemorySettingsScreen()
      },
      initialRoute: "setup",
    );
  }
}


