import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class ApiServices {
  final String apiBaseUri;

  ApiServices(this.apiBaseUri);

  Future<dynamic> get(String url) async {
    var apiUrl = Uri.parse(apiBaseUri);

    try {
      print(apiUrl);
      print("SDFS SDF SDF SDF ");
      final response = await http.get(apiUrl);

      print("SDFS S4444444444444444444444444444DF SDF SDF ");
      return response;
    } catch (e) {
      throw Exception("Failed to make GET request: $e");
    }
  }

  Future<dynamic> post(String url, Map<String, dynamic> body) async {
    var apiUrl = Uri.parse(apiBaseUri + url);

    try {
      var response = await http.post(apiUrl, body: body);

      return response;
    } catch (e) {
      //CommonUtility.showSnackbarsuccess("Error","$e" );

      throw Exception("Failed to make POST request: $e");
    }
  }

  Future<dynamic> getWithUrl(String fullUrl) async {
    try {
      final response = await http.get(Uri.parse(fullUrl));
      return response;
    } catch (e) {
      // CommonUtility.showSnackbarValidationError("Getting Server error ${e}");

      throw Exception("Something goes wrong");
    }
  }
}
