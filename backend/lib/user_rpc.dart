import 'package:grpc/src/server/call.dart';
import 'package:server_grpc/generated/user.pbgrpc.dart';

final mockUser = User()
  ..id = '1'
  ..username = 'userName';

class UserRpc extends UserRpcServiceBase {
  @override
  Future<User> createUser(ServiceCall call, User request) {
    final userName = request.username;

    /// Создание пользователя в базе данных
    return Future.value(mockUser);
  }

  @override
  Future<User> getUser(ServiceCall call, Request request) {
    final id = request.id;

    /// Получение пользователя по id из базы данных
    return Future.value(mockUser);
  }

  @override
  Future<Response> deleteUser(ServiceCall call, Request request) {
    // TODO: Удаление из базы данных пользователя
    return Future.value(Response(message: 'User deleted'));
  }

  @override
  Future<User> updateUser(ServiceCall call, User request) {
    final id = request.id;
    // TODO: Обновление пользователя в базе данных
    return Future.value(mockUser);
  }
}
