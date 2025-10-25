/// The primary [MaterialApp] widget.
///
// Time-stamp: <Saturday 2025-10-25 16:41:25 +1100 Graham Williams>
///
/// Copyright (C) 2025, Software Innovation Institute, ANU.
///
/// Licensed under the GNU General Public License, Version 3 (the "License").
///
/// License: https://opensource.org/license/gpl-3-0.
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
// this program.  If not, see <https://opensource.org/license/gpl-3-0>.
///
/// Authors: Graham Williams

library;

import 'package:flutter/material.dart';

import 'package:solidui/solidui.dart';

import 'constants/app.dart';
import 'home.dart';

// This widget is the root of the application.

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SolidThemeApp(
      // Turn off debug banner for now.
      debugShowCheckedModeBanner: false,
      title: appTitle,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),

      // This is the usual Scaffold() that we then "seemlessly" replace with
      // SolidScaffold().
      home: SolidLogin(
        image: const AssetImage('assets/images/app_image.png'),
        logo: const AssetImage('assets/images/app_icon.png'),
        child: SolidScaffold(
          // MENU
          menu: [
            const SolidMenuItem(
              icon: Icons.home,
              title: 'Home',
              tooltip: '''

            **Home:** Tap here to return to the main page for the app.

            ''',
              child: AppHomePage(title: appTitle),
            ),
            const SolidMenuItem(
              icon: Icons.folder,
              title: 'Files',
              tooltip: '''

            **Files:** Tap here to browse the files on your POD.

            ''',
              child: SolidFile(basePath: ''),
            ),
            const SolidMenuItem(
              icon: Icons.headphones,
              title: 'Music',
              tooltip: '''

            **Health:** Tap here for a summary of your health. You main health
            data is managed witheth HealthPod and other apps.

            ''',
              child: Center(
                child: Text('Another Page', style: TextStyle(fontSize: 24)),
              ),
            ),
            const SolidMenuItem(
              icon: Icons.interpreter_mode,
              title: 'Interests',
              tooltip: '''

            **Interests:** Tap here to access your life interests. You Movie
            interests are managed by the MovieStar app but you get a summary
            here.

            ''',
              child: Center(
                child: Text('Profile Page', style: TextStyle(fontSize: 24)),
              ),
            ),
          ],

          // APP BAR
          appBar: SolidAppBarConfig(
            title: appTitle.split('-')[0],

            // VERSION
            versionConfig: const SolidVersionConfig(
              changelogUrl:
                  'https://github.com/gjwgit/book_of_life/blob/dev/'
                  'CHANGELOG.md',
              showDate: true,
            ),

            // actions: [
            //   SolidAppBarAction(
            //     icon: Icons.search,
            //     onPressed: () => debugPrint('Search'),
            //     tooltip: 'Search',
            //   ),
            //   SolidAppBarAction(
            //     icon: Icons.notifications,
            //     onPressed: () => debugPrint('Notifications'),
            //     tooltip: 'Notifications',
            //   ),
            // ],
            // overflowItems: [
            //   SolidOverflowMenuItem(
            //     id: 'help',
            //     icon: Icons.help,
            //     label: 'Help',
            //     onSelected: () => debugPrint('Help'),
            //   ),
            // ],
          ),

          // STATUS BAR
          statusBar: SolidStatusBarConfig(
            serverInfo: const SolidServerInfo(
              serverUri: 'https://pods.solidcommunity.au',
              // tooltip: 'Tap here to visit the Solid server.',
            ),
            loginStatus: SolidLoginStatus(
              //    webId: 'user@example.com',
              // onTap: () => debugPrint('Login/Logout'),
              // TODO 20250919 gjw  SHOULD COME FROM SOLIDUI AND HAVE A DEFAULT
              // onTap: () => handleLogout(context),
              //loggedInTooltip: 'Click to log out',
              //loggedOutTooltip: 'Click to log in',
            ),
            securityKeyStatus: const SolidSecurityKeyStatus(
              //  isKeySaved: true,
              //    onKeyStatusChanged: () {},
            ),
          ),

          // ABOUT
          aboutConfig: SolidAboutConfig(
            applicationName: appTitle.split(' - ')[0],
            applicationIcon: Image.asset(
              'assets/images/app_icon.png',
              width: 64, // Adjust size as needed
              height: 64,
            ),
            applicationLegalese: '''Copyright © 2025 Togaware Pty Ltd''',
            text: '''

          Your book of life is written by you. This app provides support for you to do
          just that, while retaining all your data encrypted and secure on a Solid
          server of your choice.

          With this app you can store your **important numbers** so they are
          available whenever you need them. Your **health data** can be
          populated here and shared with your doctor. All data is stored
          encrypted as a Pod in your Data Vault on a Solid Server of your
          choice.

          [Source code.](https://github.com/gjwgit/book_of_life)

          ''',
          ),

          // THEME DARK/LIGHT Mode
          themeToggle: const SolidThemeToggleConfig(
            enabled: true,
            showInAppBarActions: true,
          ),

          child: const AppHomePage(title: appTitle),
        ),
      ),
    );
  }
}
