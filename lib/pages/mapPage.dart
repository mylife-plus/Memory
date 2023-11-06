import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:latlong2/latlong.dart';
import 'package:mylife_plus/utils/styles.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {



  @override
  void initState() {

    _initialize();

    _controller.mapEventStream.listen((event) {
      print(event.camera.zoom);
      print("north is: "+event.camera.visibleBounds.northEast.latitude.toString() +" "+event.camera.visibleBounds.northEast.longitude.toString());
      print("south is: "+event.camera.visibleBounds.southWest.latitude.toString() +" "+event.camera.visibleBounds.southWest.longitude.toString());
    });
    super.initState();
  }

  final MapController _controller = MapController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Memory Map",style: headline,),centerTitle: true,),
      body: FlutterMap(options: const MapOptions(
        //TODO:refactor constant Values to a class.
        initialCenter: LatLng(51.509364, -0.128928),
        initialZoom: 1,
        maxZoom: 8
      ), mapController: _controller, children: [

        TileLayer(
          evictErrorTileStrategy: EvictErrorTileStrategy.notVisible,
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'com.example.app',
          tileProvider: FMTC.instance.call("mapStore").getTileProvider(),
      ),
      RichAttributionWidget(
        attributions: [
          TextSourceAttribution(
            'MyLife+',
            onTap: () => print('https://openstreetmap.org/copyright'),
          ),
      ])],),
    ));
  }

  _initialize() async{
    try{
      await FMTC.initialise();
    }
    catch(e){};

  }

}
