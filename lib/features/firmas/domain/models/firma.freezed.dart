// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firma.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Firma {
  String get nombreFirma => throw _privateConstructorUsedError;
  DateTime get fechaFirma => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FirmaCopyWith<Firma> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirmaCopyWith<$Res> {
  factory $FirmaCopyWith(Firma value, $Res Function(Firma) then) =
      _$FirmaCopyWithImpl<$Res, Firma>;
  @useResult
  $Res call({String nombreFirma, DateTime fechaFirma});
}

/// @nodoc
class _$FirmaCopyWithImpl<$Res, $Val extends Firma>
    implements $FirmaCopyWith<$Res> {
  _$FirmaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nombreFirma = null,
    Object? fechaFirma = null,
  }) {
    return _then(_value.copyWith(
      nombreFirma: null == nombreFirma
          ? _value.nombreFirma
          : nombreFirma // ignore: cast_nullable_to_non_nullable
              as String,
      fechaFirma: null == fechaFirma
          ? _value.fechaFirma
          : fechaFirma // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirmaImplCopyWith<$Res> implements $FirmaCopyWith<$Res> {
  factory _$$FirmaImplCopyWith(
          _$FirmaImpl value, $Res Function(_$FirmaImpl) then) =
      __$$FirmaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nombreFirma, DateTime fechaFirma});
}

/// @nodoc
class __$$FirmaImplCopyWithImpl<$Res>
    extends _$FirmaCopyWithImpl<$Res, _$FirmaImpl>
    implements _$$FirmaImplCopyWith<$Res> {
  __$$FirmaImplCopyWithImpl(
      _$FirmaImpl _value, $Res Function(_$FirmaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nombreFirma = null,
    Object? fechaFirma = null,
  }) {
    return _then(_$FirmaImpl(
      nombreFirma: null == nombreFirma
          ? _value.nombreFirma
          : nombreFirma // ignore: cast_nullable_to_non_nullable
              as String,
      fechaFirma: null == fechaFirma
          ? _value.fechaFirma
          : fechaFirma // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$FirmaImpl implements _Firma {
  const _$FirmaImpl({required this.nombreFirma, required this.fechaFirma});

  @override
  final String nombreFirma;
  @override
  final DateTime fechaFirma;

  @override
  String toString() {
    return 'Firma(nombreFirma: $nombreFirma, fechaFirma: $fechaFirma)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirmaImpl &&
            (identical(other.nombreFirma, nombreFirma) ||
                other.nombreFirma == nombreFirma) &&
            (identical(other.fechaFirma, fechaFirma) ||
                other.fechaFirma == fechaFirma));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nombreFirma, fechaFirma);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirmaImplCopyWith<_$FirmaImpl> get copyWith =>
      __$$FirmaImplCopyWithImpl<_$FirmaImpl>(this, _$identity);
}

abstract class _Firma implements Firma {
  const factory _Firma(
      {required final String nombreFirma,
      required final DateTime fechaFirma}) = _$FirmaImpl;

  @override
  String get nombreFirma;
  @override
  DateTime get fechaFirma;
  @override
  @JsonKey(ignore: true)
  _$$FirmaImplCopyWith<_$FirmaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
