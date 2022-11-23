// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BillRetrofit.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _BillRetrofit implements BillRetrofit {
  _BillRetrofit(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.smartelectric.kr/bill';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BillDateDTO> getBillDate(customerNumber) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'custNo': customerNumber};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BillDateDTO>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/specific-user/bill-date',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BillDateDTO.fromJson(_result.data!);
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
