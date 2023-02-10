// codes by https://faun.pub/flutter-implementing-listview-widget-using-json-file-fbd1e3ba60ad
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListenScreen extends StatefulWidget {
  const ListenScreen({super.key});

  @override
  State<ListenScreen> createState() => _ListenScreenState();
}

class _ListenScreenState extends State<ListenScreen> {
  late List data;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFf8f9fa),
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: const Color(0xFFf8f9fa),
            foregroundColor: const Color(0xFF212529),
            elevation: 0,
            titleSpacing: 0.1,
            title: const Text(
              'گوێگرتن',
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
            padding:
                const EdgeInsets.only(left: 6, right: 6, bottom: 6, top: 0),
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
                        onTap: () {},
                        child: Card(
                          color: const Color(0xFFffa94d),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 33,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Text(
                                          newData[index]['url'],
                                          style: const TextStyle(
                                              color: Color(0xFFd9480f),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0),
                                        ),
                                        const SizedBox(width: 3),
                                        Text(
                                          newData[index]['title'],
                                          style: const TextStyle(
                                              color: Color(0xFFd9480f),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      newData[index]['text'],
                                      style: const TextStyle(
                                        color: Color(0xFFe8590c),
                                      ),
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
