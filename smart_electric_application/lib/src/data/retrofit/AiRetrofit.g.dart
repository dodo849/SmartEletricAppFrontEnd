// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AiRetrofit.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AiRetrofit implements AiRetrofit {
  _AiRetrofit(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.smartelectric.kr/ai';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AiReportDTO> requestAiReport(customerNumber) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'custNo': customerNumber};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AiReportDTO>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/report/issue',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AiReportDTO.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AiPredictionDTO> requestAiPrediction(customerNumber) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'custNo': customerNumber};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AiPredictionDTO>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/prediction',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AiPredictionDTO.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
