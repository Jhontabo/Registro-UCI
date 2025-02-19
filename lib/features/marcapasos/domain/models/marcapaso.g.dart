// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marcapaso.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarcapasoImpl _$$MarcapasoImplFromJson(Map<String, dynamic> json) =>
    _$MarcapasoImpl(
      id: json['id'] as String,
      fechaColocacion: json['fechaColocacion'] as String,
      modo: json['modo'] as String,
      via: json['via'] as String,
      frecuencia: (json['frecuencia'] as num).toInt(),
      sensibilidadSalida: (json['sensibilidadSalida'] as num).toInt(),
    );

Map<String, dynamic> _$$MarcapasoImplToJson(_$MarcapasoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fechaColocacion': instance.fechaColocacion,
      'modo': instance.modo,
      'via': instance.via,
      'frecuencia': instance.frecuencia,
      'sensibilidadSalida': instance.sensibilidadSalida,
    };
