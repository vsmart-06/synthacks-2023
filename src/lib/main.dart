import 'package:flutter/material.dart';
import "package:spacejam/pages/playground.dart";


void main() {
  runApp(
    MaterialApp(
      routes: {
        "/": (context) => Playground(),
      }
    )
  );
}
