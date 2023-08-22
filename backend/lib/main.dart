import 'dart:async';
import 'dart:developer';

import 'package:grpc/grpc.dart';

import 'user_rpc.dart';

Future<void> startServer() async {
  runZonedGuarded(() async {
    final server = Server.create(services: [
      UserRpc()
    ], interceptors: [
      // Можно добавить интерцепторы (перехватчики)
    ], codecRegistry: CodecRegistry(codecs: [GzipCodec()]));
    await server.serve(port: 9999);
    log("Server listen port ${server.port}");
  }, (error, stack) {
    log("Error", error: error);
  });
}
