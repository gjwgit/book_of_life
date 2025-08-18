/// Book of Life - The primary [MaterialApp] widget.
///
// Time-stamp: <Monday 2025-08-18 19:34:38 +1000 Graham Williams>
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

import 'package:solidui/solidui.dart';

import 'package:bol/constants/app.dart';

class BookOfLife extends StatelessWidget {
  const BookOfLife({super.key});

  // This widget is the root of the application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: SolidScaffold(
        menu: [
          SolidMenuItem(
            icon: Icons.home,
            title: 'Home',
            tooltip: '''

            **Home:** Tap here to return to the main page for the app.

            ''',
            // widget: AppHomePage(title: appTitle.split(' - ')[0]),
          ),
          SolidMenuItem(
            icon: Icons.settings,
            title: 'Health',
            tooltip: '''

            **Health:** Tap here for a summary of your health. You main health
              data is managed witheth HealthPod and other apps.

            ''',
            // widget: Center(
            // child: Text('Another Page', style: TextStyle(fontSize: 24)),
            // ),
          ),
          SolidMenuItem(
            icon: Icons.person,
            title: 'Interests',
            tooltip: '''

            **Interests:** Tap here to access your life interests. You Movie
              interests are managed by the MovieStar app but you get a summary
              here.

            ''',
            // widget: Center(
            // child: Text('Profile Page', style: TextStyle(fontSize: 24)),
            // ),
          ),
        ],
        appBar: SolidAppBarConfig(
          title: 'My Application',
          actions: [
            SolidAppBarAction(
              icon: Icons.search,
              onPressed: () => print('Search'),
              tooltip: 'Search',
            ),
            SolidAppBarAction(
              icon: Icons.notifications,
              onPressed: () => print('Notifications'),
              tooltip: 'Notifications',
              hideOnNarrowScreen: true, // Hide on narrow screens
            ),
          ],
          overflowItems: [
            SolidOverflowMenuItem(
              id: 'help',
              icon: Icons.help,
              label: 'Help',
              onSelected: () => print('Help'),
            ),
          ],
        ),
        statusBar: SolidStatusBarConfig(
          serverInfo: SolidServerInfo(
            serverUri: 'https://example.com',
            tooltip: 'Server status',
          ),
          loginStatus: SolidLoginStatus(
            webId: 'user@example.com',
            onTap: () => print('Login/Logout'),
            loggedInTooltip: 'Click to log out',
            loggedOutTooltip: 'Click to log in',
          ),
        ),
        child: Center(
          child: Text('This will be the main app page.\nThe Home page.'),
        ),
      ),
    );
  }
}
