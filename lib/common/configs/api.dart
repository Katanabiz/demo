part of common;

class Api {
  static Future<Map<String, dynamic>> put(String endPoint,
      {required Map<String, dynamic> params,
      Map<String, String> files: const {},
      String type: 'form-data'}) async {
    final Map<String, dynamic> result = await _request(
      endPoint,
      params: params,
      files: files,
      method: MethodType.put,
      type: type,
    );
    return result;
  }

  static Future<Map<String, dynamic>> patch(String endPoint,
      {required Map<String, dynamic> params,
      Map<String, String> files: const {},
      String type: 'form-data'}) async {
    final Map<String, dynamic> result = await _request(
      endPoint,
      params: params,
      files: files,
      method: MethodType.patch,
      type: type,
    );
    return result;
  }

  static Future<Map<String, dynamic>> post(
    String endPoint, {
    required Map<String, dynamic> params,
    Map<String, String> files: const {},
    String type: 'json',
  }) async {
    final Map<String, dynamic> result = await _request(
      endPoint,
      params: params,
      files: files,
      method: MethodType.post,
      type: type,
    );
    return result;
  }

  static Future<Map<String, dynamic>> get(
    String endPoint, {
    Map<String, dynamic> query: const {},
    String type = 'json',
  }) async {
    final Map<String, dynamic> result = await _request(endPoint,
        method: MethodType.get, type: type, params: {}, query: query);
    return result;
  }

  static Future<Map<String, dynamic>> delete(
    String endPoint, {
    Map<String, dynamic> params = const {},
    Map<String, dynamic> query = const {},
    String type = 'json',
  }) async {
    final Map<String, dynamic> result = await _request(endPoint,
        method: MethodType.delete, type: type, params: params, query: query);
    return result;
  }

  static Future<Map<String, dynamic>> _request(
    String endPoint, {
    required Map<String, dynamic> params,
    Map<String, dynamic> query: const {},
    Map<String, String> files: const {},
    required MethodType method,
    required String type,
  }) async {
    final Map<String, dynamic> parameters = <String, dynamic>{};

    if (method == MethodType.get) {
      if (!endPoint.contains('lang')) {
        endPoint += '?'
                'lang=' +
            HelperMS.lang() +
            '&';
      }
    }
    if (query != {}) {
      if (!endPoint.contains('?')) {
        endPoint += '?';
      }
      query.forEach((String k, dynamic v) =>
          v != null ? endPoint += k + '=' + '$v' + '&' : '');
      endPoint = endPoint.substring(0, endPoint.length - 1);
    }
    params.forEach(
        (String k, dynamic v) => v != null ? parameters[k] = '$v' : '');

    HelperMS.log(
        'API > REQUEST: ' +
            method.toString().toUpperCase() +
            ' ' +
            ConfigX.apiBaseUrl +
            endPoint,
        colorfulText: ColorfulText.cyan);
    HelperMS.log('API > PARAMETERS: $parameters',
        colorfulText: ColorfulText.cyan);

    final Map<String, dynamic> result =
        await _apiRequest(endPoint, parameters, files, method, type);

    // HelperMS.log('API > RESPONSE: $result');

    return result;
  }

  static Future<Map<String, dynamic>> _apiRequest(
      String endPoint,
      Map<String, dynamic> parameters,
      Map<String, String> files,
      MethodType method,
      [String type = 'json']) async {
    Map<String, dynamic> result;
    String jsonParameters = '';
    Map<String, String> headers = {};
    if (type == '') {
      //just send token in header
      // jsonParameters = jsonEncode(parameters);
    }
    if (type == 'json') {
      headers['accept'] = 'application/json';
      jsonParameters = jsonEncode(parameters);
    }
    if (type == 'token-only') {
      jsonParameters = jsonEncode(parameters);
    }

    if (type == 'raw') {
      headers['Content-Type'] = 'application/json';
    }
    if (type == 'form-data') {
      headers['accept'] = 'application/json';
      headers['Content-Type'] = 'application/x-www-form-urlencoded';
    }

    if (ConfigX.token != '') {
      headers['authorization'] = _apiHeaderAuth();
    }

    HelperMS.log('API > HEADERS: $headers', colorfulText: ColorfulText.cyan);

    switch (method) {
      case MethodType.post:
        result = await _post(
          endPoint,
          headers,
          jsonParameters,
          parameters,
          files,
          type,
        );
        break;

      case MethodType.put:
        result = await _put(
            endPoint, headers, jsonParameters, parameters, files, type);
        break;

      case MethodType.patch:
        result = await _patch(
            endPoint, headers, jsonParameters, parameters, files, type);
        break;

      case MethodType.delete:
        result = await _delete(endPoint, headers);
        break;

      case MethodType.get:
      default:
        result = await _get(endPoint, headers);
    }

    return result;
  }

