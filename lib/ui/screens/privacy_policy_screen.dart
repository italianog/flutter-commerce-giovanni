import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  static const routeName = '/privacy-policy-screen';

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  double _value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        centerTitle: true,
        bottom: _value < 1
            ? PreferredSize(
                preferredSize: const Size.fromHeight(6.0),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.red.withOpacity(0.3),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                  value: _value,
                ),
              )
            : null,
      ),
      body: WebView(
        initialUrl:
            'https://1e33ae50-e984-43ba-9c78-6b8f341cad0d.l.notice.studio/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {},
        onProgress: (int progress) {
          setState(() {
            _value = progress / 100;
          });
        },
        javascriptChannels: const <JavascriptChannel>{},
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            print('blocking navigation to $request}');
            return NavigationDecision.prevent;
          }
          print('allowing navigation to $request');
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
        gestureNavigationEnabled: true,
        backgroundColor: const Color(0x00000000),
      ),
    );
  }
}
