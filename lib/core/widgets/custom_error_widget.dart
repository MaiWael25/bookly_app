import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.errmessage});
  final String errmessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errmessage,
        style: Styles.textStyle18,
      ),
    );
  }
}
