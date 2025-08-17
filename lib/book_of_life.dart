/// Book of Life - The primary [MaterialApp] widget.
///
// Time-stamp: <Sunday 2025-08-17 20:19:25 +1000 Graham Williams>
///
/// Copyright (C) 2025, Software Innovation Institute, ANU.
///
/// Licensed under the GNU General Public License, Version 3 (the "License").
///
/// License: https://www.gnu.org/licenses/gpl-3.0.en.html.
//
// This program is free software: you can redistribute it and/or modify it under
// the terms of the GNU General Public License as published by the Free Software
// Foundation, either version 3 of the License, or (at your option) any later
// version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
// details.
//
// You should have received a copy of the GNU General Public License along with
// this program.  If not, see <https://www.gnu.org/licenses/>.
///
/// Authors: Graham Williams

library;

import 'package:flutter/material.dart';

import 'package:bol/constants/app.dart';
import 'package:bol/home.dart';
import 'package:bol/widgets/solid_scaffold.dart';

class BookOfLife extends StatelessWidget {
  const BookOfLife({super.key});

  // This widget is the root of the application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: SolidScaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(appTitle),
        ),
        navigationItems: [
          NavigationItem(
            icon: Icons.home,
            label: 'Home',
            widget: AppHomePage(title: appTitle.split(' - ')[0]),
          ),
          NavigationItem(
            icon: Icons.settings,
            label: 'Another',
            widget: Center(
              child: Text('Another Page', style: TextStyle(fontSize: 24)),
            ),
          ),
          NavigationItem(
            icon: Icons.person,
            label: 'Profile',
            widget: Center(
              child: Text('Profile Page', style: TextStyle(fontSize: 24)),
            ),
          ),
        ],
      ),
    );
  }
}
