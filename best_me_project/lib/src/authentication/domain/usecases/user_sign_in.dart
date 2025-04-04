import 'package:best_me_project/core/interfaces/usecase.dart';
import 'package:best_me_project/src/authentication/domain/repository/auth_respository.dart';
import 'package:fpdart/src/either.dart';

// Mỗi chức nang sẽ là một usecase
class UserSignIn implements UseCase<String, UserSignInParams> {
  final AuthRespository repository;
  UserSignIn(this.repository);

  @override
  Future<Either<String, String>> call(UserSignInParams params) async {
    return await repository.signIn(
      username: params.username,
      password: params.password,
    );
  }
}

class UserSignInParams {
  final String username;
  final String password;
  UserSignInParams({
    required this.username,
    required this.password,
  });
}
