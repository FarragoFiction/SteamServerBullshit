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

Future<String> getKey() async {
  var config = File('steam_key_not_git.key');
  return await config.readAsString();
}

Future<Null> testGetting(request) async{
  String key = await getKey();
  String url = "http://api.steampowered.com/ISteamUserStats/GetSchemaForGame/v2/?key=${key}&appid=929640";
  print ("url is $url");
  String resp = await http.read(url);
  request.response..write(resp);

}