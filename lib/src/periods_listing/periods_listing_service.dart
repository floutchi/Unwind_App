import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:unwind_app/dto/period_dto.dart';
import 'package:unwind_app/model/url.dart';

class PeriodsListingService {
  const PeriodsListingService(this._token);

  final String _token;

  Future<List<PeriodDTO>> periods() async {
    final uri = Uri.parse('$baseUrl/holidayperiod');
    final res = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      },
    );

    if (res.statusCode == 200) {
      final periods = parsePeriods(utf8.decode(res.bodyBytes));
      return periods;
    }

    throw Exception(
      "Une erreur est survenue lors de la récupération de vos périodes de vacances",
    );
  }

  Future<PeriodDTO> period(int id) async {
    final uri = Uri.parse('$baseUrl/holidayperiod/$id');
    final res = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $_token",
      },
    );

    if (res.statusCode == 200) {
      final period = parsePeriod(utf8.decode(res.bodyBytes));
      return period;
    }

    throw Exception(
      "Une erreur est survenur lors de la récupération de la période",
    );
  }

  Future<PeriodDTO> createPeriod(Map<String, dynamic> dto) async {
    final uri = Uri.parse('$baseUrl/holidayperiod');
    final res = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      },
      body: jsonEncode(dto),
    );

    if (res.statusCode == 200) {
      return parsePeriod(res.body);
    }

    throw Exception(
      jsonDecode(res.body).error ?? "Une erreur inattendue est survenue.",
    );
  }

  Future<void> editPeriod(int id, Map<String, dynamic> dto) async {
    final uri = Uri.parse('$baseUrl/holidayperiod/$id');
    await http.put(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      },
      body: jsonEncode(dto),
    );
  }

  Future<void> removePeriod(int id) async {
    final uri = Uri.parse('$baseUrl/holidayperiod/$id');
    await http.delete(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $_token",
      },
    );
  }
}
