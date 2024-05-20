import 'package:http/http.dart' as https;
import 'package:http/http.dart';

class Api {
  static const String _baseUrl = "https://jsonplaceholder.typicode.com/posts";
  Future<Response> getData() async {
    https.Response respons = await https.get(
      Uri.parse(_baseUrl),
    );
    return respons;
  }
}

final Api apiProvider = Api();
