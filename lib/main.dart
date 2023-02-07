import 'screens/loading.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  runApp(const AlphabetMitRawand());
}

class AlphabetMitRawand extends StatelessWidget {
  const AlphabetMitRawand({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'NotoSansKurdish',
        primarySwatch: Colors.red,
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
      home: const LoadingScreen(),
    );
  }
}
