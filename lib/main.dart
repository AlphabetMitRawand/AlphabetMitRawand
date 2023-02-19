import 'screens/loading.dart';
import 'firebase_options.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_offline/flutter_offline.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const AlphabetMitRawand());
}

class AlphabetMitRawand extends StatelessWidget {
  const AlphabetMitRawand({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Salah',
        primarySwatch: Colors.green,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.transparent,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Color(0xFF343a40),
          ),
          color: Colors.white,
          foregroundColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          return connected
              ? child
              : AnnotatedRegion<SystemUiOverlayStyle>(
                  value: const SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarBrightness: Brightness.dark,
                    statusBarIconBrightness: Brightness.dark,
                    systemNavigationBarColor: Colors.white,
                    systemNavigationBarIconBrightness: Brightness.dark,
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Scaffold(
                      backgroundColor: Colors.white,
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "ئینتەرنێتت نییە!!",
                              style: TextStyle(fontSize: 22.0),
                            ),
                            const Text(
                              "ئەگەر ئینتەرنێتت هەبێت ئەپەکە باشتر کاردەکات",
                              style: TextStyle(fontSize: 14.0),
                            ),
                            const SizedBox(height: 10.0),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFFc92a2a),
                                ),
                              ),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return WillPopScope(
                                      onWillPop: () async => false,
                                      child: const LoadingScreen(),
                                    );
                                  },
                                ),
                              ),
                              child: const Text(
                                "هیچ کێشەیەک نییە، بەردەوام بە",
                                style: TextStyle(
                                  color: Color(0xFFfff5f5),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        },
        child: const LoadingScreen(),
      ),
    );
  }
}
