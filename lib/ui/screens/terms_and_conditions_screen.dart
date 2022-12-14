import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  static const routeName = '/terms-and-conditions-screen';

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  double _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Termini e condizioni'),
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
            'https://6eed4130-8a19-4aee-a85c-401ebd8e7c71.l.notice.studio/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {},
        onProgress: (int progress) {
          setState(() {
            _value = progress / 100;
          });
          //print('WebView is loading (progress : $progress%)');
        },
        javascriptChannels: const <JavascriptChannel>{},
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            // print('blocking navigation to $request}');
            return NavigationDecision.prevent;
          }
          //print('allowing navigation to $request');
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          // print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          //print('Page finished loading: $url');
        },
        gestureNavigationEnabled: true,
        backgroundColor: const Color(0x00000000),
      ),
    );
  }
}
