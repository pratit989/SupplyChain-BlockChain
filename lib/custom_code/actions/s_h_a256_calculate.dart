// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'dart:convert' show utf8;
import 'package:crypto/crypto.dart';

Future<String> sHA256Calculate(
  int index,
  String previousHash,
  DateTime timestamp,
  dynamic jsonData,
  String addedBy,
) async {
  // Add your function code here!
  List<int> bytes =
      utf8.encode("$index$previousHash$timestamp$jsonData$addedBy");
  String hash = sha256.convert(bytes).toString();
  return hash;
}
