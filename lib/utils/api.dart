import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MuffesApi {
  final String _url = 'https://api.muffes.com/v1';

  var token;
  int userId;

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

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}
