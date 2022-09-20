import 'package:freezed_annotation/freezed_annotation.dart';

part 'JwtTokenDTO.freezed.dart';
part 'JwtTokenDTO.g.dart';

@freezed
class JwtTokenDTO with _$JwtTokenDTO{
  factory JwtTokenDTO({
    required String accessToken,
    required String refreshToken,
  }) = _JwtTokenDTO;

  factory JwtTokenDTO.fromJson(Map<String, dynamic> json) => _$JwtTokenDTOFromJson(json);

}