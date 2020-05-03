import 'dart:convert';

import 'package:baseproject/core/serializers.dart';
import 'package:baseproject/features/auth/data/entities/access_token.dart';
import 'package:baseproject/features/auth/data/entities/additional_information.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_response.g.dart';

abstract class LoginResponse
    implements Built<LoginResponse, LoginResponseBuilder> {
  LoginResponse._();

  factory LoginResponse([
    void Function(LoginResponseBuilder) updates,
  ]) = _$LoginResponse;

  AccessToken get token;
  AdditionalInformation get additionalInformation;

  static LoginResponse fromJson(String jsonString) => serializers
      .deserializeWith(LoginResponse.serializer, jsonDecode(jsonString));

  static Serializer<LoginResponse> get serializer => _$loginResponseSerializer;
}
