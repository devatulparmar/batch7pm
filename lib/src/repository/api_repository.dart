
import 'package:http/http.dart' as http;

class ApiRepository {
  Future defaultGetCall(String url) async {
    return await http.get(Uri.parse(url));
  }

  Future defaultPostCall(String url, dynamic headers, dynamic body) async {
    return await http.post(Uri.parse(url), headers: headers, body: body);
  }
}