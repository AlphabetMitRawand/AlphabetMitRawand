import 'grammar.dart';
import 'reading.dart';
import 'setting.dart';
import 'translate.dart';
import 'random_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _container({
    required String title,
    required IconData image,
    required Color clrBox,
    required Color clrText,
    required Color clrShadow,
    required Color clrImage,
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
                fontSize: 18.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  image,
                  size: 80.0,
                  color: clrImage,
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
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.white,
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'بەخێربێیت بۆ',
                  style: TextStyle(
                    color: Color(0xFF495057),
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'ئەلفوبێی زمانی ئەڵمانی',
                  style: TextStyle(
                    color: Color(0xFF212529),
                    fontSize: 18.0,
                    height: 1,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
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
            padding: const EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              top: 12.0,
              bottom: 0.0,
            ),
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
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '١٠٠٠ وشەی ئەڵمانی بە وەرگێڕانی کوردی',
                              style: TextStyle(
                                color: Color(0xFF1c7ed6),
                                fontSize: 14.0,
                                letterSpacing: 0.0,
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
                      letterSpacing: 0.0,
                      color: Color(0xFF212529),
                      fontWeight: FontWeight.w400,
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
                          image: Icons.format_shapes_rounded,
                          clrBox: const Color(0xFF69db7c),
                          clrText: const Color(0xFF2b8a3e),
                          clrShadow: const Color(0xFFd3f9d8),
                          clrImage: const Color(0xFF2b8a3e),
                        ),
                      ),
                      // InkWell(
                      //   splashColor: Colors.transparent,
                      //   highlightColor: Colors.transparent,
                      //   onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       backgroundColor: const Color(0xFFd9480f),
                      //       content: const Text(
                      //         'بەردەست نییە',
                      //         style: TextStyle(color: Color(0xFFffe8cc)),
                      //       ),
                      //       action: SnackBarAction(
                      //         label: 'باشە',
                      //         onPressed: () {},
                      //       ),
                      //     ),
                      //   ),
                      //   child: _container(
                      //     title: 'گوێگرتن',
                      //     image: Icons.hearing_rounded,
                      //     clrBox: const Color(0xFFffa94d),
                      //     clrText: const Color(0xFFd9480f),
                      //     clrShadow: const Color(0xFFffe8cc),
                      //     clrImage: const Color(0xFFd9480f),
                      //   ),
                      // ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RandomWordsScreen(),
                          ),
                        ),
                        child: _container(
                          title: 'وشە و ڕستەکان',
                          image: Icons.format_indent_increase_rounded,
                          clrBox: const Color(0xFFff8787),
                          clrText: const Color(0xFFc92a2a),
                          clrShadow: const Color(0xFFffe3e3),
                          clrImage: const Color(0xFFc92a2a),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GrammarScreen(),
                          ),
                        ),
                        child: _container(
                          title: 'ڕێزمان',
                          image: Icons.forum_rounded,
                          clrBox: const Color(0xFFda77f2),
                          clrText: const Color(0xFF862e9c),
                          clrShadow: const Color(0xFFf3d9fa),
                          clrImage: const Color(0xFF862e9c),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TranslateScreen(),
                          ),
                        ),
                        child: _container(
                          title: 'گوێگرتن',
                          image: Icons.hearing_rounded,
                          clrBox: const Color(0xFF748ffc),
                          clrText: const Color(0xFF364fc7),
                          clrShadow: const Color(0xFFdbe4ff),
                          clrImage: const Color(0xFF364fc7),
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
