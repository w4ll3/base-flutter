import 'package:baseproject/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class RetrievePasswordRemote {
  Future<Either<Failure, String>> sendToken({
    String document,
    String email,
  });

  Future<Either<Failure, String>> validateToken({
    String token,
  });

  Future<Either<Failure, String>> retrievePassword({
    String newPassword,
    String token,
  });
}
