import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'o7planning.org',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreenPage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const HomePage(),
        '/details': (BuildContext context) => const DetailsPage(),
        '/about': (BuildContext context) => const AboutPage(),
      },
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title of About Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Close'),
          onPressed: () {
            // Close page
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.cyan[100],
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title of Details Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Close'),
          onPressed: () {
            // Close page and pass a value back to previous page
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.lightGreen[100],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title of Home Page"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              child: const Text('Go to Details Page'),
              onPressed: () {
                Navigator.of(context).pushNamed('/details');
              },
            ),
            ElevatedButton(
              child: const Text('Go to About Page'),
              onPressed: () {
                Navigator.of(context).pushNamed('/about');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  int loadingPercent = 0;

  Future<String> loadFromFuture() async {
    // <fetch data from server. ex. login>
    while (loadingPercent < 100) {
      setState(() {
        loadingPercent++;
        if (kDebugMode) {
          print("Percent: $loadingPercent");
        }
      });
      // Delay 100 millisecond.
      await Future.delayed(const Duration(milliseconds: 100));
    }
    // Show Main Screen (After Splash Screen)
    return Future.value('/home');
  }

  @override
  Widget build(BuildContext context) {
    // Return an empty container here since the splash screen is handled by flutter_native_splash
    return Container();
  }

  @override
  void initState() {
    super.initState();
    // Remove splash screen when initialization is completed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
  }
}
