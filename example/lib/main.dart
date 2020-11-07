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
      statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.teal,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: 'Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal, visualDensity: VisualDensity.adaptivePlatformDensity,),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _topModalSheetKey = GlobalKey<TopModalSheetState>();
  var _topModalData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        centerTitle: true,
        title: const Text("TopModalSheet sample"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: <Widget>[
            Expanded(child: Center(
              child: Text("$_topModalData"),
            )),
            Row(
              children: [
                Expanded(child: MaterialButton(
                  color: Colors.white,
                  elevation: 5,
                  child: const Text("Show TopModal 1"),
                  onPressed: () async {
                    var value = await showTopModalSheet<String>(context: context, child: DumyModal());

                    if(value != null){
                      setState(() {
                        _topModalData = value;
                      });
                    }
                  },
                )),
                const VerticalDivider(),
                Expanded(child: MaterialButton(
                  color: Colors.white,
                  elevation: 5,
                  child: const Text("Show TopModal 2"),
                  onPressed: () async {
                    var value = await Navigator.of(context).push<List<int>>(PageRouteBuilder(pageBuilder: (_, __, ___) {
                      return TopModalSheet(
                        key: _topModalSheetKey,
                        child: Container(color: Colors.teal, height: MediaQuery.of(context).size.height * .2, child: Center(
                          child: MaterialButton(
                            color: Colors.white,
                            child: const Text("Back", style: TextStyle(color: Colors.teal),),
                            onPressed: () {
                              _topModalSheetKey.currentState.onBackPressed(data: [1,2,3]);
                            },
                          )
                        )),
                      );
                    }, opaque: false));

                    if(value != null){
                      setState(() {
                        _topModalData = "$value";
                      });
                    }
                  },
                )),
              ],
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
    return Container(
      color: Theme.of(context).primaryColor,
      height: MediaQuery.of(context).size.height * .3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).viewInsets.top),
            child: const Text("Choose Wisely", style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: OutlineButton(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Image.network("https://www.fifaindex.com/static/FIFA21/images/crest/10/light/1878.webp",
                        height: MediaQuery.of(context).size.height * .15,
                      ),
                      splashColor: Colors.white,
                      highlightedBorderColor: Colors.teal,
                      onPressed: () {
                        Navigator.of(context).pop("Maquina");
                      },
                    ),
                  )
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    child: OutlineButton(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Image.network("https://www.fifaindex.com/static/FIFA20/images/crest/10/light/1028.webp",
                        height: MediaQuery.of(context).size.height * .15,
                      ),
                      splashColor: Colors.white,
                      highlightedBorderColor: Colors.teal,
                      onPressed: () {
                        Navigator.of(context).pop("Monarcas");
                      },
                    ),
                  )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

