import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // Features - Auth
  // sl.registerLazySingleton(() => AuthRemoteDataSourceImpl(client: sl()));
  // sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(client: sl()));
  // sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(remoteDataSource: sl()));
  // sl.registerLazySingleton(() => AuthBloc(authRepository: sl()));
}
