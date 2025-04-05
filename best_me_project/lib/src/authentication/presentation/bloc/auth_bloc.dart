import 'package:best_me_project/src/authentication/domain/usecases/user_sign_in.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignIn _userSignIn;

  AuthBloc({required UserSignIn userSignIn})
      : _userSignIn = userSignIn,
        super(AuthInitial()) {
    on<AuthSignInEvent>(
      (event, emit) async {
        /// Thay vì dùng
        /// _userSignIn.call() thì sẽ dùng như sau, vì call là một function đặc biệt

        final result = await _userSignIn(
          UserSignInParams(
            username: event.username,
            password: event.password,
          ),
        );
        // it can be either a failure or success => emit the state
        result.fold(
          (failure) => emit(AuthFailure()),
          (success) => emit(AuthSuccess(success)),
        );
      },
    );
  }
}
