import 'package:flutter/material.dart';

void navigateTo(BuildContext context, Widget screeen) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(builder: (context) => screeen),
  );
}
