// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'http://api.themoviedb.org/3/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getVideoMovieId(id, apiKey) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(apiKey, 'apiKey');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api_key': apiKey};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'movie/$id/videos',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Video.fromJson(_result.data);
    return value;
  }

  @override
  getListVideoMovieId(id, apiKey) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(apiKey, 'apiKey');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api_key': apiKey};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'movie/$id/videos',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ListVideo.fromJson(_result.data);
    return value;
  }

  @override
  getAllVideoWithCategory(category, apiKey) async {
    ArgumentError.checkNotNull(category, 'category');
    ArgumentError.checkNotNull(apiKey, 'apiKey');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api_key': apiKey};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        'movie/$category',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Movie.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getMovidetail(id, api_key) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(api_key, 'api_key');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api_key': api_key};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'movie/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MoviewDetail.fromJson(_result.data);
    return value;
  }
}
