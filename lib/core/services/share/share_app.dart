import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareApp {
  void share(BuildContext ctx, String content) async {
    try {
      await Share.share(content);
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
