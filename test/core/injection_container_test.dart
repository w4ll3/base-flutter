import 'package:baseproject/core/environment/flavor.dart';
import 'package:baseproject/core/injection_container.dart' as di;
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Can initialize injection container',
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      const BuildEnvironment environment = BuildEnvironment(
        baseUrl: 'https://api.base.develop.uds.com.br/app',
        flavor: BuildFlavor.develop,
      );
      di.init(
        environment: environment,
      );
    },
  );
}
