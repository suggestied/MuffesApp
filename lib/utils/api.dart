import 'dart:convert';
import 'dart:io';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class MuffesApi {
  final String _url = 'https://api.muffes.com/v1';
  DioCacheManager _dioCacheManager;

  var token;
  int userId;

  getToken() async {
    return await _getToken();
  }

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'));
    return token;
  }

  postData(auth, apiPath, data) async {
    var fullUrl = _url + apiPath;
    if (auth) {
      await _getToken();
    }
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  cacheGetData(auth, apiPath) async {
    _dioCacheManager = DioCacheManager(CacheConfig());

    Dio _dio = Dio();
    _dio.interceptors.add(_dioCacheManager.interceptor);
    var fullUrl = _url + apiPath;
    if (auth) {
      await _getToken();
    }
    Response response = await _dio.get(
      fullUrl,
      options: buildCacheOptions(
        Duration(days: 7),
        forceRefresh: true,
        options: Options(headers: _setHeaders()),
      ),
    );
    // print(response.data);
    return response;
  }

  getData(auth, apiPath) async {
    var fullUrl = _url + apiPath;
    if (auth) {
      await _getToken();
    }
    return await http.get(fullUrl, headers: _setHeaders());
  }

  patchData(auth, apiPath, data) async {
    var fullUrl = _url + apiPath;
    if (auth) {
      await _getToken();
    }
    return await http.patch(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  putData(auth, apiPath, data) async {
    var fullUrl = _url + apiPath;
    if (auth) {
      await _getToken();
    }
    return await http.put(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  delData(auth, apiPath, data) async {
    var fullUrl = _url + apiPath;
    if (auth) {
      await _getToken();
    }
    return await http.delete(fullUrl, headers: _setHeaders());
  }

  multipartPostData(auth, apiPath, data, files) async {
    var fullUrl = _url + apiPath;
    if (auth) {
      await _getToken();
    }

    var request = http.MultipartRequest(
        'POST', Uri.parse('https://api.muffes.com/v1/post'));
    request.fields.addAll(data);
    for (var file in files) {
      request.files.add(await http.MultipartFile.fromPath('files[]', file));
    }

    request.headers['Content-type'] = 'application/json';
    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] = 'Bearer $token';

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}
