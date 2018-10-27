import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ProsesState();
  }
}

class ProsesState extends State<Home> {
  final TextEditingController _angka1Controller = new TextEditingController();
  final TextEditingController _angka2Controller = new TextEditingController();

  String _result = "- - -";

  void _hitung() {
    try {
      setState(() {
        int angka1 = int.parse(_angka1Controller.text);
        int cm = int.parse(_angka2Controller.text);

        double angka2 = cm / 100;

        if ((angka1 > 0) && ((angka2 > 0))) {
          var x = angka1 / (angka2 * angka2);
          if ((x > 18) && (x < 25)) {
            _result = "IDEAL";
          } else if ((x < 18) && (x > 0)) {
            _result = "KURUS";
          } else if ((x > 25) && (x < 40)) {
            _result = "GEMUK";
          } else if ((x > 40)) {
            _result = "obesitas";
          }
        } else {
          _result = "- - -";
        }
        _result = "$_result";
      });
    } catch (e) {
      _result = "- - -";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[100],
          title: Text("Apakah Berat Anda Ideal ?"),
          elevation: 0.0,
          automaticallyImplyLeading: true,
          actions: <Widget>[
            new IconButton(
              icon: new Icon(
                Icons.call_missed_outgoing,
                size: 20.0,
              ),
              onPressed: _hitung,
            )
          ],
        ),
        backgroundColor: Colors.grey[200],
        body: new Container(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new ListView(children: <Widget>[
              new Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0),
              ),
              new ConstrainedBox(
                constraints: BoxConstraints.expand(height: 100.0),
                child: new Container(
                  decoration: new BoxDecoration(boxShadow: [
                    //warna shadow card
                    new BoxShadow(
                        color:
                            _result == 'obesitas' ? Colors.red : Colors.green,
                        blurRadius: 200.0)
                  ]),
                  margin: EdgeInsets.only(top: 30.0),
                  child: new Card(
                      semanticContainer: true,
                      margin: EdgeInsets.only(
                          top: 20.0, left: 50.0, right: 50.0, bottom: 10.0),
                      elevation: 50.0,
                      color: Colors.transparent,
                      child: new Text("$_result",
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 70.0,
                              textBaseline: TextBaseline.ideographic,
                              color: _result == 'obesitas'
                                  ? Colors.red
                                  : Colors.black))),
                ),
              ),
              new Container(
                  margin: const EdgeInsets.all(40.0),
                  height: 245.0,
                  width: 290.0,
                  color: Colors.grey.shade200,
                  constraints: new BoxConstraints.expand(height: 350.0),
                  padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0),
                  child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new TextField(
                          controller: _angka1Controller,
                          autofocus: true,
                          autocorrect: true,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            labelText: 'Berat Badan (KG)',
                            hintText: '',
                          ),
                        ),
                        new Padding(padding: new EdgeInsets.only(top: 15.0)),
                        new TextField(
                          controller: _angka2Controller,
                          autocorrect: true,
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            labelText: 'Tinggi Badan (CM)',
                            hintText: '',
                          ),
                        ),
                        new Padding(padding: new EdgeInsets.only(top: 60.0)),
                        new Container(
                          alignment: Alignment.center,
                          child: new RaisedButton(
                            onPressed: _hitung,
                            color: Colors.green[500],
                            elevation: 20.0,
                            padding: new EdgeInsets.symmetric(
                                vertical: 25.0, horizontal: 70.0),
                            child: new Text('Kalkulasi'),
                            textColor: Colors.white,
                          ),
                        )
                      ])),
            ]),
          ),
        ));
  }
}
