import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/ExtensionProperty/ActivityNavigation.dart';
import 'package:flutter_app/custom/CustomView.dart';
import 'package:flutter_app/model/LoginBinding.dart';
import 'package:flutter_app/model/BaseResponse.dart';
import 'package:flutter_app/network_service/BaseRepository.dart';
import 'package:flutter_app/network_service/HttpService.dart';
import 'package:flutter_app/view/FetchAlbum.dart';
import 'network_service/KeyRequest.dart';
import 'view/SecondRoute.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'network_service/BaseRepository.dart';

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
  BaseResponse user;
  LoginBinding loginBinding;
  Future<StateRepository> futureState;

  @override
  void initState() {
    super.initState();
    futureState = get(KeyRequest.GET_SOMETHING, "200");
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void getText() {
    Toast.show(
        "${usernameController.text} - ${passwordController.text}", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }

  Future<void> login() async {
    print("call api");
    String a = KeyExtensionMap.valuesMap[KeyRequest.GET_SOMETHING];
    Toast.show("call api ne", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    loginBinding = new LoginBinding(
      username: usernameController.text,
      password:
      "cI1eVifkKE9E0P8lHOuWvhkOa3aSD+PFvcf8tFB/+pK9N8bjU33aw3hl7kgWuiZ5Y2lPDwvVELJjYtO4V6d8+ihtv4A5HhFnwbbg++E/yawmuJq4VV2LRoudBZ4rj1hmCAGu3BJqaJF0eZX6NAsmgN/NCpLRkQlSQkE3vviBd7F0Gvzsj7m5ER7G8jFN3bpqUASPUo6UhVBBLeLE+k/w0/0IT0NBlKOGidXoX2cb5HLgHx6q8+JO7llKPsI7WI1YGsYuEsqDbTxuEkpX+7ZHD+e9F94l7GIy5ujIRXt1yVD2cKTt9gGOHT2vKwI6Dcw6CTBYWJVVDPt5X0nG63YLcg==",
    );
    final http.Response response = await http.post(
      'https://api.ihp.dev.intelin.vn/user/login',
      body: loginBinding.toJson(),
    );
    if (response.statusCode == 200) {
      print("call api response =  ${response.body}");
      BaseResponse base = BaseResponse.fromJson(json.decode(response.body));
      if (base.code == "LOGIN_2000") {
        pushPage(context, FetchAlbumWidget());
      }
      print(base.data);
    } else {
      print("call api fail");
      Toast.show("Error", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
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
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 1 / 4,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Image.asset(
                  "assets/images/component.png",
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 3 / 4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0))),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50.0, left: 30, right: 30),
                      child: EditTextWidget(
                          context: context,
                          hint: "username",
                          textEditingController: usernameController,
                          keyboardType: TextInputType.number,
                          iconStart: null,
                          isPassword: false),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50.0, left: 30, right: 30),
                      child: EditTextWidget(
                          context: context,
                          hint: "password",
                          textEditingController: passwordController,
                          keyboardType: TextInputType.text,
                          iconStart: null,
                          iconEnd: Icon(Icons.ac_unit),
                          isPassword: true),
                    ),
                    FutureBuilder<StateRepository>(
                      future: futureState,
                      builder: (context, snapshot) {
                       return snapshot.data.use(
                                (loading) => CircularProgressIndicator(),
                                (success) => Text(success.baseResponse.code),
                                (error) =>  Text(error.error));
                      },
                    ),
                    _buildColumnBottom(),
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  Column _buildColumnBottom() {
    Color colorButton = Theme
        .of(context)
        .primaryColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 30, width: 50),
        RaisedButton(
          onPressed: () {
            login();
          },
          child: Text(
            "Test something",
            style:
            TextStyle(fontSize: 20, color: Theme
                .of(context)
                .accentColor),
          ),
        ),
      ],
    );
  }

  Container buildText() {
    return Container();
  }
}
