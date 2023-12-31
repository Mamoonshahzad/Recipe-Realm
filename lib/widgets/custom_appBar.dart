import 'package:flutter/material.dart';
import 'package:recipe_realm/utils/app_constants.dart';

class CustomAppBar extends StatelessWidget {
  String screenName;

  CustomAppBar({super.key, required this.screenName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppConstant.appMainColor,
      centerTitle: true,
      title: Text(screenName),
    );
  }
}
