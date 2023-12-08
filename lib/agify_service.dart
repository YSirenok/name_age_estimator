import 'package:dio/dio.dart';
import 'package:name_age_estimator/age_estimate.dart';

class AgifyService {
  final Dio _dio = Dio();

  Future<AgeEstimate> getAgeEstimate(String name) async {
    try {
      final response = await _dio.get('https://api.agify.io', queryParameters: {
        'name': name,
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = response.data;
        print('Agify API Response: $json');
        return AgeEstimate.fromJson(json);
      } else {
        print('Agify API Error: ${response.statusCode}');
        throw Exception('Failed to fetch age estimate');
      }
    } catch (e) {
      print('Agify API Error: $e');
      throw Exception('Failed to fetch age estimate');
    }
  }
}
