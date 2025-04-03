// Mỗi chức nang sẽ là một usecase
import 'package:best_me_project/core/interfaces/usecase.dart';
import 'package:fpdart/src/either.dart';

class UserSignIn implements UseCase {
  @override
  Future<Either<String, dynamic>> call({params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
