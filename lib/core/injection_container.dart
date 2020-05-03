import 'package:baseproject/core/environment/flavor.dart';
import 'package:baseproject/core/network/network_info.dart';
import 'package:baseproject/features/auth/data/datasources/auth_remote_impl.dart';
import 'package:baseproject/features/auth/domain/blocs/auth_bloc.dart';
import 'package:baseproject/features/auth/domain/datasources/auth_remote.dart';
import 'package:baseproject/features/auth/domain/usecases/login.dart';
import 'package:baseproject/features/auth/domain/usecases/logout.dart';
import 'package:baseproject/features/retrieve_password/data/datasources/retrieve_password_remote_impl.dart';
import 'package:baseproject/features/retrieve_password/domain/datasources/retrieve_password_remote.dart';
import 'package:baseproject/features/retrieve_password/domain/usecases/retrieve_password.dart';
import 'package:baseproject/features/retrieve_password/domain/usecases/send_token.dart';
import 'package:baseproject/features/retrieve_password/domain/usecases/validate_token.dart';
import 'package:baseproject/features/secure_storage/data/datasources/secure_data_source_impl.dart';
import 'package:baseproject/features/secure_storage/domain/datasources/secure_data_source.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init({
  BuildEnvironment environment,
}) async {
  //! Core
  sl.registerSingleton<GlobalKey<NavigatorState>>(GlobalKey<NavigatorState>());
  sl.registerLazySingleton(() => environment);
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //secure_storage
  sl.registerLazySingleton<SecureDataSource>(
    () => SecureDataSourceImpl(sl()),
  );

  //retrieve_password
  sl.registerLazySingleton<RetrievePasswordRemote>(
    () => RetrievePasswordRemoteImpl(sl(), sl()),
  );
  sl.registerLazySingleton(
    () => RetrievePassword(sl()),
  );
  sl.registerLazySingleton(
    () => SendToken(sl()),
  );
  sl.registerLazySingleton(
    () => ValidateToken(sl()),
  );
  // sl.registerLazySingleton<RetrievePasswordManager>(
  //   () => RetrievePasswordManager(sl(), sl(), sl()),
  // );

  //login
  sl.registerLazySingleton<AuthRemote>(
    () => AuthRemoteImpl(sl(), sl()),
  );
  sl.registerLazySingleton(
    () => Login(sl(), sl(), sl()),
  );
  sl.registerLazySingleton(
    () => Logout(sl(), sl()),
  );
  sl.registerLazySingleton(
    () => AuthBloc(),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => Dio(BaseOptions(
        baseUrl: environment.baseUrl,
        connectTimeout: 60000,
        receiveTimeout: 60000,
      ))
        ..interceptors.addAll([
          LogInterceptor(responseBody: true, requestBody: true),
          InterceptorsWrapper(
            onRequest: (RequestOptions options) async {
              options.headers.addAll({'Content-Type': 'application/json'});
              return options;
            },
            onError: (DioError error) async {
              if (error.type == DioErrorType.RECEIVE_TIMEOUT ||
                  error.type == DioErrorType.CONNECT_TIMEOUT) {
                error.response = Response(
                  statusCode: -1,
                );
              }
              if (error.response.statusCode == 401 &&
                  !error.request.path.contains('/login')) {
                sl.get<SecureDataSource>().purge();

                sl
                    .get<GlobalKey<NavigatorState>>()
                    .currentState
                    .pushNamedAndRemoveUntil('/', (route) => route.isFirst);
              }
              return error;
            },
          )
        ]));
}
