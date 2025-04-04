import 'package:best_me_project/src/authentication/data/datasource/auth_data.dart';
import 'package:best_me_project/src/authentication/domain/repository/auth_respository.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/src/either.dart';

class AuthRespositoryImp implements AuthRespository {
  // Sẽ gọi database thông qua injection chứ không phải gọi trực tiếp data
  //chỉ muốn dựa vào interface đã tạo
  final AuthData authData;
  AuthRespositoryImp(this.authData);

  @override
  Future<Either<String, String>> signIn({
    required String username,
    required String password,
  }) async {
    try {
      var res = await authData.signIn(
        username: username,
        password: password,
      ); //bắt kết quả
      return left(res);
    } catch (e) {
      return left(e.toString());
    }
  }
}
