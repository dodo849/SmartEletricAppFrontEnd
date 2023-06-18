// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'RecentPowerUsageByDayDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecentPowerUsageByDayDTO _$RecentPowerUsageByDayDTOFromJson(
    Map<String, dynamic> json) {
  return _RecentPowerUsageByDayDTO.fromJson(json);
}

/// @nodoc
mixin _$RecentPowerUsageByDayDTO {
  List<PowerUsageDTO> get lastMonth => throw _privateConstructorUsedError;
  List<PowerUsageDTO> get secondLastMonth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentPowerUsageByDayDTOCopyWith<RecentPowerUsageByDayDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentPowerUsageByDayDTOCopyWith<$Res> {
  factory $RecentPowerUsageByDayDTOCopyWith(RecentPowerUsageByDayDTO value,
          $Res Function(RecentPowerUsageByDayDTO) then) =
      _$RecentPowerUsageByDayDTOCopyWithImpl<$Res, RecentPowerUsageByDayDTO>;
  @useResult
  $Res call(
      {List<PowerUsageDTO> lastMonth, List<PowerUsageDTO> secondLastMonth});
}

/// @nodoc
class _$RecentPowerUsageByDayDTOCopyWithImpl<$Res,
        $Val extends RecentPowerUsageByDayDTO>
    implements $RecentPowerUsageByDayDTOCopyWith<$Res> {
  _$RecentPowerUsageByDayDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastMonth = null,
    Object? secondLastMonth = null,
  }) {
    return _then(_value.copyWith(
      lastMonth: null == lastMonth
          ? _value.lastMonth
          : lastMonth // ignore: cast_nullable_to_non_nullable
              as List<PowerUsageDTO>,
      secondLastMonth: null == secondLastMonth
          ? _value.secondLastMonth
          : secondLastMonth // ignore: cast_nullable_to_non_nullable
              as List<PowerUsageDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecentPowerUsageByDayDTOCopyWith<$Res>
    implements $RecentPowerUsageByDayDTOCopyWith<$Res> {
  factory _$$_RecentPowerUsageByDayDTOCopyWith(
          _$_RecentPowerUsageByDayDTO value,
          $Res Function(_$_RecentPowerUsageByDayDTO) then) =
      __$$_RecentPowerUsageByDayDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PowerUsageDTO> lastMonth, List<PowerUsageDTO> secondLastMonth});
}

/// @nodoc
class __$$_RecentPowerUsageByDayDTOCopyWithImpl<$Res>
    extends _$RecentPowerUsageByDayDTOCopyWithImpl<$Res,
        _$_RecentPowerUsageByDayDTO>
    implements _$$_RecentPowerUsageByDayDTOCopyWith<$Res> {
  __$$_RecentPowerUsageByDayDTOCopyWithImpl(_$_RecentPowerUsageByDayDTO _value,
      $Res Function(_$_RecentPowerUsageByDayDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastMonth = null,
    Object? secondLastMonth = null,
  }) {
    return _then(_$_RecentPowerUsageByDayDTO(
      lastMonth: null == lastMonth
          ? _value._lastMonth
          : lastMonth // ignore: cast_nullable_to_non_nullable
              as List<PowerUsageDTO>,
      secondLastMonth: null == secondLastMonth
          ? _value._secondLastMonth
          : secondLastMonth // ignore: cast_nullable_to_non_nullable
              as List<PowerUsageDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecentPowerUsageByDayDTO implements _RecentPowerUsageByDayDTO {
  _$_RecentPowerUsageByDayDTO(
      {required final List<PowerUsageDTO> lastMonth,
      required final List<PowerUsageDTO> secondLastMonth})
      : _lastMonth = lastMonth,
        _secondLastMonth = secondLastMonth;

  factory _$_RecentPowerUsageByDayDTO.fromJson(Map<String, dynamic> json) =>
      _$$_RecentPowerUsageByDayDTOFromJson(json);

  final List<PowerUsageDTO> _lastMonth;
  @override
  List<PowerUsageDTO> get lastMonth {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lastMonth);
  }

  final List<PowerUsageDTO> _secondLastMonth;
  @override
  List<PowerUsageDTO> get secondLastMonth {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_secondLastMonth);
  }

  @override
  String toString() {
    return 'RecentPowerUsageByDayDTO(lastMonth: $lastMonth, secondLastMonth: $secondLastMonth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecentPowerUsageByDayDTO &&
            const DeepCollectionEquality()
                .equals(other._lastMonth, _lastMonth) &&
            const DeepCollectionEquality()
                .equals(other._secondLastMonth, _secondLastMonth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_lastMonth),
      const DeepCollectionEquality().hash(_secondLastMonth));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecentPowerUsageByDayDTOCopyWith<_$_RecentPowerUsageByDayDTO>
      get copyWith => __$$_RecentPowerUsageByDayDTOCopyWithImpl<
          _$_RecentPowerUsageByDayDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecentPowerUsageByDayDTOToJson(
      this,
    );
  }
}

abstract class _RecentPowerUsageByDayDTO implements RecentPowerUsageByDayDTO {
  factory _RecentPowerUsageByDayDTO(
          {required final List<PowerUsageDTO> lastMonth,
          required final List<PowerUsageDTO> secondLastMonth}) =
      _$_RecentPowerUsageByDayDTO;

  factory _RecentPowerUsageByDayDTO.fromJson(Map<String, dynamic> json) =
      _$_RecentPowerUsageByDayDTO.fromJson;

  @override
  List<PowerUsageDTO> get lastMonth;
  @override
  List<PowerUsageDTO> get secondLastMonth;
  @override
  @JsonKey(ignore: true)
  _$$_RecentPowerUsageByDayDTOCopyWith<_$_RecentPowerUsageByDayDTO>
      get copyWith => throw _privateConstructorUsedError;
}
