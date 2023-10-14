import 'package:flutter/material.dart';

final colorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF082659),
    brightness: Brightness.light,
    background: Colors.white);

final appTheme = ThemeData().copyWith(
    colorScheme: colorScheme,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: colorScheme.primary,
      elevation: 6,
    ),
    // textTheme:  TextTheme(
    //   titleLarge: GoogleFonts.ubuntuCondensed(
    //       color: colorScheme.primary,
    //       fontSize: 20,
    //       fontWeight: FontWeight.bold),
    //   titleMedium: GoogleFonts.ubuntuCondensed(
    //       color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
    //   titleSmall: GoogleFonts.ubuntuCondensed(
    //       color: Colors.white, fontSize: 14, fontWeight: FontWeight.w200),
    // )
    );
