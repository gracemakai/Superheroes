import 'dart:convert';

import 'package:http/http.dart' as http;

class BaseService {
  var postRequestType = "POST";
  var getRequestType = "GET";
  var patchRequestType = "PUT";
  var deleteRequestType = "DELETE";

  databaseRequest(String link, String type,
      {Map<String, dynamic>? body,
      Map<String, String>? bodyFields,
      Map<String, String>? headers}) async {
    try {

      headers ??= {
        'Content-Type': 'application/json',
      };
      var request = http.Request(
        type,
        Uri.parse(link),
      );
      print(request.url);
      if (body != null) {
        request.body = json.encode(body);
      }

      if (bodyFields != null) {
        request.bodyFields = bodyFields;
      }

      // request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var bytesToString = response.stream.bytesToString();

      return bytesToString;
    } catch (e, s) {
      print("Error on api $link $e $s");
    }
  }
}
