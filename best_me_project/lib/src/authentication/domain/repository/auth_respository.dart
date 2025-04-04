import 'package:fpdart/fpdart.dart';

abstract class AuthRespository {
  // Khi kết nối tới database thì sẽ là bất đồng bộ => trả về future
  // Có thể tạo failer khi không muốn trả về mỗi string mà còn có thể là status..
  Future<Either<String, String>> signIn({
    required String username,
    required String password,
  });
}
