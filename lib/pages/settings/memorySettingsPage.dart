import 'package:flutter/material.dart';
import 'package:mylife_plus/utils/styles.dart';

class MemorySettingsScreen extends StatefulWidget {
  const MemorySettingsScreen({Key? key}) : super(key: key);

  @override
  State<MemorySettingsScreen> createState() => _MemorySettingsScreenState();
}

class _MemorySettingsScreenState extends State<MemorySettingsScreen> {

  List<String> tagsList = ["Food", "Transport", ""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Memory", style: headline,),),
      body: Container(padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Column(
        children: [
          SizedBox.fromSize(size: const Size.fromHeight(60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("#Meta", style: headline,),
              IconButton(onPressed: ()=>print('hi'), icon:const Icon(Icons.add_outlined))
            ],
          ),),

        SizedBox.fromSize(size: Size.fromHeight(100),child: Column(children: [SizedBox(height: 40,child: Text("Transport"),),SizedBox(height: 60,child: Row(children: [IconButton(onPressed: ()=>print('hi'), icon: Icon(Icons.add_outlined)), Card(child: Text(String.fromCharCode(0x1F600),style: normalStyle,),),Text(String.fromCharCode(0x1F600)),Text(String.fromCharCode(0x1F600))],),)],),)
        ],
      ),),
    );
  }
}
