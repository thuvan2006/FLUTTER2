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
      title: 'Title of Application',
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
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            bottom: createTabBar(),
            title: const Text('Flutter TabBar Example'),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text("Car")),
              Center(child: Text("Transit")),
              Center(child: Text("Bike")),
              Center(child: Text("Boat")),
              Center(child: Text("Railway")),
              Center(child: Text("Bus"))
            ],
          ),
        ));
  }

  TabBar createTabBar() {
    return const TabBar(
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
        Row(children: [
          Icon(Icons.directions_boat),
          SizedBox(width: 5),
          Text("Boat")
        ]),
        Row(children: [
          Icon(Icons.directions_railway),
          SizedBox(width: 5),
          Text("Railway")
        ]),
        Row(children: [
          Icon(Icons.directions_bus),
          SizedBox(width: 5),
          Text("Bus")
        ]),
      ],
      isScrollable: true,
    );
  }
}
