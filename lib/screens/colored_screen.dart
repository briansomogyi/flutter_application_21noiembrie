import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:share_plus/share_plus.dart';

import '../models/css_color.dart';
import '../utils/color_utils.dart' as color_utils;
import '../common/consts.dart' as consts;

class ColoredScreen extends StatelessWidget {
  const ColoredScreen({super.key, required this.cssColor});

  final CssColor cssColor;

  void shareColor() async {
    // Generate the color swatch image file name
    final String hexCode = color_utils.toHex(
      cssColor.color,
    );
    final String fileName = consts.colorSwatchFileName(hexCode);

    // Create the color swatch image file
    Uint8List pngBytes = await color_utils.buildColorSwatch(
      cssColor.color,
      512,
      512,
    );
    final XFile xFile = XFile.fromData(
      pngBytes,
      name: fileName,
      mimeType: 'image/png',
    );

    // Summon the platform's share sheet to share the image file
    await Share.shareXFiles([
      xFile,
    ], text: 'Iti trimit o culoare!');
  }

  @override
  Widget build(BuildContext context) {
    final textColor = color_utils.contrastColor(cssColor.color);
    return Scaffold(
      backgroundColor: cssColor.color,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: shareColor,
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            Text(
              cssColor.colorName,
              style: Theme.of(
                context,
              ).textTheme.displaySmall?.copyWith(color: textColor),
            ),
            Text(
              color_utils.toHex(cssColor.color),
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
