import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huawei_map/map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
