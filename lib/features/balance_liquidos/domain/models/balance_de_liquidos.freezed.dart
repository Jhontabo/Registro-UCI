// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance_de_liquidos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BalanceDeLiquidos {
  String get idBalanceDeLiquidos => throw _privateConstructorUsedError;
  int get hora => throw _privateConstructorUsedError;
  int get orden => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BalanceDeLiquidosCopyWith<BalanceDeLiquidos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceDeLiquidosCopyWith<$Res> {
  factory $BalanceDeLiquidosCopyWith(
          BalanceDeLiquidos value, $Res Function(BalanceDeLiquidos) then) =
      _$BalanceDeLiquidosCopyWithImpl<$Res, BalanceDeLiquidos>;
  @useResult
  $Res call({String idBalanceDeLiquidos, int hora, int orden});
}

/// @nodoc
class _$BalanceDeLiquidosCopyWithImpl<$Res, $Val extends BalanceDeLiquidos>
    implements $BalanceDeLiquidosCopyWith<$Res> {
  _$BalanceDeLiquidosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idBalanceDeLiquidos = null,
    Object? hora = null,
    Object? orden = null,
  }) {
    return _then(_value.copyWith(
      idBalanceDeLiquidos: null == idBalanceDeLiquidos
          ? _value.idBalanceDeLiquidos
          : idBalanceDeLiquidos // ignore: cast_nullable_to_non_nullable
              as String,
      hora: null == hora
          ? _value.hora
          : hora // ignore: cast_nullable_to_non_nullable
              as int,
      orden: null == orden
          ? _value.orden
          : orden // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BalanceDeLiquidosImplCopyWith<$Res>
    implements $BalanceDeLiquidosCopyWith<$Res> {
  factory _$$BalanceDeLiquidosImplCopyWith(_$BalanceDeLiquidosImpl value,
          $Res Function(_$BalanceDeLiquidosImpl) then) =
      __$$BalanceDeLiquidosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idBalanceDeLiquidos, int hora, int orden});
}

/// @nodoc
class __$$BalanceDeLiquidosImplCopyWithImpl<$Res>
    extends _$BalanceDeLiquidosCopyWithImpl<$Res, _$BalanceDeLiquidosImpl>
    implements _$$BalanceDeLiquidosImplCopyWith<$Res> {
  __$$BalanceDeLiquidosImplCopyWithImpl(_$BalanceDeLiquidosImpl _value,
      $Res Function(_$BalanceDeLiquidosImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idBalanceDeLiquidos = null,
    Object? hora = null,
    Object? orden = null,
  }) {
    return _then(_$BalanceDeLiquidosImpl(
      idBalanceDeLiquidos: null == idBalanceDeLiquidos
          ? _value.idBalanceDeLiquidos
          : idBalanceDeLiquidos // ignore: cast_nullable_to_non_nullable
              as String,
      hora: null == hora
          ? _value.hora
          : hora // ignore: cast_nullable_to_non_nullable
              as int,
      orden: null == orden
          ? _value.orden
          : orden // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BalanceDeLiquidosImpl implements _BalanceDeLiquidos {
  const _$BalanceDeLiquidosImpl(
      {required this.idBalanceDeLiquidos,
      required this.hora,
      required this.orden});

  @override
  final String idBalanceDeLiquidos;
  @override
  final int hora;
  @override
  final int orden;

  @override
  String toString() {
    return 'BalanceDeLiquidos(idBalanceDeLiquidos: $idBalanceDeLiquidos, hora: $hora, orden: $orden)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BalanceDeLiquidosImpl &&
            (identical(other.idBalanceDeLiquidos, idBalanceDeLiquidos) ||
                other.idBalanceDeLiquidos == idBalanceDeLiquidos) &&
            (identical(other.hora, hora) || other.hora == hora) &&
            (identical(other.orden, orden) || other.orden == orden));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, idBalanceDeLiquidos, hora, orden);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BalanceDeLiquidosImplCopyWith<_$BalanceDeLiquidosImpl> get copyWith =>
      __$$BalanceDeLiquidosImplCopyWithImpl<_$BalanceDeLiquidosImpl>(
          this, _$identity);
}

abstract class _BalanceDeLiquidos implements BalanceDeLiquidos {
  const factory _BalanceDeLiquidos(
      {required final String idBalanceDeLiquidos,
      required final int hora,
      required final int orden}) = _$BalanceDeLiquidosImpl;

  @override
  String get idBalanceDeLiquidos;
  @override
  int get hora;
  @override
  int get orden;
  @override
  @JsonKey(ignore: true)
  _$$BalanceDeLiquidosImplCopyWith<_$BalanceDeLiquidosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
