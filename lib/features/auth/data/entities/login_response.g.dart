// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LoginResponse> _$loginResponseSerializer =
    new _$LoginResponseSerializer();

class _$LoginResponseSerializer implements StructuredSerializer<LoginResponse> {
  @override
  final Iterable<Type> types = const [LoginResponse, _$LoginResponse];
  @override
  final String wireName = 'LoginResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, LoginResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(AccessToken)),
      'additionalInformation',
      serializers.serialize(object.additionalInformation,
          specifiedType: const FullType(AdditionalInformation)),
    ];

    return result;
  }

  @override
  LoginResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'token':
          result.token.replace(serializers.deserialize(value,
              specifiedType: const FullType(AccessToken)) as AccessToken);
          break;
        case 'additionalInformation':
          result.additionalInformation.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AdditionalInformation))
              as AdditionalInformation);
          break;
      }
    }

    return result.build();
  }
}

class _$LoginResponse extends LoginResponse {
  @override
  final AccessToken token;
  @override
  final AdditionalInformation additionalInformation;

  factory _$LoginResponse([void Function(LoginResponseBuilder) updates]) =>
      (new LoginResponseBuilder()..update(updates)).build();

  _$LoginResponse._({this.token, this.additionalInformation}) : super._() {
    if (token == null) {
      throw new BuiltValueNullFieldError('LoginResponse', 'token');
    }
    if (additionalInformation == null) {
      throw new BuiltValueNullFieldError(
          'LoginResponse', 'additionalInformation');
    }
  }

  @override
  LoginResponse rebuild(void Function(LoginResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginResponseBuilder toBuilder() => new LoginResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginResponse &&
        token == other.token &&
        additionalInformation == other.additionalInformation;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, token.hashCode), additionalInformation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginResponse')
          ..add('token', token)
          ..add('additionalInformation', additionalInformation))
        .toString();
  }
}

class LoginResponseBuilder
    implements Builder<LoginResponse, LoginResponseBuilder> {
  _$LoginResponse _$v;

  AccessTokenBuilder _token;
  AccessTokenBuilder get token => _$this._token ??= new AccessTokenBuilder();
  set token(AccessTokenBuilder token) => _$this._token = token;

  AdditionalInformationBuilder _additionalInformation;
  AdditionalInformationBuilder get additionalInformation =>
      _$this._additionalInformation ??= new AdditionalInformationBuilder();
  set additionalInformation(
          AdditionalInformationBuilder additionalInformation) =>
      _$this._additionalInformation = additionalInformation;

  LoginResponseBuilder();

  LoginResponseBuilder get _$this {
    if (_$v != null) {
      _token = _$v.token?.toBuilder();
      _additionalInformation = _$v.additionalInformation?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginResponse;
  }

  @override
  void update(void Function(LoginResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginResponse build() {
    _$LoginResponse _$result;
    try {
      _$result = _$v ??
          new _$LoginResponse._(
              token: token.build(),
              additionalInformation: additionalInformation.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'token';
        token.build();
        _$failedField = 'additionalInformation';
        additionalInformation.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LoginResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
