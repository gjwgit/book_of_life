/// Book of Life - The primary [MaterialApp] widget.
///
// Time-stamp: <Tuesday 2025-08-26 20:04:45 +1000 Graham Williams>
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

// Which sample Scaffold to use.
//
// 0 = Just a basic Text widget within a standard Scaffold.
// 1 = Test floating menu with narrow screen.
// 2 = Test dark/light mode.
// 9 = My final Scaffold for the app.

int useScaffold = 2;

// This widget is the root of the application.
//
// To support the darl.light theme this needs to be a StatefulWidget?

class BookOfLife extends StatelessWidget {
  const BookOfLife({super.key});

  @override
  Widget build(BuildContext context) {
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
        // Pretend we are a Scaafold().
        0 => SolidScaffold(body: sampleChild),
        // Add a menu to the Scaffold(). body/child are synonymous.
        1 => SolidScaffold(menu: sampleMenu, child: sampleChild),
        // Add a dark.light mode button.
        2 => SolidScaffold(
          menu: [tapTheme, ...sampleMenu],
          appBar: buildSampleAppBar,
          themeToggle: sampleThemeToggle,
          child: sampleChild,
        ),
        // Bring it all together.
        9 => SolidScaffold(
          menu: sampleMenu,
          themeToggle: sampleThemeToggle,
          appBar: buildSampleAppBar,
          statusBar: sampleStatusBar,
          aboutConfig: sampleAboutConfig,
          child: sampleChild,
        ),
        _ => Scaffold(body: sampleChild),
      },
    );
  }
}

////////////////////////////////////////////////////////////////////////
// Define sample widgets.

////////////////////////////////////
// ABOUT

final sampleAboutConfig = SolidAboutConfig(
  applicationName: appTitle.split(' - ')[0],
  applicationIcon: Icon(Icons.apps, size: 64),
  applicationLegalese: '''© 2025 My Company''',
  text: '''

  Your book of life is written by you. This app provides support for you to do
  just that, while retaining all your data encrypted and secure on a Solid
  server of your choice.

  **Features:**

  • Your important numbers are stored here and available whereever your are.

  • Your health data can be populated here and shared with your doctor.

  • All data is stored encrypted as a POD on a Solid Server of your choice.

  For more information, visit [github](https://github.com/gjwgit/book_of_life).

''',
);

////////////////////////////////////
// APP BAR

final buildSampleAppBar = SolidAppBarConfig(
  title: appTitle,
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
  versionConfig: buildSampleVersion,
);

////////////////////////////////////
// CHILD

const sampleChild = Center(
  child: Text('Home Page', style: TextStyle(fontSize: 24)),
);

////////////////////////////////////
// MENU

const sampleMenu = [
  SolidMenuItem(
    icon: Icons.home,
    title: 'Home',
    tooltip: '''

    **Home:** Tap here to return to the main page for the app.

    ''',
    child: sampleChild,
  ),
  SolidMenuItem(
    icon: Icons.settings,
    title: 'Health',
    tooltip: '''

    **Health:** Tap here for a summary of your health. You main health
    data is managed witheth HealthPod and other apps.

    ''',
    child: Center(child: Text('Another Page', style: TextStyle(fontSize: 24))),
  ),
  SolidMenuItem(
    icon: Icons.person,
    title: 'Interests',
    tooltip: '''

    **Interests:** Tap here to access your life interests. You Movie
    interests are managed by the MovieStar app but you get a summary
    here.

    ''',
    child: Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
  ),
];

////////////////////////////////////
// STATUS BAR

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

////////////////////////////////////
// THEME DARK/LIGHT Mode

// TODO This should be part of SolidScaffold, not in my code.

final sampleThemeToggle = SolidThemeToggleConfig(
  enabled: true,
  //  currentThemeMode: _currentThemeMode,
  //  onToggleTheme: _toggleTheme,
  showInAppBarActions: true,
);

final tapTheme = SolidMenuItem(
  icon: Icons.star,
  title: 'Theme',
  tooltip: '''

              **Theme:** Tap here to show a page to test the theme.

              ''',
  child: Center(
    child: Text(
      'Theme Button - Not Yet Working',
      style: TextStyle(fontSize: 24),
    ),
  ),
);

////////////////////////////////////
// VERSION

final buildSampleVersion = SolidVersionConfig(
  changelogUrl:
      'https://github.com/gjwgit/book_of_life/blob/dev/'
      'CHANGELOG.md',
  showDate: true,
);
