import 'package:baseproject/core/error/failures.dart';
import 'package:baseproject/features/secure_storage/domain/datasources/secure_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureDataSourceImpl implements SecureDataSource {
  SecureDataSourceImpl(
    this._secureStorage,
  );

  final FlutterSecureStorage _secureStorage;

  @override
  Future<Either<Failure, String>> read(String key) async {
    try {
      return _secureStorage.read(key: key).then((value) => Right(value));
    } catch (err) {
      return Left(err);
    }
  }

  @override
  Future<Either<Failure, bool>> save(String key, String value) async {
    return _secureStorage
        .write(key: key, value: value)
        .then((_) => const Right(true));
  }

  @override
  Future<Either<Failure, bool>> purge() async {
    return _secureStorage.deleteAll().then((_) => const Right(true));
  }
}
