import 'package:flutter_client/generated/user.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class UserRepo {
  late UserRpcClient userRpcClient;

  UserRepo() {
    final channel = ClientChannel('localhost',
        port: 9999,
        options: ChannelOptions(
            credentials: const ChannelCredentials.insecure(),
            codecRegistry: CodecRegistry()));
    userRpcClient = UserRpcClient(channel);
  }

  Future<User> getUser(String id) async {
    final user = await userRpcClient.getUser(
      Request(id: id),
    );
    return user;
  }
}
