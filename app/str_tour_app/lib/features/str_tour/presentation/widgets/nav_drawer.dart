// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

// Press the Navigation Drawer button to the left of AppBar to show
// a simple Drawer with two items.
class NavDrawer {
  //  BuildContext context;
  //   NavDrawer

  Widget drawerItemsWidget(BuildContext context) {
    // var localization = 'Billi Harington';
    // final drawerHeader = UserAccountsDrawerHeader(
    //   accountName: Text(
    //     'Billi Harington',
    //   ),
    //   accountEmail: Text(
    //     'BilliHarington@ТвояМамка.cum',
    //   ),
    //   currentAccountPicture: const CircleAvatar(
    //     child: FlutterLogo(size: 42.0),
    //   ),
    // );

    final drawerItems = Container(
      color: Colors.white,
      child: ListView(
        children: [
          //drawerHeader,
          ListTile(
            title: Text(
              'Dungeon master',
            ),
            leading: const Icon(Icons.favorite),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Three hunred baks',
            ),
            leading: const Icon(Icons.comment),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );

    return drawerItems;
  }
}
