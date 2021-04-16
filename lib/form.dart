import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'main.dart';

class FormFeed extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Color hexToColor(String code) {
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Feedback",
        home: new Material(
            child: new Container (
                padding: const EdgeInsets.all(30.0),
                color: Colors.white,
                child: new Container(
                  child: new Center(
                      child: new Column(
                          children : [
                            new Padding(padding: EdgeInsets.only(top: 140.0)),
                            new Text('Feedback',
                              style: new TextStyle(color: hexToColor("#F2A03D"), fontSize: 25.0),),
                            new Padding(padding: EdgeInsets.only(top: 50.0)),
                            new TextFormField(
                              decoration: new InputDecoration(
                                labelText: "Masukkan Nama",
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(
                                  ),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if(val.length==0) {
                                  return "Name cannot be empty";
                                }else{
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              style: new TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                            new Padding(padding: new EdgeInsets.only(top: 20.0)),
                            new TextFormField(
                              decoration: new InputDecoration(
                                labelText: "Masukkan Email",
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(
                                  ),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if(val.length==0) {
                                  return "Email cannot be empty";
                                }else{
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              style: new TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                            new Padding(padding: new EdgeInsets.only(top: 20.0)),
                            new TextFormField(
                              decoration: new InputDecoration(
                                labelText: "Your Feedback",
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(
                                  ),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if(val.length==0) {
                                  return "Feedback cannot be empty";
                                }else{
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              style: new TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                            new Padding(padding: new EdgeInsets.only(top: 20.0)),
                            Container(
                              //height: double.infinity,
                              margin: EdgeInsets.only(left: 10,right: 10,bottom: 20),
                              child: RaisedButton(
                                onPressed: () {
                                  _onAlertButtonsPressed(context);
                                },
                                padding: EdgeInsets.all(10.0),
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: Text(
                                  'KIRIM',
                                  style:
                                  TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ]
                      )
                  ),
                )
            )
        )
    );
  }
}

_onAlertButtonsPressed(context) {
  Alert(
    context: context,
    type: AlertType.warning,
    title: "Feedback Telah Terkirim!",
    desc: "Feedback anda telah terkirim ke admin, mohon tunggu hingga beberapa waktu untuk membalas feedback anda dan akan dikirim melalui email.",
    buttons: [
      DialogButton(
        child: Text(
          "Again",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FormFeed())),
        color: Color.fromRGBO(0, 179, 134, 1.0),
      ),
      DialogButton(
        child: Text(
          "Back",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyApp())),
        gradient: LinearGradient(colors: [
          Color.fromRGBO(116, 116, 191, 1.0),
          Color.fromRGBO(52, 138, 199, 1.0),
        ]),
      )
    ],
  ).show();
}