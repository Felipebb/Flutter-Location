import 'package:flutter/material.dart';
import 'src/bloc/location_bloc.dart';

void main() => runApp(MyApp());
final service = LocationService();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: MyHomePage(),
            );
      }
  }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.lat, this.long}) : super(key: key);
  final double lat;
  final double long;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: service.locationStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox();
        }
        var info = snapshot.data;
        var lat = info.lat.toString();
        var long = info.long.toString();
        //print(lat);
        //print(long);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("Teste Location"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Latitude: "+lat,
                ),
                Text("Longitude: "+ long)
              ],
            ),
          ),
        );
      }
    );
  }
}
