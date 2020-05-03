import 'package:auto_route/auto_route.dart';
import 'package:baseproject/core/injection_container.dart';
import 'package:baseproject/features/secure_storage/domain/datasources/secure_data_source.dart';

class AuthGuard extends RouteGuard {
  @override
  Future<bool> canNavigate(
    ExtendedNavigatorState navigator,
    String routeName,
    Object arguments,
  ) async {
    final SecureDataSource secureDataSource = sl();
    return secureDataSource.read(SecureDataSource.TOKEN_KEY) != null;
  }
}
