import 'package:flutter/material.dart';
import 'package:flutterquiz/ui/widgets/custom_image.dart';
import 'package:flutterquiz/utils/ui_utils.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return QImage(
      imageUrl: UiUtils.getImagePath('splash_logo.svg'),
      color: Theme.of(context).primaryColor,
      height: 66,
      width: 168,
    );
  }
}