  static Future<Map<String, dynamic>> _post(endPoint, headers, jsonParameters,
      parameters, Map<String, String> files, type) async {
    dynamic data;
    Map<String, dynamic> result;
    if (files != {}) {
      final http.MultipartRequest request = http.MultipartRequest(
          'POST', Uri.parse(ConfigX.apiBaseUrl + endPoint));

      files.forEach((String k, dynamic v) async => request.files
          .add(await http.MultipartFile.fromPath(k, v, filename: basename(v))));

      // files.forEach((String k, dynamic v) =>
      //     request.files.add(http.MultipartFile.fromBytes(k, v)));
      request.headers.addAll({"Content-Type": "multipart/form-data"});
      if (ConfigX.token != '') {
        request.headers.addAll({"Authorization": _apiHeaderAuth()});
      }
      parameters.forEach((String k, dynamic v) => request.fields[k] = v);
      final http.StreamedResponse response = await request.send();
      data = await response.stream.bytesToString();
      result = {
        'responseStatus': response.statusCode,
        'data': data.length > 0 ? json.decode(data) : data
      };
    } else if (type == 'raw') {
      var headers = {
        'Content-Type': 'application/json',
      };
      var request = http.Request('POST', Uri.parse(ConfigX.apiBaseUrl));
      request.headers.addAll(headers);

      http.StreamedResponse response;

      try {
        response = await request.send();
      } on Exception catch (_) {
        return <String, dynamic>{
          'responseStatus': 0,
          'data': 'No internet connection'
        };
      }
      data = utf8.decode(await response.stream.toBytes());
      result = {
        'responseStatus': response.statusCode,
        'data': data.length > 0 ? json.decode(data) : data,
      };
    } else {
      http.Response response;
      try {
        response = await http.post(Uri.parse(ConfigX.apiBaseUrl + endPoint),
            headers: headers,
            body: type == 'json' ? jsonParameters : parameters);
        HelperMS.log('API > RESPONSE HEADER: ${response.headers.toString()}',
            colorfulText: ColorfulText.magenta);
        HelperMS.log('API > STATUS CODE: ${response.statusCode}',
            colorfulText: ColorfulText.green);
        HelperMS.log('API > DATA: ${response.body}',
            colorfulText: ColorfulText.green);
      } on Exception catch (_) {
        return <String, dynamic>{
          'responseStatus': 0,
          'data': 'No internet connection'
        };
      }

      data = utf8.decode(response.bodyBytes);
      result = {
        'responseStatus': response.statusCode,
        'data': data.length > 0 ? json.decode(data) : data
      };
    }
    return result;
  }

  static Future<Map<String, dynamic>> _put(endPoint, headers, jsonParameters,
      parameters, Map<String, String> files, type) async {
    dynamic data;
    Map<String, dynamic> result;

    http.Response response;
    try {
      response = await http.put(Uri.parse(ConfigX.apiBaseUrl + endPoint),
          headers: headers, body: parameters);
      HelperMS.log('API > RESPONSE HEADERS: ${response.headers.toString()}',
          colorfulText: ColorfulText.magenta);
      HelperMS.log('API > STATUS CODE: ${response.statusCode}',
          colorfulText: ColorfulText.green);
      HelperMS.log('API > DATA: ${response.body}',
          colorfulText: ColorfulText.green);
    } on Exception catch (_) {
      return <String, dynamic>{
        'responseStatus': 0,
        'data': 'No internet connection'
      };
    }

    data = utf8.decode(response.bodyBytes);
    result = {'responseStatus': response.statusCode, 'data': json.decode(data)};
    // }
    return result;
  }

