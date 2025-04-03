abstract class AuthData {
  Future<String> signIn({required String username, required String password});
}

class AuthDataImpl implements AuthData {
  @override
  Future<String> signIn(
      {required String username, required String password}) async {
    // TODO: implement signIn
    await Future.delayed(const Duration(seconds: 2));
    return 'Sign in success!';
    //Bắt lỗi 200 ở đây
  }
}
