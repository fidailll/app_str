import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _webController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Стерлитамак'),
        actions: [
          IconButton(
            onPressed: () async {
              if (await _webController.canGoBack()) {
                _webController.goBack();
              } else {
                log('Нет записи в истории');
              }
              return;
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          IconButton(
            onPressed: () async {
              if (await _webController.canGoForward()) {
                _webController.goForward();
              } else {
                log('Нет записи в истории');
              }
              return;
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
          IconButton(
            onPressed: () async {
              _webController.reload();
            },
            icon: const Icon(Icons.replay),
          ),
        ],
      ),
      body: WebView(
        initialUrl: 'http://sonofmqe.beget.tech',
//Подержка JavaScript
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          _webController = controller;
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(
      //     Icons.next_plan,
      //     size: 32,
      //   ),
      //   onPressed: () async {
      //     _webController.loadUrl('https://www.youtube.com');
      //   },
      // ));
    );
  }
}
