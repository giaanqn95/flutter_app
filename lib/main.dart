import 'package:flutter/material.dart';
import "package:flutter_app/ExtensionProperty/ActivityNavigation.dart";
import 'view/SecondRoute.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  String testSomething = "An dep trai";
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void getText(){
    Toast.show("${usernameController.text} - ${passwordController.text}", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor.fromHex("#2EC501"),
      body: Container(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 1 / 4,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/component.png",
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 3 / 4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50.0, left: 30, right: 30),
                      child: TextField(
                        controller: usernameController,
                        decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1.0),),
                            hintText: 'Enter username'),
                          textInputAction: TextInputAction.next
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50.0, left: 30, right: 30),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1.0),),
                            hintText: 'Enter password'),
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    _buildColumnBottom()
                  ],
                ),
              ),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Column _buildColumnBottom() {
    Color colorButton = Theme.of(context).primaryColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 30, width: 50),
        RaisedButton(
          onPressed: () {
            getText();
          },
          child: Text(
            "Test something",
            style:
                TextStyle(fontSize: 20, color: Theme.of(context).accentColor),
          ),
        ),
      ],
    );
  }
}
