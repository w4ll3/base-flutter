// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_information.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AdditionalInformation> _$additionalInformationSerializer =
    new _$AdditionalInformationSerializer();

class _$AdditionalInformationSerializer
    implements StructuredSerializer<AdditionalInformation> {
  @override
  final Iterable<Type> types = const [
    AdditionalInformation,
    _$AdditionalInformation
  ];
  @override
  final String wireName = 'AdditionalInformation';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AdditionalInformation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'nome',
      serializers.serialize(object.nome, specifiedType: const FullType(String)),
      'usuarioId',
      serializers.serialize(object.usuarioId,
          specifiedType: const FullType(int)),
      'clienteId',
      serializers.serialize(object.clienteId,
          specifiedType: const FullType(int)),
      'isPrimeiroAcesso',
      serializers.serialize(object.isPrimeiroAcesso,
          specifiedType: const FullType(bool)),
      'isDeviceIdValido',
      serializers.serialize(object.isDeviceIdValido,
          specifiedType: const FullType(bool)),
      'isDadosConfirmados',
      serializers.serialize(object.isDadosConfirmados,
          specifiedType: const FullType(bool)),
      'deviceId',
      serializers.serialize(object.deviceId,
          specifiedType: const FullType(String)),
      'tokenAutenticacaoDTO',
      serializers.serialize(object.tokenAutenticacaoDTO,
          specifiedType: const FullType(String)),
      'pinCriado',
      serializers.serialize(object.pinCriado,
          specifiedType: const FullType(bool)),
      'statusAceiteTermosDeUsoVigente',
      serializers.serialize(object.statusAceiteTermosDeUsoVigente,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AdditionalInformation deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AdditionalInformationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'nome':
          result.nome = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'usuarioId':
          result.usuarioId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'clienteId':
          result.clienteId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'isPrimeiroAcesso':
          result.isPrimeiroAcesso = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isDeviceIdValido':
          result.isDeviceIdValido = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isDadosConfirmados':
          result.isDadosConfirmados = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'deviceId':
          result.deviceId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tokenAutenticacaoDTO':
          result.tokenAutenticacaoDTO = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pinCriado':
          result.pinCriado = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'statusAceiteTermosDeUsoVigente':
          result.statusAceiteTermosDeUsoVigente = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AdditionalInformation extends AdditionalInformation {
  @override
  final String login;
  @override
  final String email;
  @override
  final String nome;
  @override
  final int usuarioId;
  @override
  final int clienteId;
  @override
  final bool isPrimeiroAcesso;
  @override
  final bool isDeviceIdValido;
  @override
  final bool isDadosConfirmados;
  @override
  final String deviceId;
  @override
  final String tokenAutenticacaoDTO;
  @override
  final bool pinCriado;
  @override
  final String statusAceiteTermosDeUsoVigente;

  factory _$AdditionalInformation(
          [void Function(AdditionalInformationBuilder) updates]) =>
      (new AdditionalInformationBuilder()..update(updates)).build();

  _$AdditionalInformation._(
      {this.login,
      this.email,
      this.nome,
      this.usuarioId,
      this.clienteId,
      this.isPrimeiroAcesso,
      this.isDeviceIdValido,
      this.isDadosConfirmados,
      this.deviceId,
      this.tokenAutenticacaoDTO,
      this.pinCriado,
      this.statusAceiteTermosDeUsoVigente})
      : super._() {
    if (login == null) {
      throw new BuiltValueNullFieldError('AdditionalInformation', 'login');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('AdditionalInformation', 'email');
    }
    if (nome == null) {
      throw new BuiltValueNullFieldError('AdditionalInformation', 'nome');
    }
    if (usuarioId == null) {
      throw new BuiltValueNullFieldError('AdditionalInformation', 'usuarioId');
    }
    if (clienteId == null) {
      throw new BuiltValueNullFieldError('AdditionalInformation', 'clienteId');
    }
    if (isPrimeiroAcesso == null) {
      throw new BuiltValueNullFieldError(
          'AdditionalInformation', 'isPrimeiroAcesso');
    }
    if (isDeviceIdValido == null) {
      throw new BuiltValueNullFieldError(
          'AdditionalInformation', 'isDeviceIdValido');
    }
    if (isDadosConfirmados == null) {
      throw new BuiltValueNullFieldError(
          'AdditionalInformation', 'isDadosConfirmados');
    }
    if (deviceId == null) {
      throw new BuiltValueNullFieldError('AdditionalInformation', 'deviceId');
    }
    if (tokenAutenticacaoDTO == null) {
      throw new BuiltValueNullFieldError(
          'AdditionalInformation', 'tokenAutenticacaoDTO');
    }
    if (pinCriado == null) {
      throw new BuiltValueNullFieldError('AdditionalInformation', 'pinCriado');
    }
    if (statusAceiteTermosDeUsoVigente == null) {
      throw new BuiltValueNullFieldError(
          'AdditionalInformation', 'statusAceiteTermosDeUsoVigente');
    }
  }

  @override
  AdditionalInformation rebuild(
          void Function(AdditionalInformationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdditionalInformationBuilder toBuilder() =>
      new AdditionalInformationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdditionalInformation &&
        login == other.login &&
        email == other.email &&
        nome == other.nome &&
        usuarioId == other.usuarioId &&
        clienteId == other.clienteId &&
        isPrimeiroAcesso == other.isPrimeiroAcesso &&
        isDeviceIdValido == other.isDeviceIdValido &&
        isDadosConfirmados == other.isDadosConfirmados &&
        deviceId == other.deviceId &&
        tokenAutenticacaoDTO == other.tokenAutenticacaoDTO &&
        pinCriado == other.pinCriado &&
        statusAceiteTermosDeUsoVigente == other.statusAceiteTermosDeUsoVigente;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, login.hashCode),
                                                email.hashCode),
                                            nome.hashCode),
                                        usuarioId.hashCode),
                                    clienteId.hashCode),
                                isPrimeiroAcesso.hashCode),
                            isDeviceIdValido.hashCode),
                        isDadosConfirmados.hashCode),
                    deviceId.hashCode),
                tokenAutenticacaoDTO.hashCode),
            pinCriado.hashCode),
        statusAceiteTermosDeUsoVigente.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AdditionalInformation')
          ..add('login', login)
          ..add('email', email)
          ..add('nome', nome)
          ..add('usuarioId', usuarioId)
          ..add('clienteId', clienteId)
          ..add('isPrimeiroAcesso', isPrimeiroAcesso)
          ..add('isDeviceIdValido', isDeviceIdValido)
          ..add('isDadosConfirmados', isDadosConfirmados)
          ..add('deviceId', deviceId)
          ..add('tokenAutenticacaoDTO', tokenAutenticacaoDTO)
          ..add('pinCriado', pinCriado)
          ..add(
              'statusAceiteTermosDeUsoVigente', statusAceiteTermosDeUsoVigente))
        .toString();
  }
}

