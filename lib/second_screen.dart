import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        '"Plant Type" is used to pick the plant that is getting analyzed. '
            '"Analysis Type" is used to pick what type of analysis is getting '
            'implemented.',
        softWrap: true,
      ),
    );

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        const Text('Home'),
        IconButton(
          icon: const Icon(Icons.arrow_forward_sharp),
          onPressed: () {
            Navigator.pushNamed(context, '/third');
          },
        ),
        const Text('Next')
      ],
    );

    Widget dropDowns = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const[
        PlantTypeDropdown(),
        AnalysisTypeDropdown(),
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
            textSection,
            dropDowns,
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

class PlantTypeDropdown extends StatefulWidget {
  const PlantTypeDropdown({Key? key}) : super(key: key);

  @override
  _PlantTypeDropdown createState() {
    return _PlantTypeDropdown();
  }
}

class _PlantTypeDropdown extends State<PlantTypeDropdown> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        items: const [
          DropdownMenuItem<String>(
            child: Text('Impatien'),
            value: 'impatien',
          ),
          DropdownMenuItem<String>(
            child: Text('Phlox'),
            value: 'phlox',
          ),
          DropdownMenuItem<String>(
            child: Text('Lettuce'),
            value: 'lettuce',
          ),
          DropdownMenuItem<String>(
            child: Text('Pansy'),
            value: 'pansy',
          ),
        ],
        onChanged: (String? value) {
          setState(() {
            _value = value;
          });
        },
        hint: const Text('Plant Type'),
        value: _value,
      ),
    );
  }
}

class AnalysisTypeDropdown extends StatefulWidget {
  const AnalysisTypeDropdown({Key? key}) : super(key: key);

  @override
  _AnalysisTypeDropdown createState() {
    return _AnalysisTypeDropdown();
  }
}

class _AnalysisTypeDropdown extends State<AnalysisTypeDropdown> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        items: const [
          DropdownMenuItem<String>(
            child: Text('Nitrogen Index'),
            value: 'nitrogen',
          ),
          DropdownMenuItem<String>(
            child: Text('Germination Rate'),
            value: 'germination',
          ),
          DropdownMenuItem<String>(
            child: Text('Growth Track'),
            value: 'growth',
          ),
        ],
        onChanged: (String? value) {
          setState(() {
            _value = value;
          });
        },
        hint: const Text('Analysis Type'),
        value: _value,
      ),
    );
  }
}