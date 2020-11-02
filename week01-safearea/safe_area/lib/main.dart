import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 01 - Safe Area',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _safeArea = false;

  List<Widget> get _mike => List.generate(4, (i) => Image.asset('assets/images/mike.jpg', width: 60));

  String get _text => _safeArea ? 'Hide Mike Wazowski removing SafeArea' : 'Save Mike Wazowski with SafeArea';

  _changeSafeArea() => setState(() => _safeArea = !_safeArea);

  Widget _buildRow() {
    Row _row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _mike,
    );

    return _safeArea ? SafeArea(child: _row) : _row;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          _buildRow(),
          Spacer(),
          MaterialButton(
            child: Text(_text),
            color: Colors.green,
            padding: const EdgeInsets.all(10),
            onPressed: _changeSafeArea,
            textColor: Colors.white,
          ),
          Spacer(),
          _buildRow(),
        ],
      ),
    );
  }
}
