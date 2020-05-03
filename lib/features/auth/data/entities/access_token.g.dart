// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AccessToken> _$accessTokenSerializer = new _$AccessTokenSerializer();

class _$AccessTokenSerializer implements StructuredSerializer<AccessToken> {
  @override
  final Iterable<Type> types = const [AccessToken, _$AccessToken];
  @override
  final String wireName = 'AccessToken';

  @override
  Iterable<Object> serialize(Serializers serializers, AccessToken object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'accessToken',
      serializers.serialize(object.accessToken,
          specifiedType: const FullType(String)),
      'tokenType',
      serializers.serialize(object.tokenType,
          specifiedType: const FullType(String)),
      'refreshType',
      serializers.serialize(object.refreshType,
          specifiedType: const FullType(String)),
      'expiresIn',
      serializers.serialize(object.expiresIn,
          specifiedType: const FullType(int)),
      'scope',
      serializers.serialize(object.scope,
          specifiedType: const FullType(String)),
      'lastLogin',
      serializers.serialize(object.lastLogin,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AccessToken deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccessTokenBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'accessToken':
          result.accessToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tokenType':
          result.tokenType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'refreshType':
          result.refreshType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'expiresIn':
          result.expiresIn = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'scope':
          result.scope = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastLogin':
          result.lastLogin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AccessToken extends AccessToken {
  @override
  final String accessToken;
  @override
  final String tokenType;
  @override
  final String refreshType;
  @override
  final int expiresIn;
  @override
  final String scope;
  @override
  final String lastLogin;

  factory _$AccessToken([void Function(AccessTokenBuilder) updates]) =>
      (new AccessTokenBuilder()..update(updates)).build();

  _$AccessToken._(
      {this.accessToken,
      this.tokenType,
      this.refreshType,
      this.expiresIn,
      this.scope,
      this.lastLogin})
      : super._() {
    if (accessToken == null) {
      throw new BuiltValueNullFieldError('AccessToken', 'accessToken');
    }
    if (tokenType == null) {
      throw new BuiltValueNullFieldError('AccessToken', 'tokenType');
    }
    if (refreshType == null) {
      throw new BuiltValueNullFieldError('AccessToken', 'refreshType');
    }
    if (expiresIn == null) {
      throw new BuiltValueNullFieldError('AccessToken', 'expiresIn');
    }
    if (scope == null) {
      throw new BuiltValueNullFieldError('AccessToken', 'scope');
    }
    if (lastLogin == null) {
      throw new BuiltValueNullFieldError('AccessToken', 'lastLogin');
    }
  }

  @override
  AccessToken rebuild(void Function(AccessTokenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccessTokenBuilder toBuilder() => new AccessTokenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccessToken &&
        accessToken == other.accessToken &&
        tokenType == other.tokenType &&
        refreshType == other.refreshType &&
        expiresIn == other.expiresIn &&
        scope == other.scope &&
        lastLogin == other.lastLogin;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, accessToken.hashCode), tokenType.hashCode),
                    refreshType.hashCode),
                expiresIn.hashCode),
            scope.hashCode),
        lastLogin.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AccessToken')
          ..add('accessToken', accessToken)
          ..add('tokenType', tokenType)
          ..add('refreshType', refreshType)
          ..add('expiresIn', expiresIn)
          ..add('scope', scope)
          ..add('lastLogin', lastLogin))
        .toString();
  }
}

class AccessTokenBuilder implements Builder<AccessToken, AccessTokenBuilder> {
  _$AccessToken _$v;

  String _accessToken;
  String get accessToken => _$this._accessToken;
  set accessToken(String accessToken) => _$this._accessToken = accessToken;

  String _tokenType;
  String get tokenType => _$this._tokenType;
  set tokenType(String tokenType) => _$this._tokenType = tokenType;

  String _refreshType;
  String get refreshType => _$this._refreshType;
  set refreshType(String refreshType) => _$this._refreshType = refreshType;

  int _expiresIn;
  int get expiresIn => _$this._expiresIn;
  set expiresIn(int expiresIn) => _$this._expiresIn = expiresIn;

  String _scope;
  String get scope => _$this._scope;
  set scope(String scope) => _$this._scope = scope;

  String _lastLogin;
  String get lastLogin => _$this._lastLogin;
  set lastLogin(String lastLogin) => _$this._lastLogin = lastLogin;

  AccessTokenBuilder();

  AccessTokenBuilder get _$this {
    if (_$v != null) {
      _accessToken = _$v.accessToken;
      _tokenType = _$v.tokenType;
      _refreshType = _$v.refreshType;
      _expiresIn = _$v.expiresIn;
      _scope = _$v.scope;
      _lastLogin = _$v.lastLogin;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccessToken other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AccessToken;
  }

  @override
  void update(void Function(AccessTokenBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AccessToken build() {
    final _$result = _$v ??
        new _$AccessToken._(
            accessToken: accessToken,
            tokenType: tokenType,
            refreshType: refreshType,
            expiresIn: expiresIn,
            scope: scope,
            lastLogin: lastLogin);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
