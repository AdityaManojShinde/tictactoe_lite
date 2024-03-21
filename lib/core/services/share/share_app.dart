import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareApp {
  void share(BuildContext ctx) async {
    try {
      await Share.share(
          'check out this awesome app on Goggle Play Store\nLink : https://play.google.com/store/apps/details?id=tech.din0.tic_tac_toe_lite');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      if (ctx.mounted) {
        ScaffoldMessenger.of(ctx).showSnackBar(
            const SnackBar(content: Text('Something went wrong')));
      }
    }
  }
}