  static Future<Map<String, dynamic>> _patch(endPoint, headers, jsonParameters,
      parameters, Map<String, String> files, type) async {
    dynamic data;
    Map<String, dynamic> result;

    http.Response response;
    try {
      response = await http.patch(Uri.parse(ConfigX.apiBaseUrl + endPoint),
          headers: headers, body: type == 'json' ? jsonParameters : parameters);
      HelperMS.log('API > RESPONSE HEADERS: ${response.headers.toString()}',
          colorfulText: ColorfulText.magenta);
      HelperMS.log('API > STATUS CODE: ${response.statusCode}',
          colorfulText: ColorfulText.green);
      HelperMS.log('API > DATA: ${response.body}',
          colorfulText: ColorfulText.green);
    } on Exception catch (_) {
      return <String, dynamic>{
        'responseStatus': 0,
        'data': 'No internet connection'
      };
    }

    data = utf8.decode(response.bodyBytes);
    result = {'responseStatus': response.statusCode, 'data': json.decode(data)};
    // }
    return result;
  }

  static Future<Map<String, dynamic>> _get(endPoint, headers) async {
    dynamic data;
    Map<String, dynamic> result;

    http.Response response;
    try {
      response = await http.get(Uri.parse(ConfigX.apiBaseUrl + endPoint),
          headers: headers);

      HelperMS.log('API > RESPONSE HEADERS: ${response.headers.toString()}',
          colorfulText: ColorfulText.magenta);
      HelperMS.log('API > STATUS CODE: ${response.statusCode}',
          colorfulText: ColorfulText.green);
      HelperMS.log('API > DATA: ${response.body}',
          colorfulText: ColorfulText.green);
    } on Exception catch (_) {
      return <String, dynamic>{
        'responseStatus': 0,
        'data': 'No internet connection'
      };
    }

    data = utf8.decode(response.bodyBytes);
    result = {'responseStatus': response.statusCode, 'data': json.decode(data)};
    return result;
  }

  static Future<Map<String, dynamic>> _delete(endPoint, headers) async {
    dynamic data;
    Map<String, dynamic> result;

    http.Response response;
    try {
      response = await http.delete(Uri.parse(ConfigX.apiBaseUrl + endPoint),
          headers: headers);
      HelperMS.log('API > RESPONSE HEADERS: ${response.headers.toString()}',
          colorfulText: ColorfulText.magenta);
      HelperMS.log('API > STATUS CODE: ${response.statusCode}',
          colorfulText: ColorfulText.green);
      HelperMS.log('API > DATA: ${response.body}',
          colorfulText: ColorfulText.green);
    } on Exception catch (_) {
      return <String, dynamic>{
        'responseStatus': 0,
        'data': 'No internet connection'
      };
    }

    data = utf8.decode(response.bodyBytes);
    result = {'responseStatus': response.statusCode, 'data': json.decode(data)};
    return result;
  }

  static String _apiHeaderAuth() {
    String authorization = '';
    if (ConfigX.token != '') {
      authorization = 'Bearer ' + ConfigX.token;
    }
    return authorization;
  }
}

enum MethodType {
  get,
  post,
  put,
  patch,
  delete,
}

Map<String, String> handleHeaders(Headerx headerx) {
  Map<String, String> header = {};
  if (headerx.formData) {
    header['Content-Type'] = 'application/x-www-form-urlencoded';
  }
  if (headerx.multipartFormData) {
    header['Content-Type'] = "multipart/form-data";
  }
  if (headerx.xWwwFormUrlencoded) {
    header['Content-Type'] = 'application/json';
  }

  if (headerx.raw) {
    header['Content-Type'] = 'application/json';
  }

  if (headerx.formData) {
    header['Content-Type'] = "multipart/form-data";
  }

  header['authorization'] =
      ConfigX.token != '' ? 'Bearer ' + ConfigX.token : '';

  return header;
}

class Headerx extends CustomModel {
  Headerx({
    this.formData = false,
    this.multipartFormData = false,
    this.xWwwFormUrlencoded = false,
    this.raw = true,
    this.authorization = true,
  });
  late bool formData;
  late bool multipartFormData;
  late bool xWwwFormUrlencoded;
  late bool raw;
  late bool authorization;

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
