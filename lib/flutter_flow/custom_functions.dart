import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

dynamic toJSON(
  List<String> keys,
  List<String> values,
) {
  // json from list
  final data = <dynamic>[];
  if (keys != null && values != null) {
    for (var i = 0; i < keys.length; i++) {
      data.add({
        keys[i]: values[i],
      });
    }
  }
  return data;
}

DocumentReference getLatestBlockRef(List<DocumentReference> blockList) {
  // Add your function code here!
  return blockList[blockList.length - 1];
}

int increment(int currentIndex) {
  // increment by 1
  return currentIndex + 1;
}
