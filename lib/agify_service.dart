import 'package:dio/dio.dart';

import 'age_estimate.dart';

class AgifyService {
  final Dio _dio = Dio();

  Future<AgeEstimate> getAgeEstimate(String name) async {
    final response = await _dio.get('https://api.agify.io/?name=$name');
    return AgeEstimate.fromJson(response.data);
  }
}
