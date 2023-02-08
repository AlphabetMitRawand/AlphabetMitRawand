import 'home.dart';
import 'dart:async';
import 'onboarding.dart';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    setValue();
  }

  void setValue() async {
    final prefsOnboarding = await SharedPreferences.getInstance();
    int launchTimeOnboarding =
        prefsOnboarding.getInt('ShowOneTimeOnboarding') ?? 0;
    prefsOnboarding.setInt('ShowOneTimeOnboarding', launchTimeOnboarding + 1);

    if (Platform.isAndroid) {
      Timer(const Duration(seconds: 6), () {
        if (launchTimeOnboarding == 0) {
          if (!mounted) return;
          Timer(const Duration(seconds: 6), () {
            if (launchTimeOnboarding == 0) {
              if (!mounted) return;
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const OnBoardingScreen();
              }));
            } else {
              if (!mounted) return;
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const OnBoardingScreen();
              }));
            }
          });
        } else {
          if (!mounted) return;
          Timer(const Duration(seconds: 6), () {
            if (launchTimeOnboarding == 0) {
              if (!mounted) return;
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const OnBoardingScreen();
              }));
            } else {
              if (!mounted) return;
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const HomeScreen();
              }));
            }
          });
        }
      });
    } else if (Platform.isIOS) {
      Timer(const Duration(seconds: 6), () {
        if (launchTimeOnboarding == 0) {
          if (!mounted) return;
          Timer(const Duration(seconds: 6), () {
            if (launchTimeOnboarding == 0) {
              if (!mounted) return;
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const OnBoardingScreen();
              }));
            } else {
              if (!mounted) return;
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const HomeScreen();
              }));
            }
          });
        } else {
          if (!mounted) return;
          Timer(const Duration(seconds: 6), () {
            if (launchTimeOnboarding == 0) {
              if (!mounted) return;
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const OnBoardingScreen();
              }));
            } else {
              if (!mounted) return;
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const HomeScreen();
              }));
            }
          });
        }
      });
    } else {
      if (!mounted) return;
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return const HomeScreen();
      }));
    }
  }

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
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: DropShadowImage(
            offset: const Offset(0, 0),
            scale: 1,
            image: Image.asset(
              'assets/images/logos/icon.png',
              width: 140.0,
              height: 140.0,
            ),
          ),
        ),
      ),
    );
  }
}

class DesktopNotSupported extends StatefulWidget {
  const DesktopNotSupported({super.key});
  @override
  State<DesktopNotSupported> createState() => _DesktopNotSupportedState();
}

class _DesktopNotSupportedState extends State<DesktopNotSupported> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '!!دێسکتۆپ پشتگیری ناکرێ',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              'Desktop Not Supported!!',
              style: TextStyle(fontSize: 20.0, fontFamily: 'Lato'),
            ),
          ],
        ),
      ),
    );
  }
}
