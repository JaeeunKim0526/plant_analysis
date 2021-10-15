import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'The result is displayed here',
        softWrap: true,
      ),
    );

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_back_sharp),
          onPressed: () {
            Navigator.pushNamed(context, '/third');
          },
        ),
        const Text('Home'),
        IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        const Text('Next')
      ],
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
                'images/graph.png',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            textSection,
            buttonSection,
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
