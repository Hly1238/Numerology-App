import 'package:best_me_project/src/authentication/data/datasource/auth_data.dart';
import 'package:best_me_project/src/authentication/data/repositories/auth_respository_imp.dart';
import 'package:best_me_project/src/authentication/domain/usecases/user_sign_in.dart';
import 'package:best_me_project/src/authentication/presentation/bloc/auth_bloc.dart';
import 'package:best_me_project/src/authentication/presentation/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(
              userSignIn: UserSignIn(
                AuthRespositoryImp(
                    AuthDataImpl()), // Replace with your actual repository
              ),
            ),
          ),
        ],
        child: const Login(),
      ),
    );
  }
}
