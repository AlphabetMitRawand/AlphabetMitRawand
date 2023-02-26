import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ListenScreen extends StatefulWidget {
  const ListenScreen({super.key});

  @override
  State<ListenScreen> createState() => _ListenScreenState();
}

enum TtsState { playing, stopped }

class _ListenScreenState extends State<ListenScreen> {
  bool isSwitched = false;
  late FlutterTts flutterTts;
  TtsState ttsState = TtsState.stopped;
  final TextEditingController _controller = TextEditingController();
  bool isTtsRunning = false;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    flutterTts.setLanguage("de-DE");
    flutterTts.setPitch(1.0);
    flutterTts.setSpeechRate(0.5);
    flutterTts.setVolume(1.0);
    flutterTts.setStartHandler(() {
      setState(() {
        isTtsRunning = true;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        isTtsRunning = false;
      });
    });
  }

  Future<void> _speak() async {
    String text = _controller.text;
    if (text.isNotEmpty) {
      await flutterTts.speak(text);
      setState(() {
        ttsState = TtsState.playing;
      });
    } else if (text.isEmpty) {}
  }

  @override
  void dispose() {
    flutterTts.stop();
    _controller.dispose();
    super.dispose();
  }

  void _stop() async {
    await flutterTts.stop();
    setState(() {
      isTtsRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFd9480f),
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFFffe8cc),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: const Color(0xFFffe8cc),
          appBar: AppBar(
            backgroundColor: const Color(0xFFd9480f),
            surfaceTintColor: const Color(0xFFd9480f),
            automaticallyImplyLeading: false,
            shadowColor: Colors.transparent,
            foregroundColor: const Color(0xFFffe8cc),
            elevation: 0,
            titleSpacing: 0.1,
            title: const Text(
              'گوێگرتن',
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.east_rounded,
                color: Color(0xFFffe8cc),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'دەقەکەت لێرە بنووسە',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFd9480f),
                    ),
                  ),
                  Theme(
                    data: ThemeData(
                      textSelectionTheme: TextSelectionThemeData(
                        cursorColor: const Color(0xFFd9480f),
                        selectionHandleColor: const Color(0xFFd9480f),
                        selectionColor:
                            const Color(0xFFd9480f).withOpacity(0.5),
                      ),
                    ),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '...Hallo, ich bin',
                        hintStyle: TextStyle(
                          color: Color(0xFFd9480f),
                        ),
                        filled: false,
                        focusColor: Colors.green,
                        hoverColor: Color(0xFFd9480f),
                      ),
                      style: const TextStyle(
                        color: Color(0xFFd9480f),
                      ),
                      obscureText: false,
                      controller: _controller,
                      keyboardType: TextInputType.multiline,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                      maxLines: null,
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: const Color(0xFFc92a2a),
                foregroundColor: const Color(0xFFffe3e3),
                onPressed: () => setState(() {
                  _controller.clear();
                }),
                child: const Icon(Icons.delete_rounded),
              ),
              const SizedBox(width: 12.0),
              FloatingActionButton(
                backgroundColor: const Color(0xFFd9480f),
                foregroundColor: const Color(0xFFffe8cc),
                onPressed: () {
                  if (isTtsRunning) {
                    _stop();
                  } else {
                    _speak();
                  }
                },
                child: isTtsRunning
                    ? const Icon(Icons.stop)
                    : const Icon(Icons.play_arrow),
              ),
            ],
          ),
          // Container(
          //   margin: const EdgeInsets.all(14),
          //   decoration: const BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(8.0),
          //     ),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Color(0xFFffe8cc),
          //         spreadRadius: 5,
          //         blurRadius: 8,
          //         offset: Offset(0, 5),
          //       ),
          //     ],
          //   ),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Row(
          //             children: [
          //               IconButton(
          //                 onPressed: () {},
          //                 icon: const Icon(Icons.volume_up_rounded),
          //               ),
          //               IconButton(
          //                 onPressed: () {},
          //                 icon: const Icon(Icons.delete_rounded),
          //               ),
          //             ],
          //           ),
          //           // ElevatedButton(
          //           //   onPressed: _getText,
          //           //   child: const Text('گوێگرتن'),
          //           // ),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: <Widget>[
          //               FloatingActionButton(
          //                 onPressed: _speak,
          //                 backgroundColor: Colors.green,
          //                 child: const Icon(Icons.play_arrow),
          //               ),
          //               const SizedBox(width: 16.0),
          //               FloatingActionButton(
          //                 onPressed: _stop,
          //                 backgroundColor: Colors.red,
          //                 child: const Icon(Icons.stop),
          //               ),
          //             ],
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
