// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DisplayWebView extends StatefulWidget {
  final String url;
  const DisplayWebView({Key? key, required this.url}) : super(key: key);

  @override
  State<DisplayWebView> createState() => _DisplayWebViewState();
}

class _DisplayWebViewState extends State<DisplayWebView> {
  String url = '';
  @override
  void initState() {
    super.initState();
    url = widget.url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Flutter WebView example'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (NavigationRequest request) {
          // giao dịch thành công : Giao+d%E1%BB%8Bch+th%C3%A0nh+c%C3%B4ng.
          // giao dịch bị từ chối : Giao+d%E1%BB%8Bch+b%E1%BB%8B+t%E1%BB%AB+ch%E1%BB%91i+b%E1%BB%9Fi+ng%C6%B0%E1%BB%9Di+d%C3%B9ng.
          print(request.url);
          if (request.url.contains('Giao+d%E1%BB%8Bch+th%C3%A0nh+c%C3%B4ng.')) {
            Navigator.pop(context, true);
          } // success
          if (request.url.contains(
              'Giao+d%E1%BB%8Bch+b%E1%BB%8B+t%E1%BB%AB+ch%E1%BB%91i+b%E1%BB%9Fi+ng%C6%B0%E1%BB%9Di+d%C3%B9ng.')) {
            Navigator.pop(context, false); // return null
          } // fail
          print('allowing navigation to $request');
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
