import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart' as line;
import 'package:url_launcher/url_launcher.dart';

class MyAboutMeView extends StatefulWidget {
  const MyAboutMeView({super.key});

  @override
  State<MyAboutMeView> createState() => _MyAboutMeViewState();
}

class _MyAboutMeViewState extends State<MyAboutMeView> {
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();

  @override
  void initState() {
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = _handleTap as GestureTapCallback?;
    super.initState();
  }

  _handleTap({required urlLink}) async {
    final Uri url = Uri.parse(urlLink);
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      throw Exception('Could launch $url');
    }
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const line.LineIcon.accusoft(
            color: Colors.white,
          ),
        ),
        title: const Text(
          'About Me',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 230,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: [
              const Text(
                'Thanks for using Fresh Resrc.',
                style: TextStyle(
                    fontSize: 20, decoration: TextDecoration.underline),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                        text: 'This',
                        style: TextStyle(color: Colors.black, fontSize: 25)),
                    const TextSpan(
                        text: ' app',
                        style: TextStyle(color: Colors.black, fontSize: 25)),
                    const TextSpan(
                        text: ' was',
                        style: TextStyle(color: Colors.black, fontSize: 25)),
                    const TextSpan(
                        text: ' made',
                        style: TextStyle(color: Colors.black, fontSize: 25)),
                    const TextSpan(
                        text: ' by',
                        style: TextStyle(color: Colors.black, fontSize: 25)),
                    const TextSpan(
                      text: ' PubSec.',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25),
                    ),
                    const TextSpan(
                        text: 'If you want to contact me.',
                        style: TextStyle(color: Colors.black, fontSize: 25)),
                    const TextSpan(
                        text: ' Here is my Telegram.',
                        style: TextStyle(color: Colors.black, fontSize: 25)),
                    TextSpan(
                      recognizer: _tapGestureRecognizer,
                      text: '@PubSecOfficial',
                      style: const TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 100,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    child: IconButton(
                      onPressed: () async {
                        await _handleTap(
                            urlLink: 'https://t.me/PubSecOfficial');
                      },
                      icon: const line.LineIcon.telegramPlane(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    child: IconButton(
                      onPressed: () async {
                        await _handleTap(
                            urlLink:
                                'https://apkpure.net/fresh-resrc/en.limited.aastures');
                      },
                      icon: const line.LineIcon.android(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
