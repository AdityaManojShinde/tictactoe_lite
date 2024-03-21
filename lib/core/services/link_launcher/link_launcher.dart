import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkLauncher {
  LinkLauncher();
  Future<void> launchLink(
      {required String url,
      required LaunchMode mode,
      required BuildContext ctx}) async {
    final Uri link = Uri.parse(url);
    try {
      await launchUrl(mode: mode, link);
    } catch (e) {
      if (ctx.mounted) {
        ScaffoldMessenger.of(ctx).showSnackBar(
            const SnackBar(content: Text('Something went wrong')));
      }

      if (kDebugMode) {
        print(e);
      }
    }
  }
}
