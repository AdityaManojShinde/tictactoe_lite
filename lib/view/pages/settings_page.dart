import 'package:flutter/material.dart';
import 'package:tictactoe/core/services/link_launcher/link_launcher.dart';
import 'package:tictactoe/core/services/share/share_app.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final linkLauncher = LinkLauncher();
    final appShare = ShareApp();
    const textColor = Color.fromARGB(255, 100, 32, 170);
    void openPrivacyPolicy() => linkLauncher.launchLink(
        url:
            'https://www.freeprivacypolicy.com/live/152f4be1-4c44-47f1-9747-e4ef5b3f3d40',
        mode: LaunchMode.inAppBrowserView,
        ctx: context);
    void openMoreApp() => linkLauncher.launchLink(
        url: 'https://play.google.com/store/apps/dev?id=5752398750099521659',
        mode: LaunchMode.externalApplication,
        ctx: context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 127, 39, 255),
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            title: Text(
              'Privacy Policy',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: textColor),
            ),
            onTap: openPrivacyPolicy,
          ),
          ListTile(
            leading: const Icon(color: textColor, Icons.apps),
            title: Text(
              'More apps',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: textColor),
            ),
            onTap: openMoreApp,
          ),
          ListTile(
            leading: const Icon(color: textColor, Icons.share),
            title: Text(
              'Share with friends',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: textColor),
            ),
            onTap: () => appShare.share(context,
                "Found this awesome Tic Tac Toe game called Tic Tac Toe Lite! It's super lightweight and perfect for quick matches. ⚡ Wanna play?\nhttps://play.google.com/store/apps/details?id=tech.din0.tic_tac_toe_lite"),
          ),
        ],
      ),
    );
  }
}
