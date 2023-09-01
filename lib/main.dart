import 'package:flutter/material.dart';
import "package:spacejam/pages/playground.dart";
import 'package:flame/game.dart';


void main() {
  runApp(
    MaterialApp(
      routes: {
        "/": (context) => Playground(),
      }
    )
  );
}
