import 'dart:convert';

import 'package:baseproject/core/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'additional_information.g.dart';

abstract class AdditionalInformation
    implements Built<AdditionalInformation, AdditionalInformationBuilder> {
  AdditionalInformation._();

  factory AdditionalInformation([
    Function(AdditionalInformationBuilder) updates,
  ]) = _$AdditionalInformation;

  String get login;
  String get email;
  String get nome;
  int get usuarioId;
  int get clienteId;
  bool get isPrimeiroAcesso;
  bool get isDeviceIdValido;
  bool get isDadosConfirmados;
  String get deviceId;
  String get tokenAutenticacaoDTO;
  bool get pinCriado;
  String get statusAceiteTermosDeUsoVigente;

  static AdditionalInformation fromJson(String jsonString) =>
      serializers.deserializeWith(
          AdditionalInformation.serializer, jsonDecode(jsonString));

  static Serializer<AdditionalInformation> get serializer =>
      _$additionalInformationSerializer;
}
