import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huawei_map/map.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  HuaweiMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Huawei map style example'),
        ),
        body: Center(
          child: HuaweiMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
                target: LatLng(52.236339248338254, 20.997119033530335),
                zoom: 17.0),
          ),
        ));
  }

  Future<void> _onMapCreated(HuaweiMapController controller) async {
    mapController = controller;
    if (Theme.of(context).brightness == Brightness.dark) {
      var mapStyle = await rootBundle
          .loadString('assets/mapstyle_night_hms.json');
      await mapController.setMapStyle(mapStyle);
    }
  }
}
