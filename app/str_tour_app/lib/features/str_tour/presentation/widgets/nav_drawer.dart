// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:str_tour_app/features/str_tour/presentation/pages/afisha.dart';
import 'package:str_tour_app/features/str_tour/presentation/pages/appeal.dart';

// Press the Navigation Drawer button to the left of AppBar to show
// a simple Drawer with two items.
class NavDrawer {
  //  BuildContext context;
  //   NavDrawer

  Widget drawerItemsWidget(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: Colors.grey),
      accountName: Text(
        'Иван',
      ),
      accountEmail: Text(
        '11111@mail.ru',
      ),
      currentAccountPicture: const CircleAvatar(
        child: Icon(Icons.person, color: Colors.grey, size: 50),
        backgroundColor: Colors.white,
      ),
    );
    final drawerItems = Container(
        width: 200,
        color: Colors.white,
        child: ListView(
          children: [
            drawerHeader,
            // Container(
            //     color: Colors.grey,
            //     height: 100,
            //     child: Column(
            //       children: [
            //         Text('Name'),
            //         SizedBox(height: 10),
            //         Text('Phone: +8(800)777-77-77'),
            //       ],
            //     )),
            //drawerHeader,

            ListTile(
              title: Text(
                'Написать обращение',
              ),
              //leading: const Icon(Icons.edit),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Appeal()));
              },
            ),
            ListTile(
              title: Text(
                'Афиша',
              ),
              //leading: const Icon(Icons.),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Afisha()));
              },
            ),
          ],
        ));

    return drawerItems;
  }
}
