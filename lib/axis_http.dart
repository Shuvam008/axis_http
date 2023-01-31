import 'dart:convert';

import 'package:axis_http/Request_http.dart';
import 'package:axis_http/Response_http.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_user_agentx/flutter_user_agent.dart';

class Axios {
  // Axios([Request? req]) {}
  Future<Response> get(Request req) async {
    String filterUrl = req.url;
    String stage1 = filterUrl.replaceAll("https://", "");
    String stage2 = stage1.split(".com").first;
    String stage3 = stage2 + '.com';
    print('URL VALUE : ' + stage3);
    final response = await http.get(
      Uri.parse(req.url),
      headers: <String, String>{
        "Content-Type":
            req.headers.contentType == '' ? '' : req.headers.contentType,
        "User-Agent": req.headers.userAgent == '' ? '' : req.headers.userAgent,
        "Host": req.headers.host == '' ? stage3 : req.headers.host,
        "Accept": req.headers.accept == '' ? '' : '',
        "Accept-Encoding":
            req.headers.acceptEncoding == '' ? '' : req.headers.accept,
        "Connection":
            req.headers.connection == '' ? '' : req.headers.connection,
        "contentLength":
            req.headers.contentLength == '' ? '' : req.headers.contentLength,
      },
    );

    // print(response.body);
    print(response.statusCode);
    print(response.reasonPhrase);
    if (response.statusCode == 200) {
      print("success");
      var parsed = json.decode(response.body);
      print(jsonEncode(parsed));
      return Response(
        contentLength: 10,
        data: response.body,
        hashCode: response.hashCode,
        headers: response.headers,
        isRedirect: response.isRedirect,
        persistentConnection: response.persistentConnection,
        statusCode: response.statusCode,
      );
    } else {
      print("Failed : $Response");
      throw Exception('Failed to load Data');
    }
  }

  Future<Response> post(Request req) async {
    if (null != req.headers) {
      // if(!req?.headers?.accept)
    }
    final response = await http.post(Uri.parse(req.url),
        // headers: <String, String>{
        //   "Content-Type": req.headers.content_Type,
        //   "User-Agent": req.headers.user_Agent,
        //   "Host": req.headers.host,
        //   "Accept": req.headers.accept,
        //   "Accept-Encoding": req.headers.accept_Encoding,
        //   "Connection": req.headers.connection,
        //   // "Content-Length": req.headers.content_Length,
        // },
        body: const JsonEncoder().convert(req.body));
    if (response.statusCode == 200) {
      //return response;
      return Response(
        contentLength: 10,
        data: response.body,
        hashCode: response.hashCode,
        headers: response.headers,
        isRedirect: response.isRedirect,
        persistentConnection: response.persistentConnection,
        statusCode: response.statusCode,
      );
    } else {
      throw Exception('Failed to load Data');
    }
  }
}


// Axios obj = new Axios();

//https://docs.flutter.dev/cookbook#networking

//https://docs.flutter.dev/cookbook#networking

// library axis_http;

// /// A Calculator.
// class Calculator {
//   /// Returns [value] plus 1.
//   int addOne(int value) => value + 1;
// }
