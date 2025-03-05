// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cateter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CateterImpl _$$CateterImplFromJson(Map<String, dynamic> json) =>
    _$CateterImpl(
      id: json['id'] as String,
      tipo: json['tipo'] as String,
      sitio: json['sitio'] as String,
      fechaInsercion: DateTime.parse(json['fechaInsercion'] as String),
      fechaRetiro: json['fechaRetiro'] == null
          ? null
          : DateTime.parse(json['fechaRetiro'] as String),
      lugarProcedencia: json['lugarProcedencia'] as String,
    );

Map<String, dynamic> _$$CateterImplToJson(_$CateterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tipo': instance.tipo,
      'sitio': instance.sitio,
      'fechaInsercion': instance.fechaInsercion.toIso8601String(),
      'fechaRetiro': instance.fechaRetiro?.toIso8601String(),
      'lugarProcedencia': instance.lugarProcedencia,
    };
