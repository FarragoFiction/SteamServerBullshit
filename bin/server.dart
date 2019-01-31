import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;


Future main() async {
  var server = await HttpServer.bind(
    "0.0.0.0",
    85,
  );
  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {
    testGetting();
    request.response
      ..write('Hello, world!')
      ..close();
  }
}

void testGetting() {
  http.read("http://farragofiction.com/WranglerNewsposts/jadedResearcher.txt").then(print);

}