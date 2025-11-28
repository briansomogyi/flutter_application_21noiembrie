import 'package:flutter/material.dart';

import 'common/strings.dart' as strings;
import 'screens/home_screen.dart';

void main() {
  runApp(CssColorViewerApp());
}

class CssColorViewerApp extends StatelessWidget {
  const CssColorViewerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: strings.appName,
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
