import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'home.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
        color: const Color(0xFFFFFFFF),
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
                color: Color(0xFF343a40),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF495057),
                  fontSize: 16.0,
                ),
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: PageView(
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2);
            },
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
          color: const Color(0xFFFFFFFF),
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
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const HomeScreen();
                          }));
                        },
                        child: const Text(
                          'دەستپێبکە',
                          style: TextStyle(
                            color: Color(0xFF343a40),
                            fontSize: 18.0,
                          ),
                        ),
                      )
                    : const Text(
                        'دواتر',
                        style: TextStyle(
                          color: Color(0xFF343a40),
                          fontSize: 18.0,
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
