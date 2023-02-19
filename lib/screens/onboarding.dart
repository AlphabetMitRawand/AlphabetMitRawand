import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'home.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  Widget pageScreens({
    required String image,
    required String title,
    required String text,
  }) =>
      Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 32.0,
            ),
            Image.asset(
              image,
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                color: Color(0xFF212529),
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
              ),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Color(0xFF495057),
                  fontWeight: FontWeight.w400,
                ),
              ),
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
          body: Padding(
            padding: const EdgeInsets.only(bottom: 80.0),
            child: PageView(
              onPageChanged: (index) => setState(() => isLastPage = index == 2),
              physics: const ClampingScrollPhysics(),
              controller: _controller,
              children: [
                pageScreens(
                  image: 'assets/images/words.png',
                  title: 'وشە و ڕستەکان',
                  text:
                      'زیاتر لە ١٠٠٠ وشە و ڕستە لە ئەڵمانییەوە وەرگێڕدراوە بۆ کوردی و فێربوونی ئاسانە',
                ),
                pageScreens(
                  image: 'assets/images/listening.png',
                  title: 'گوێگرتن و خوێندنەوە',
                  text: '٥٠ تێکست و گوێگرتن لە دەنگی بۆ کەسانی سەرەتایی',
                ),
                pageScreens(
                  image: 'assets/images/grammar.png',
                  title: 'ڕێزمانی ئەڵمانی',
                  text:
                      'هەموو ڕێزمانەکانی بۆ ئاستەکانی ئەلفوبێ و A1/2 لێرەدا بەردەستە و بە ئاسانی ڕوون کراوەتەوە',
                ),
              ],
            ),
          ),
          bottomSheet: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            height: 80.0,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    textDirection: TextDirection.rtl,
                    effect: const WormEffect(
                      paintStyle: PaintingStyle.stroke,
                      dotColor: Color(0xFF343a40),
                      activeDotColor: Color(0xFF343a40),
                    ),
                    onDotClicked: (index) => _controller.animateToPage(
                      index,
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      curve: Curves.easeIn,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _controller.nextPage(
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.easeIn,
                  ),
                  child: isLastPage
                      ? InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return const HomeScreen();
                              }),
                            );
                          },
                          child: const Text(
                            'دەستپێبکە',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xFF343a40),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      : const Text(
                          'دواتر',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF343a40),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
