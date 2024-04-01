import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_clone/api/constants.dart';
import 'package:google_clone/api/dummy.dart';

import 'package:http/http.dart' as http;

class ApiService {
  bool isDummyData = false;

  Future<Map<String, dynamic>> fetchData(
      {required BuildContext context,
      required String queryTerm,
      required String KEY,
      String start = '0'}) async {
    try {
      if (!isDummyData) {
        String q = queryTerm.contains(' ')
            ? queryTerm.split(' ').join('+')
            : queryTerm;

        final response = await http.get(
          Uri.parse(
              'https://www.googleapis.com/customsearch/v1?key=$KEY&cx=$CONTEXT&q=$q&start=$start'),
        );
        if (response.statusCode == 200) {
          final jsonData = response.body;
          final respData = json.decode(jsonData);
          return respData;
        }
      }
    } catch (e) {
      log(
        e.toString(),
      );
    }
    return dummyResponse;
  }
}
