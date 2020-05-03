import 'package:baseproject/core/error/failures.dart';
import 'package:baseproject/features/auth/data/entities/login_response.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRemote {
  Future<Either<Failure, LoginResponse>> login({
    String username,
    String password,
  });

  Future<Either<Failure, bool>> logout();
}
