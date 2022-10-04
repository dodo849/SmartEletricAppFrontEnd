// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AiPredictionDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AiPredictionDTO _$$_AiPredictionDTOFromJson(Map<String, dynamic> json) =>
    _$_AiPredictionDTO(
      prediction: (json['prediction'] as List<dynamic>)
          .map((e) => DailyPrediction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AiPredictionDTOToJson(_$_AiPredictionDTO instance) =>
    <String, dynamic>{
      'prediction': instance.prediction,
    };

_$__DailyPrediction _$$__DailyPredictionFromJson(Map<String, dynamic> json) =>
    _$__DailyPrediction(
      dateTimeKr: json['dateTimeKr'] as String,
      powerUsageQuantity: (json['powerUsageQuantity'] as num).toDouble(),
    );

Map<String, dynamic> _$$__DailyPredictionToJson(_$__DailyPrediction instance) =>
    <String, dynamic>{
      'dateTimeKr': instance.dateTimeKr,
      'powerUsageQuantity': instance.powerUsageQuantity,
    };
