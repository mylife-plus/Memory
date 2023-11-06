import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:mylife_plus/utils/styles.dart';
import 'package:mylife_plus/utils/theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pointycastle/export.dart' as crypto;
import 'package:mylife_plus/models/config.dart';
import 'package:pointycastle/random/fortuna_random.dart';
import 'package:share_plus/share_plus.dart';




class SetupScreen extends StatefulWidget {
  const SetupScreen({Key? key}) : super(key: key);

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {

  final AppConfig _config = AppConfig();

  //TODO:Refactor Encryption to a separate class inside the utils file

    String publicKey = "";
    String privateKey = "";
    bool saveKey = false;
    bool setupPin = false;
    bool keyGenerated = false;
@override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 8),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Setup", style: TextStyle(fontSize: 28, color: Colors.black),),
            SizedBox.fromSize(
              size: const Size.fromHeight(80),
              child: InkWell(
                onTap: ()=>_generateKey(),
                child:  Card(
                  child:  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Text("Generate Private Key", style: normalStyle,),
                          //alert icon
                        keyGenerated?Icon(Icons.verified_user,color: primaryColor, ) :Icon(Icons.key, color: Colors.red,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox.fromSize(
              size: const Size.fromHeight(80),
              child: InkWell(
                onTap: ()=>shareKey(),
                child:  IgnorePointer(
                  ignoring: !keyGenerated,
                  child:  Card(
                    child:  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Backup Private Key", style: normalStyle,),
                      Icon(Icons.backup, color: keyGenerated?primaryColor:Colors.grey,)
                    ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Text("   Store this key safely", style: errorStyle,),
              ],
            ),
            SizedBox.fromSize(
              size: const Size.fromHeight(80),
              child: Card(elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Text("Store key in key-store", style: normalStyle,),
                      Switch(activeColor: primaryColor,value: saveKey, onChanged: (e) => setState(() {
                        saveKey=e;
                      }))
                    ],
                  ),
                ),
              ),
            ),
            const Row(
              children: [
                Text(
                    "   store the private key in the key-store\n   to automatically enter private-key"),
              ],
            ),
            SizedBox.fromSize(
              size: const Size.fromHeight(80),
              child: Card(elevation: 1,borderOnForeground: false,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Text("Activate Pin Code", style: normalStyle,),
                      Switch(activeColor: primaryColor,value: setupPin, onChanged: (e) => setState(() {
                        setupPin=e;
                      }))
                    ],
                  ),
                ),
              ),
            ),


            keyGenerated?Container(margin: EdgeInsets.only(top: 48),child: Center(child: Column(children: [
              Text('Please Store your Cipher Key Somewhere safe:\n\n'),
              SizedBox(height: 36,
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectableText(privateKey,textAlign: TextAlign.center,),
                    Padding(padding: EdgeInsets.only(left: 36),child: IconButton(onPressed: ()=>shareKey(), icon: Icon(Icons.copy,color: primaryColor,)))
                  ],
                ),
              )
            ],),),):SizedBox.shrink(),

            Padding(
              padding:  const EdgeInsets.only(top: 64,bottom: 36),
              child: IgnorePointer(


                ignoring: !keyGenerated,

                child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: keyGenerated?Colors.green:Colors.grey),onPressed: () async {

                  _config.saveKeyStored(saveKey);

                  _config.savePinCodeEnabled(setupPin);

                    if(saveKey) {
                      var box = await Hive.openBox<String>("keyStore");

                      box.put("cipherKey", privateKey);

                      print(box.get("cipherKey"));

                      if(setupPin){

                       Navigator.of(context).pushReplacementNamed("pinSetup",arguments: privateKey);

                  }
                      else{
                        Navigator.of(context).pushReplacementNamed("home");
                      }

                }},child: Container(height:50,width: 160,child:  Center(child: Text("Done",style: GoogleFonts.poppins(fontSize: 24)),),),),
              ),
            ),



          ],
      ),
    ),
        ));
  }

  /// The function "_generateKey" generates a key asynchronously.
  _generateKey() async {


  /// The line `Uint8List seed = exampleSecureRandom();` is calling the
  /// `exampleSecureRandom()` function to generate a random seed. The seed is a
  /// `Uint8List` (an array of 8-bit integers) and is used as input for generating a
  /// private key.
  Uint8List seed = exampleSecureRandom();



//Set boolean to true to show the private key and store it
  setState(() {
    keyGenerated = true;
    privateKey = String.fromCharCodes(seed);
  });

  print(privateKey);

  }

  void init() async {
    await _config.init();
  }

  shareKey() async {

  await Share.share(privateKey,subject: "MyLife+ Cipher Key");

  }




  /// The function returns a Uint8List of random bytes. acts as a seed to generate private key
  Uint8List exampleSecureRandom() {

  //Generate a 32-byte random seed using Pointy Castle's Fortuna implementation
  final secureRandom = FortunaRandom();
  final seedSource = Random.secure();
  final seed = List<int>.generate(32, (_) => seedSource.nextInt(255));
  secureRandom.seed(crypto.KeyParameter(Uint8List.fromList(seed)));
  //make sure the secureRandom is always 32 bytes long
  secureRandom.nextBytes(32);

  return secureRandom.nextBytes(32);
  }



}
