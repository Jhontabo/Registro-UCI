// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cambio_posicion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CambioDePosicionImpl _$$CambioDePosicionImplFromJson(
        Map<String, dynamic> json) =>
    _$CambioDePosicionImpl(
      idCambioDePosicion: json['idCambioDePosicion'] as String,
      hora: (json['hora'] as num).toInt(),
      posicion: json['posicion'] as String,
      orden: (json['orden'] as num).toInt(),
    );

Map<String, dynamic> _$$CambioDePosicionImplToJson(
        _$CambioDePosicionImpl instance) =>
    <String, dynamic>{
      'idCambioDePosicion': instance.idCambioDePosicion,
      'hora': instance.hora,
      'posicion': instance.posicion,
      'orden': instance.orden,
    };
