import 'dart:convert';

import 'package:unwind_app/dto/activity_dto.dart';
import 'package:unwind_app/model/url.dart';
import 'package:http/http.dart' as http;

class NewActivityService {
  const NewActivityService(this._token);

  final String _token;

  Future<ActivityDTO> createActivity(
    int periodId,
    Map<String, dynamic> dto,
  ) async {
    final uri = Uri.parse('$baseUrl/holidayperiod/$periodId/activity');
    final res = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      },
      body: jsonEncode(dto),
    );

    if (res.statusCode == 200) {
      final dto = parseActivity(res.body);
      return dto;
    }

    throw Exception(
      jsonDecode(res.body).error ?? "Une erreur inattendue est survenue.",
    );
  }

  Future<void> editActivity(
    int periodId,
    int activityId,
    Map<String, dynamic> dto,
  ) async {
    final uri = Uri.parse(
      '$baseUrl/holidayperiod/$periodId/activity/$activityId',
    );
    await http.put(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $_token",
      },
      body: jsonEncode(dto),
    );
  }

  Future<void> removeActivity(int periodId, int activityId) async {
    final uri = Uri.parse(
      "$baseUrl/holidayperiod/$periodId/activity/$activityId",
    );
    await http.delete(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      },
    );
  }
}
