import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

String toHex(Color color) {
  final int code = color.toARGB32();
  return '#${code.toRadixString(16)}';
}

Color contrastColor(Color color) {
  // if (ThemeData.estimateBrightnessForColor(color) == Brightness.dark) {
  //   return Colors.white;
  // } else {
  //   return Colors.black;
  // }
  return ThemeData.estimateBrightnessForColor(color) == Brightness.dark
      ? Colors.white
      : Colors.black;
}

/// Builds a color swatch image of the given [color] with the specified [width] and [height].
Future<Uint8List> buildColorSwatch(Color color, int width, int height) async {
  // Create the color swatch using a sequence of graphical operations
  final ui.PictureRecorder recorder = ui.PictureRecorder();
  final Canvas canvas = Canvas(
    recorder,
    Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
  );
  canvas.drawColor(color, BlendMode.src);
  final ui.Picture picture = recorder.endRecording();

  // Convert the picture to a PNG image and return its bytes
  final ui.Image img = await picture.toImage(width, height);
  final ByteData? pngBytes = await img.toByteData(
    format: ui.ImageByteFormat.png,
  );
  return pngBytes!.buffer.asUint8List();
}
