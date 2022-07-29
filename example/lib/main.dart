import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.teal,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: 'Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  String? _topModalData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TopModalSheet sample"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Center(
              child: Text(
                "$_topModalData",
                style: TextStyle(fontSize: 30),
              ),
            )),
            MaterialButton(
              color: Colors.white,
              elevation: 5,
              child: const Text("Show TopModal 1"),
              onPressed: () async {
                var value =
                    await showTopModalSheet<String?>(context, DumyModal());

                setState(() {
                  _topModalData = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class DumyModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text("Choose Wisely",
              style: TextStyle(color: Colors.teal, fontSize: 20),
              textAlign: TextAlign.center),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 5),
                child: OutlinedButton(
                  child: Column(
                    children: [
                      FlutterLogo(
                        size: MediaQuery.of(context).size.height * .15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2),
                        child: Text("CF Cruz Azul"),
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pop("CF Cruz Azul");
                  },
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 10),
                child: OutlinedButton(
                  child: Column(
                    children: [
                      FlutterLogo(
                        size: MediaQuery.of(context).size.height * .15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2),
                        child: Text("Monarcas FC"),
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pop("Monarcas FC");
                  },
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
