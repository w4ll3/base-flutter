library serializers;

import 'package:baseproject/features/auth/data/entities/access_token.dart';
import 'package:baseproject/features/auth/data/entities/additional_information.dart';
import 'package:baseproject/features/auth/data/entities/login_response.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  AccessToken,
  AdditionalInformation,
  LoginResponse,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
