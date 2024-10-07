import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  // Update this to your machine's IP
  final String baseUrl = "http://192.168.88.7:5000";

  Future<dynamic> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/auth/login'),  // Ensure the route matches
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);  // Handle success
      } else {
        throw Exception('Login failed: ${response.body}');  // Handle error response
      }
    } catch (e) {
      throw Exception('Error logging in: $e');
    }
  }

  Future<dynamic> fetchPosts() async {
    final response = await http.get(
      Uri.parse('$baseUrl/posts'),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
