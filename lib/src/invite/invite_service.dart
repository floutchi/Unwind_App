import 'package:unwind_app/model/url.dart';
import 'package:http/http.dart' as http;

class InviteService {
  const InviteService(this._token);

  final String _token;

  Future<void> invite(int periodId, String email) async {
    final uri = Uri.parse('$baseUrl/holidayperiod/$periodId/user');
    await http.post(
      uri,
      headers: {
        'Authorization': 'Bearer $_token',
      },
      body: email,
    );
  }
}
