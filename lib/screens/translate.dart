import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

enum TtsState { playing, stopped }

class _TranslateScreenState extends State<TranslateScreen> {
  bool isSwitched = false;
  late FlutterTts flutterTts;
  TtsState ttsState = TtsState.stopped;
  final TextEditingController _controller = TextEditingController();

  @override 
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    flutterTts.setLanguage("en-US");
    flutterTts.setPitch(1.0);
    flutterTts.setSpeechRate(0.5);
    flutterTts.setVolume(1.0);
  }

  Future<void> _speak() async {
    String text = _controller.text;
    if (text.isNotEmpty) {
      await flutterTts.speak(text);
      setState(() {
        ttsState = TtsState.playing;
      });
    }
  }

  Future<void> _stop() async {
    await flutterTts.stop();
    setState(() {
      ttsState = TtsState.stopped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF364fc7),
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFFdbe4ff),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: const Color(0xFFdbe4ff),
          appBar: AppBar(
            backgroundColor: const Color(0xFF364fc7),
            surfaceTintColor: const Color(0xFF364fc7),
            automaticallyImplyLeading: false,
            shadowColor: Colors.transparent,
            foregroundColor: const Color(0xFFdbe4ff),
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
                color: Color(0xFFdbe4ff),
              ),
            ),
          ),
          body: Container(
            margin: const EdgeInsets.all(14),
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextField(
                  obscureText: false,
                  controller: _controller,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'دەقەکەت لێرە بنووسە',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.volume_up_rounded),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete_rounded),
                        ),
                      ],
                    ),
                    // ElevatedButton(
                    //   onPressed: _getText,
                    //   child: const Text('گوێگرتن'),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FloatingActionButton(
                          onPressed: _speak,
                          backgroundColor: Colors.green,
                          child: const Icon(Icons.play_arrow),
                        ),
                        const SizedBox(width: 16.0),
                        FloatingActionButton(
                          onPressed: _stop,
                          backgroundColor: Colors.red,
                          child: const Icon(Icons.stop),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
