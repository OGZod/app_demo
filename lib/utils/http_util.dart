
import 'package:dio/dio.dart';
import 'package:untitled/values/constants.dart';

class HttpUtil {
  static HttpUtil instance = HttpUtil.internal();
  factory HttpUtil(){
    return instance;
  }
  late Dio dio;
  HttpUtil.internal(){
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.serverAPIUrl,
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
      headers: {},
      contentType: "application/json: charset=utf-8",
      responseType: ResponseType.json
    );
    dio = Dio(options);
  }
  Future post(String path,{dynamic data, Map<String, dynamic>? queryParameters})
  async{
    var response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters
    );
    return response.data;
  }
}
