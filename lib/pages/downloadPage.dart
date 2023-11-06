import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/disposable.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> with DisposableWidget {

  late DownloadManagement downloadManager ;
  late SharedPreferences prefs;
  late StreamSubscription<DownloadProgress> _subscription;

  final downloadable = RectangleRegion(
    LatLngBounds(
      const LatLng(90,-180), // North West
      const LatLng(-90,180), // South East
    ),
  ).toDownloadable(
    minZoom: 1, maxZoom: 7, options: TileLayer(
    minZoom: 1,
    maxZoom: 8,
    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    userAgentPackageName: 'com.mylifeplus.map',),);


  Duration eta = const Duration();
  double size = 0;
  double percentage =0;




  @override
  void initState()  {

    try{
      _initialize();
    }
    catch(e){};

    FMTC.instance.call("mapStore").manage.create();
    print(FMTC.instance.call("mapStore").stats.storeSize);
    print(FMTC.instance.call("mapStore").manage.ready);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title:Text('Memory Map Download'), centerTitle: true,),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Downloading the Map is required in order to use the app.", textAlign: TextAlign.center,),
        
        ElevatedButton(onPressed: () async =>  {

          downloadManager = FMTC.instance.call("mapStore").download,
    
          downloadManager.check(downloadable).then((value) => print(value)),
            // if(manager.isPaused()) manager.resume(),

          _startDownloading(),

        }, child:Text("Download & Recover")),
        const Text("Please wait while the map is being downloaded.", textAlign: TextAlign.center,),

        Text("estimated time remaining:  "+ eta.inSeconds.toString() + " seconds"),
        Text("Downloaded Size:  ${(size/1024).toStringAsFixed(2)}  MiB"),
        const SizedBox(height: 50,),
        Container(padding: const EdgeInsets.symmetric(horizontal: 32),height:8,width: double.infinity,child: LinearProgressIndicator(backgroundColor: Colors.grey,minHeight: 8,value: percentage/100,color: Colors.cyan,
        borderRadius: BorderRadius.circular(4),))

      ],),
    ));
  }



_resetAndStartDownloading() async {

    FMTC.instance.call("mapStore").manage.reset();

  _subscription= downloadManager.startForeground(region: downloadable).listen((
      event) {


    setState(() {
      percentage = event.percentageProgress;

      eta = event.estRemainingDuration;

      size = event.successfulSize;
    });
  }, onDone: () {

    prefs.setBool("mapDownloaded", true);
    Navigator.of(context).pushNamed("Memory");
  });
}
_startDownloading() async {
     if(FMTC.instance.call("mapStore").manage.ready) {

       
       return downloadManager.startForeground(region: downloadable).listen((
           event) {
         setState(() {
           percentage = event.percentageProgress;
           eta = event.estRemainingDuration;
           size = event.successfulSize;

         });
       }, onDone: () {
         prefs.setBool("mapDownloaded", true);
         Navigator.of(context).pushNamed("Memory");
       }, onError: (e,stackTrace)=>{
          print(e.toString()),
         _resetAndStartDownloading()

       },
       cancelOnError: true);
     }

  }
@override
  void dispose() {

_subscription.cancel();

    super.dispose();
  }

_initialize() async {
    try{
      await FMTC.initialise();
       prefs = await SharedPreferences.getInstance();

       await FMTC.instance.call("mapStore").manage.createAsync();

       downloadManager =   FMTC.instance.call("mapStore").download;
    }
    catch(e){};
     prefs = await SharedPreferences.getInstance();


    print("initialized");
  }



}
