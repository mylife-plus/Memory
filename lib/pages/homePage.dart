import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  final Map<String,Widget> iconsMap = {
    "Profile":Image.asset("assets/images/profile.png"),
    "Cash":Image.asset("assets/images/cash.png"),
    "Chat":Image.asset("assets/images/chat.png"),
    "Contact":Image.asset("assets/images/contact.png"),
    "Match":Image.asset("assets/images/match.png"),
    "Memory":Image.asset("assets/images/memory.png"),
    "Idea":Image.asset("assets/images/idea.png"),
    "Investment":Image.asset("assets/images/investment.png"),
    "Plans":Image.asset("assets/images/plans.png"),
    "Health":Image.asset("assets/images/health.png"),
    "Task":Image.asset("assets/images/task.png"),
    "Wallet":Image.asset("assets/images/wallet.png"),
    "Settings":Image.asset("assets/images/settings.png")};


  late final TabController _controller;

  @override
  void initState() {

    _controller= TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("MyLife+")),
      bottomNavigationBar: TabBar(tabs: const [
        Tab(icon: Icon(Iconsax.setting_3,color: Colors.black,),),
        Tab(icon: Icon(Iconsax.home,color: Colors.black,),),
        Tab(icon: Icon(FontAwesome.money_bill_transfer,color: Colors.black,),)
      ],
        controller: _controller,),
      body: TabBarView(controller: _controller,
          children: [
        Column(children:[Expanded(
          child: Container(
          child: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          padding: const EdgeInsets.only(bottom: 8, top: 8),
          children:  [
            ...iconsMap.keys.map((e) => InkWell(child:Column(children: [iconsMap[e]!, Text(e)],), onTap: ()=>Navigator.of(context).pushNamed(e),))
          ],),),
        ),
        ]),
        Container(color: Colors.green,),
        Container(color: Colors.yellow,),
      ]),

    ));
  }
}