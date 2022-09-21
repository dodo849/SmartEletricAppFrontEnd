import 'package:freezed_annotation/freezed_annotation.dart';

part 'JwtTokenDTO.freezed.dart';
part 'JwtTokenDTO.g.dart';

@freezed
class JwtTokenDTO with _$JwtTokenDTO{
  factory JwtTokenDTO({
    @JsonKey(name: "access-token") required String accessToken,
    @JsonKey(name: "refresh-token") required String refreshToken,
  }) = _JwtTokenDTO;

  factory JwtTokenDTO.fromJson(Map<String, dynamic> json) => _$JwtTokenDTOFromJson(json);

}