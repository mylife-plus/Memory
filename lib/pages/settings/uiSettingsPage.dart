import 'package:flutter/material.dart';


class UISettingsScreen extends StatefulWidget {
  const UISettingsScreen({Key? key}) : super(key: key);

  @override
  State<UISettingsScreen> createState() => _UISettingsScreenState();
}

class _UISettingsScreenState extends State<UISettingsScreen> {
  bool nightMode = true;
  bool rightHand = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),body:
      Container(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 12),
        child: Column(children: [
          Container(height: 60,child: InkWell(onTap: ()=>print('tapped'),child: Card(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Light Mode"),
              Switch(value: nightMode, onChanged: (e)=>setState(() {
                nightMode= e;
              }))
            ],),
        ),) ,),),
          Container(height: 60,child: InkWell(onTap: ()=>print('tapped'),child: Card(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Right Hand"),
                Switch(value: rightHand, onChanged: (e)=>setState(() {
                  rightHand= e;
                }))
              ],),
          ),) ,),)],),
      ),);
  }
}
