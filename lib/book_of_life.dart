/// Book of Life - The primary [MaterialApp] widget.
///
// Time-stamp: <Thursday 2025-08-21 14:56:38 +1000 Graham Williams>
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

import 'package:package_info_plus/package_info_plus.dart';
import 'package:solidui/solidui.dart';

import 'package:bol/constants/app.dart';

// Which sample Scaffold to use.
//
// 0 = Just a basic Text widget.
// 1 = Test floating menu with narrow screen.
// 2 = Test dark/light mode.
// 9 = My final Scaffold for the app.

int useScaffold = 9;

class BookOfLife extends StatelessWidget {
  BookOfLife({super.key});

  // This widget is the root of the application.

  // Determine the app's version.

  final Future<String> versionFuture = PackageInfo.fromPlatform().then(
    (info) => info.version,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: versionFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            // Turn off debug banner for now.
            debugShowCheckedModeBanner: false,
            title: appTitle,

            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            ),

            // This is the usual Scaffold() that we then "seemlessly" replace with
            // SolidScaffold().
            home: switch (useScaffold) {
              1 => SolidScaffold(menu: sampleMenu, child: sampleChild),
              2 => SolidScaffold(
                menu: sampleMenu,
                themeToggle: sampleThemeToggle,
                child: sampleChild,
              ),
              9 => SolidScaffold(
                menu: sampleMenu,
                themeToggle: sampleThemeToggle,
                appBar: buildSampleAppBar(snapshot.data ?? ''),
                statusBar: sampleStatusBar,
                child: sampleChild,
              ),
              _ => Scaffold(body: sampleChild),
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

////////////////////////////////////////////////////////////////////////

// Define sample widgets.

const sampleMenu = [
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
];

const sampleChild = Center(
  child: Text('This will be the main app page.\nThe Home page.'),
);

SolidAppBarConfig buildSampleAppBar(String version) {
  return SolidAppBarConfig(
    title: 'My Application',
    actions: [
      SolidAppBarAction(
        icon: Icons.search,
        onPressed: () => debugPrint('Search'),
        tooltip: 'Search',
      ),
      SolidAppBarAction(
        icon: Icons.notifications,
        onPressed: () => debugPrint('Notifications'),
        tooltip: 'Notifications',
        hideOnNarrowScreen: true, // Hide on narrow screens
      ),
    ],
    overflowItems: [
      SolidOverflowMenuItem(
        id: 'help',
        icon: Icons.help,
        label: 'Help',
        onSelected: () => debugPrint('Help'),
      ),
    ],
    versionConfig: buildSampleVersion(version),
  );
}

final sampleStatusBar = SolidStatusBarConfig(
  serverInfo: SolidServerInfo(
    serverUri: 'https://pods.solidcommunity.au',
    tooltip: 'Server status',
  ),
  loginStatus: SolidLoginStatus(
    webId: 'user@example.com',
    onTap: () => debugPrint('Login/Logout'),
    loggedInTooltip: 'Click to log out',
    loggedOutTooltip: 'Click to log in',
  ),
);

final sampleThemeToggle = SolidThemeToggleConfig(
  enabled: true,
  //  currentThemeMode: _currentThemeMode,
  //  onToggleTheme: _toggleTheme,
  showInAppBarActions: true,
  hideOnVeryNarrowScreen: true,
  tooltip: '''
**Theme Toggle**

Switch between light and dark modes for optimal viewing experience.

🌙 **Dark Mode**: Better for low-light environments

☀️ **Light Mode**: Better for bright environments

''',
);

SolidVersionConfig buildSampleVersion(String version) {
  return SolidVersionConfig(
    version: version,
    changelogUrl:
        'https://github.com/gjwgit/book_of_life/blob/dev/'
        'CHANGELOG.md',
    showDate: true,
  );
}
