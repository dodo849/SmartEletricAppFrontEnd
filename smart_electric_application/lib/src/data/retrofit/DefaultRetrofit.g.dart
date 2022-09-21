// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DefaultRetrofit.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _DefaultRetrofit implements DefaultRetrofit {
  _DefaultRetrofit(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.smartelectric.kr/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<IsSmartMeterDTO> checkIsSmartMeter(customerNumber) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'custNum': customerNumber};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<IsSmartMeterDTO>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'kepcoCustNumValidation',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = IsSmartMeterDTO.fromJson(_result.data!);
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
