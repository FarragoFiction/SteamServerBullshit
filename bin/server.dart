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
    await testGetting(request);
    request.response
      ..write('Hello, world!')
      ..close();
  }
}

Future<Null> testGetting(request) async{
  String resp = await http.read("http://farragofiction.com/WranglerNewsposts/jadedResearcher.txt");
  request.response..write(resp);

}