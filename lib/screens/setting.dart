import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitched = false;

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
            foregroundColor: const Color(0xFF212529),
            elevation: 0,
            titleSpacing: 0.1,
            title: const Text(
              'سەبارەت',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.east_rounded,
                color: Color(0xFF212529),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      if (kIsWeb) {
                        launchUrl(
                          Uri.parse('https://instagram.com/de.krd'),
                        );
                      } else {
                        FlutterWebBrowser.openWebPage(
                          url: 'https://instagram.com/de.krd',
                          customTabsOptions: const CustomTabsOptions(
                            colorScheme: CustomTabsColorScheme.light,
                            shareState: CustomTabsShareState.on,
                            instantAppsEnabled: true,
                            showTitle: true,
                            urlBarHidingEnabled: true,
                          ),
                          safariVCOptions: const SafariViewControllerOptions(
                            barCollapsingEnabled: true,
                            dismissButtonStyle:
                                SafariViewControllerDismissButtonStyle.close,
                            modalPresentationCapturesStatusBarAppearance: true,
                          ),
                        );
                      }
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        border: Border.all(
                          color: const Color(0xFF868e96),
                          width: 2.5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/images/logo/rawand.png',
                            width: 80.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'ڕەوەند ئاکۆ خالید',
                                    style: TextStyle(
                                      color: Color(0xFF212529),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3.0,
                                  ),
                                  Icon(
                                    Icons.verified_rounded,
                                    color: Colors.blue,
                                    size: 16.0,
                                  ),
                                ],
                              ),
                              const Text(
                                'گەشەپێدەری وێب و ئەپی مۆبایل',
                                style: TextStyle(
                                  color: Color(0xFF495057),
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xFF212529),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: () async {
                      String email = Uri.encodeComponent(
                          "info.rawandkhalid.share-alphabet@blogger.com");
                      String subject =
                          Uri.encodeComponent("ناونیشانەکە لێرە بنووسە");
                      String body = Uri.encodeComponent(
                          "لێرەدا دەقەکەت بنووسە / لینکی دەنگەکە و هتد...");
                      Uri mail = Uri.parse(
                          "mailto:$email?subject=$subject&body=$body");
                      if (await launchUrl(mail)) {
                        // email app opened
                      } else {
                        launchUrl(Uri.parse(
                            'mailto:info.rawandkhalid.share-alphabet@blogger.com'));
                      }
                    },
                    child: Container(
                      height: 55.0,
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      padding: const EdgeInsets.all(14.0),
                      decoration: const BoxDecoration(
                        color: Color(0xFFced4da),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.edit_rounded,
                                size: 22.0,
                                color: Color(0xFF212529),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                'لەم ئەپە بنووسە',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xFF212529),
                                ),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18.0,
                            color: Color(0xFF212529),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    padding: const EdgeInsets.all(14.0),
                    decoration: const BoxDecoration(
                      color: Color(0xFFced4da),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.dark_mode_rounded,
                              size: 22.0,
                              color: Color(0xFF212529),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              'دۆخی تاریک',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0xFF212529),
                              ),
                            ),
                          ],
                        ),
                        Switch(
                          value: isSwitched,
                          activeColor: const Color(0xFF212529),
                          inactiveThumbColor: const Color(0xFF212529),
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                            if (isSwitched) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text('بەردەست نییە'),
                                  action: SnackBarAction(
                                    label: 'باشە',
                                    onPressed: () {},
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => Share.share(
                      'بۆ یەکەمجار 🤩😱 لە ژیانتدا دەتوانیت بە زمانی کوردی فێری زمانی ئەڵمانی ببیت لەسەر هەر ئامێرێک بە خۆڕایی🤩😱! \nلینک: https://github.com/AlphabetMitRawand/AlphabetMitRawand',
                      subject: 'AlphabetMitRawand',
                    ),
                    child: Container(
                      height: 55.0,
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      padding: const EdgeInsets.all(14.0),
                      decoration: const BoxDecoration(
                        color: Color(0xFFced4da),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.share_rounded,
                                size: 22.0,
                                color: Color(0xFF212529),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                'هاوبەشکردن',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xFF212529),
                                ),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18.0,
                            color: Color(0xFF212529),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (kIsWeb) {
                        launchUrl(
                          Uri.parse('https://bio.r4wand.eu.org'),
                        );
                      } else {
                        FlutterWebBrowser.openWebPage(
                          url: 'https://bio.r4wand.eu.org',
                          customTabsOptions: const CustomTabsOptions(
                            colorScheme: CustomTabsColorScheme.light,
                            shareState: CustomTabsShareState.on,
                            instantAppsEnabled: true,
                            showTitle: true,
                            urlBarHidingEnabled: true,
                          ),
                          safariVCOptions: const SafariViewControllerOptions(
                            barCollapsingEnabled: true,
                            // preferredBarTintColor: Colors.green,
                            // preferredControlTintColor: Colors.amber,
                            dismissButtonStyle:
                                SafariViewControllerDismissButtonStyle.close,
                            modalPresentationCapturesStatusBarAppearance: true,
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 55.0,
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      padding: const EdgeInsets.all(14.0),
                      decoration: const BoxDecoration(
                        color: Color(0xFFced4da),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.question_answer_rounded,
                                size: 22.0,
                                color: Color(0xFF212529),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                'پەیوەندی',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xFF212529),
                                ),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18.0,
                            color: Color(0xFF212529),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (kIsWeb) {
                        launchUrl(
                          Uri.parse(
                              'https://github.com/AlphabetMitRawand/AlphabetMitRawand'),
                        );
                      } else {
                        FlutterWebBrowser.openWebPage(
                          url:
                              'https://github.com/AlphabetMitRawand/AlphabetMitRawand',
                          customTabsOptions: const CustomTabsOptions(
                            colorScheme: CustomTabsColorScheme.light,
                            shareState: CustomTabsShareState.on,
                            instantAppsEnabled: true,
                            showTitle: true,
                            urlBarHidingEnabled: true,
                          ),
                          safariVCOptions: const SafariViewControllerOptions(
                            barCollapsingEnabled: true,
                            // preferredBarTintColor: Colors.green,
                            // preferredControlTintColor: Colors.amber,
                            dismissButtonStyle:
                                SafariViewControllerDismissButtonStyle.close,
                            modalPresentationCapturesStatusBarAppearance: true,
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 55.0,
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      padding: const EdgeInsets.all(14.0),
                      decoration: const BoxDecoration(
                        color: Color(0xFFced4da),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.bug_report_rounded,
                                size: 22.0,
                                color: Color(0xFF212529),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                'ڕاپۆرتی هەڵەیەک بکە',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xFF212529),
                                ),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18.0,
                            color: Color(0xFF212529),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
