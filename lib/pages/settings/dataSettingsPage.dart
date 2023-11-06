import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mylife_plus/models/noteModel.dart';

class DataSettingsScreen extends StatefulWidget {
  const DataSettingsScreen({Key? key}) : super(key: key);

  @override
  State<DataSettingsScreen> createState() => _DataSettingsScreenState();
}

class _DataSettingsScreenState extends State<DataSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body:  Padding(padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 8),
        child: Column(
          children: [
            InkWell(child: const Card(child: Padding(padding: EdgeInsets.symmetric(horizontal: 12),
                child: SizedBox(height: 60,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("Backup Data"),
                    Icon(Icons.chevron_right_rounded)

                  ],),
                ),),),onTap: ()=> saveThenRead(),),
            InkWell(child: const Card(child: Padding(padding: EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(height: 60,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
                  Text("Upload Data"),
                  Icon(Icons.chevron_right_rounded)

                ],),
              ),),),onTap: ()=> print("hi"),),


            InkWell(child: const Card(child: Padding(padding: EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(height: 60,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
                  Text("Erase all Data"),
                  Icon(Icons.chevron_right_rounded),

                ],),
              ),),),onTap: ()=> print("hi"),),
          ],
        )
        ,),

    );
  }
  saveThenRead() async {

    var box = await Hive.openBox<Note>("notes");

    Note note = Note("Memory Title","This is a Memory Description",DateTime.now(),[15.665,20.6],{"meta1":5},[],null);

    print(await box.add(note));
    print(box.getAt(0));


  }
}



