import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'o7planning',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(
        title: '',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final int _counter = 0;

  //void _incrementCounter() {
  //setState(() {
  // This call to setState tells the Flutter framework that something has
  // changed in this State, which causes it to rerun the build method below
  // so that the display can reflect the updated values. If we changed
  // _counter without calling setState(), then the build method would not be
  // called again, and so nothing would appear to happen.
  //_counter++;
  // });
  //}

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    EdgeInsets a2;
    // ignore: unused_local_variable
    EdgeInsetsDirectional a;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    isScrollable: true,
                    tabs: [
                      Row(children: [
                        Icon(Icons.directions_car),
                        SizedBox(width: 5),
                        Text("Car")
                      ]),
                      Row(children: [
                        Icon(Icons.directions_transit),
                        SizedBox(width: 5),
                        Text("Transit")
                      ]),
                      Row(children: [
                        Icon(Icons.directions_bike),
                        SizedBox(width: 5),
                        Text("Bike")
                      ]),
                    ],
                    indicator: ShapeDecoration(
                        shape: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0,
                                style: BorderStyle.solid)),
                        gradient: LinearGradient(
                            colors: [Color(0xff0081ff), Color(0xff01ff80)]))),
              ),
            ),
            title: const Text("Banner Example"),
          ),
          body: Container(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.topCenter,
              child: Banner(
                message: 'Offer 20% off',
                location: BannerLocation.topEnd,
                color: Colors.red,
                child: SizedBox(
                  height: 186,
                  width: 280,
                  child: Image.network(
                    'https://raw.githubusercontent.com/o7planning/rs/master/flutter/fast_food.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
