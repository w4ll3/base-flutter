import 'dart:convert';

import 'package:baseproject/core/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'access_token.g.dart';

abstract class AccessToken implements Built<AccessToken, AccessTokenBuilder> {
  AccessToken._();

  factory AccessToken([
    Function(AccessTokenBuilder) updates,
  ]) = _$AccessToken;

  String get accessToken;
  String get tokenType;
  String get refreshType;
  int get expiresIn;
  String get scope;
  String get lastLogin;

  static AccessToken fromJson(String jsonString) => serializers.deserializeWith(
      AccessToken.serializer, jsonDecode(jsonString));

  static Serializer<AccessToken> get serializer => _$accessTokenSerializer;
}
