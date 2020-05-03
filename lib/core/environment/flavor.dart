import 'package:meta/meta.dart';

enum BuildFlavor { prod, develop, homolog, qa }

class BuildEnvironment {
  const BuildEnvironment({
    @required this.baseUrl,
    @required this.flavor,
  });

  final String baseUrl;
  final BuildFlavor flavor;
}
