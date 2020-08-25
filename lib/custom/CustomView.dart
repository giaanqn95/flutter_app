import 'package:flutter/material.dart';
import 'package:flutter_app/ExtensionProperty/ActivityNavigation.dart';

class EditTextWidget extends StatefulWidget {
  BuildContext context;
  String hint;
  TextEditingController textEditingController;
  TextInputType keyboardType;
  Icon iconStart;
  Icon iconEnd;
  bool isPassword;

  EditTextWidget(
      {Key key,
      @required this.context,
      @required this.hint,
      @required this.textEditingController,
      @required this.keyboardType,
      @required this.iconStart,
      @required this.iconEnd,
      @required this.isPassword})
      : super(key: key);

  @override
  EditTextWidgetState createState() => EditTextWidgetState();
}

class EditTextWidgetState extends State<EditTextWidget> {
  void changeInputType() {
    print("changeInputType");
    setState(() {
      print("changeInputType ${widget.isPassword}");
      widget.isPassword = !widget.isPassword;
      print("changeInputType ${widget.isPassword}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.hint,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 16, color: HexColor.fromHex("#2E2E2E"))),
        Container(
          margin: EdgeInsets.only(top: 5.0),
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 2.0, color: Colors.green)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              widget.iconStart != null
                  ? Container(
                      child: widget.iconStart,
                      margin: EdgeInsets.only(left: 10))
                  : Container(),
              Expanded(
                child: TextField(
                  obscureText: widget.isPassword,
                  controller: widget.textEditingController,
                  keyboardType: widget.keyboardType,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent, width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent, width: 1.0)),
                      hintText: widget.hint),
                  textInputAction: TextInputAction.done,
                ),
              ),
              widget.iconEnd != null
                  ? Container(
                decoration: BoxDecoration(color: Colors.black),
                      child: IconButton(
                        icon: widget.iconEnd,
                        onPressed: () {
                          changeInputType();
                        },
                      ),
                      margin: EdgeInsets.only(right: 10))
                  : Container()
            ],
          ),
        )
      ],
    );
  }
}
