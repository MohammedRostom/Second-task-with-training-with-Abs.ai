import 'dart:convert';

import 'package:flutter/material.dart';

class JsonConverterClass {
  static readDatafromJason(
    BuildContext context, {
    required String pathJasonFile,
  }) async {
    // Load JSON data from the asset bundle
    String jsonString =
        await DefaultAssetBundle.of(context).loadString(pathJasonFile);
    // Decode the JSON string
    List<Map<String, dynamic>> data =
        List<Map<String, dynamic>>.from(json.decode(jsonString));

    return data;
  }
}