class AdditionalInformationBuilder
    implements Builder<AdditionalInformation, AdditionalInformationBuilder> {
  _$AdditionalInformation _$v;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _nome;
  String get nome => _$this._nome;
  set nome(String nome) => _$this._nome = nome;

  int _usuarioId;
  int get usuarioId => _$this._usuarioId;
  set usuarioId(int usuarioId) => _$this._usuarioId = usuarioId;

  int _clienteId;
  int get clienteId => _$this._clienteId;
  set clienteId(int clienteId) => _$this._clienteId = clienteId;

  bool _isPrimeiroAcesso;
  bool get isPrimeiroAcesso => _$this._isPrimeiroAcesso;
  set isPrimeiroAcesso(bool isPrimeiroAcesso) =>
      _$this._isPrimeiroAcesso = isPrimeiroAcesso;

  bool _isDeviceIdValido;
  bool get isDeviceIdValido => _$this._isDeviceIdValido;
  set isDeviceIdValido(bool isDeviceIdValido) =>
      _$this._isDeviceIdValido = isDeviceIdValido;

  bool _isDadosConfirmados;
  bool get isDadosConfirmados => _$this._isDadosConfirmados;
  set isDadosConfirmados(bool isDadosConfirmados) =>
      _$this._isDadosConfirmados = isDadosConfirmados;

  String _deviceId;
  String get deviceId => _$this._deviceId;
  set deviceId(String deviceId) => _$this._deviceId = deviceId;

  String _tokenAutenticacaoDTO;
  String get tokenAutenticacaoDTO => _$this._tokenAutenticacaoDTO;
  set tokenAutenticacaoDTO(String tokenAutenticacaoDTO) =>
      _$this._tokenAutenticacaoDTO = tokenAutenticacaoDTO;

  bool _pinCriado;
  bool get pinCriado => _$this._pinCriado;
  set pinCriado(bool pinCriado) => _$this._pinCriado = pinCriado;

  String _statusAceiteTermosDeUsoVigente;
  String get statusAceiteTermosDeUsoVigente =>
      _$this._statusAceiteTermosDeUsoVigente;
  set statusAceiteTermosDeUsoVigente(String statusAceiteTermosDeUsoVigente) =>
      _$this._statusAceiteTermosDeUsoVigente = statusAceiteTermosDeUsoVigente;

  AdditionalInformationBuilder();

  AdditionalInformationBuilder get _$this {
    if (_$v != null) {
      _login = _$v.login;
      _email = _$v.email;
      _nome = _$v.nome;
      _usuarioId = _$v.usuarioId;
      _clienteId = _$v.clienteId;
      _isPrimeiroAcesso = _$v.isPrimeiroAcesso;
      _isDeviceIdValido = _$v.isDeviceIdValido;
      _isDadosConfirmados = _$v.isDadosConfirmados;
      _deviceId = _$v.deviceId;
      _tokenAutenticacaoDTO = _$v.tokenAutenticacaoDTO;
      _pinCriado = _$v.pinCriado;
      _statusAceiteTermosDeUsoVigente = _$v.statusAceiteTermosDeUsoVigente;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdditionalInformation other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AdditionalInformation;
  }

  @override
  void update(void Function(AdditionalInformationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AdditionalInformation build() {
    final _$result = _$v ??
        new _$AdditionalInformation._(
            login: login,
            email: email,
            nome: nome,
            usuarioId: usuarioId,
            clienteId: clienteId,
            isPrimeiroAcesso: isPrimeiroAcesso,
            isDeviceIdValido: isDeviceIdValido,
            isDadosConfirmados: isDadosConfirmados,
            deviceId: deviceId,
            tokenAutenticacaoDTO: tokenAutenticacaoDTO,
            pinCriado: pinCriado,
            statusAceiteTermosDeUsoVigente: statusAceiteTermosDeUsoVigente);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
