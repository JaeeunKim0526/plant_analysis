import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/second_screen.dart';
import 'package:startup_namer/camera.dart';
import 'package:startup_namer/result.dart';
// Uncomment lines 7 and 10 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

Future<void> main() async {
  // debugPaintSizeEnabled = true;
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => const MyApp(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => const SecondScreen(),
      '/third' : (context) => CameraScreen(camera: firstCamera,),
      '/fourth': (context) => const ResultScreen(),
    },
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'APTUS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
                Text(
                  'Analyzing Plant Traits Using Smartphone Application',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: IconButton(
            icon: const Icon(Icons.near_me),
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
          ),
        ),
        const Text('Customer Portal'),
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              //Navigator.pushNamed(context, '/second');
            },
          ),
        ),
        const Text('Development Portal')
        //_buildButtonColumn(color, Icons.near_me, 'Customer Portal'),
        //_buildButtonColumn(color, Icons.settings, 'Development Portal'),
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'The focus is to provide a platform and environment that enable '
            'synchronized analyzation of a plant through implementing the '
            'technology of image processing.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'APTUS Capstone Project',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('APTUS'),
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'images/plants.png',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}