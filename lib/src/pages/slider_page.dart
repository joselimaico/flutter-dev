import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100.0;

  bool _checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _createSlider(),
            _createCheckbox(),
            _createSwitch(),
            Expanded(child: _createImage()),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      value: _sliderValue,
      min: 10.0,
      max: 400.0,
      // divisions: 9,
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      onChanged: _checkboxValue
          ? null
          : (double value) {
              setState(() {
                _sliderValue = value;
              });
            },
    );
  }

  Widget _createImage() {
    return Image(
        image: NetworkImage(
            "https://1.bp.blogspot.com/-ZKmwpS1lIyQ/XAbQj5lyzhI/AAAAAAAA5mI/gqjYV-XMho0ZXfqJawFtavy4ZOePSlBXwCLcBGAs/s1600/6d56a3fc6901ea17715d0695a89f281f.jpg"),
        width: _sliderValue,
        fit: BoxFit.contain);
  }

  Widget _createCheckbox() {
    // return Checkbox(
    //     value: _checkboxValue,
    //     onChanged: (value) {
    //       setState(() {
    //         _checkboxValue = value;
    //       });
    //     });

    return CheckboxListTile(
        title: Text("Bloquear Slider"),
        value: _checkboxValue,
        onChanged: (value) {
          setState(() {
            _checkboxValue = value;
          });
        });
  }

  Widget _createSwitch() {
    return SwitchListTile(
        title: Text("Bloquear Slider"),
        value: _checkboxValue,
        onChanged: (value) {
          setState(() {
            _checkboxValue = value;
          });
        });
  }
}
