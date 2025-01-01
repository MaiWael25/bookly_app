import 'package:bookly_app/core/utils/function/custom_snakbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url !=null) {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
     CustomSnackBar(context, 'Cannot launch$url');
  }
}
}


