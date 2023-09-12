import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  bool _isClicked = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Przykład Fluttera"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: _isLoading
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    )
                  : Text("Kliknij mnie"),
              onPressed: () {
                if (!_isLoading) {
                  setState(() {
                    _isLoading = true;
                  });

                  Future.delayed(Duration(seconds: 3), () {
                    setState(() {
                      _isClicked = true;
                      _isLoading = false;
                    });
                  });
                }
              },
            ),
            SizedBox(width: 10),
            Text(_isClicked ? "Kliknięto!" : "Nie kliknięto"),
          ],
        ),
      ),
    );
  }
}
