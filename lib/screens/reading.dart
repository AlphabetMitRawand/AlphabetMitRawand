// codes by https://faun.pub/flutter-implementing-listview-widget-using-json-file-fbd1e3ba60ad

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:alphabetmitrawand/screens/loading.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({super.key});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  late List data;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.green,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.greenAccent,
          appBar: AppBar(
            backgroundColor: Colors.green,
            foregroundColor: const Color(0xFF212529),
            elevation: 0,
            titleSpacing: 0.1,
            title: const Text(
              'خوێندنەوە',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.east_rounded,
                color: Color(0xFF212529),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Center(
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/json/reading.json'),
                builder: (context, snapshot) {
                  // Decode the JSON
                  var newData = json.decode(snapshot.data.toString());

                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const DesktopNotSupported()));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 32, bottom: 32, left: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      newData[index]['title'],
                                      //'Note Title',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                    Text(
                                      newData[index]['text'],
                                      //'Note Text',
                                      style: TextStyle(
                                          color: Colors.grey.shade600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: newData == null ? 0 : newData.length,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
