import 'package:flutter/material.dart';

class CustomPageBuilder extends PageRouteBuilder {
  CustomPageBuilder({required super.pageBuilder})
      : super(
          transitionDuration: const Duration(milliseconds: 500),
        );
}
