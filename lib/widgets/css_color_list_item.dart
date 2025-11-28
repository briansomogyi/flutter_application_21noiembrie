import 'package:flutter/material.dart';

import '../models/css_color.dart';
import '../utils/color_utils.dart';

class CssColorListItem extends StatelessWidget {
  const CssColorListItem({
    super.key,
    required this.cssColor,
    this.onItemClicked,
  });

  final CssColor cssColor;

  /// Callback when the item is clicked.
  final void Function()? onItemClicked;

  @override
  Widget build(BuildContext context) {
    final TextStyle itemStyle = TextStyle(color: contrastColor(cssColor.color));
    return GestureDetector(
      onTap: onItemClicked,
      child: Container(
        padding: EdgeInsets.all(16.0),
        color: cssColor.color,
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(cssColor.colorName, style: itemStyle),
            Text(toHex(cssColor.color), style: itemStyle),
          ],
        ),
      ),
    );
  }
}
