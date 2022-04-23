import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  String title;
  String url;
  WebViewPage({required this.url, required this.title}) : super();

  @override
  State<WebViewPage> createState() => _WebViewPageState(url, title);
}

class _WebViewPageState extends State<WebViewPage> {
  String url;
  String title;
  _WebViewPageState(this.url, this.title);
  late WebViewController _webController;

  // @override
  // void initState() {
  //   cacheDelete();
  //   super.initState();
  // }

  void cacheDelete() async {
    await _webController.clearCache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // SizedBox(width: 10),
            Image(
              image: AssetImage('assets/icons/str_logo.png'),
              width: 50,
              height: 50,
            ),
            //SizedBox(width: 50),
            // Text(
            //   title,
            //   style: TextStyle(fontSize: 20),
            // ),
          ],
        ),
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
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
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
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.black),
          ),
          IconButton(
            onPressed: () async {
              _webController.reload();
            },
            icon: const Icon(Icons.replay, color: Colors.black),
          ),
        ],
      ),
      body: WebView(
        // onWebViewCreated:(url) {
        //   _webController.clearCache();
        // },
        // onPageStarted: (url) {
        //   _webController.clearCache();
        // },
        initialUrl: url,
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
