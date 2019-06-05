import 'package:http/http.dart' as http;
import 'dart:convert';

class _FolidayNetworkAgent extends http.BaseClient {
  final http.Client _inner;

  _FolidayNetworkAgent(this._inner);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _inner.send(request);
  }
}

var _networkAgent = new _FolidayNetworkAgent(new http.Client());
String _token;

Future<http.Response> post(url,
{Map<String, String> headers, body, Encoding encoding, bool isAuthorizationNeeded = false}) {
  // TODO: token, headers implementation needed, etc
  if (headers == null) {
    headers = {
      'Content-Type': 'application/json'
    };
  }
  if (isAuthorizationNeeded && _token != null) {
    headers['Authorization'] = _token;
  }
  return _networkAgent.post(url, headers: headers, body: body, encoding: encoding);
}

Future<http.Response> get(url, {Map<String, String> headers, bool isAuthorizationNeeded = false}) {
  if (headers == null) {
    headers = {
      'Content-Type': 'application/json'
    };
  }
  if (isAuthorizationNeeded && _token != null) {
    headers['Authorization'] = _token;
  }
  return _networkAgent.get(url, headers: headers);
}

saveToken(String token) {
  _token = "Bearer " + token;
}

// TODO: put, patch method has not being implemented yet


