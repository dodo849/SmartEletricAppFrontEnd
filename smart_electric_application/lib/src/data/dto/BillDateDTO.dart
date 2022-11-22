import 'package:freezed_annotation/freezed_annotation.dart';

part 'BillDateDTO.freezed.dart';
part 'BillDateDTO.g.dart';

@freezed
class BillDateDTO with _$BillDateDTO {
  factory BillDateDTO({
    required String result,
  }) = _BillDateDTO;

  factory BillDateDTO.fromJson(Map<String, dynamic> json) =>
      _$BillDateDTOFromJson(json);
}
