// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
// import 'package:str_tour_app/features/str_tour/presentation/pages/virtual_tour.dart';
// ignore: avoid_web_libraries_in_flutter
//import 'dart:js' as js;

import 'package:str_tour_app/features/str_tour/presentation/pages/virtual_tour.dart';

class BottomSheetContent extends StatelessWidget {
  final String title;
  final String urlAddress;
  final String address;
  final String phone;
  final String url;

  const BottomSheetContent(
      {Key? key,
      required this.title,
      required this.urlAddress,
      required this.address,
      required this.phone,
      required this.url})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          SizedBox(
            height: 70,
            child: Container(
              width: 300,
              margin: const EdgeInsets.only(
                  top: 20, left: 10, right: 10, bottom: 10),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
          const Divider(thickness: 1),
          // Container(
          //   height: 350,
          //   child: ListView(
          //     children: [
          const SizedBox(
            height: 10,
          ),
          urlAddress != ''
              ? Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Text('Сайт: $urlAddress',
                      style: const TextStyle(fontSize: 18)))
              //     Container(
              // margin: EdgeInsets.only(left: 10, right: 10),
              // child: Row(
              //   children: [
              //     TextButton(
              //       child: Text('Сайт: $urlAddress',
              //           style: TextStyle(fontSize: 18)),
              //       onPressed: (() =>
              //           js.context.callMethod('open', ['$urlAddress'])),
              //     )
              //   ],
              // ))
              : const Center(),
          const SizedBox(
            height: 10,
          ),
          address != ''
              ? Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Text('Адресс: $address',
                      style: const TextStyle(fontSize: 18)))
              : const Center(),
          const SizedBox(
            height: 10,
          ),
          phone != ''
              ? Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Text('Номер телефона: $phone',
                      style: const TextStyle(fontSize: 18)))
              : const Center(),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            margin:
                const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(color: Colors.black),
                primary: Colors.white,
                shadowColor: Colors.black,
                side: const BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                // js.context.callMethod('open', [url]);
                // setState(() {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            WebViewPage(url: url, title: title)));
              },
              child: const Center(
                child: Text('Посмотреть виртуалльный тур',
                    style: TextStyle(color: Colors.black)),
              ),
            ),
          ),
          //],
          //  ),
          // )
        ],
      ),
    );
  }
}

// class ModalBottomSheetDemo extends StatelessWidget {
//   void _showModalBottomSheet(BuildContext context) {
//     showModalBottomSheet<void>(
//       context: context,
//       builder: (context) {
//         return BottomSheetContent();
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () {
//           _showModalBottomSheet(context);
//         },
//         child: Text('It dangeon'),
//       ),
//     );
//   }
// }
