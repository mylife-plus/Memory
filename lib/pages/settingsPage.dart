import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  final List<String> iconsList = ["UI.png", "language.png","security.png","Data.png"];

  final List<String> appsList = ["Memory","Cash","Investment","Idea","Task","Contact"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings"),),
      body: Column(
        children: [
          SizedBox(height: 50,),
          Row(children: [Text('     General')],),
      ...iconsList.map((e) => InkWell(child:Card(child: Container(height: 40,padding: EdgeInsets.symmetric(horizontal: 12),child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        Image.asset("assets/images/"+e),
        SizedBox(width: 280,child: Text(e.substring(0,e.length-4),textAlign: TextAlign.start,)),
        Icon(Icons.chevron_right_rounded)

      ],),),), onTap: ()=>Navigator.of(context).pushNamed(e.substring(0,e.length-4)),)),


          const SizedBox(height: 50,),
          const Row(children: [Text('     Apps')],),

          ...appsList.map((e) => InkWell(child:Card(child: Container(height: 40,padding: const EdgeInsets.symmetric(horizontal: 12),child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Image.asset("assets/images/"+e.toLowerCase()+".png"),
            SizedBox(width: 280,child: Text(e,textAlign: TextAlign.start,)),
            const Icon(Icons.chevron_right_rounded)

          ],),),), onTap: ()=>Navigator.of(context).pushNamed(e+"Settings"),)),





        ],
      )
    );
  }
}

