import 'package:flutter/material.dart';

class HalamanSedekah extends StatefulWidget {
  @override
  _HalamanSedekahState createState() => _HalamanSedekahState();
}

class _HalamanSedekahState extends State<HalamanSedekah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Builder(builder: (BuildContext context) {
          return Stack(
            children: <Widget>[
              new Image.asset(
                'image/bg.png',
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Mari Kita Bersedekah",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: new Card(
                          color: Colors.white,
                          elevation: 2.0,
                          margin: EdgeInsets.only(right: 15.0, left: 15.0),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Image.asset("image/info_new.jpg"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Image.asset("image/qr.png"),
                                    ],
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 23, right: 23),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 60,
                            child: RaisedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                color: Colors.white,
                                child: Icon(Icons.arrow_back)),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: Container(
                              height: 60,
                              color: Colors.transparent,
                              width: double.infinity,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
