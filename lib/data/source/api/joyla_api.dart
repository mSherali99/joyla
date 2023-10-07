import 'package:dio/dio.dart';

import '../../model/joyla_model.dart';

/// https://run.mocky.io/v3/e2652ce1-2b0f-4dcd-b0a7-5e694cc49afd

class JoylaApi {
  final _dio = Dio(BaseOptions(baseUrl: "https://run.mocky.io/", validateStatus: (status) => true));

  Future<List<JoylaModel>> getAllList() async {
    try {
      List<JoylaModel>? resultList = [];
      final response = await _dio.get(
          "v3/e2652ce1-2b0f-4dcd-b0a7-5e694cc49afd");
      int status = response.statusCode ?? 0;
      if (status >= 200 && status <= 300) {
        resultList = ((response.data as List).map((e) => JoylaModel.fromJson(e))).toList();
      }
      // print(response.data);
      return resultList;
    } catch (e) {
      return <JoylaModel>[];
    }
  }
}
