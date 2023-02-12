import 'listen.dart';
import 'grammar.dart';
import 'reading.dart';
import 'setting.dart';
import 'random_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter_web_browser/flutter_web_browser.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _container({
    required String title,
    required String image,
    required Color clrBox,
    required Color clrText,
    required Color clrShadow,
  }) =>
      Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: clrBox,
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          boxShadow: [
            BoxShadow(
              color: clrShadow,
              spreadRadius: 5,
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: clrText,
                fontSize: 20.0,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  image,
                  width: 90.0,
                  height: 90.0,
                ),
              ],
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
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
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'بەخێربێیت بۆ',
                  style: TextStyle(
                    color: Color(0xFF495057),
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  'ئەلفوبێی زمانی ئەڵمانی',
                  style: TextStyle(
                    color: Color(0xFF212529),
                    fontSize: 18.0,
                    height: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              // IconButton(
              //   icon: const Icon(
              //     Icons.volunteer_activism_outlined,
              //     size: 26.0,
              //     color: Color(0xFF343a40),
              //   ),
              //   onPressed: () async {
              //     if (kIsWeb) {
              //       launchUrl(Uri.parse(
              //           'https://www.paypal.com/donate/?hosted_button_id=2Q8CB2GHA2WPC'));
              //     } else {
              //       FlutterWebBrowser.openWebPage(
              //         url: '',
              //         customTabsOptions: const CustomTabsOptions(
              //           colorScheme: CustomTabsColorScheme.light,
              //           shareState: CustomTabsShareState.on,
              //           instantAppsEnabled: true,
              //           showTitle: true,
              //           urlBarHidingEnabled: true,
              //         ),
              //         safariVCOptions: const SafariViewControllerOptions(
              //           barCollapsingEnabled: true,
              //           dismissButtonStyle:
              //               SafariViewControllerDismissButtonStyle.close,
              //           modalPresentationCapturesStatusBarAppearance: true,
              //         ),
              //       );
              //     }
              //   },
              // ),
              IconButton(
                icon: const Icon(
                  Icons.manage_accounts_rounded,
                  size: 30.0,
                  color: Color(0xFF212529),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const SettingScreen();
                  }));
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RandomWordsScreen())),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: 126.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFFC1E4FF),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFe7f5ff),
                          spreadRadius: 5,
                          blurRadius: 12,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(
                              height: 24.0,
                            ),
                            Text(
                              'دەتەوێت وشەی نوێ فێر ببیت؟',
                              style: TextStyle(
                                color: Color(0xFF1864ab),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '١٠٠٠ وشەی ئەڵمانی بە وەرگێڕانی کوردی',
                              style: TextStyle(
                                color: Color(0xFF1c7ed6),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/images/women-reading.png',
                          width: 80.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  child: const Text(
                    'بەشەکان',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFF212529),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: GridView(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 160.0,
                      childAspectRatio: 2 / 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                    ),
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ReadingScreen(),
                          ),
                        ),
                        child: _container(
                          title: 'خوێندنەوە',
                          image: 'assets/images/books.png',
                          clrBox: const Color(0xFF69db7c),
                          clrText: const Color(0xFF2b8a3e),
                          clrShadow: const Color(0xFFd3f9d8),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ListenScreen())),
                        child: _container(
                          title: 'گوێگرتن',
                          image: 'assets/images/listening.png',
                          clrBox: const Color(0xFFffa94d),
                          clrText: const Color(0xFFd9480f),
                          clrShadow: const Color(0xFFffe8cc),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RandomWordsScreen())),
                        child: _container(
                          title: 'وشە و ڕستەکان',
                          image: 'assets/images/words.png',
                          clrBox: const Color(0xFFff8787),
                          clrText: const Color(0xFFc92a2a),
                          clrShadow: const Color(0xFFffe3e3),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GrammarScreen())),
                        child: _container(
                          title: 'ڕێزمان',
                          image: 'assets/images/grammar.png',
                          clrBox: const Color(0xFFda77f2),
                          clrText: const Color(0xFF862e9c),
                          clrShadow: const Color(0xFFf3d9fa),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
