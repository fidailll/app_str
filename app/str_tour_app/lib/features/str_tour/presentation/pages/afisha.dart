import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:str_tour_app/features/str_tour/data/datasources/post_appeal.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Afisha extends StatefulWidget {
  @override
  _AfishaState createState() => _AfishaState();
}

class _AfishaState extends State<Afisha> {
  late WebViewController _webController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // SizedBox(width: 10),
            // Image(
            //   image: AssetImage('assets/icons/str_logo.png'),
            //   width: 40,
            //   height: 40,
            // ),
            //SizedBox(width: 50),
            Text(
              'Афиша',
              style: TextStyle(fontSize: 20),
            ),
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
        initialUrl: 'https://cityopen.ru/afisha',
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
