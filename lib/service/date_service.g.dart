// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _DateService implements DateService {
  _DateService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<String>> getDate(amcNo) async {
    ArgumentError.checkNotNull(amcNo, 'amcNo');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/receipt/getDate/$amcNo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data.cast<String>();
    return value;
  }
}
