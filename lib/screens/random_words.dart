import 'dart:math';
import '../service/words_de.dart';
import '../service/words_krd.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class RandomWordsScreen extends StatefulWidget {
  const RandomWordsScreen({super.key});

  @override
  State<RandomWordsScreen> createState() => _RandomWordsScreenState();
}

class _RandomWordsScreenState extends State<RandomWordsScreen> {
  String textDe = 'Las Anfängen';
  String textKrd = 'با دەست پێ بکەین';

  void changeText() async {
    setState(() {
      var rand = Random().nextInt(wordsKrd.length);
      textKrd = wordsKrd[rand];
      textDe = wordsDe[rand];
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFfa5252),
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFff6b6b),
        appBar: AppBar(
          backgroundColor: const Color(0xFFfa5252),
          foregroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0.5,
          title: const Text(
            'وشە و ڕستەکان',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.report_problem_rounded,
                color: Colors.white,
              ),
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (context) => const FeedBackDialog());
              },
            ),
          ],
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.east_rounded,
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      textDe,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 28,
                        color: Color(0xFFffe3e3),
                        fontFamily: 'EnglishFont',
                      ),
                    ),
                  ),
                  const SizedBox(height: 3.0),
                  Text(
                    textKrd,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFFffc9c9),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(360.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFfa5252),
                      spreadRadius: 6,
                      blurRadius: 50,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: IconButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFFfa5252),
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      const Color(0xFFffe3e3),
                    ),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(22.0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(360.0),
                          side: const BorderSide(
                            color: Color(0xFFfa5252),
                          )),
                    ),
                  ),
                  onPressed: changeText,
                  icon: const Icon(
                    Icons.loop_outlined,
                    size: 38.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeedBackDialog extends StatefulWidget {
  const FeedBackDialog({Key? key}) : super(key: key);

  @override
  State<FeedBackDialog> createState() => _FeedBackDialogState();
}

class _FeedBackDialogState extends State<FeedBackDialog> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        backgroundColor: const Color(0xFFfa5252),
        title: const Text(
          'هەڵە ڕاپۆرت بکە',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        content: Form(
          key: _formKey,
          child: TextFormField(
            controller: _controller,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
              hintText: "تکایە بەم شێوەیە بنووسە: \nسڵاو = Hallo",
              filled: true,
            ),
            maxLines: 3,
            textInputAction: TextInputAction.done,
            validator: (String? text) {
              if (text == null || text.isEmpty) {
                return 'Please enter a value';
              }
              return null;
            },
          ),
        ),
        actions: [
          TextButton(
            child: const Text(
              'هەڵوەشاندنەوە',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text(
              'ناردن',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                // ignore: unused_local_variable
                String message;
                try {
                  // Get a reference to the `feedback` collection
                  final collection =
                      FirebaseFirestore.instance.collection('feedback');

                  // Write the server's timestamp and the user's feedback
                  await collection.doc().set({
                    'timestamp': FieldValue.serverTimestamp(),
                    'feedback': _controller.text,
                  });

                  message = 'Feedback sent successfully';
                } catch (e) {
                  message = 'Error when sending feedback';
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
