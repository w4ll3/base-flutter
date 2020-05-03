import 'package:baseproject/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SecureDataSource {
  static const dynamic TOKEN_KEY = 'token';

  Future<Either<Failure, bool>> save(String key, String value);

  Future<Either<Failure, String>> read(String key);

  Future<Either<Failure, bool>> purge();
}
