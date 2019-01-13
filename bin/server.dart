import 'dart:io';
import 'dart:async';

Future main() async {
  var server = await HttpServer.bind(
    "0.0.0.0",
    85,
  );
  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {
    request.response
      ..write('Hello, world!')
      ..close();
  }
}