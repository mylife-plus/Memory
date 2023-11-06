import 'package:flutter/material.dart';
import 'package:mylife_plus/utils/styles.dart';


class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool storeKey = true;
  bool activatePin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [


          SizedBox(height: 60,child: InkWell(onTap: ()=>print('tapped'),child:  Card(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("backup private key", style: normalStyle,),
                const   Icon(Icons.chevron_right_rounded)
              ],),
          ),) ,),),



          
           Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text("loose this key = loose access to app data", style: errorStyle,),
          ),

          Container(height: 60,child: Card(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text("store key in key-store", style: normalStyle,),
                Switch(value: storeKey, onChanged: (e)=>setState(() {
                  storeKey = e;
                }))
              ],),
          ),),),


           Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text("store the private key in the key-store to\nautomatically enter the private key", style: errorStyle,),
          ),

          Container(height: 60,child: Card(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text("activate phone pin", style: normalStyle,),
                Switch(value: activatePin, onChanged: (e)=>setState(() {
                  activatePin= e;
                }))
              ],),
          ),),),


           Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text("the private key overrides the pin", style: errorStyle,),
          )
        ],
      ),
    );
  }
}
