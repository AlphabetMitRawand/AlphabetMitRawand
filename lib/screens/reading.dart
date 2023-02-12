import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReadingDetailScreen(
                                title: newData[index]['title'],
                                titlede: newData[index]['titlede'],
                                data: newData[index]['data'],
                                datackb: newData[index]['datackb'],
                              ),
                            ),
                          );
                        },
                        child: Card(
                          color: const Color(0xFF8ce99a),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 33,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Text(
                                          newData[index]['nummber'],
                                          style: const TextStyle(
                                            color: Color(0xFF2b8a3e),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        const Text(
                                          ".",
                                          style: TextStyle(
                                            color: Color(0xFF2b8a3e),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        const SizedBox(width: 3),
                                        Text(
                                          newData[index]['title'],
                                          style: const TextStyle(
                                            color: Color(0xFF2b8a3e),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      newData[index]['text'],
                                      style: const TextStyle(
                                        color: Color(0xFF2f9e44),
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

class ReadingDetailScreen extends StatelessWidget {
  final String title;
  final String titlede;
  final String data;
  final String datackb;

  const ReadingDetailScreen({
    super.key,
    required this.title,
    required this.titlede,
    required this.data,
    required this.datackb,
  });

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
            title: Text(
              title,
              style: const TextStyle(
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
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              bottom: 8,
              top: 0,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titlede,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Lato',
                            color: Color(0xFF212529),
                          ),
                        ),
                        Text(
                          data,
                          style: const TextStyle(
                            fontFamily: 'Lato',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF212529),
                    ),
                  ),
                  Text(datackb),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
