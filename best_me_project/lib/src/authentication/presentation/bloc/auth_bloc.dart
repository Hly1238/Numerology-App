import 'package:best_me_project/core/interfaces/usecase.dart';
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
